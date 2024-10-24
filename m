Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4705D0BB69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hr+VlRp4LSkY0Zy0C0X2S5gF0hJCl0OgFIINDYPo60c=; b=hXeyqy4LnOu2/maJXmjaxUSZkr
	RnhXD9zJ0eyfh6PQkmc/Beq3nAbXTmHABRhgChYbwJ0X6jNVvJaAF0SKkV5epTxaUHRtDeTo3d6AV
	BNVy2XKEJ75L+jjMhkuY6hLYYcn+Swos99R2PBcxMzoEIZmSqqdO0Ep+mKhT744HJM0emrV0JJyCw
	AhIGn7p+N3SV+Yubt4dREaLIJiUdE83yu6PnlYhz9DtBOjNJRyfW7waeGG9MHgzBJBKCP++zt5GGU
	O9JTwWAM764uFWP8wlL265q/5nacQKKQkp+rn4tEq/ifhfTfRZLHbalhlZWIMBpC/RozXzTLlR99b
	w6o8XXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ros-0000000H0Qz-41Da;
	Thu, 24 Oct 2024 06:59:42 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rga-0000000GyaM-2aUp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:51:10 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0EE63A0B65;
	Thu, 24 Oct 2024 08:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=hr+VlRp4LSkY0Zy0C0X2
	S5gF0hJCl0OgFIINDYPo60c=; b=piJOe3x6KYsaFa+WFZnnppcKrl3riyU35Tna
	BglPi3scGiUdkEZSwjgttExGoaTyXBpl0UPMfKZBC5BXVlK92z+VO8UOJUNM62Bp
	kqMINcbqER5/vRDrpWTmxqV0HP60KEF+8F3gaVtDiP657vQQzYt8VVZlCBgjauIC
	HuBKwac9+zZUhUF0UQ2nGTgTKZo7nMUUJrYpDFCuBwTW5ueWvKeKyctB4HXxHy6k
	pb4aSr2966eCUahLgtwemGhtv+aMJTU3M1zQ9rbD89P1O41HQAqca2t0cB6NG8fy
	XYzcB0G5IFaqM3xdIRfhtM/Fzn8uqCGal7BUYDuLCuee25xER9SCgwC6iPeYpSg1
	iC/16qgaus1roEzutvrrx71A2FAsiPw/fSU6318hJxj88N1Z3deCcFtH62vT4V3c
	2461fk0k2SD5iVko1dgxwJk5Kb/3VwFdxCGM5AhUSmszybZZ0ocjeF/IlitERmA5
	QYEMpkRc8UOwhKYLmjnpQ3xCDBEto7AO22tnS5KFlP3m/kWAU/AtP34xA7HgMfv5
	trrnso4QErOXXHCWC1mmJ/KUdmjoAYI/jJcy2TXj9KAdYrR1XnjDvJU9HLOrEPrj
	lNUqKuKH5KTGFwSki/9dVmhZ6zaZn/1j5EBKhksSuC/OHpN5ds0YU+2xrJ0UgIA+
	6VvGtIY=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>
Subject: [PATCH 07/10] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
Date: Thu, 24 Oct 2024 08:49:28 +0200
Message-ID: <20241024064931.1144605-8-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1729752654;VERSION=7978;MC=4016853731;ID=153595;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235108_919497_487DE142 
X-CRM114-Status: UNSURE (   7.02  )
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

Add compatible string for Allwinner suniv F1C100s audio codec.

[ csokas.bence: Reimplement in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f766..16f4f7a40d9d 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,suniv-f1c100s-codec
 
   reg:
     maxItems: 1
@@ -70,6 +71,7 @@ properties:
         - MIC1
         - MIC2
         - MIC3
+        - MIC
 
         # Microphone Biases from the SoC
         - HBIAS
@@ -80,6 +82,8 @@ properties:
         - Headset Mic
         - Line In
         - Line Out
+        - Right FM In
+        - Left FM In
         - Mic
         - Speaker
 
@@ -229,6 +233,33 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,suniv-f1c100s-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - LINEIN
+              - LINEOUT
+              - MIC
+              - HBIAS
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Right FM In
+              - Left FM In
+              - Mic
+              - Speaker
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1



