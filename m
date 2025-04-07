Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E010DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+FgwxOm7aFKO8+Yjp585HwY/8KQoU+DtbqgD3z9mVQ=; b=H85MHwTrfNL3tgn/UfzGrtaZGP
	wvCI6cJ9qkGaBCKOy++OBOeR3/KCCvDddNPCZizIveHAdLiNrJS4SEMWI/jOy0InCGyro/9rwcTjL
	DiCSZTvPWG6UhtKM/iFs+RAW6DgR4ciM8tzC4K8gV9oJSjwErBGbL73I9sfhu7tkJsPMM4Te1i95t
	OgRbvucb+blmfoG0oJyShoEMb2YJ7/HiY/YDtfdyptUQ7dzEsx62DvTDYj/JcrIbP8+ml6bmuIIJ0
	NehHW88b1FpHsdLAff+QgH14hyelkb3tdpDsZpG2VS/d2hM/ERD0Lr7xdXN/wcoRVvBvbt/1dNC6B
	OwDg2isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g5Y-0000000GaV1-16Qm;
	Mon, 07 Apr 2025 06:36:08 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g27-0000000GZxf-3C2v;
	Mon, 07 Apr 2025 06:32:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2254e0b4b79so47548775ad.2;
        Sun, 06 Apr 2025 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007554; x=1744612354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+FgwxOm7aFKO8+Yjp585HwY/8KQoU+DtbqgD3z9mVQ=;
        b=cgRCp/KjN+802U5/pYkCKFxUkUQPzSVTxaqRX3liSkje8alcHD6FvGLeJbmCkHZF9K
         aSBYOQRXzWE7iqixYL+RfGW2x+RTxP6W/ipwCsO2UvxHNdvi3m18dOTE3cpiUUwqjcqA
         Z07OXqwJ/MWbld9a8cRMh9p9XymzNNZUpi0AuELwfng5EpDwrXgRdu/0txqsEneVJrts
         QBRzPOxoYi+RI3SCVWpuNouJoQHihEwsPoQRr6ks92E78xUbQXpjyO40azZ3KPCW1G81
         c/wrMXfRqKdW+FLQqy2cPimpBuhRRh8b165ZuSDtnRYw48K//M/7burdX1CfYmVdH3AB
         P8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007554; x=1744612354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+FgwxOm7aFKO8+Yjp585HwY/8KQoU+DtbqgD3z9mVQ=;
        b=Bxl63z3ztFdCCH3qVfKPm7rKDR0HyTVm+R2TEX5X1g/9rd1ewMKjLNdb+esFTOkAlv
         JOXlVnDv7AtXj9WKh7x9EJr8pHSxbRiGotiP4ITN1LMNLXWQF1Y5S9sRJCSLO8Iiyqv/
         YndYH7+DefJRpvagXTjVEvYORC58KpKKYqXyqHTTWX78gJMQFOZVFIQoL4hUt0XvHC3S
         SNZQQ5OPajaJtGFmXXQifm54Gbs6aa2xCs/k8Td3bCOtdoHpocVtRiRHEr3JYmjrypGl
         ydnC2c+AJGFFhxjPrWYcmVlTzPBwKJhGVyZJvQ16wOVOhPL1qZMVMZ56i1Z6p4d0lOlZ
         RQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCU32mZ6ytDfqjAJ1hyQ5/puc0LFS31qLskrN5BX6l9U3Ru/FE6Hzj/rW2jHnMdX1aF/Rc46638+gk5La+J2rZg7pw==@lists.infradead.org, AJvYcCW4fjrH1RRVLQNgmiSEsgRmw6qdshvv8E4bJgaysRw/Tz84PWUkqOaA1OpJca99iOFyGAJe4l+jS6wdY2XF@lists.infradead.org
X-Gm-Message-State: AOJu0YxsnnJCH9iL5fCs0h4p0VXve20xamSegisPmjTUj/IgnGu3lMah
	/+TpRwpBf+rKzod1aihMkopjYaWc1zAc/9F2swywLNDPJU07wH0Eez0ysA==
X-Gm-Gg: ASbGncuMkQTuF1GqIsdUeBH+3f5uWJBowkKWDiZ8zFtWLHc6iFjs5Z+jjnY0bbJSh2K
	jns3P/697lS21l6eX0zi/a3+Erwr1dTeiSDpD9LGc+wh5ww3rH6YBIMZXnjwfDfPjJyR6Z3kbBi
	0ppu5MiQ3xc/lOk6ZYTbdUZDq4mxqUkQA8ALSz81b53rTilYVIJw/uvXh3pCqJPaCV5RJQjNeZX
	wEMZE93i2TveEWbnvjj27gNlNnM05RuJhmkOJMqyNvWbQh6bOQddxOUPnz2P0XrJhbgKD1k5TnD
	+KQIrgkPn7PtQHDmRuuOKB8txq7Q3OtGsJTzHIp7tQxlfVn5TDAxu2YTi/s=
X-Google-Smtp-Source: AGHT+IHqfdC2hAwF+iHvluludcTR0crAZTyeQqY1dFdw+RUMqBj5erLa4Mr2mQeYTN3YlEylkAXOrA==
X-Received: by 2002:a17:902:cec2:b0:223:2aab:4626 with SMTP id d9443c01a7336-22a8a84ea52mr138936315ad.11.1744007554389;
        Sun, 06 Apr 2025 23:32:34 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d980598csm7694095b3a.77.2025.04.06.23.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:32:33 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org (open list:AMLOGIC DDR PMU DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PMU PROFILING AND DEBUGGING),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] perf/amlogic: Replace smp_processor_id() with raw_smp_processor_id() in meson_ddr_pmu_create()
Date: Mon,  7 Apr 2025 12:02:03 +0530
Message-ID: <20250407063206.5211-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_233235_803528_F6249C0B 
X-CRM114-Status: GOOD (  12.60  )
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

The Amlogic DDR PMU driver meson_ddr_pmu_create() function incorrectly uses
smp_processor_id(), which assumes disabled preemption. This leads to kernel
warnings during module loading because meson_ddr_pmu_create() can be called
in a preemptible context.

Following kernel warning and stack trace:
[   31.745138] [   T2289] BUG: using smp_processor_id() in preemptible [00000000] code: (udev-worker)/2289
[   31.745154] [   T2289] caller is debug_smp_processor_id+0x28/0x38
[   31.745172] [   T2289] CPU: 4 UID: 0 PID: 2289 Comm: (udev-worker) Tainted: GW 6.14.0-0-MANJARO-ARM #1 59519addcbca6ba8de735e151fd7b9e97aac7ff0
[   31.745181] [   T2289] Tainted: [W]=WARN
[   31.745183] [   T2289] Hardware name: Hardkernel ODROID-N2Plus (DT)
[   31.745188] [   T2289] Call trace:
[   31.745191] [   T2289]  show_stack+0x28/0x40 (C)
[   31.745199] [   T2289]  dump_stack_lvl+0x4c/0x198
[   31.745205] [   T2289]  dump_stack+0x20/0x50
[   31.745209] [   T2289]  check_preemption_disabled+0xec/0xf0
[   31.745213] [   T2289]  debug_smp_processor_id+0x28/0x38
[   31.745216] [   T2289]  meson_ddr_pmu_create+0x200/0x560 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
[   31.745237] [   T2289]  g12_ddr_pmu_probe+0x20/0x38 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
[   31.745246] [   T2289]  platform_probe+0x98/0xe0
[   31.745254] [   T2289]  really_probe+0x144/0x3f8
[   31.745258] [   T2289]  __driver_probe_device+0xb8/0x180
[   31.745261] [   T2289]  driver_probe_device+0x54/0x268
[   31.745264] [   T2289]  __driver_attach+0x11c/0x288
[   31.745267] [   T2289]  bus_for_each_dev+0xfc/0x160
[   31.745274] [   T2289]  driver_attach+0x34/0x50
[   31.745277] [   T2289]  bus_add_driver+0x160/0x2b0
[   31.745281] [   T2289]  driver_register+0x78/0x120
[   31.745285] [   T2289]  __platform_driver_register+0x30/0x48
[   31.745288] [   T2289]  init_module+0x30/0xfe0 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
[   31.745298] [   T2289]  do_one_initcall+0x11c/0x438
[   31.745303] [   T2289]  do_init_module+0x68/0x228
[   31.745311] [   T2289]  load_module+0x118c/0x13a8
[   31.745315] [   T2289]  __arm64_sys_finit_module+0x274/0x390
[   31.745320] [   T2289]  invoke_syscall+0x74/0x108
[   31.745326] [   T2289]  el0_svc_common+0x90/0xf8
[   31.745330] [   T2289]  do_el0_svc+0x2c/0x48
[   31.745333] [   T2289]  el0_svc+0x60/0x150
[   31.745337] [   T2289]  el0t_64_sync_handler+0x80/0x118
[   31.745341] [   T2289]  el0t_64_sync+0x1b8/0x1c0

Changes replaces smp_processor_id() with raw_smp_processor_id() to
ensure safe CPU ID retrieval in preemptible contexts.

Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>
Fixes: 2016e2113d35 ("perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/perf/amlogic/meson_ddr_pmu_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
index 07446d784a1a..c1e755c356a3 100644
--- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
+++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
@@ -511,7 +511,7 @@ int meson_ddr_pmu_create(struct platform_device *pdev)
 
 	fmt_attr_fill(pmu->info.hw_info->fmt_attr);
 
-	pmu->cpu = smp_processor_id();
+	pmu->cpu = raw_smp_processor_id();
 
 	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, DDR_PERF_DEV_NAME);
 	if (!name)

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.49.0


