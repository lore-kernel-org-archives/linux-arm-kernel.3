Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6657DE6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=; b=DEhDBGn08EuBpaeSBwDsTIhxpl
	YzWthq/ts/vsxCGBP/Kb+UeHOn4ZYA4a3sGorNukxcYFLvl09OI12PAZQGiMFTWMgjJTbDydVVgxg
	rBu7uWCZt0UXbFG/0iPv1FBYoIAOUf0Gh+YwMvWZcRhuFrvhjKNeaPORjaJJI2OfWPXrrFanKd4o9
	WGCcSyt0tFJdNEEwBKDcv359MCUPch6hyzthkA5Vz+8x367tAVI9ipMGzquaXfCDR7a563saBnCtz
	bzxhdWz3bL8JE+84Z1qFvKde5kOfRd+kDIgk4zYitxBbQmpkJmAdtEmWUuBbarwiIQuzj2QEZcGCS
	2Cy/tsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sMf-00000007Hi1-216T;
	Fri, 01 Nov 2024 14:11:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6k-00000007FHJ-02z1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=; b=Cqo2ZW/WQGeqp7qcs2hdAd3U6U
	4htr1oqxGYrQd1ZHL0IwK4o7jsM1JAuGOSq375sZQonMoc6zcZh8z7nhxRCp5NW8CTlsu/qLUP3yk
	rrE+LCgy1xmZFku+eohM2exbMja9NWAnHRJGuW8VR3SWdDOLXeSHVvPI+fTMK9+VRWLp3TO2jAqL3
	EZcDoeMfo+Jc4RmxHzk9zIjCvFNlkUVowTLgnwLkmlG6Td3JxVSB7PNoZ/uAgPwEY6WqnbHgWsCtm
	F1SNaytQJ96POze2qfJoGFmhbx6vunhy1Hyoqs3wtFupMNr9BvjGUlhUOYgE8BBDEFn2U7zWrVMle
	giAqqs3Q==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6h-0000000Ai21-05od
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:54:32 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e625b00bcso1659362b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730469266; x=1731074066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=;
        b=bdoMuLpvQnyPm+dV7aszJaFrlBLiQTwa/85C1NzlKjwNFDxTKKQY+/7079iJ8hjIhu
         UPoMBGTzcPr/jfdjPJgYBfFA9czDoP/l9oG8ctHlzqPLsQIW+kRliyW6grWv3Gh1USQV
         lCJbqgLp4srR+qTT2eEXyxYJmCzeuK86Nno23zkz3iQiWR7cGBYu6Vow1PbgNUMN/iGw
         CkfBvna5sWVGoKvshRN0mHE5WA6eyVe94fxdhkhX5rZ5Pc+5XQcqcIUHCjimqeyw0nLG
         OzxQtApaZ33Yvv/dHV1F6fccpBqJaVQ2n/3gvpXVqZ/qf1uix6OuLcJdIHEOcWK8PIP2
         uYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469266; x=1731074066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=;
        b=lYyJUHNRNcxNOdti5DKO2ngqPlY3oxkeQHjOYyRrGXUIKVhlK6M08Z4C7W0O9V+WGn
         0jiJHbEeCJpta9KrYgNhWRCXC+KpRHXJH0F6+YOgL1PxWwY+d2UO/VS2FzOwr+e/K2Z8
         TDiWlNDJEmlm/vlc3R4RFMj4cmorbiEb429oHCoowB66e/zwKGWRwo0D11pOhtwloYLl
         A7gJmkzcbP1jzipvAp/Uavh/X2AMxYiGJ14zz1MK4L6y/fqg6tdMcQoGSvwkyo6lJKPm
         Dvw0k+6UscrH0Rhg3BJYO0qDIOiz09H1cF/ic8EdqRoYkUpZ8AOOmtzM1cKba1EaEMPs
         4evg==
X-Forwarded-Encrypted: i=1; AJvYcCVf5PIrcrvIICQqMRYtYweSJBkPQCkLI2f5qixhdioqUBanPSbKiR5j8FVJaUAJZNKND5FaTHwALrNmLAn4xCIG@lists.infradead.org
X-Gm-Message-State: AOJu0YzMBmJkWyziXa2l6V3CaLObpzjhGi/asgfwf+MfTJhzByK62cdf
	dj/KbhEIn2F+8UKNJV2cuWuQQyjsHyL6mQWoERIuQilBlBqghkTG
X-Google-Smtp-Source: AGHT+IFDJu2muMMX574LjGpxqR6z30/n/2YRYNEjaDajZtXr5fX5zoOaIGrofmuOBUvyB3txoWtOUA==
X-Received: by 2002:a05:6a00:2d9c:b0:71e:6a57:7290 with SMTP id d2e1a72fcca58-720b99f28e8mr10309705b3a.0.1730469266034;
        Fri, 01 Nov 2024 06:54:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:54:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Fri,  1 Nov 2024 10:54:04 -0300
Message-Id: <20241101135406.47836-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135431_185673_6B5FBC0E 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Fabio Estevam <festevam@denx.de>

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Also update the example.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..aa3204b6aff9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
@@ -182,7 +185,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1


