Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F316CD6B6DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BVVyLjJdR6me74k/F+Ot1blbg2/epRtk+d2HKjKdKo=; b=fkylukNICYPUNEwKEqbuIzEPdP
	2EROYeJ85CNXdCps5/RoquJzGkbYUDA8a+LY5eVQYqfeNgDoAoabsinMLlayWFrW9BxoX88yVWpR7
	aKUko+gj+gUFsaS2uoTT6HsvONqANDr2e8YyVgyylPRjSMu4yAqhbO20yH7dDuhNaAUz7UYojK6kV
	nzCUq6U3vISnYripDJxi70dEbcFn03CRGP36L/BKV3XoN6n2o/Kd7Lbyo6gnlPD5Pb6IhrZF0Cw3A
	ZJ02gh9Z2+Ir1ulPrH5vGEXvcUFAuP6PFtMz3aUBW+SGqZeOSRTkJ+apD9ii0WRK8+Haxy32sS4Gw
	jFxZgLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ubo-00000003asq-3LH7;
	Thu, 31 Oct 2024 12:49:04 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPi-00000003XlX-4A83
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:36 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A810FA10C1;
	Thu, 31 Oct 2024 13:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=6BVVyLjJdR6me74k/F+O
	t1blbg2/epRtk+d2HKjKdKo=; b=LQ68MGVIC86SMlJjtvg5Jee/xNZrERR5EiYQ
	3NT0ILBjt4JY89V3DYQD3RjZhrBhNOheZlrFBtOnK9sHYWyfwM60lA3GuJ376jUZ
	/JGKbIjU3GEaYwZ3v+lzfEBHTVvFZ3htqepE75CiVMROfg+v/TxgLRrdiE14mZ00
	MuPtu6uuJMu8f34Ec5D4vAuR6utaO/GXARNnThKmZNbKPjJF64ElUwBJhD1m19Zk
	mDs7tkjD0zaKi3/NRsxIcbYKPxC8kjfytyO6dyqaPnKKLcWEFdUTU+U0BlnO1h/G
	r1XMBHBReC/ld+IQEh7gSJELcT39Wr2MOqkftotQcDa0E3aNNVvrUbiCyyS9GJ4d
	/AaEP6wy6u61kzKIIQ4eJrjlyrx6beH+cb6afvbBoTQtOXBipHoZ/8W/BcyczzQV
	hicB2vGhnAQjuf1K2SmZ/eeG5lNmNrKlmGWynUqBOdz0gvFqqzsqOAFEAB7geALE
	3r8NzkPhbjqnJzI17aCeY80HSYF6Tm6WDIcFY4E8r5xlS5MxpJeLr6NkkRWv2rPU
	N0gNVz0KpscDu2D6hgQ0JZssOeW/87fCMA1JlYoCu4B+3p2rcFQLhdghjEQiicEa
	TXKEtvWSEv5Iw4wD0X4h3REHN8nUx7kqHb309oIwnzPThk262BZjaTDo9NooSpyh
	7hFTojk=
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
Subject: [PATCH v4 07/10] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
Date: Thu, 31 Oct 2024 13:35:33 +0100
Message-ID: <20241031123538.2582675-7-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378193;VERSION=7979;MC=1610445493;ID=207187;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053635_208679_17B8996C 
X-CRM114-Status: UNSURE (   7.83  )
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

[ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
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



