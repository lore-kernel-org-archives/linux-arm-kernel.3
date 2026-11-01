Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=te3otQZE;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=ZUE2kLUh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yA0iizie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xj9axg9dYLGo8p01aLCCgHl7zzs0dRi/f+h5LP9McgI=; b=te3otQZEwG3gPE
	FJSY3gfquaxp1JKhXTcNn7+xKIBtrHgmHJ71GcXLn/hkWeJDT7egLzraqYkorIncFxWczHsHIKUf1
	76d/b6GyaY+0BVWK5qe3id+jfwmEUqBZ3R9cUN1W+mO4Mewuc5MKYwCzclnUx+lCWUvupxRWmqp9B
	lz3L+UJIyvoVIIAg3l86Grj7545rcT1IpLTCerKC3vc6GSYgv/Y7rGvHkjLr+U839ZxqE2mEWV6fr
	jBumCD3mz13iZf/lUogNRq4rXcfMNmcne2dPXPYdgcxc5dOFQzneNQs7MnSkJXXzDJTUyKIUCfBB/
	1852Z8lWQz/C82MT0glA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQrZ-0000000DzEx-2lxn;
	Sun, 01 Nov 2026 08:24:25 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQrW-0000000DzBy-1iyg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:24:24 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 887A6140030D
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Nov 2026 03:24:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 01 Nov 2026 03:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793521461; x=
	1793607861; bh=Xj9axg9dYLGo8p01aLCCgHl7zzs0dRi/f+h5LP9McgI=; b=Z
	UE2kLUhu+f0h4zzJ7dQNeGGmU6x0eCmvflkfG8hlr4R+lO5kUaYpg1scaSJLQaTf
	u9dBXckKhipYFpy5Xry4XzDCgFoseELeenqYN0NwsqfkgPn+97HjYpMDySAqd1Lg
	ahxW9fRQ5R5YMdfx2CCjngo88MuczShDgw+62LvXZrFXDOfGjcY+CQ/OENHNcfGe
	L5YsMkAwsFCZ+5ykEIF/wSoX91EbXO98M1kwf706z7tPbeeusGrGY72ZYLJS/QWZ
	uk0y206WG0075IyUoX/0SvlZs60vA1UL30zLZjnpq//GUXB/4uqZofwRUMtOIApz
	RgSC4ZSaiGQjcO6xnH2ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793521461; x=1793607861; bh=X
	j9axg9dYLGo8p01aLCCgHl7zzs0dRi/f+h5LP9McgI=; b=yA0iizieupE0/Rl/N
	QNS3w5eyyCQa2OOnOgJjfo6uOya3dZ+YvoIC+y91f+hC/P7kqlvZ/oOok5wtI6k1
	cCzVNArcZUvhkV0Q1NS0kF7YvePCWe/5iGBxSh67+utZpZ6107eDd7GudFlvOk9Z
	kPMv10hPCnmWEIo+pkCSUK3GKY0o6SEP+FvBCLfDszbGm9iXB4BZev1RyzRYuFcq
	2RXmVSjM0hOJcVBBYbKotRxv0T40pBnqe5JnkxRbC02wnelIq6TjoOWfM4AjvK3M
	hQ6UlOngvpvDwpPhaPrkFCnBdRwx9DOjqGKuv72SFJKUfZs3ziQ42YhgI6v2q1hu
	4fgcA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793521461; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:hZBV4K20vn/k86kouUhtLvkrZn/iniPGfgxhWuiBPq3esr6
	/7Gc5TthP5MxUFSfkI9i5ms5MFggWA1BpEDLbol7sdl3/9p55PaPNGDXRJ0PJk12
	3FXdCda0h0EFMAp0NXrhdy/SnClCGIubs1WCv+7D2Itb01zkPk2wRwViQY4so7/V
	GhNattnS7Z9iPO5oGsGU4W3w7l9MNy+vA3+7exlsIijeurvIqYHI9gTRhztSuH9m
	BvTwqxdDy9qR64nuAF0Wcf2gLNVczWJmsqNhJ88PUXyu6bCOmuxzWtT2Cwif/QiB
	B+DBY1ReL9vCri7U8RU8snlQzOzJAKHId1Sddlw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/cR+SVB5SQ0kGP0/C0/QK06xN+k1K/x4EQfQy/b1HSY=:4Xq95QJdIqCjB39RLzyySSIteLteH9r9uz6l54PwLfw=;
X-ME-Sender: <xms:NffmappYiiEfk4kfjkeNmrE3x9bbwYjo8qJ1BS2hvxfVLSeTq3BWfw>
    <xme:NffmapTQGRvTElT2d0EPyQjKzgY25MzyOou17JuLGt-pT7K1Mq9znNiujCs5YGg6y
    sU03Im7CXxLEKsNibXsCP2LqVvFo7AkuioOY8-a2wzUBv4TH44N4A>
X-ME-Received: <xmr:NffmatlYCyvECxQvyETkXjlReYmwPXTBB_Zwh99ir20A-fFxy3a3zK2VpGW6H5YiHO_PwUYi>
X-ME-Proxy-Cause: dmFkZTGZ556hZr4OQNVERo9rUYXTF10cGGQBi7vLn3VnSr966c7BEZC28LhiqgFQ0DLnXR
    bnYwdeOAqs5QxBVuvkRL+ZwpHs/blmZG2wUWUiNLZ7HENeZpMSZpencZWiEx1r/ZYZ/gaT
    5aRTZsrFo+PnzxoJMR1ENyaKg8E7fhdgt1B6kN2BycVkXJHEJTKc3jHTPe6IjiylVhuTTD
    rIDq43QCU8cfWL1yKlOgbv7lVceHpNeuB46oYLXbGuG53l6HRsNNJeQwVLCejjdSqA3oLJ
    mySu3UERpxtLqccEHJ3QQ08pgTmGPEw/h/+EEsPDgBAlHAn17s6eZ3ZSMRh5fpdn/9Y7MW
    A4rXUGboymQeYRhevUsMu99pylgnR1ci1qPeAm1i9ilW2KXn+HDY/CMMKnD405vPZSMIAh
    ES4PMdqvNXQ7QUwxpvmakX14ML6/VWcidwIGbtd5Z36B8pG7IVS/WskaIVqL021NAJxc2B
    /rfw9y47objWwdzSCmJ70FIOgJGSAqR9mntmLWHfzhbdquX0VmYu0VURVrFw2PA8bwIFvh
    p/JyHLmDqKNUc+pdg4V8gmSCK//MVTL30Lbg6qyUA9FhG3bmA2/MWiurCN/6R3QJ0QTe1i
    sucgcgOKk16/auPcTGxxu9BmGIQVE1RnosKooRtX8cizl+Tvru/4UwWmSG6A
X-ME-Proxy: <xmx:NffmatGW220jToEwOhR7lCy7bcaAo0LH2mLgSm1MRCCuN3-Fj9D7zA>
    <xmx:Nffmagm1kmBFVt9bJp6ZmEDIHeeR-WHXun76PHDhcv23TnKn69DJsA>
    <xmx:NffmasSr-IKyDYvzy1vq30ODzQqhhzHDD5Dgk_G6fGtCxuSYwdgxGQ>
    <xmx:Nffmal6FwYnZffS2k_QoX8ZcBMdo5cI06LhkartZ9s68737wETpKkg>
    <xmx:NffmavXEdFxjRyf7BP8FK3c75DIi3NBZDtANZ4DUTD5ql7SR9v2HcMji>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 03:24:13 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v15 06/15] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
Date: Sun,  1 Nov 2026 21:22:58 +1300
Message-ID: <20261101082307.151957-7-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_012422_525600_78BFE42D 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3576 NPU has two cores of the RKNN block this binding describes, with
two extra CBUF clocks, two power domains per core, one reset instead of
two, and no SRAM supply. Widen the properties and pin each SoC to its own
shape in allOf; sram-supply stays required for RK3588.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd..3b611b64c8aa 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3576-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -33,14 +34,18 @@ properties:
       - const: core # Main NPU core processing unit registers
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: aclk
       - const: hclk
       - const: npu
       - const: pclk
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   interrupts:
     maxItems: 1
@@ -51,12 +56,15 @@ properties:
   npu-supply: true
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   resets:
+    minItems: 1
     maxItems: 2
 
   reset-names:
+    minItems: 1
     items:
       - const: srst_a
       - const: srst_h
@@ -75,7 +83,40 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        power-domains:
+          maxItems: 1
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+      required:
+        - sram-supply
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+        power-domains:
+          minItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        sram-supply: false
 
 additionalProperties: false
 
-- 
2.43.0


