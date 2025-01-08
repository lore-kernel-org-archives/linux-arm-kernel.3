Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBEEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9S7W0HfHvJI5190vNjSmuT5KotC5Nh+CN9GUxaRb6A=; b=GDpeSllYbBOJfYduWRrnS+4kVJ
	65Ks5ybQD5qkBbTHsMho1qIDPYoN0549MLLtgokejdHEuHbsKG5gYgOlRWUNuv7Jw15dARIgT5edW
	BQnicerjH+pkm9kGssjb82bF+IOj6O3AD5QRdOFhUR9NRk3OiDByqi7TaLmxPdyhUwVUFSeRRjulo
	/WGPhulvaYFZmTwq+mhhXWetQ9eLtNK3LSbg/isuBpnnu1NudMJCR/DrHEHhdmLpZQAfa2y+njIC/
	pUUAZnV+wLaQWfX9glEKS6+0uLeegn3tqW9qcymA5xXxhoV/Z+RFXeuCrROYfJqlpdezkudsVBvQV
	JtAYciHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUzO-00000008OBr-0k8B;
	Wed, 08 Jan 2025 12:16:46 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVf-00000008Gz8-0CFq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:07 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so53252365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336761; x=1736941561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u9S7W0HfHvJI5190vNjSmuT5KotC5Nh+CN9GUxaRb6A=;
        b=QOysX4gO3Q/Fbk8xnF0V/SqXaGCWyvZCNjhas9lfDvfUAjHwY2DFoxEhfGKYBBBMsy
         DsItkFWuve1occOA/p/wH/lGTYtjHFFfR64MvitA6CNqpLTgRGKTyNCg5V6thft9KRsk
         J5l32233GJciGSPKGo5alh+hbeE4ZqnA3tOK7jsxVlceo02Z0AASzNo52VOztqJxhyhm
         zhf2zHRmy3YJwY1ZkpU91wTd/eioJMi+4iLYyRYDj67K+5AAiGPJ+MJGRIspo47EopWM
         b4hCjrTNEVXNH34+80I0i/Wp3Wwcje1hnFpDSOy4NOACcG6En7QaF7R6oIvB3y5RrIF/
         yCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336761; x=1736941561;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9S7W0HfHvJI5190vNjSmuT5KotC5Nh+CN9GUxaRb6A=;
        b=U9gOEN74PHeBzFevFJyO3Qxez9gV75i0QglF4JDkDCtO4hxrWTb68YNaqtVCph4ia+
         DsjNx/It4bHAwW5aHVYApKSlakJ/tmP/dhxGfQA/pxrqz1GTSHM2A6rw7ctynFss+Ob2
         Xeyn34ZZab0JX3XCbrzwckT6DQpYdwGHB0N9Dt3SdxnKkptjYNwMz1GSYQ87BTtpOJPi
         KGj9MSD/K8xN+XqzGflwsaI3LUdclPOsSHmLe9K04AjsL9euwvyp1UGrSFW7svkttYoD
         u5IYNlMnpSAO3sJCF6PLZtNe37E4w3/mGISRQBFKVzmzfThTXbCUy9P5ssUGH2Suz865
         Bz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNcWZUb5LZz4rKIiKLS0LcMoArEZn5tSLygs3OeGgqXtBLc6c1kzOGo5tqNE9Bz3ZZ+Pui+Gng2E/dnpdf1P9H@lists.infradead.org
X-Gm-Message-State: AOJu0YzldOzzFTG7d6Bx7HK5/OEVoisEaD7H4uznTXYcQQ7qGG+aFxEX
	jzQy8Jxyuaj013Vt81C6hnPWQguGizZQrh/dURnHCZcZLNr2qs85HxlNqUebvT24SAQxdWHt234
	dFZGwj/1C2k+63XO5Rg==
X-Google-Smtp-Source: AGHT+IEuXsIa0p+08ntfuOYSXDRZbRggsKddBxRV+z+mWnkpVnsaXUObKqP1qE0FqwA+Az1xv45anGjrQ+vmf5da
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:434:fa72:f1bf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c28:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-436e2699dfbmr21482055e9.14.1736336760817;
 Wed, 08 Jan 2025 03:46:00 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-1-vdonnefort@google.com>
Subject: [PATCH v2 00/12] Tracefs support for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_034603_088731_599933AC 
X-CRM114-Status: GOOD (  23.80  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The growing set of features supported by the hypervisor in protected
mode necessitates debugging and profiling tools. Tracefs is the
ideal candidate for this task:

  * It is simple to use and to script.

  * It is supported by various tools, from the trace-cmd CLI to the
    Android web-based perfetto.

  * The ring-buffer, where are stored trace events consists of linked
    pages, making it an ideal structure for sharing between kernel and
    hypervisor.

This series introduces a method to create events and to generate them
from the hypervisor (hyp_enter/hyp_exit given as an example) as well as
a Tracefs user-space interface to read them.

A presentation was given on this matter during the tracing summit in
2022. [1]

1. ring-buffer
--------------

To setup the per-cpu ring-buffers, a new interface is created:

  ring_buffer_remote:	Describes what the kernel needs to know about the
			remote writer, that is, the set of pages forming the
			ring-buffer and a callback for the reader/head
			swapping (enables consuming read)

  ring_buffer_remote():	Creates a read-only ring-buffer from a
			ring_buffer_remote.

To keep the internals of `struct ring_buffer` in sync with the writer,
the meta-page is used. It was originally introduced to enable user-space
mapping of the ring-buffer [1]. In this case, the kernel is not the
producer anymore but the reader. The function to read that meta-page is:

  ring_buffer_poll_remote():
			Update `struct ring_buffer` based on the writer
			meta-page. Wake-up readers if necessary.

The kernel has to poll the meta-page to be notified of newly written
events.

2. Tracefs interface
--------------------

The interface is a hypervisor/ folder at the root of the tracefs mount
point.  This folder is like an instance and you'll find there a subset
of the regular Tracefs user-space interface:

  hypervisor/
     buffer_size_kb
     trace_clock
     trace_pipe
     trace_pipe_raw
     trace
     per_cpu/
             cpuX/
                 trace
                 trace_pipe
                 trace_pipe_raw
     events/
            hypervisor/
                hyp_enter/
                          enable
                          id

Behind the scenes, kvm/hyp_trace.c must rebuild the tracing hierarchy
without relying on kernel/trace/trace.c. This is due to fundamental
differences:

  * Hypervisor tracing doesn't support trace_array's system-specific
    features (snapshots, tracers, etc.).

  * Logged event formats differ (e.g., no PID in hypervisor
    events).

  * Buffer operations require specific hypervisor interactions.

3. Events
---------

In the hypervisor, "hyp events" can be generated with trace_<event_name>
in a similar fashion to what the kernel does. They're also created with
similar macros than the kernel (see kvm_hypevents.h)

HYP_EVENT("foboar",
	HE_PROTO(void),
	HE_STRUCT(),
	HE_ASSIGN(),
	HE_PRINTK(" ")
)

Despite the apparent similarities with TRACE_EVENT(), those macros
internally differs: they must be used in parallel between the hypervisor
(for the writing part) and the kernel (for the reading part) which makes
it difficult to share anything with their kernel counterpart.

Also, events directory isn't using eventfs.

4. Limitations:
---------------

Non-consuming reading of the buffer isn't supported (i.e. cat trace ->
-EPERM) due to current the lack of support in the ring-buffer meta-page.

[1] https://tracingsummit.org/ts/2022/hypervisortracing/
[2] https://lore.kernel.org/all/20240510140435.3550353-1-vdonnefort@google.com/

Changes since v1: https://lore.kernel.org/all/20240911093029.3279154-1-vdonnefort@google.com/

  - Add 128-bits mult fallback in the unlikely event of an overflow. (John)
  - Fix ELF section sort.
  - __always_inline trace_* event macros.
  - Fix events/<event>/enable permissions.
  - Rename ring-buffer "writer" to "remote".
  - Rename CONFIG_PROTECTED_NVHE_TESTING to PKVM_SELFTEST to align with
    Quentin's upcoming selftest
  - Rebase on 6.13-rc3.

Changes since RFC: https://lore.kernel.org/all/20240805173234.3542917-1-vdonnefort@google.com/

  - hypervisor trace clock:
     - mult/shift computed in hyp_trace.c. (John)
     - Update clock when it deviates from kernel boot clock. (John)
     - Add trace_clock file.
     - Separate patch for better readability.

  - Add a proper reset interface which does not need to teardown the
    tracing buffers. (Steven)

  - Return -EPERM on trace access. (Steven)

  - Add per-cpu trace file.

  - Automatically teardown and free the tracing buffer when it is empty,
    without readers and not currently tracing.

  - Show in buffer_size_kb if the buffer is loaded in the hypervisor or
    not.

  - Extend tests to cover reset and unload.

  - CC timekeeping folks on relevant patches (Marc)

Vincent Donnefort (12):
  ring-buffer: Check for empty ring-buffer with rb_num_of_entries()
  ring-buffer: Introducing ring-buffer remote
  ring-buffer: Expose buffer_data_page material
  KVM: arm64: Support unaligned fixmap in the nVHE hyp
  KVM: arm64: Add clock support in the nVHE hyp
  KVM: arm64: Add tracing support for the pKVM hyp
  KVM: arm64: Add hyp tracing to tracefs
  KVM: arm64: Add clock for hyp tracefs
  KVM: arm64: Add raw interface for hyp tracefs
  KVM: arm64: Add trace interface for hyp tracefs
  KVM: arm64: Add support for hyp events
  KVM: arm64: Add kselftest for tracefs hyp tracefs

 arch/arm64/include/asm/kvm_asm.h              |   8 +
 arch/arm64/include/asm/kvm_define_hypevents.h |  61 ++
 arch/arm64/include/asm/kvm_hyp.h              |   1 -
 arch/arm64/include/asm/kvm_hypevents.h        |  41 +
 arch/arm64/include/asm/kvm_hypevents_defs.h   |  41 +
 arch/arm64/include/asm/kvm_hyptrace.h         |  37 +
 arch/arm64/kernel/image-vars.h                |   4 +
 arch/arm64/kernel/vmlinux.lds.S               |  18 +
 arch/arm64/kvm/Kconfig                        |  10 +
 arch/arm64/kvm/Makefile                       |   2 +
 arch/arm64/kvm/arm.c                          |   6 +
 arch/arm64/kvm/hyp/hyp-constants.c            |   4 +
 arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h   |  13 +
 arch/arm64/kvm/hyp/include/nvhe/clock.h       |  16 +
 .../kvm/hyp/include/nvhe/define_events.h      |  21 +
 arch/arm64/kvm/hyp/include/nvhe/trace.h       |  60 ++
 arch/arm64/kvm/hyp/nvhe/Makefile              |   1 +
 arch/arm64/kvm/hyp/nvhe/clock.c               |  65 ++
 arch/arm64/kvm/hyp/nvhe/events.c              |  35 +
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  85 ++
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |   6 +
 arch/arm64/kvm/hyp/nvhe/mm.c                  |   2 +-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c          |  14 +-
 arch/arm64/kvm/hyp/nvhe/switch.c              |   5 +-
 arch/arm64/kvm/hyp/nvhe/trace.c               | 660 ++++++++++++
 arch/arm64/kvm/hyp_events.c                   | 159 +++
 arch/arm64/kvm/hyp_trace.c                    | 988 ++++++++++++++++++
 arch/arm64/kvm/hyp_trace.h                    |  15 +
 include/linux/ring_buffer.h                   |  99 +-
 kernel/trace/ring_buffer.c                    | 308 ++++--
 tools/testing/selftests/hyp-trace/Makefile    |   6 +
 tools/testing/selftests/hyp-trace/config      |   4 +
 .../selftests/hyp-trace/hyp-trace-test        | 254 +++++
 34 files changed, 2955 insertions(+), 96 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_define_hypevents.h
 create mode 100644 arch/arm64/include/asm/kvm_hypevents.h
 create mode 100644 arch/arm64/include/asm/kvm_hypevents_defs.h
 create mode 100644 arch/arm64/include/asm/kvm_hyptrace.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/clock.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/define_events.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/trace.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/clock.c
 create mode 100644 arch/arm64/kvm/hyp/nvhe/events.c
 create mode 100644 arch/arm64/kvm/hyp/nvhe/trace.c
 create mode 100644 arch/arm64/kvm/hyp_events.c
 create mode 100644 arch/arm64/kvm/hyp_trace.c
 create mode 100644 arch/arm64/kvm/hyp_trace.h
 create mode 100644 tools/testing/selftests/hyp-trace/Makefile
 create mode 100644 tools/testing/selftests/hyp-trace/config
 create mode 100755 tools/testing/selftests/hyp-trace/hyp-trace-test


base-commit: 09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
-- 
2.47.1.613.gc27f4b7a9f-goog


