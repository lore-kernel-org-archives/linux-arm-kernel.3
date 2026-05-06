Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B69CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7wPFQrFfOibwr4CB74CBepe/VCcRdrCCdHhqX/hkBQ=; b=Dkr11xTwjcMv4NaZbXRl7Rtgtt
	gCmXknjgrexD440QPNFYsl7cHzpcnwAiz/xC4dnAjvKEzkakTheHT02ocGDl7dbUGa5IfpW6BMZ/i
	MsO+J+aEtuCbpZYytOwvUXfsP/RdJ1eO2TWPCxywNdKMK9r429+jWJclPm2aOK3cAvMJ7r+jiNI6q
	Of6l/r8klExV5dZDkU48ZZG0szwP5pcIwJmAJdDCTFIdY/f+ZocsKK+qzNMK2Zyd7UMoWTKcxtqxh
	7wCT+kMeNoQpkWpihiHMkUbKwZWGAesoWo09kYS3TtLJW8D9tdzVUpZ5zDhwtWQQYirt/OoWEabqU
	lAG2yjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMh-00000000kmX-0mOg;
	Wed, 06 May 2026 12:28:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMg-00000000kkg-0PBY;
	Wed, 06 May 2026 12:28:34 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778070511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7wPFQrFfOibwr4CB74CBepe/VCcRdrCCdHhqX/hkBQ=;
	b=Vg0lSLnDalfX899ful3UlIF1C9VwGRlOfqYjWmjJ0X/RSva3FVRKHZkK9N/jbaVjDPDgMH
	wtg2PD2xW+rdpW9lrLCFf2/P1R9RIgufwci5bZuBg/juUjf2m0SqRZiz8el7JfmeiMCmoU
	RB/km84VF6GYshyNlQ5LCewvZycF1EERQVgdXVEpKSUYQ5BzH+g+9sNkao//GWO7Nz3Tbo
	NzOhqmE+3OlZRcH0dml7OXnhUM38b+virM8Ztb3yXlg5c9uODskMRH8HTqCm3z6F24/MeV
	M9xVdDINQiK73iJuoVN/wz/y2j7d4+ZgoCl9P+WVHTB0rFkug8CnzqYDQxSJqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778070511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7wPFQrFfOibwr4CB74CBepe/VCcRdrCCdHhqX/hkBQ=;
	b=0xB8F7sC2iozuFJgRE7iV0an35nm5ZaESmF8JQwTUL+log07n0lDIJzAPKacSLsFYJCnKJ
	ifJ0LrF7txwPeTDA==
Date: Wed, 06 May 2026 14:28:15 +0200
Subject: [PATCH v3 1/4] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-rpi-otp-driver-v3-1-294602663695@linutronix.de>
References: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
In-Reply-To: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778070510; l=1154;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=i28b5kPae1O6TJgN0WQ3X6zS29yFb9fnQDyZIJdT6z4=;
 b=QQTunFcNSxejov3aYv+Hx9pRqK4bevXNHD2tSPUg9fCuSRmy/vw0JHrcmbGH0mzxOyp1K5aM+
 AHFrDtCVOi+CuJFcxhVnYqlbMpX5dpgrURqOpol6IcRX900JRQS0nG3
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_052834_282602_655B594B 
X-CRM114-Status: UNSURE (   7.58  )
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

Add a compatible string for the bcm2712 firmware.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..fbcfa2bc168a 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -21,9 +21,16 @@ select:
 
 properties:
   compatible:
-    items:
-      - const: raspberrypi,bcm2835-firmware
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - enum:
+              - raspberrypi,bcm2712-firmware
+              - raspberrypi,bcm2835-firmware
+          - const: simple-mfd
+      - items:
+          - const: raspberrypi,bcm2712-firmware
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd
 
   mboxes:
     maxItems: 1

-- 
2.47.3


