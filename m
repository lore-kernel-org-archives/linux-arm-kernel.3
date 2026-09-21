Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C63C982FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=; b=zc7A4f4fTiZbM5UxBVHFszv0yj
	Ke8Gy5aZQKz/uPkhQYWAqFXvP0k446s5vjJWZf8asMDXaQyJ34iHimDj32Sufnif9vwgOSWndG+y1
	RGC0kpXeR1eapYktFxyOrWoDw21kN2nmPLbSsYfNh269X+TAw59FGuc67flkJdohDUjW+hPS9hlx+
	4tBS0f30DLi4csupdZmZFKg5rgcp6IRizMmvbqKiXM5jJ3DwexAqxzxBmqPsdh/orHHctwGtSTzpb
	LgtEeqO5MctP52hD3+j1N2RBjVZls+I1zTceHd7cft2UqTuY2H8K1+RUZ7lmqHwUoWj/cMdHkHdp5
	te214BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fza-00000002cXG-3rZ0;
	Mon, 21 Sep 2026 15:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzV-00000002cTu-2OuB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=; b=gEgQpAhk6OBQ5VBkyT/bu/WaMi
	Pl1wK6MIaRHKOAe/kEUeVnbuOVGA2GMo6owuXH/0o8ERnn7NTnoaJC+H9X4T4GItB2WoTsvvY8I5b
	MiQ60ZUM47CrSrRPR4wBBrOo0eQoGnBrDC/hKpcUCDjMVZLhofFxwesNU/iWtjgO6Yxusbc9DEuSd
	gEbumawD9Bldy9jZqHdjZ5ZAj/ymSlOZnYZ9cz4k4ljzG0YxtTd89Cu39lgpL05txaGqa5unILDM8
	zPqxs4w2INX7Lz3Prw2T9oAH+CqLhhb/YChi68hZV3YFdKSoPTw51buO8UucHWWdnxgSraZJ6CvON
	vARvd3tw==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fzR-0000000CTg7-24qP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:31:35 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f63546c5so2469070f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004691; x=1790609491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=;
        b=FeQ2S/vkcLipfLF8VzZRHeRWjPMvKdJxHivbi/wy7tA4QD1zIE7hrMhLu+wVJIIb9Q
         gegbf07/+uzH3Q3bFyxDvQfI3IqCYau9NlQZpIYx0PE+g/PYPSkp/iGUzjKw34NOcvSw
         RKb3GHSlJpttLFokZlNnrz4wUw9yVJap0NBNyblR9z5J4gokWPgU7ulYGVey5JJCBkoC
         ZlvNDc6rh5Gj0TyJnvYpzvKe83wGoy4g91dPz9TaxLd9BRVsoaRbFMyk0DJToPzMg7pI
         EDOgrNFzqbDIS6696D/08+o/zlj4NuI9v5b0hSZFtAiAoLhpqfbn1LqyG0oHeDeIBXav
         WPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004691; x=1790609491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=;
        b=lzkgsOHurrgM6TMG0+K0vhaV0PdYLtCbBftzz01wBHJDUKMWJjxqoJD9x/EJWA5WsP
         hCY/FWicSJ+Umu9NUmnS/msJ32dtut21cgfqzgu0JpGQlC2h5fkkyOVB7Kkt4lRR58GD
         U0FrB6DCOi2kVSH5RNOK50G43TgszZFX9rHsq+p/DRrhWtHyoOL9UvbO0100nDL9X004
         Gufp1RINRHZ1GrLpyIEQ5TAo8gPuiU9FrzBVywg7MfDo5s5tinhYnfjIu/JmTOp/iG7X
         fd3lks6GwR52P7ix2qAKwZrMxDCoYx+Rf3e4qJCvXFbTtS902LxEc2auDARbgalPERzW
         wC/g==
X-Forwarded-Encrypted: i=1; AKwUvBww006p6dT9V99vIk73dJsEUD/aEfacTHjisOibTvgy9QO1D+RcWDLWu6rlAjLJMt8dBvyd/bmF7d1FUbBjCeDL@lists.infradead.org
X-Gm-Message-State: AFuF++k/Pi6QrBJjFtVHg1LyKv18niIWe76Zp7fkgDY+LOQvshNEBO6h
	ze47rnNOMwLQZ555b2rTWT2Jo+A62iLHdj91K05qr3OfB9iCr3pcpGFp
X-Gm-Gg: AYBFou05EjdyaYGgWt8vb/YYhRLzVQsey0oLpSpj+QHZWdqLXnHFoXMJCo5B8e1F31Q
	+dxWL3UC3U7IjunESSG/vcCj/NGIbxg+RPHvj1fUVDeLKC4z2/Cpp2pyg/n/ezWatJQuztYgQhX
	b/mszS9Eb4XYRWbaTMLZG7134hJT8zlkhrbi6sEV2rZjE/5L/48YOoQaFR3Kg217R0vWvOUUbes
	BwrUD0uQQZPbe6SUAoI6g+9vw9uy5jB7uKYmq4Jd5ptlaOqB3Cb/PDsidJmcgwr1LqqyrAx9+CH
	+PFPcH6yi4jmHGXXIOcxQjrcVRMw3U6peDz6Z06cWQAxk3sHz+GIywCZo9jflQO2t3kVDbl5ltD
	oKgws8g1wh/BPw3mP1ftl1XQAdaQyBTafIyQ14/yXqdfNarsHrN6jzsqSaMsiv+DADF47VPiTgE
	PUU0r1agqCQwN0Af7qwtkKO596U3GRqN3OZlr0umTfps9G9CRj6/8Kep43oA1W4vGpKLSFlKuUk
	DxRzJQpaTTk1QI+mh565RjsVEYRMdNio5nC5Iapmmq+ZamI0HBP3UGO5Q==
X-Received: by 2002:a05:6000:4b13:b0:487:1687:197d with SMTP id ffacd0b85a97d-4871e212458mr14317492f8f.6.1790004691345;
        Mon, 21 Sep 2026 08:31:31 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:29 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:57 +0200
Subject: [PATCH v2 1/5] media: dt-bindings: add rockchip rk3576 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3185;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8UIbOajv/WeBQjxhRwQ8WC4GpLGZ30N+4iDWN0b6s8o=;
 b=lKpSlM1nNUiAbgX0spgPXAk0GpWUq8d3KoePWyxk4ZSDU3HkmiPsECMZUnE7pYP6SmzdfHjUv
 odFPQ1dailNC0o+hdS/dO7TmYRMTNNv9fogQQIDl+DajAdYmtsxsM90
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_163134_057945_06976BBC 
X-CRM114-Status: GOOD (  12.05  )
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

Add the compatible for the Video Capture (VICAP) unit of the Rockchip
RK3576. This variant features five MIPI CSI-2 ports and a connection
to the image signal processor (ISP). The pixel clock of each MIPI port
enters the VICAP through a dedicated gate in the clock and reset unit,
so the variant takes five interface clocks and five interface resets
in addition to the aclk, hclk and dclk of the other variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 080b64503b1b..b7dfaf3b378d 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -15,6 +15,10 @@ description:
   the data from camera sensors, video decoders, or other companion ICs and
   transfers it into system main memory by AXI bus.
 
+  The Rockchip RK3576 Video Capture (VICAP) is similar to its RK3568
+  counterpart, but features five MIPI CSI-2 ports and an additional
+  connection to the image signal processor (ISP) block.
+
   The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
   counterpart, but features six MIPI CSI-2 ports and additional connections
   to the image signal processor (ISP) blocks.
@@ -23,6 +27,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-vicap
+      - rockchip,rk3576-vicap
       - rockchip,rk3588-vicap
 
   reg:
@@ -33,7 +38,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     items:
@@ -42,6 +47,9 @@ properties:
       - const: dclk
       - const: iclk
       - const: iclk1
+      - const: iclk2
+      - const: iclk3
+      - const: iclk4
     minItems: 4
 
   iommus:
@@ -221,6 +229,40 @@ allOf:
 
             port@11: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 8
+
+        clock-names:
+          minItems: 8
+
+        resets:
+          minItems: 8
+          maxItems: 8
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: irst0
+            - const: irst1
+            - const: irst2
+            - const: irst3
+            - const: irst4
+
+        ports:
+          properties:
+            port@6: false
+
+            port@11: false
+
   - if:
       properties:
         compatible:
@@ -230,9 +272,11 @@ allOf:
       properties:
         clocks:
           minItems: 5
+          maxItems: 5
 
         clock-names:
           minItems: 5
+          maxItems: 5
 
         resets:
           minItems: 9

-- 
2.43.0


