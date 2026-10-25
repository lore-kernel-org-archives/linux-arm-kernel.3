Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F25606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvUbsmga;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gbxnhvxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=; b=nvUbsmgaaH25o6
	9yqw9D/SMfLTTQ4KSEigihtLp1l6P8B5rL9p6TcjPrexl88v+xj1V9XYvjy0RoOURfO8t7+URxTxz
	tRu1qUvQr/OcRMSjsZ87vEFAvtlTg2S1bcmPjSaif+7cIQkxN06+o+R3oj1/7vTBWmLB+PrD9DjuF
	9tOJOlmx7HonBrABaKSrcVMx0mhlx1KOwGz0VSgp/Q+rVS5YIP8atTQHzI7o1DOVKV6IlBupS03SZ
	4jxR4UDUgG/Os6BTyuh3XGONgLT+3S6zj5OyFvWSoM3bApm0mUoIrpknyxpBfdY7WZRn2QJ3B+QHi
	2xpR6jFkXo61csKJvAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyk3-000000015uI-0kXu;
	Sun, 25 Oct 2026 13:58:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyjy-000000015rQ-2twA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 13:58:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e0d885929so1382127f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936705; x=1793541505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=gbxnhvxfa3FxCJcSk05oRgdTP+hzLSe4p77cHDuFTwNMxYud0zxJK/ajCgWZKrcNvk
         bwV/N0PpKswdRnlfx70F2XFRBWnmPCEkULRD+h9BSbs4RLBdE0QVBINarywCoUGQmZGn
         dht63uMTHIpDVh5WATVcUp5F+k2rsLlw8I1VJ3HDWkXRN1JrZH06am7tarqZ55sJEM39
         hamcnqa1UJd8sDcVWFMY13Lsbw+CwQ01ZAxOnY/W12U61rkJDPAhGt5IuJ/Tn2DLEAmW
         AewjX3Ac/dtRbt/U5JDynTSKD6m4Bep3l7nBHThX1sUj1UpN+J0Fv3r0Ct+t1oL7Y64w
         2rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936705; x=1793541505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=txU1yOFSaENmU+Zy0w2sdtPR0eBgKuQeO8OtkC8vZ/5X/mebmcMxRZsO5u7FalYYCy
         FhHXU+eqSRZI+sq2XRT/jelsy5FeegI/+z7SOT7kJbCRiKFDGGscXi3YJDU+G7ANn8uK
         JeyXreKCm8K7Vi7gs8E2dRJqGKzvlZZF3sHC6YxJ43WLJBFWSznMAj19JCwLAelxYWgM
         hjZt1szvhcZbjctAFYCfqRm6AXEwjFv2pKVrDenQJaF6K/joxy0/Hk9u/ZorgskJTTKt
         NOhOGuYTPXRzzRqlju0DQ9uPb7zx+/H7H0GDFr2cbLMOn8Xo6SMp+elDWfFXNrNKccuS
         nTkA==
X-Forwarded-Encrypted: i=1; AKwUvBwIa0xciZ/hgg4TWlF2rDOFwik57Pt8BiWicoNKLDoWb19Ess7fVOXPWHwy5BKJoF00/XcACBH0yfu+Ffh4jpFv@lists.infradead.org
X-Gm-Message-State: AFq9FYLIX03WRGCAZa8fV6xk2urc0NnjMwDQ1IE6n5iZRoPm+4Xj4/Bc
	kbRmrh473g1MuVetg86x6T7Yy0vUcMR37/cmXbfGxLdJrWDyE6lV+MvU
X-Gm-Gg: AYBFou3Y7op++WYWqUYmoPLy/NfwuZhX95RCccOXPMyo3U/eXOZGfLxE6KgukgqfJri
	DJLHN16Mhr9eMOCEoo3xdjOcsH+d/lbRHVHqqIpCVRUDli3B2FhrjH/x2KiREn+GAmvl19WYLAp
	dk6V26hLpjlcTEdm7jswbF8sZNFfyezmyUG7+seysdA0iyFv57pQDk3UymlScvtXnanc2U+BQJX
	IUM6H3kE7PoPLszjanDF67V8ZvBjFv9sw6i6g6Z73Mm6qL80ZpJfRJV3CEccUC/HrhpjWV3rLfm
	HVBEYQP60W340N1hx+ZCM8kwh/W6J0N2WLSBdTh4SS1n3QxwNNWvPFfGeUdxIuL+EeYORQCTxN2
	eBqLKp79/c3e4wwORgL1+4/MksJkwxi0jJeILZoEzYcMVlWlKOG76OuWzu0qwSgISlyDFl/w8MO
	atFKBU1WpTjg6Pow9dRWyIrQ2p8JHfQTdyE3Yg2oUgsR7FpWTre3blz/TzAvoAHOdVBApHVX9bn
	ynUzDIYeYVry6uyeLsAisWvCTutdqgYqsqPKsXR97Rup2rjInF03VebvXJjKP6r/v7W/zbBHEQy
	FykfWY0dJlRWXQ==
X-Received: by 2002:adf:e004:0:10b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e3ebb1168mr4784693f8f.41.1792936704729;
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 13:57:44 +0000
Message-ID: <20261025135745.102970-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_065826_746939_D157B906 
X-CRM114-Status: GOOD (  11.32  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0


