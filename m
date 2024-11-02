Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF1AE677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BVVyLjJdR6me74k/F+Ot1blbg2/epRtk+d2HKjKdKo=; b=hLt3wOOVeZP7FII3h/4qwUdo0g
	nuE9jLbkp+sTMEW2RFhNw7HdDSAPomDPSZxpommwnImtvzUKV5gm9P5Xt3NnvkrGQP8m/K8QxMsxQ
	X8XqFyulQWd17htqhb/8b5TM0oI0aGFMHncbj7xWJLPeuYOjmn89pp8GCqdarS4LU765tNHfoUQM6
	ktnMpHf5ZgrkVw+F7dWNVibv6eli/gOpHXm4H2QHl/WLDktyFfg8q0lI1Lxa1TaQvscJN+G4zIzov
	nTqBePPWLZdewiE5Ri5mFM1hflkCVR0HS9+vkPcPa5+j2TX7SgDCxK+VcKdEv2ptMlAPnYGBrom0u
	vC6bK+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7DoL-00000009jxY-02PY;
	Sat, 02 Nov 2024 13:05:01 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dje-00000009jNU-30Kh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:00:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 69622A0ABF;
	Sat,  2 Nov 2024 14:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=6BVVyLjJdR6me74k/F+O
	t1blbg2/epRtk+d2HKjKdKo=; b=A+UtL/lytKD+HLHR4iDjYCIulzShvKEyTfgw
	3Z5KSRo6vXfQ0/d/E2XSJrJBfqVK5bwJNXTB3d41PvsGpTpT2tbDSHTeuKMCjdAI
	f0DmKXb76aM4Xv7GA0KGyMwktjy0sujpM7uUWVsBgs2iJYV88XYAwBxARZ6hqKBC
	uEElnh0nBjnhkOUin+Alo4vvCj/AwWoeeatw795rt0Ye4niKhSues4kMrB9+7vqC
	2l5C2dRl8cw9VBXdcxMyRt3cWhlvxHXz31vp2I07kj+ZBcS3CXbxas/cS48c5lqR
	1UZUchOQ3NKPxBLg2scsexKhGd9dzNegQ4xsnSDevNN2iMlH7K+F4iZDOZDmXzh7
	M6t+Wsr8S9s8QNEYsjiPLio+c8PVlClscZByvv4q9DP356oCoquLwmLtCz7bqqxQ
	ulJYjJTHZ1FsRIvgaj4NDR0HURlaVFdAFUX0WkDrrz2fS+zt7Cjpf721AbKz0MhN
	S9wx9NN2r1M+BwjW8j/dJJ3sXSQ5m77SwkQ9yYLdwn2CqlHNpmzpX3Jmd6+pGti7
	8ZhUXitbbX5uFqRbBLfaYd79+pPhDhsct6jDbfHQPRq99OW8WzGKs/oGj+giMaXW
	9uNG+hUakgslS2rFSbp68yI1di+ZY1RJwS2xcpSAHs7KguD1uSMZZNdLh8+rsWuH
	dGTaLco=
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
Subject: [PATCH v5 2/3] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
Date: Sat, 2 Nov 2024 13:57:11 +0100
Message-ID: <20241102125712.2647325-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241102125712.2647325-1-csokas.bence@prolan.hu>
References: <20241102125712.2647325-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730552408;VERSION=7979;MC=1258900186;ID=222167;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485566706B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_060010_944031_4D83A5CF 
X-CRM114-Status: UNSURE (   8.25  )
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



