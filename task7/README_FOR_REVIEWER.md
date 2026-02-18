## Шаг 1. Создание namespace audit-zone с уровнем PodSecurity restricted

```bash
kubectl apply -f 01-create-namespace.yaml
````

## Шаг 2. Проверка политики безопасности PSA

```bash
bash verify/validate-security.sh
```

* Проверяет, что небезопасные манифесты в insecure-manifests/ отклоняются.
* Проверяет, что безопасные манифесты в secure-manifests/ применяются успешно.

## Шаг 3. Установка OPA Gatekeeper

```bash
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml
```

Дождитесь, пока все компоненты Gatekeeper перейдут в статус `Running`:

```bash
kubectl get pods -n gatekeeper-system
```

## Шаг 4. Применение OPA-шаблонов и ограничений

```bash
kubectl apply -f gatekeeper/constraint-templates/
kubectl apply -f gatekeeper/constraints/
```

## Шаг 5. Проверка работы Gatekeeper

```bash
bash verify/verify-admission.sh
```

* Проверяет, что правила Gatekeeper отклоняют небезопасные манифесты.
* Проверяет, что безопасные манифесты применяются.

## Возврат в исходное состояние

```bash
bash reset-task7.sh
```

