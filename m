Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E658606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3OhCHOBZ;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZA7JXScB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=; b=3OhCHOBZ8RE4gE
	MwL/IER81yL5LI1APP9UJXa1juoAbAmSHLVPppqJu91/sILZO5nOCwITgCcoaudt13trDe0iLras9
	Hi7WnGol2Nz9SaUIY9kn6eN29q89JSRJNA0fqbFPPPONyG1MunQOxwg6HHPEVH+0OcyOfjt9CZRRs
	6Lo/Z9WQsYizXWayudkFKlx8Bqg4ZTdxk1HN1PU4fnKUn1pGsfIYX17LxHx87OqgOhs899/6TD22b
	+xuaCR3dFiWORF+yd+TfevJbRgve6d1Kd8nJpvYJz9QTIcBfpH0Ut2k9vgWAIv3Y1kM3bjae5VydO
	shD+l5jAIfUkfEBKuUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6D-00000000DP1-3zd7;
	Mon, 02 Nov 2026 19:53:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy66-00000000DHN-2BBg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26183225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649217; x=1794254017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
        b=ZA7JXScBRGip58jFTTphV+pI/Yd0Whlkye3f5G36ITFkBKfiOKt1UDX3JW2H9yaQzs
         dj7t8Tyn9JrM+4mUfQQlNPFOWZCOn1xunb+VtX+MdS8PM7EYwGFpvRcNAzjAvJLnEHMz
         7jor3uCQZnt54nlxNyeQQJjj5jZb/tXRFiKTEtytwnsYSaMq/guFAmr72zpvq9yGQMAL
         8M+7XngQnVUS1V8T0GuVGI45jE9VBoCJCLoWZvVOwwP67V/prxObmFNtRhX1EQ576vuN
         Ph7KTyPqp7Q20oVUCCMtdMGfQoRF0E+G4lMZlfCyOCCGlzs2ZdVewk1jUtXiwCDDQi14
         Cx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649217; x=1794254017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
        b=VKc/bl/BihkUyHzP5ktXgvPnX4nyWK3jrn2Y0LdnUdStvutd5lRZpm4tryjRYQuBUl
         oqINA0+E/iHtabChchJbDq0tTFzh2EKZyXoxnTY6WPEX/lw2Ei6Adba+2mG3VNer6mmC
         /8MTGS2wXmC2ZYNPzbbNRgqLM91Rr4c5FZjCyW8HILs1D8AKdnOsv1hN3flo3AvBXTyU
         XgrhJ6OvRKFYG87lFR/GjCcQLqiC2SDHcDOs1O8DtTNzxivxxvR+M1T5iqhQgYQAWv/t
         4IMHLXNJtANJzEFGeQq6q+O8jU/BOK0xt0YIc/h+EToXJiBlC0U2q5L7dh1rtcdMROqq
         oW+w==
X-Forwarded-Encrypted: i=1; AKwUvBwA4XrFDxAhRhLeViwg1QYNQVVEDWXUFxT0hvDxSYdzL1xf9GiU1aubIYcYWWpPR8PHtJ+kUmNfKhrrmMVQdIbw@lists.infradead.org
X-Gm-Message-State: AFq9FYJw4HcqrmlwNTsdb8mmThI8FEaU4zgIi1nLEpteqg06uCfvftDe
	pmtd/+teiTkEgtLpJZ4ftdfMiM0W+NepYGpwoYYOCN0Xdmv8U0/FFtL+TSNGYVqEF4U=
X-Gm-Gg: AYBFou0sGuhQ6IKXw9VOwLYVphLwsncaQe/MrT1mRj5uaxbbnBz7CKH0hiM4/8faU+x
	pPt77kCHBWXoyIonjO07JltzzJb7bwBdR/xUofv6Lb798yGDXBHGGQBPDmdygvtPAxT/A2ni6JU
	gpafaE2jb7WtGddFoCZkdex+PR6rk1Uue6OOPUzitRzWBTHecJTucg4NKigbZD90iCNkpt0dafB
	1AsICsEbL9febHQlhgbaVl9Z8N/p7hjsEiF+ERmxEnng5YF6ugyG7GsXWc9ViU8X3q8+81jhSrd
	BEnhGmbY6wbtG0s7m4vrntzc7HqQN8hXNC2KGgQa45p8WEE1bontWcSz0Tr2YjJUpFUbMRM8IqI
	bEpAQ5CAzRTqhXV4Bnd6lIeA5KYWlXLsKY2rIXbrUdwLz3vJAZ1fRhUTicrPInSgOJvuyWxaSpy
	HSDEBadepFC6XUe9m+rpp1A7x1MGau+6TR7Gp1QmNx5jvKuywpDcFJpdsOEACGxJVhvIfw3wL5g
	4PSXR3pdY8c7XiV9dhIzj6ZSpYw76qzjpM9UchDmiA4QJsIdqttAi+cOG3pN3a+WdomScBmres+
	p4kJ2xJWisnuJdaK3sl+N1uGT5s8LvX/nd09wxdgCNJcnviiNw8ZF24JtYVGe4HLs7JV9CbJsBE
	nomx+2tAp6PgeOyVuz6a2Rv5tx/3eLq0KtWMlkEIRmDeZJPQ=
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr271307785e9.17.1793649216650;
        Mon, 02 Nov 2026 11:53:36 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:36 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:52 +0100
Subject: [PATCH v3 6/9] ARM: dts: omap: dm816x: Update USB node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-6-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2863;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=EJnKkiuemSceXMhSCbPdhy5GFuqZDHKo16lb5OWeVfM=;
 b=ESCjvnfz5BaaRmtGIY0BXm6cWwwqwJZz//AnUTjaN8AjdB+wYwYVBSVpHdY1qsQm/aRw6J459
 nTfcAhJhQm5APUGdpa6Zx677/Klogwl+XT/qmDwr+30RfMu+RVgFJIi
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115341_157389_E50BAD1E 
X-CRM114-Status: GOOD (  13.51  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.
Removing deprecated usb_otg_hs `ti,hwmods` property in DT node in favour
of ti-sysc implementation.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 40 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 1e8d225dfb2c..314e5e580c8b 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -573,18 +573,26 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1400 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
+				reg = <0x1400 0x400>,
+				      <0x1000 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <18>;
 				interrupt-names = "mc";
@@ -621,10 +629,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1c00 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
+				reg = <0x1c00 0x400>,
+				      <0x1800 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <19>;
 				interrupt-names = "mc";
@@ -661,12 +669,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0


