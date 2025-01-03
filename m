Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 21:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZznWuB1FraRGFyZglxWAosBnpPgLA03XkIoE8efXcA=; b=Q7ouaLO81iyRLeZQIGiI6Hq1FF
	T3WJ4PGZC8s7y8TI5mERDZSe71IHtQt9jrHxVDzmNbmymYFUipS8pN3+YYQYfRQNu6QUmezRJt7iy
	kCBu4QwXH69pUjeXtf2wm5izpn35TipdzKLfdtlZTKF4piB29cSoqzH3uK39VSKaG+DB6QIL/3E9d
	7W/jxJPkKvHc4NguEqo1uYjrNyqC/VhvoJE7/cRo56gxUvCvQ/rAGm8bA5Llo1yh6laAWcIDFMqP6
	n6n8pzNODvQHN0jsqkQZ7biXov042AyV1rffxkhLQT5KDnvmlLkSuaoGtlib7TScaaisHWB6sOdDk
	63Wb2NpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpC7-0000000E2dv-3ONa;
	Fri, 03 Jan 2025 21:26:59 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpAl-0000000E2QE-2PrS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 21:25:37 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503LPSbt2448245
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 15:25:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735939528;
	bh=YZznWuB1FraRGFyZglxWAosBnpPgLA03XkIoE8efXcA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bP2nhUXm4ZvP5A/Ogp+ULktqfTiKWvl5cIOouWNWOdTs31HFtamfdMWnbW5xvzxKc
	 JYSygimS1kNkpVKx5+NFFi6nnDE9eDe8B0PSkBDrlVe5+pYSWltlCa3riTkqLwHENP
	 3+Pq+YReZJ8KOxQzALnVPJtmMwxW6L51rWNaejDo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503LPSL4011213;
	Fri, 3 Jan 2025 15:25:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 15:25:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 15:25:28 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503LPStc016571;
	Fri, 3 Jan 2025 15:25:28 -0600
Date: Fri, 3 Jan 2025 15:25:28 -0600
From: Nishanth Menon <nm@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: <devicetree@vger.kernel.org>, Romain Naour <romain.naour@smile.fr>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>,
        Romain Naour <romain.naour@skf.com>, <afd@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <20250103212528.enq4ur5afxhwzh7n@outdoors>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_132535_788915_66C84AC3 
X-CRM114-Status: GOOD (  18.86  )
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

On 15:07-20241205, Kevin Hilman wrote:
> 
> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> > SoC are used to drive the reference clock to the PCIe Endpoint device via
> > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> > obtain the regmap for the ACSPCIE_CTRL register within the System
> > Controller device-tree node in order to enable the PAD IO Buffers.
> > 
> > The Technical Reference Manual for J721e SoC with details of the
> > ASCPCIE_CTRL registers is available at:
> > https://www.ti.com/lit/zip/spruil1
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
>       commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
>       commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
> 
> Best regards,
> -- 
> Kevin Hilman <khilman@baylibre.com>
> 
This will need a bit of fixup - See along the lines of the following.
Additionally, we should be a bit careful about the dependency of dts
mix up from two trees.

https://lore.kernel.org/all/20250103174524.28768-1-afd@ti.com/T/#m15dcfa786fc430d54cf96475afc10648372f8589

From Andrew Davis:

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2a..3323f3bc976e0 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
     description:
       The node corresponding to SoC chip identification.
 
+  "^aspcie-ctrl@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the ASPCIe control region.
+
 required:
   - compatible
   - reg
@@ -110,5 +116,10 @@ examples:
             compatible = "ti,am654-chipid";
             reg = <0x14 0x4>;
         };
+
+        acspcie0_proxy_ctrl: aspcie-ctrl@18090 {
+            compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
+            reg = <0x18090 0x4>;
+        };
     };
 ...
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 32a232a90100e..4b2101e90fb51 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -84,7 +84,7 @@ ehrpwm_tbclk: clock-controller@4140 {
                        #clock-cells = <1>;
                };
 
-               acspcie0_proxy_ctrl: syscon@18090 {
+               acspcie0_proxy_ctrl: aspcie-ctrl@18090 {
                        compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
                        reg = <0x18090 0x4>;
                };

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

