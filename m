Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B8AD72368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyC/GAu9DTSmLmeOK++rR8PfBg5itQ+kpE8oyjTPF8I=; b=vSjtIWmj9X6JKch3azmRSgRXxn
	oWMhLBAmgfnbJyQjEF0Vh7FNxrv9pFHissIbv/Vz+CTM81ktxe5N0/cSY1+jt9zjUQGu2uJmm9HbZ
	ScUf1+MyFsnzEfiHYFmGGJUj8m4ibpl1qBndjz1F6yPeFRZn4+Gv+SYI55JHNObfb/PEmd0NRJeo+
	j9WcBCue0jJPexEexQmFBH4Qv5qcFS69gFo2E3HlT7cByqbT6MfBKbAsWs+1iq0LIeVwW3DTvYyYU
	3/C3DdUsHTQAs/AE0soKLOrki9z/G5Vg8paSNM7Lg2jb/dpyMRmbxHq3LUGXQECZ3mV/BIxWquX5X
	E+KoEtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsf-00000008dt5-3Wxq;
	Fri, 23 Jan 2026 09:55:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsU-00000008dgY-14NT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:54:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BFDEB4E42214;
	Fri, 23 Jan 2026 09:54:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94B816070A;
	Fri, 23 Jan 2026 09:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 540DA119A87A3;
	Fri, 23 Jan 2026 10:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EyC/GAu9DTSmLmeOK++rR8PfBg5itQ+kpE8oyjTPF8I=;
	b=rdMgpe8DHm7olxNrC6vmAgBTwuliGEyrizi7QRt/FZ1SAuOsm0isnkAsP7UQhI6LULu7Un
	U7dDZt0Td4nKM6ZKLLvkO/F7AvtXwNcOqLLamYMFpYvT54gT5z4I3+DD/AFCIYyQ3g1Lmk
	jKDP03mUqomKe2eysLra4rr3Jepcp9RdZ4JUXWLpNn7ZyLPuqM1kV7sve8hBGN0aESJi7g
	hJJPOW9j7IMOu8FYg09/FwJXnOAolWjMLXdh09q4v0uZWXyNkEdqPk8kqjYupi+rCli6ZM
	YpMdc8O4XwGg0JSg9bC+yJ13jHegdPrG/PL/70fDSJGiy44K90zOKBfSkrqHyA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 23 Jan 2026 10:54:30 +0100
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-1-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=csO7fJLjqTP5V/c20DV8fnDFkCku7x86gfcOjMPl5Yw=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0VjQ4rcAr8t5AlHqZfWDczWyk7dJWQSMM+h1
 mQKN84z2leJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7fYTC/9OF4L7uuwIvqZr8yw9EfckD2MgCHRhIDg+26Fe5w9DgIfLD+sk7tVXPEMeCrWYY0daq8l
 3+8+ujdjsCghOkVPGJlqjUFcGtZQSC1kEka8k6B9ehu4uixBrzW2uYUxO+oXVXynEguq06U/90p
 iQkWCZ7Ilv0Xzt7/BDteL1MM5zSB17HvSNka4CJ8irMQUylGBnrJdervlxdw1KM8UWyuGxhHYa6
 2FLtJl5wpoRd8kjGwb/2rMz0jt1+vJdhASygtXhGzbYBPTx9bveeB4xPUG5Qp/XKCAPYObvhcYp
 Ifj9nlxL5p065MxpxY+2ru6TFZFornWLEmhHVM876BzBC/OgHdZKqD+Xarqs2YQYQoZqyTeTibO
 Jgf10ZdCk7BFKpdfsYdpuRHxJ/JAAqf6xbCoHm8WDt9dUxXRhK3/hRtihw9adG0mATyQ9f6Fnm8
 yUwdYMbTpVaopSV4nxNh/TTsZVprsdeg1p3aIhMqz1wkdo4LfpO4bGZfbyjbpl8hRwF2E=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015454_435312_999132D4 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Add the AAEON vendor prefix to support the AAEON SRG-IMX8PL MCU driver
devicetree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a74560a4f687fe7a2070ca21b0752..0f84ee93b3a8473719ee92f8c046e350c4a20825 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -32,6 +32,8 @@ patternProperties:
     description: 8devices, UAB
   "^9tripod,.*":
     description: Shenzhen 9Tripod Innovation and Development CO., LTD.
+  "^aaeon,.*":
+    description: AAEON
   "^abb,.*":
     description: ABB
   "^abilis,.*":

-- 
2.52.0


