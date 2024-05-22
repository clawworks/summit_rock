import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/custom_button.dart';
import 'package:summit_rock/src/features/authentication/data/auth_repository.dart';
import 'package:summit_rock/src/features/authentication/presentation/summit_header.dart';
import 'package:summit_rock/src/routing/app_router.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = useTextEditingController(
      text: ref.watch(authRepositoryProvider).currentUser?.name,
    );
    final loading = useState(false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20.0),
            const SummitHeader(),
            const SizedBox(height: 60.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'What is Your Name?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                  // size: 36.0,
                  // weight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    // horizontal: 16.0,
                    vertical: 40.0,
                  ),
                  child: TextField(
                    onEditingComplete: () {
                      // _submit(controller, context, controller);
                    },
                    textAlign: TextAlign.center,
                    controller: controller,
                    textCapitalization: TextCapitalization.words,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                ),
                CustomButton(
                  text: "Let's Go!",
                  loading: loading.value,
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () async {
                    loading.value = true;
                    final authRepo = ref.read(authRepositoryProvider);
                    print("Signing in Anonymously");
                    await authRepo.signInAnonymously();
                    print("Updating User Name");
                    await authRepo.updateUserName(controller.text);
                    print("Routing to Home Page");
                    if (context.mounted) {
                      context.goNamed(AppRoute.home);
                      loading.value = false;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
