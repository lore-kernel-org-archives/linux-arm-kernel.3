Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DDCC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GV5s6FOxWw6F5tawQDBpDciMQ1YhmYggnl1ycVHKgck=; b=lkKmqQBcQOChisrVh4oL25rapB
	hOro8a83Y289+EldEefw6s94+Uj/vPCs2Xo/IHpFtPLC5EQY2WAmQaWaLb+lYdXE77/YXPEevjLOx
	sa4luTovsP3+tGUqne5Q5P5No56EwV2ACUz6LSWLhNXNKFUGTHNBxQ6RXylU5LF2PjlD1EAkONfo6
	ZYVWrpK9f6oJL3IzOWda/+LwrUBuq03yJQNDxNtNkyfcbgnw3yeWHwqxzo3paniwBsh4l/pA+YBB/
	8wuy00gSHhoaM35VURnDiFmLmF6gMfrTI2T8wQDkK1PF4FM2Cmtu5V+kCn8jidHnc2jYDwPcwCGJ2
	EJdMxjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUo1-00000003uxQ-2mYP;
	Thu, 31 Jul 2025 15:02:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTr4-00000003lhb-2hCE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:01:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so665712f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970517; x=1754575317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GV5s6FOxWw6F5tawQDBpDciMQ1YhmYggnl1ycVHKgck=;
        b=J5MbsZO3bT+6H8uB5PHC6wlD+8Szo2NhL5JdsEVqlJ0izsRqw20LuE5o8DNFe/Fvff
         jKUfw6TChjZotXkKTm0K/jJzGmi3qi5PODs6BDlWFhprYY6ck+P9Qtg9uwVjK4ywjVNr
         irraETFyQK3WybyfwPruQHbkVI2ra93waBK3J1dKIvx9so0YWY7p7TYrlG8OHEINVXT1
         yfGZaxVgCv8qA171InSm6ZkaK+PVdm5aAmAatLuYeDmYx2rZEYFBGaESM7CtDneYKGYW
         OWPFQeLf5ryPjKyzWJ7RQ1v4waVTZRRe9XH4w701VFyijMSf/XLjlU+wnSk8BbF1zoAy
         0viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970517; x=1754575317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV5s6FOxWw6F5tawQDBpDciMQ1YhmYggnl1ycVHKgck=;
        b=jWCKa+YpcqJc3D/LGBlC/ht5JpFmQX1ebJkNwuoBAuVbx5H70p0aUkoVZFSfKjw+il
         vYgcXm8Vl1Zd9uRfeRKWfeDjp5H429q2CEBNkhZ5MFkmxPBlBCQrI9fwfDAHRJhxbYQR
         6KslJioVAqlc0XRCoWxEg2IaCk7A4BdylSt2bgiz476patNE1L7yw18g5uLmsL53FUV8
         kmM3oyyUGvFr3ynJxtGtByJvlQB+4IEk4rS1pQut0geNjAmvAqeuO6tDeA5fExgiyxhA
         k9tJq5Ue9TEm1Mel6zvgUF9LFAvGgqBiyNUEqH6hYL8rpZrxvplQ1zZtyevOrFpQidXa
         /1ug==
X-Forwarded-Encrypted: i=1; AJvYcCWHR4fJuEr6IT2MPooaQ+KK05LTRRVvVgZfIB87W3Jh35LMop9q2kDCv2z3UMFXzmTTZ143s89zWLGzh+drsPxA@lists.infradead.org
X-Gm-Message-State: AOJu0YxQbILTaPjTSYDakoUOPGKGVrojsxWCp8Em9I4lFHGIxWITM0e3
	n/ni3u+1/9oIp3dMz6ZdOiYS0+qJ0uOc4I4Jukr3ZEnpgc5cKPYWPFqNPlr3BOHBX0c=
X-Gm-Gg: ASbGnctsWwiMESFJqfIICp/F0mB+VYhKVMRABn67Z7uMZPhBtiAy3u9ThQKElyerweC
	N472AmQYukaeK6audY0V96YFNUCv63k5T3atTlXsFjleanwpNmHHKqploBGcCdM1/tpmLyOv9ko
	cpyjUOmRQxD4GO2TBJrnNoqVfcQ5ZZPFE5ipc9t61foVFBRD8rlf2tSRvuMKcPLltwPs9pqC4Nh
	O8Gpcm8QyeYAF55yMJV0e1mdQjGehsBYDdpCKClyv5r7bgG8NFA5M7uGOOXo/gjmwnnySMpYs7t
	nu2eZOrL61dsITSDh893MHXq7aPk0jfeWLjXx5kzKLGNvNUho11tRz57PJvJ3nv739Th/Ws3QWF
	JsiODYBwIPfaCXs/JABsxy5X11tTLfDUAUn2ifPmuuUhZcRBNfoLcPB9SzYk=
X-Google-Smtp-Source: AGHT+IELpYq0cfUwdhdal+guuoengtu4ASva2Hzj0xykx429WqgpGqubTQ/jYn7p47HzHjuQsPyogw==
X-Received: by 2002:a05:6000:41d3:b0:3b7:974d:5359 with SMTP id ffacd0b85a97d-3b7974d597dmr5098700f8f.32.1753970516376;
        Thu, 31 Jul 2025 07:01:56 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:55 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] Add the STM and the SWT nodes for the s32g2 and s32g3
Date: Thu, 31 Jul 2025 16:01:33 +0200
Message-ID: <20250731140146.62960-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070158_690933_B05241E5 
X-CRM114-Status: GOOD (  13.83  )
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

The NXP S32 SoC family includes timers and watchdogs that can be
dedicated to the CPUs present in the system. The documentation refers
to them as the System Timer Module (STM) and the Software Watchdog
Timer (SWT).  This design originates from the automotive domain, where
the SoC can be partitioned, and a group of CPUs may run different
operating systems or firmware.

On the S32G2, we found 8 timers and 7 watchdogs. On the S32G3, there
are 12 timers and 12 watchdogs.  Please note that the 8th timer
(STM_07) is not described here, as it is coupled with a specific STM
instance used for timestamping. This makes it somewhat special and
requires custom handling in the driver. It will be added later.

All timers and watchdogs are disabled by default, and are selectively
enabled depending on the platform configuration, which may include
different combinations of Cortex-M7 and Cortex-A53 cores.

This patch series introduces support for the SoC and enables both the
s32g274a-rdb2 and s32g399a-rdb3 platforms.

Testing was done only on the s32g274a-rdb2, as I do not have access to
a s32g399a-rdb3 board.

Changelog:
  v2:
    - Replace the 'description' word usage by 'node
    - Reordered the nodes in DT regarding the address ranges
    - Modified the change description to leave the ambiguity regarding
      the architected timers

Daniel Lezcano (8):
  arm64: dts: s32g2: Add the System Timer Module nodes
  arm64: dts: s32g274-rd2: Enable the STM timers
  arm64: dts: s32g3: Add the System Timer Module nodes
  arm64: dts: s32g399a-rdb3: Enable the STM timers
  arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
  arm64: dts: s32g274-rd2: Enable the SWT watchdog
  arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
  arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 119 +++++++++++
 .../boot/dts/freescale/s32g274a-rdb2.dts      |  20 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 195 ++++++++++++++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |  36 ++++
 4 files changed, 370 insertions(+)

-- 
2.43.0


