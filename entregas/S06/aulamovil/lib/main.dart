import 'package:flutter/material.dart';

const Color kBackground = Color(0xFFF8FAFC);
const Color kSurface = Color(0xFFFFFFFF);
const Color kBorder = Color(0xFFE2E8F0);
const Color kPrimary = Color(0xFF4F46E5);
const Color kPrimaryLight = Color(0xFFEEF2FF);
const Color kTextDark = Color(0xFF0F172A);
const Color kTextMuted = Color(0xFF64748B);

const Color kColorPdf = Color(0xFFEF4444);
const Color kColorTask = Color(0xFFF59E0B);
const Color kColorForum = Color(0xFF06B6D4);
const Color kColorSlide = Color(0xFF8B5CF6);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula Virtual',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackground,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimary,
          brightness: Brightness.light,
        ),
      ),
      home: const StudentDashboard(),
    );
  }
}

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const VirtualClassroomView(),
    const Center(
      child: Text(
        'Vista: Tareas Pendientes',
        style: TextStyle(fontSize: 18, color: kTextDark),
      ),
    ),
    const Center(
      child: Text(
        'Vista: Calendario',
        style: TextStyle(fontSize: 18, color: kTextDark),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: kSurface,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimary,
          unselectedItemColor: kTextMuted.withValues(alpha: 0.6),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.space_dashboard_rounded),
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.assignment_rounded),
              ),
              label: 'Tareas pendientes',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.calendar_month_rounded),
              ),
              label: 'Calendario',
            ),
          ],
        ),
      ),
    );
  }
}

class VirtualClassroomView extends StatelessWidget {
  const VirtualClassroomView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CourseModule> courseModules = _getDummyModules();

    return Scaffold(
      backgroundColor: kBackground,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          children: [
            _buildCourseHeader(),
            const SizedBox(height: 24),
            _buildQuickStatsCard(),
            const SizedBox(height: 28),
            const Text(
              'Contenido del Semestre',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 16),
            ...courseModules.map((module) => _buildModuleCard(module)),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: kTextDark,
          size: 22,
        ),
        onPressed: () {},
      ),
      title: const Text(
        'Ingeniería en Sistemas',
        style: TextStyle(
          color: kTextMuted,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: kTextDark,
            size: 26,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCourseHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: kPrimaryLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'SECCIÓN E · 2026',
            style: TextStyle(
              color: kPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Auditoría de Sistemas',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: kTextDark,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            CircleAvatar(
              radius: 12,
              backgroundColor: kBorder,
              child: Icon(Icons.person, size: 16, color: kTextMuted),
            ),
            SizedBox(width: 8),
            Text(
              'Ing. Carlos Mendoza',
              style: TextStyle(
                fontSize: 14,
                color: kTextMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickStatsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.emoji_events_rounded, color: kColorTask, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Tu progreso',
                    style: TextStyle(
                      color: kTextDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Text(
                '68%',
                style: TextStyle(
                  color: kPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.68,
              backgroundColor: kBackground,
              color: kPrimary,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '12 de 18 actividades listas',
                style: TextStyle(
                  color: kTextMuted,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '¡Vas muy bien!',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(CourseModule module) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: module.isInitiallyExpanded,
          iconColor: kPrimary,
          collapsedIconColor: kTextMuted,
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            module.title,
            style: const TextStyle(
              color: kTextDark,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              module.dateRange,
              style: const TextStyle(color: kTextMuted, fontSize: 13),
            ),
          ),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: kBorder, height: 1),
            ),
            ...module.resources.map((resource) => _buildResourceRow(resource)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceRow(CourseResource resource) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: resource.accentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(resource.icon, color: resource.accentColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resource.title,
                    style: TextStyle(
                      color: resource.isCompleted ? kTextMuted : kTextDark,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: resource.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    resource.typeLabel,
                    style: const TextStyle(color: kTextMuted, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: resource.isCompleted ? kPrimary : Colors.transparent,
                border: Border.all(
                  color: resource.isCompleted ? kPrimary : kBorder,
                  width: 2,
                ),
              ),
              child: resource.isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  List<CourseModule> _getDummyModules() {
    return [
      CourseModule(
        title: 'General & Avisos',
        dateRange: 'Información permanente del curso',
        isInitiallyExpanded: true,
        resources: [
          CourseResource(
            title: 'Foro de avisos generales',
            typeLabel: 'Anuncio · Foro',
            icon: Icons.forum_rounded,
            accentColor: kColorForum,
            isCompleted: true,
          ),
          CourseResource(
            title: 'Sílabo y metodología de evaluación',
            typeLabel: 'Documento · PDF',
            icon: Icons.picture_as_pdf_rounded,
            accentColor: kColorPdf,
            isCompleted: true,
          ),
        ],
      ),
      CourseModule(
        title: 'Semana 1: Conceptos Básicos',
        dateRange: '29 de junio - 5 de julio',
        resources: [
          CourseResource(
            title: 'Tipos de Auditoría de Sistemas',
            typeLabel: 'Lectura · PDF',
            icon: Icons.picture_as_pdf_rounded,
            accentColor: kColorPdf,
            isCompleted: true,
          ),
          CourseResource(
            title: 'Generalidades y Alcances',
            typeLabel: 'Presentación · Diapositivas',
            icon: Icons.auto_awesome_motion_rounded,
            accentColor: kColorSlide,
            isCompleted: true,
          ),
        ],
      ),
      CourseModule(
        title: 'Semana 3: Motivaciones y Ética',
        dateRange: '13 de julio - 19 de julio',
        isInitiallyExpanded: true,
        resources: [
          CourseResource(
            title: 'Motivaciones para hacer una auditoría',
            typeLabel: 'Material de lectura · PDF',
            icon: Icons.picture_as_pdf_rounded,
            accentColor: kColorPdf,
            isCompleted: false,
          ),
          CourseResource(
            title: 'Ejercicios de Ética y Principios',
            typeLabel: 'Tarea · Vence mañana',
            icon: Icons.assignment_rounded,
            accentColor: kColorTask,
            isCompleted: false,
          ),
        ],
      ),
    ];
  }
}

class CourseModule {
  final String title;
  final String dateRange;
  final List<CourseResource> resources;
  final bool isInitiallyExpanded;

  CourseModule({
    required this.title,
    required this.dateRange,
    required this.resources,
    this.isInitiallyExpanded = false,
  });
}

class CourseResource {
  final String title;
  final String typeLabel;
  final IconData icon;
  final Color accentColor;
  final bool isCompleted;

  CourseResource({
    required this.title,
    required this.typeLabel,
    required this.icon,
    required this.accentColor,
    this.isCompleted = false,
  });
}