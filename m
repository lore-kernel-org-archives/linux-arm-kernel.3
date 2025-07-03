Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC635C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmUr7a9e0PATdvV0LHXQVvdSyYTobgcYcqniNe1h/bk=; b=L8wXYq51tfsmhz+essb3GN09ch
	GR4eEMkaCMM/UGQfacykrlhJLCuwJ+nIrM6OeRYvP99P7u3MuktMQHbBH0cf3NHwM4TV5R7p7ha2z
	6kM3YqOSMhZYouArMbE+WceBa2Rs5kRkylGJTMFKRLiqOyG+js9VMrCFFZc1l4CJHOmLkpyan13to
	606ib/7MTnjVwg1lQQ3h8drI4xd3jgrKASpa15sCTpXJil/e4HuX5v9sO2biMI2v0X5wVnEZtosC1
	XoDEFCuQsYGK143M5YlgVNGU7Bhc/nzyMHlpqxMxzHIKqaQ+/gNOOFDGTtgh/cQrdjKki3MmyvbHy
	v2ADhaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMLa-0000000BunF-2jDr;
	Thu, 03 Jul 2025 15:59:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKZJ-0000000Bau7-0Hxc;
	Thu, 03 Jul 2025 14:05:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32b43cce9efso45600181fa.3;
        Thu, 03 Jul 2025 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751551539; x=1752156339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JmUr7a9e0PATdvV0LHXQVvdSyYTobgcYcqniNe1h/bk=;
        b=aKNmh3hNXqjRfqDptxY1XOKCeGbeAHYkqs6eOayvFRw7MUefv+Lk0xpKJmHPFFF/qy
         zHAMgL9ZnFKOIKViFwDtQsExhhfeVBCLnG0sJDKPehqkZAhbwVq9vwzMGm0v770DUWgO
         lcTfW53U3ilxxdXkrnnfTtkV5c/CsrpKUXIhBgD94WZr3WrDOa4pJK2a5xnInGQmS0tT
         LOLTZ7HdcEWe81aXxdnteFUllWnEslv65P0XTMifc/boHnUm2bMrUM2GDgAu0wsv6kvf
         AF2KV2GsiSWmlG9PF4sPzwjov8FGskDsY4Wiglgzp6OCeorAz/Agn7GH2t8W1fF2XjJa
         6b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551539; x=1752156339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmUr7a9e0PATdvV0LHXQVvdSyYTobgcYcqniNe1h/bk=;
        b=A9xmR7a7jYASAqGC6tILFAIMYwp85TihfqP5roI05KgJiluexof1JzxplisWmZr5Gf
         Al5gneY4KEj3k4WEuvDxiq0ooaralT4VA1+bALAXLXxCNS0ZRGq/8efDyxeh5ZN/G8RP
         bsitFjKOu7ajEaMTWpkOQXxtrBsugxHKCAH45MKNu9mks+F+dRjNjjJSiIeZ11SyDADH
         ZB2c20s8wVp3QlvBfcOvKFh++G4XhVfRtqxJY7IZmfgBM6CH0HEz+7S9z43dE4s3hEFc
         ECfuiWvJ5cErDJnogO7moSxmP5FGGTEEp0qlkibZzRaLeBnrk8e9YgAZXw96NhaxIc21
         EbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9OSN5YMXeJL5MPdM30XBZQ5wpTkTH2JTarMHcoMMObkT/0rN+0FZPu0X9ILEK4ToENaFlc3vtJ104wZhJCGw=@lists.infradead.org, AJvYcCXCB0PYAuTlGrhOO+zy2EPRNR98h88vjhe8vwBmD4TtuaPHuiUnRZSEhIeohY2iwny8XD35xIjJNvLrzaDu7P3Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb5wr+n3dR41SAM4DX0crzYNzgBH8CiMH8LkcNQRXokszNJSGD
	Mlexsz9+qESlkSBUxmcJMpnulUVNJF8whiL5wjTJ+PoA75xD6SBfwhtkbnJy6A==
X-Gm-Gg: ASbGncvQPBv4SI77hA03Sg2XDwd9ATdxKh454YUSyRCTEQrDCJUKYRW9bO59TFc6uL9
	F5MpzIcpcDqL81btmYHQWoEinmLaWlXoqGFLWwsCitSfA3WBWxsw9lBB6MISMpaM0pTs9S9N71V
	3ohsbS3MX5byhduNaYcjVBYcxJ4ikB90Ksljexrkn9D2vCHlcWVNfGbsAfnUSpzNmClkpKgscXq
	ZO9+xW/xtPqDUX3hS9g/yVsTm5uHvoGnMDZ6F/eakilZQArIUlXE64Mp2eCTd4yLv1IwV7VlsYR
	+9wL3ZT1W1JiCt+uv6HnJmCQDA5ahOEEejt477lrpmnM/X7bpmcc7QngGF0MekUMRXVHsC4jynG
	SLBEeQvUjnA==
X-Google-Smtp-Source: AGHT+IH3oVtukEMZKjnNjSNsZF/v94pisXnFb81xGOvkRQiVVqdLP6ILpVrCEuXxOzNZO5u54DBolA==
X-Received: by 2002:a05:6512:12d1:b0:553:3178:2928 with SMTP id 2adb3069b0e04-556282c250bmr2919602e87.16.1751551538784;
        Thu, 03 Jul 2025 07:05:38 -0700 (PDT)
Received: from localhost.localdomain ([80.87.144.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73ebsm2442274e87.101.2025.07.03.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:05:38 -0700 (PDT)
From: Alexander Kochetkov <al.kochet@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Kochetkov <al.kochet@gmail.com>
Subject: [PATCH] ARM: rockchip: fix kernel hang during smp initialization
Date: Thu,  3 Jul 2025 17:04:53 +0300
Message-ID: <20250703140453.1273027-1-al.kochet@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_070541_105953_7ECF410C 
X-CRM114-Status: GOOD (  12.82  )
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

In order to bring up secondary CPUs main CPU write trampoline
code to SRAM. The trampoline code is written while secondary
CPUs are powered on (at least that true for RK3188 CPU).
Sometimes that leads to kernel hang. Probably because secondary
CPU execute trampoline code while kernel doesn't expect.

The patch moves SRAM initialization step to the point where all
secondary CPUs are powered down.

That fixes rarely hangs on RK3188:
[    0.091568] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.091996] rockchip_smp_prepare_cpus: ncores 4

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
 arch/arm/mach-rockchip/platsmp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index 36915a073c23..f432d22bfed8 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -279,11 +279,6 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
-		if (rockchip_smp_prepare_sram(node)) {
-			of_node_put(node);
-			return;
-		}
-
 		/* enable the SCU power domain */
 		pmu_set_power_domain(PMU_PWRDN_SCU, true);
 
@@ -316,11 +311,19 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 		asm ("mrc p15, 1, %0, c9, c0, 2\n" : "=r" (l2ctlr));
 		ncores = ((l2ctlr >> 24) & 0x3) + 1;
 	}
-	of_node_put(node);
 
 	/* Make sure that all cores except the first are really off */
 	for (i = 1; i < ncores; i++)
 		pmu_set_power_domain(0 + i, false);
+
+	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
+		if (rockchip_smp_prepare_sram(node)) {
+			of_node_put(node);
+			return;
+		}
+	}
+
+	of_node_put(node);
 }
 
 static void __init rk3036_smp_prepare_cpus(unsigned int max_cpus)
-- 
2.43.0


