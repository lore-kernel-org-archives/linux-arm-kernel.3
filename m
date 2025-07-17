Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA26C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=; b=h/AaBbiBgzcPde5ADxE8I3HY/v
	gXlhgdf0g6fj2Vj4CEBG5VAoD8kAaH4n8KjAy4738phg2ef8sXxJCf8Z6ZB53EbGPW0BFmnsVbQ4E
	VBFPcxVjdYezNj5Q+BzFUN6M0wOJEpuDxBFUSJ7VLGPXREH9iOIKKy7JzNKvYWtuyWjs5HUmWPCdr
	xiS8lzvLUblSGT8o5FRHlDV60Yn9y6wFoxMRaieIuLDguOaFbY8A1+hnhAFiyBUeXS2wqxj24rj1F
	tLsvSXkvYf77tCSTALUFS610LFMU/P1efQZRaLhEQBO5ZQRWRwNNcUOgCYId1VS1A967Vt9lL6bTB
	yCxzI21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLxc-00000009rLA-32EG;
	Thu, 17 Jul 2025 10:35:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLv0-00000009qTY-16yq;
	Thu, 17 Jul 2025 10:32:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b45edf2303so700604f8f.2;
        Thu, 17 Jul 2025 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748368; x=1753353168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
        b=Zdj6iLEHubPt+VfFrR1UPF9yXjJNz1YITLDP4HCQhorefoIw19WWFFfVnanMhhxWp1
         RcwM0lEHvWYpR02vhcucCTde3rfuD/uIcK5zFB0SGj20Zg5ETJCmG+df3RB0Kcz4H3dh
         dZ31WrPR7ihxV1pNm7V6zZCYj955f+pEHDkI668KCFtnSaxHe1G0IqbaiExJCjUi2gq8
         x7Iik2/PdSHdi/6uaOqGJLqUhw9s/QOdpayhiqSOaR+7Skp0l8dfuE3MxunRt2uoHc7o
         2wpNB+l9PLOnNJAWYKXttMsiKEaMrKCifys3a0ditmvgxp9BEp3A+tIynspULu976C0i
         o5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748368; x=1753353168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
        b=Iys4ZfHYN3AXomEXVFw5Ia+yWrWQpBSrjH9RHx8vvfSl71FOnR3bvrO69vnt6me6Nm
         xGj6brikOr7UZnMRlSuZYWkFU8GzzvNAiTKcLTjgeEjVEtyfMY6T1+hNMwIEL57+lLnp
         ovtz+j31ke9Sw4SGWjJi23FOt/Gkk767ko2YI7bCvFGOqv6mqavN+iJnv/EkEk3Gn7bG
         BTffwI6Gjt6c7yMKVv347UXbL0vtaMTJsuCrIDAoqgfBKlFtnxQYdcLQeeP25hicVIfi
         mOdVwoAtc6w868YEcnUHF+Yr/2NO+mjpa+41nPGEkzqJ7VGaK18PT4b+lfi0zIV++EpX
         LKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1Yg/eNWRBoz3B3ZsjjZH6/u10npqbiSY/eJyf7Xc28bqoia+Px3hTgo7zYCp6WpvStNwJvNQuXdJUcHA=@lists.infradead.org, AJvYcCXPPHIDpfjbyMRecZM/wI2H/eoHdRdRPGuUkcwmkO3+y+XO5PDdDXH49egcdT6jCN7KWruWbZFS0unCV5/PG4Hm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4vkwj5Ev+Ns5Aaq4TA/Tk/qHSljO8bRMszgGYcdV/cPJJwFR5
	dsuVqEsIodITsTjIgFprp9uRv5ahX3D0fI/8AJ65gNXEzd6Cg0B7PCkXjcYv6Q==
X-Gm-Gg: ASbGncs9RiY9p4fv28S0QXREFCB4GRGL3lFTmiZX0gwUe9UzLq2jVfKcuzOazsRmJMO
	V1Kh46+1ROItRvd8QcQV4DLVykmRrmSg+Ldu+GBsS46I+xtxy11Qz6Cj5bpkwPRTjT1uTGH96Ld
	CE+sXHFGLfsv1ISIO8jP8UADZPxYCA0yF3y2wbK6iKZodNYiFZNWZhnAULlAfUrWb5UhJC208P9
	zfI9KDc6GoqCkqzxsP962guuvWSxEt4CBKeHWM/745kWzVDyMX88pCUuo0G1JF3PBGLZ3la9llr
	zz1Ulx86N+96BULbYiO1amDbpqN+CUrrCel/0lMysMJo+Uj6bLXNj9RhRDGdOtIdr0K9fizfZEK
	ubX2RnoreH5D8KDhlN/l2Q27x/5jUXVrBEXp2WsodVRS8Xy1MuxKvEkLt6C1YN/NEt22Yby+YWH
	sq1lNXbHt5M9GXtA==
X-Google-Smtp-Source: AGHT+IHYr+e6HRnWiJaX4uEEec2eLY7pIXWpQP51NQ3+bvIOdtAIUdk3bgr+G16cAKYOJRVTeTk/yA==
X-Received: by 2002:a05:6000:1882:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b60dd731damr5816056f8f.34.1752748367574;
        Thu, 17 Jul 2025 03:32:47 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d758sm20033465f8f.49.2025.07.17.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] syscore: Pass context data to callbacks
Date: Thu, 17 Jul 2025 12:32:34 +0200
Message-ID: <20250717103241.2806798-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033250_307370_1946D3D1 
X-CRM114-Status: GOOD (  14.96  )
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

From: Thierry Reding <treding@nvidia.com>

Hi,

Something that's been bugging me over the years is how some drivers have
had to adopt file-scoped variables to pass data into something like the
syscore operations. This is often harmless, but usually leads to drivers
not being able to deal with multiple instances, or additional frameworks
or data structures needing to be created to handle multiple instances.

This series proposes to "objectify" struct syscore_ops by passing a
pointer to struct syscore_ops to the syscore callbacks. Implementations
of these callbacks can then make use of container_of() to get access to
contextual data that struct syscore_ops was embedded in. This elegantly
avoids the need for file-scoped, singleton variables, by tying syscore
to individual instances.

Patch 1 contains the bulk of these changes. It's fairly intrusive
because it does the conversion of the function signature all in one
patch. An alternative would've been to introduce new callbacks such that
these changes could be staged in. However, the amount of changes here
are not quite numerous enough to justify that, in my opinion, and
syscore isn't very frequently used, so the risk of another user getting
added while this is merged is rather small. All in all I think merging
this in one go is the simplest way.

Patches 2-7 are conversions of some existing drivers to take advantage
of this new parameter and tie the code to per-instance data.

Given that the recipient list for this is huge, I'm limiting this to
Greg (because it's at the core a... core change) and a set of larger
lists for architectures and subsystems that are impacted.

Changes in v2:
- kerneldoc fixes

Thanks,
Thierry

Thierry Reding (7):
  syscore: Pass context data to callbacks
  MIPS: Embed syscore_ops in PCI context
  bus: mvebu-mbus: Embed syscore_ops in mbus context
  clk: ingenic: tcu: Embed syscore_ops in TCU context
  clk: mvebu: Embed syscore_ops in clock context
  irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
  soc/tegra: pmc: Derive PMC context from syscore ops

 arch/arm/mach-exynos/mcpm-exynos.c        |  4 +-
 arch/arm/mach-exynos/suspend.c            | 14 +++---
 arch/arm/mach-pxa/irq.c                   |  4 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c            |  4 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c            |  4 +-
 arch/arm/mach-pxa/smemc.c                 |  4 +-
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        |  4 +-
 arch/arm/mach-s5pv210/pm.c                |  2 +-
 arch/arm/mach-versatile/integrator_ap.c   |  4 +-
 arch/arm/mm/cache-b15-rac.c               |  4 +-
 arch/loongarch/kernel/smp.c               |  4 +-
 arch/mips/alchemy/common/dbdma.c          |  4 +-
 arch/mips/alchemy/common/irq.c            |  8 ++--
 arch/mips/alchemy/common/usb.c            |  4 +-
 arch/mips/pci/pci-alchemy.c               | 28 ++++++------
 arch/powerpc/platforms/cell/spu_base.c    |  2 +-
 arch/powerpc/platforms/powermac/pic.c     |  4 +-
 arch/powerpc/sysdev/fsl_lbc.c             |  4 +-
 arch/powerpc/sysdev/fsl_pci.c             |  4 +-
 arch/powerpc/sysdev/ipic.c                |  4 +-
 arch/powerpc/sysdev/mpic.c                |  4 +-
 arch/powerpc/sysdev/mpic_timer.c          |  2 +-
 arch/sh/mm/pmb.c                          |  2 +-
 arch/x86/events/amd/ibs.c                 |  4 +-
 arch/x86/hyperv/hv_init.c                 |  4 +-
 arch/x86/kernel/amd_gart_64.c             |  2 +-
 arch/x86/kernel/apic/apic.c               |  4 +-
 arch/x86/kernel/apic/io_apic.c            |  9 +++-
 arch/x86/kernel/cpu/aperfmperf.c          |  6 +--
 arch/x86/kernel/cpu/intel_epb.c           |  8 ++--
 arch/x86/kernel/cpu/mce/core.c            |  6 +--
 arch/x86/kernel/cpu/microcode/core.c      |  7 ++-
 arch/x86/kernel/cpu/mtrr/legacy.c         |  4 +-
 arch/x86/kernel/cpu/umwait.c              |  2 +-
 arch/x86/kernel/i8237.c                   |  2 +-
 arch/x86/kernel/i8259.c                   |  6 +--
 arch/x86/kernel/kvm.c                     |  4 +-
 drivers/acpi/pci_link.c                   |  2 +-
 drivers/acpi/sleep.c                      |  4 +-
 drivers/base/firmware_loader/main.c       |  2 +-
 drivers/base/syscore.c                    |  8 ++--
 drivers/bus/mvebu-mbus.c                  | 24 +++++-----
 drivers/clk/at91/pmc.c                    |  4 +-
 drivers/clk/imx/clk-vf610.c               |  4 +-
 drivers/clk/ingenic/pm.c                  |  4 +-
 drivers/clk/ingenic/tcu.c                 | 54 +++++++++++------------
 drivers/clk/mvebu/common.c                | 25 +++++++----
 drivers/clk/rockchip/clk-rk3288.c         |  4 +-
 drivers/clk/samsung/clk-s5pv210-audss.c   |  4 +-
 drivers/clk/samsung/clk.c                 |  4 +-
 drivers/clk/tegra/clk-tegra210.c          |  4 +-
 drivers/clocksource/timer-armada-370-xp.c |  4 +-
 drivers/cpuidle/cpuidle-psci.c            |  4 +-
 drivers/gpio/gpio-mxc.c                   |  4 +-
 drivers/gpio/gpio-pxa.c                   |  4 +-
 drivers/gpio/gpio-sa1100.c                |  4 +-
 drivers/hv/vmbus_drv.c                    |  4 +-
 drivers/iommu/amd/init.c                  |  4 +-
 drivers/iommu/intel/iommu.c               |  4 +-
 drivers/irqchip/exynos-combiner.c         |  6 ++-
 drivers/irqchip/irq-armada-370-xp.c       |  4 +-
 drivers/irqchip/irq-bcm7038-l1.c          |  4 +-
 drivers/irqchip/irq-gic-v3-its.c          |  4 +-
 drivers/irqchip/irq-i8259.c               |  4 +-
 drivers/irqchip/irq-imx-gpcv2.c           | 33 ++++++--------
 drivers/irqchip/irq-loongson-eiointc.c    |  4 +-
 drivers/irqchip/irq-loongson-htpic.c      |  2 +-
 drivers/irqchip/irq-loongson-htvec.c      |  4 +-
 drivers/irqchip/irq-loongson-pch-lpc.c    |  4 +-
 drivers/irqchip/irq-loongson-pch-pic.c    |  4 +-
 drivers/irqchip/irq-mchp-eic.c            |  4 +-
 drivers/irqchip/irq-mst-intc.c            |  4 +-
 drivers/irqchip/irq-mtk-cirq.c            |  4 +-
 drivers/irqchip/irq-renesas-rzg2l.c       |  4 +-
 drivers/irqchip/irq-sa11x0.c              |  4 +-
 drivers/irqchip/irq-sifive-plic.c         |  4 +-
 drivers/irqchip/irq-sun6i-r.c             | 10 ++---
 drivers/irqchip/irq-tegra.c               |  4 +-
 drivers/irqchip/irq-vic.c                 |  4 +-
 drivers/leds/trigger/ledtrig-cpu.c        |  6 +--
 drivers/macintosh/via-pmu.c               |  4 +-
 drivers/power/reset/sc27xx-poweroff.c     |  2 +-
 drivers/sh/clk/core.c                     |  2 +-
 drivers/sh/intc/core.c                    |  4 +-
 drivers/soc/bcm/brcmstb/biuctrl.c         |  4 +-
 drivers/soc/tegra/pmc.c                   |  7 ++-
 drivers/thermal/intel/intel_hfi.c         |  4 +-
 drivers/xen/xen-acpi-processor.c          |  2 +-
 include/linux/syscore_ops.h               |  6 +--
 kernel/cpu_pm.c                           |  4 +-
 kernel/irq/generic-chip.c                 |  6 +--
 kernel/irq/pm.c                           |  3 +-
 kernel/printk/printk.c                    |  3 +-
 kernel/time/sched_clock.c                 | 14 +++++-
 kernel/time/timekeeping.c                 | 14 +++++-
 virt/kvm/kvm_main.c                       |  6 +--
 96 files changed, 306 insertions(+), 269 deletions(-)

-- 
2.50.0


