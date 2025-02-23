Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1400EC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=; b=Jc8/PUL9QvIhCQMbiRw7dg0kpc
	2CDseexnqdVjwzSkItraBg6eWT7U75HbAVXKi527Dn0JFI1UNN9UNl2YBnMo0i0vq5cgRufATdpRX
	MLCWJkIJCwh4CTXfyMgMe7/PbsB1cVcIwpBAtrpOrcA6XLRBlBllghza04n1RXIoY+lhnJl+dKTkG
	7HyWtXO5UVx5Anx06ibbNJaTBCmhGYnn58ZAsgLDXylMued2l+BwJkQ67NAJ6lu8zB20xQCjsbaln
	RJQ3r+4sVZ+DfKbvilg7Hy75FT8PowdT97vyJ36tUeRBuZKwDE4Nur2UeCy9gFrjU09JdjFLLLSsO
	I4oFRozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBNN-0000000B81v-1YvJ;
	Sun, 23 Feb 2025 12:46:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBCp-0000000B6p4-0xoC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:35:36 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaec61d0f65so703271566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 04:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740314133; x=1740918933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=;
        b=bTqzL9VhtjHxMcUM2IKjY6jg/3dMKfhQLDdZ2eFBZYYA0BOYenzEQvEfUA9RDEqX7t
         DLmoa45JoQRzpMwtklQTIE7d/3FaQi4Q37SJgKD9jn/upAft8ci8++hMsZLPqRS7IDL2
         GTgF30ZX9RqIGhl4cBLeFmghDpOSUaMppkhQKKFgf/IRmcHDpqlqGJhFWHOQk+vFWycT
         fTa7p72QIEi6sSKGlZbbxz8PYW27G5ZfDs3HzzTpC1sg0FRO4UKdMFk6oU7gsvZWaBpn
         dYnwB4QLfAPtTJHwmocq9jXVqEr8Ab44S+PBPln96H8oyRVLTri9gcUUby/rFCRBoIwb
         FCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740314133; x=1740918933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=;
        b=w7oqLIvlWgIBqz9Kbc0Km/rAbqDcp6WVut97f3K+erdXfNlDlI2Sce/hX4fRsXk8g0
         4LxY5FR/VeRGd9yZa59T2nNdDPVmOW3nWBKkueqlna6D4DTFHxwD4RYh7lBAX7ATlV1a
         fB/e6XZ/1VxUiFBIzvIpb5v5bOAcLa4RQRIuSnQZzkZChdzI86ZFlKsORqHmlY5BfDLM
         ki+rQRsTwk/6rlS5m867FVknzoe2HbFlGfTMu4jZZAv5d/He8V0qyEjpxFKVRMFmMMta
         xbCXo5vo5Ka0v9zBvxDVuhc/riKxMO8IZlAf3/xydcUIhCNMHcYr5EBB20hxGNNfo0Y8
         bhvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2lcl8yiALKI+pwTHSZbDQOhKnQ0w94hI8PUS3sahv1lNBG4bYIVKrRLo8DhOc2T2hruDqDCnEaxmoVoT7IPEW@lists.infradead.org
X-Gm-Message-State: AOJu0YwlgYzlM/3eUcLMszUIEDXWNOGPEjlO2wGUyoDIWE47TVwdR4CR
	uhjRSEGmyJz3QfMnuej0F3ijePMA+8/7yXdlR9JiLKAimBV0p/Lq
X-Gm-Gg: ASbGncv1qhu+rwsEJxiTF8NeyQcVKSzoW1O2avkog1C7lLAJLeqFsTw1UJ3STS0pYJw
	xcRMzpqt15Oy/AOgsMlvErkUnH2FbSNGdO3QXU4eR8hr6Avj+qv3xLMIy//MkeRr37MYVEcWzei
	iCXQfolG4ADvGErLmwyi6ohIUh0S/TWv8a7haK5gei8OLnTxPFzySNjKgeTkpZVBabUnuJqf0/D
	SvOWVvKmigoulgO5B9RIgwH3DEYL/0WonWSzXDhXxP4WTN6JCnd0k2TzFj5bjt5hgjFMIrJxhdm
	Ve2YMtnKHNAHFhR3ForHfFodKiesiYDHD3WkuvY=
X-Google-Smtp-Source: AGHT+IFUfiW1GQDllxCKAXgvBAa6DM3kms//5wkJayxFfKOqMm0f7VR/HR8dda+cBQ6ZDNh4uZKJLg==
X-Received: by 2002:a17:906:3087:b0:ab7:da56:af9f with SMTP id a640c23a62f3a-abc09d33a64mr885264066b.49.1740314132874;
        Sun, 23 Feb 2025 04:35:32 -0800 (PST)
Received: from localhost.localdomain ([165.51.10.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53280ee4sm2020878666b.78.2025.02.23.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:35:31 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] gpio: gpio-stmpe: Use str_hi_lo() helper in stmpe_dbg_show_one()
Date: Sun, 23 Feb 2025 13:19:31 +0100
Message-Id: <20250223121931.579031-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_043535_269683_E844A0BD 
X-CRM114-Status: GOOD (  11.20  )
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

Remove hard-coded strings by using str_hi_lo() helper function.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpio/gpio-stmpe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 222279a9d82b..bd4122a6f670 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
-
+#include <linux/string_choices.h>
 /*
  * These registers are modified under the irq bus lock and cached to avoid
  * unnecessary writes in bus_sync_unlock.
@@ -283,7 +283,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo");
+			   str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -352,7 +352,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo",
+			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
 			   rise_values[rise],
-- 
2.34.1


