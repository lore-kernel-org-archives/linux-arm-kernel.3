Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1602C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=; b=iFN0A6ZYOhx/BBUMCgvsbcfr7I
	Vfe8E3mStyXPcIew3UcuP0NzohNQugdu2zBt90dde7AOqvHdhxjWuUhyP9HT6dNEg3sW5IfZ3Etsa
	0vUxim3pwAb5GVeN0CYkSXRZuXXXhdh2eDFTtRAQXasxUIa9Wm8vIrg4G8kcAnrR9QmD70QDZ98XW
	FKxqpORWP7rKQngQ62fVUBeSgpRiq1o2FTy7lX/m8b9Yy301uUyWDKgick960Q3wW4LPLBkd9GPQK
	WGNfrnX+GpPv87k+n8zuWzWuWYQPBrQQBX0oN38SotwTVjWTWfHj5kl3uylPB7VGm4CktCXBuvRQ7
	wv3xfVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAZr-00000002CBR-0F5k;
	Tue, 22 Jul 2025 10:50:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAN3-00000002AoD-003h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:37:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6129ff08877so8404617a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180635; x=1753785435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=ZakbD7rnhuM5dodWx1e8b2j8LDpxe9IAXyeZBAEpYguWa/uq1udP4JFOlIotrPzzK1
         PkPDfwF1Po0qqUqHyLR2EWmZdko+d8RuDW43J511nvluPbIG3rRTWoxzG27knuKGGiiq
         5bk4aPN6IlKWBwuCEhCEJgPlrd8HWbhkAXYNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180635; x=1753785435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=t/Lx4qjFM2ELz985QB9pHLND/o3aLYWyvGIjLWGy2AFkwCr//ZTkkA87geLlcIFu2z
         NGLRTursDGdZ8Dz+B87hBnLjw1bGAGWYh6HO5TnNyDAEZb5XNnfUIRSwQyOazDg4+eHM
         ULmvFZKuB0kJJ5eJJeQMZ+SYTBifOF/pI7VVrgtu80+yXLQG4AGAjhGNm1jqA86ClZPq
         tmr6w/qHYUrCkA0nhVLGZFFzwdJNZbo2Lw3ct2dqP0HhN5/oAqUAE7MjmAUD3P2zzHtV
         MgbzotKluEFTu2kTODHOTmlsIH3srZOFqhrL91Pc0HVtqlpI0gd/jYx37NrTh175oKTk
         8PZg==
X-Forwarded-Encrypted: i=1; AJvYcCUYgvXTFs4UKnzJaUpoyg3T/GgQDEuZ1Hu9tRCPWsmvgYvTAA1geWwv+xcJJ3Iz1+g2d4ymiG9e+vPrKTvvOaeJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxZg83EZY+uyKvWprvL+zYPXHcUPL61gHBolny5Rzfl+2hvzxKh
	V2iUhYq9RteyEdsjUh+XK2LM2IsSRWJhGGujY8hQ+U9M6bB2Cyg6CNkpAVcY/6jO9w8=
X-Gm-Gg: ASbGncs8MZp+J4SuqU6dPSShQpuNJYe9g3FmZLhPeFWenXE/eMvDFRAKUW2HCKP3SD5
	Dz0WI5dfC15cg+OyWLXcFZz/Xh/kEOvtn7w2OOqpgmTA6Z4BoO5F5D7wcmIltFlJhEA1Ni3Jkxv
	iygJhBKgoUEtwjNOXIGjPPIizJ0Kz0ufA9FfcS1nw/xjGv5Zb8IOaM3If/AYx9Pm+n8IYRCMTfw
	tnTvOpmBNh6DwvByM6bb3AsWiWAcvGqSagIg/MyooA4Uu2BEJl82r7c8I1BjiozLvPrOpQBGOqA
	48Bo76exSkYErEhDZeotaghnQAI+9S1ALAxdgms3zu2Erhi+yhPIFrPJMdcEVjmLbhnbNQixAdG
	JP0s5xo7L5BsZJCju6ECbj07c98WqxbSv983sU22AZONvntb290H5U9891NI=
X-Google-Smtp-Source: AGHT+IGu/rHAsJZdTDesHIy4THsJpwWha/3OdhJMXkmdfz+OLlrTD1ZQyBKwuFnDcJvQVIDplpGbew==
X-Received: by 2002:a17:907:2d20:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-af153339173mr333989466b.16.1753180635127;
        Tue, 22 Jul 2025 03:37:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Date: Tue, 22 Jul 2025 12:36:15 +0200
Message-ID: <20250722103706.3440777-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_033717_047572_2FD528AD 
X-CRM114-Status: GOOD (  13.62  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0


