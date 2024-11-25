Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A46D59D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZHTGGztVRlr02UorCZLeEgiwydMSFEuesYKwn9RtUI=; b=vEbeMnbHO7iUPDEpyk+I8X7fue
	QLeUztNZrswi0xvwslvDO7k0eb4K9mCQc9XBRgRP2W0PdO15ogU3wPcP918EKWFRodyavwSDj6ZB7
	3dpvKxHtBDoSpkQ+ChMfuPdyNgPPqAEvlTd8uX2/SKV+AbR1jYiwDpJ9LnURL7Ye3OUcAb65Ppqd/
	4LKWQtgEP2z0pwVf+p7k5H7e/mbRKYS3X9QzFtGpgKXW7wjEUUU2BoPCPK7f6wIz2IOskxb83sDuY
	sjOZdOJ0ZmOSzSvJ+Y8jRdzQ+9pM7RXqLDGs+OUJKyvvXLTuV4qiG8S1+eXXIPQcLkddO39B/Ln5I
	M7kGfutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgRl-000000096n4-06Gg;
	Mon, 25 Nov 2024 21:16:41 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgQn-000000096g3-10Ub
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 21:15:42 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7fc41dab8e3so189005a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732569340; x=1733174140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZHTGGztVRlr02UorCZLeEgiwydMSFEuesYKwn9RtUI=;
        b=A509Qxi+C3pSZPiFxCCwhGJHoisUJzgN0/qIrhtdooM2YOtePOysPJQseAD4jun4d5
         lPAaRHarHOyAakZ/ZAwLM5xRYQJdK70cXgJTqfyCSlKPLcbt/SVO7KnS3tD+91HlVQAz
         I5USmq2Vhnr33ibQiTRnhKUB4ALXKEpKcy6HfnD0Bn0ezHaFIDHMKkB+Wpu1wCQNQNQE
         z+SxDLf0AMzpS8M8SAeka3tl5fhnfbo0SgdG+HiUtygHJUItCgJjMituXrOZUdb3Y/l/
         mXw8yUkeoFVpNr3wwF8eeYLi3VMC1q6zTg7xsFhxz3jgqvXPWzy4jOihQbhPbPmIYj8K
         lrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732569340; x=1733174140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZHTGGztVRlr02UorCZLeEgiwydMSFEuesYKwn9RtUI=;
        b=cKZOTSlSlEORGCyWkqNCvbnZVsB21eM74LFrb2+b2mkN0/U/OZiesRbXdw2Z+gHjns
         KKvx0IrRvQTFvgnK59799LiOJjNcRZVFBHvLfLIAI5tgPZbjjdn16OV99uj0pbwoKPLw
         r2V1/yUEJGrnYITlj982eA6Pro/XCLXjlHaF33VVlSFcJaO1wkcvl4X4WAgKKudSZm8q
         3otDMzZY6mVjmNDQ+e3ezKGpqpdbq1mdg7h33JewWlaQD82wUYXLGFt1OHjJrvPU3+eU
         aPTglvvfb9w/kgUSuYW0k9SkI27AtkyJZKsjwYEns2NTahdmoOYrTqMrUuORy9L9jFka
         B3kg==
X-Forwarded-Encrypted: i=1; AJvYcCW389zqid7E2hhsifm3dGfX+s6uhXcwNlSa1VbYHk+ezduaW/q4qKlXPe8rWyTSNci54MT3jv7Outzlb32Kw5am@lists.infradead.org
X-Gm-Message-State: AOJu0YyDQHZDY5N1gYVeMvNE9qD7F6hiB28HHzMTvG2TbtssMAelw/Si
	WjzMHq5SBJ8/4dtJW+/stv4AcxyhyZGgoC3FVzzz6afr5ofRlhh3+5OXErmY
X-Gm-Gg: ASbGncvrppXgf5UzZfuUSneoMWnYptxHYms42vbV1IobRGhDVV9Fux3Kw4sRRqTcXX1
	aN01++5N15E27iC9PDibtwG0ST8OX6dO0usIzsIiDr2LrOOY+XkvND2xtiuPuGXaeMMK7dJPVfS
	ZyK6065oo4ZyQbT/x16csBJPQ3/gpWz3O/iyCvC6Q89ueuJzj9E+Aks+u2fQ/aXHMyG/LERxoCu
	5xxLYLACYRD4TNgYMGSok+sEW21nb7Xdo9atkx7qPIkvGx9uQ==
X-Google-Smtp-Source: AGHT+IHrsrU0BqzKKN0+sv8jhNnr6cs9rDOsCM8lLkVi9yLVElzX7tpOkme2fiVg4jFUx0MfT1dtog==
X-Received: by 2002:a05:6a20:c89b:b0:1dc:1147:a632 with SMTP id adf61e73a8af0-1e09e5cb4c5mr23461978637.37.1732569339517;
        Mon, 25 Nov 2024 13:15:39 -0800 (PST)
Received: from desky.home.arpa ([2605:59c8:492:c300:8a72:2d07:5f93:a09b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454967sm6907470b3a.19.2024.11.25.13.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 13:15:39 -0800 (PST)
From: bschnei@gmail.com
X-Google-Original-From: ben@bens.haus
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Schneider <ben@bens.haus>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH] cpufreq: enable 1200Mhz clock speed for armada-37xx
Date: Mon, 25 Nov 2024 13:14:52 -0800
Message-ID: <20241125211452.14987-1-ben@bens.haus>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_131541_279890_79219B62 
X-CRM114-Status: GOOD (  13.90  )
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

From: Benjamin Schneider <ben@bens.haus>

This frequency was disabled because of stability problems whose source could
not be accurately identified[1]. After seven months of testing, the evidence
points to an incorrectly configured bootloader as the source of the historical
instability. Testing was performed on two A3720 devices with this frequency
enabled and the ondemand policy in use. Marvell merged[2] changes to their
bootloader source needed to address the stability issue. This driver should
expose this frequency option to users.

[1] https://github.com/torvalds/linux/commit/484f2b7c61b9ae58cc00c5127bcbcd9177af8dfe
[2] https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell/pull/44

Signed-off-by: Benjamin Schneider <ben@bens.haus>
Reviewed-by: Pali Rohár <pali@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/cpufreq/armada-37xx-cpufreq.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
index bea41ccabf1f..f28a4435fba7 100644
--- a/drivers/cpufreq/armada-37xx-cpufreq.c
+++ b/drivers/cpufreq/armada-37xx-cpufreq.c
@@ -102,11 +102,7 @@ struct armada_37xx_dvfs {
 };
 
 static struct armada_37xx_dvfs armada_37xx_dvfs[] = {
-	/*
-	 * The cpufreq scaling for 1.2 GHz variant of the SOC is currently
-	 * unstable because we do not know how to configure it properly.
-	 */
-	/* {.cpu_freq_max = 1200*1000*1000, .divider = {1, 2, 4, 6} }, */
+	{.cpu_freq_max = 1200*1000*1000, .divider = {1, 2, 4, 6} },
 	{.cpu_freq_max = 1000*1000*1000, .divider = {1, 2, 4, 5} },
 	{.cpu_freq_max = 800*1000*1000,  .divider = {1, 2, 3, 4} },
 	{.cpu_freq_max = 600*1000*1000,  .divider = {2, 4, 5, 6} },
-- 
2.47.1


