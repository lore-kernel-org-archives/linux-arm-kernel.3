Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A5AC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIfdzcVsJS+Y1xlZNSjmnndTMnBgOYe6g0smELzJkrE=; b=3QEI2o2ZELCYwSdaTuVQm6pHLi
	AndtDKOaq/UcM4AYonDFqVuRRcHKEZhScIUprcof8n3BRJtV1CoMKWMEOd3nBEJC6IplHPk3Gmuqb
	pAaQV2ZnyjQolgVEARQ4ACsU4P2ffqil3XNmN5RE2NQCTrDbvNxuDwTnp8/RwCzwpuqtdYdP8pkwV
	PYhaFI3DyFcsycJ/QFv3HkpiK6/XytSLfJtL9sZ3kFMgliuoKLXJMdeSSLLYGlQomixRDMPHwRbGM
	SM3e0FK9N+8KKhKz888utIJH5JLP1HixElFg+3/4Rdgho4RCoU6phi4baTRGpXTE2iWlLD6PEQKoS
	atKtN1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAFV-0000000HTh9-3T2O;
	Fri, 13 Jun 2025 19:39:37 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7w3-0000000H8xI-0Bzg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 17:11:24 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55DHAnCP3183815;
	Fri, 13 Jun 2025 12:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749834649;
	bh=tIfdzcVsJS+Y1xlZNSjmnndTMnBgOYe6g0smELzJkrE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y3W/JpxVwNVQbD3bTSuqcNoWS2DUs1sx94Iq2aqEy4TDX1+edD6Gn5xLVlmu+bMLZ
	 Hdg5BR6bstG2Vcd1BvuJnxPF6Sbin5e0q38zTbnTh40leylgPCcj/ovbVd2of2s0sF
	 ceHivc9iWxLQ7q0+sBQ5ejLR4gkyJzXLvJSbcMEc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55DHAnHH2745269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 12:10:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 12:10:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 12:10:48 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55DHAmgB4049360;
	Fri, 13 Jun 2025 12:10:48 -0500
Message-ID: <db82d506-3d10-4f6d-a100-d29e3685ba46@ti.com>
Date: Fri, 13 Jun 2025 12:10:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
To: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King
	<linux@armlinux.org.uk>,
        Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy
	<marc.murphy@sancloud.com>
CC: Jason Kridner <jkridner@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
 <20250613-bbg-v3-1-514cdc768448@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250613-bbg-v3-1-514cdc768448@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_101123_247671_27E0CB3E 
X-CRM114-Status: GOOD (  14.48  )
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

On 6/13/25 10:49 AM, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation for AM33xx-based boards. Update vendor prefix from
> "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v3:
> - Change vendor prefix from ti to beagle
> - Remove BeagleBone board variant description.
> 
> Change in v2:
> - New patch
> ---
>   Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..45fa1c61cafd 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,32 @@ properties:
>         - description: TI AM33 based platform
>           items:
>             - enum:
> +              - beagle,am335x-bone
> +              - beagle,am335x-bone-black
> +              - beagle,am335x-bone-black-wireless
> +              - beagle,am335x-bone-blue
> +              - beagle,am335x-pocketbeagle
> +              - bosch,am335x-guardian
>                 - compulab,cm-t335
> +              - grinn,am335x-chiliboard
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - isee,am335x-base0033
> +              - moxa,uc-2101
>                 - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                 - novatech,am335x-lxm
> -              - ti,am335x-bone
> +              - oct,osd3358-sm-refdesign
> +              - sancloud,am335x-boneenhanced
> +              - seeed,am335x-bone-green
> +              - seeed,am335x-bone-green-wireless
> +              - tcl,am335x-sl50
>                 - ti,am335x-evm
> +              - ti,am335x-evmsk
> +              - ti,am335x-shc

SHC looks like a Bosch board.

Otherwise this looks much nicer now,

Reviewed-by: Andrew Davis <afd@ti.com>

>                 - ti,am3359-icev2
> +              - vscom,onrisc
>             - const: ti,am33xx
>   
>         - description: Compulab board variants based on TI AM33
> 

