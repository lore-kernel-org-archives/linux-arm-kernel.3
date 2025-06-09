Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2B1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1IKf9AorUgqBGeWu8urz3AAOvCJWkpQcDggQ0geEY0=; b=dijJSoxEy2hRTX21lplxResEoy
	XOat5lAOq5nbHdx7WhQuNCfUWnM3PGcViDicaNbEtfL5MMQhd+Mg+m37BW11uvk9jOlZQ8tihZq85
	Sy0VRRMsvA1O002EaKy7dEHLLQTm0mfG1Z4mS7NfMNsY/yhhWXtFx553JuibAlNBx1C+VH///LHNC
	PHRmiKrRnChIoHW799YP4AgAkSAoRbmzg69QIReze0kdWFlaqXU6Ajy1xlyGd6NhfebjrD55Tokmh
	REPFYBL37m6S/GltbLT+ulM9rjU8zbc8TSgyY49yYvH47YLZRAXoRBCEticVxDBRFWR5wPM9xgg9c
	chYSn0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm31-00000005S0L-3Q3T;
	Mon, 09 Jun 2025 23:36:59 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm0s-00000005Rpo-2pYI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 23:34:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559NYCBZ2124875;
	Mon, 9 Jun 2025 18:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749512052;
	bh=O1IKf9AorUgqBGeWu8urz3AAOvCJWkpQcDggQ0geEY0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fHehs+SxpcW4hK4rG1SoW0DZc31GQ3qdLPqhbFt1sd4K7q1tE0hoYA4XVjS727cgj
	 dCLZ0Ar7/59QXqPMJ3LHZx2DZfutJPGz0vyT+dKNCgm7XjZUG89UxViuvdOOsfdwBR
	 miMcVHtR6BiXvz7blC6OTQSvePjrX2G3AvJ6BY1Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559NYCDL4024898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 18:34:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 18:34:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 18:34:11 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559NYBZA1994249;
	Mon, 9 Jun 2025 18:34:11 -0500
Message-ID: <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
Date: Mon, 9 Jun 2025 18:34:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
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
	<linux@armlinux.org.uk>
CC: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250609-bbg-v2-2-5278026b7498@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_163446_942135_9799EA77 
X-CRM114-Status: GOOD (  15.15  )
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

On 6/9/25 10:43 AM, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation. Add description for Bone, BoneBlack and BoneGreen
> variants.
> 
> Add several compatible that were missing from the binding.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - New patch
> ---
>   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..c43fa4f4af81 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,50 @@ properties:
>         - description: TI AM33 based platform
>           items:
>             - enum:
> +              - bosch,am335x-guardian
>                 - compulab,cm-t335
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - moxa,uc-2101
>                 - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                 - novatech,am335x-lxm
> +              - oct,osd3358-sm-refdesign
> +              - tcl,am335x-sl50
>                 - ti,am335x-bone
>                 - ti,am335x-evm
> +              - ti,am335x-evmsk
> +              - ti,am335x-pocketbeagle
> +              - ti,am335x-shc
>                 - ti,am3359-icev2
> +              - vscom,onrisc
> +          - const: ti,am33xx
> +
> +      - description: TI bone variants based on TI AM335

Do we really need these "bone variants" split out from the above
list of TI AM33 based boards? We don't do that for any of the other
boards, you get a SoC and a Board compatible, every classification
in-between is just unneeded.

Andrew

> +        items:
> +          - enum:
> +              - ti,am335x-bone-black
> +              - ti,am335x-bone-green
> +              - ti,am335x-pocketbeagle
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone black variants based on TI AM335
> +        items:
> +          - enum:
> +              - sancloud,am335x-boneenhanced
> +              - ti,am335x-bone-black-wireless
> +          - const: ti,am335x-bone-black
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone green variants based on TI AM335
> +        items:
> +          - enum:
> +              - ti,am335x-bone-green-wireless
> +          - const: ti,am335x-bone-green
> +          - const: ti,am335x-bone
>             - const: ti,am33xx
>   
>         - description: Compulab board variants based on TI AM33
> 

