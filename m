Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099ACE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72r4qggF540DemqvorlHgSsuZkcFWTGS0CVX0yJkKII=; b=dMPU4FX3DwxZS+FiJeMTST+EA0
	eb1vuYbyo/qa+Z8gT7s7ApLflg4egCX1KvdsuqS9tZx+TSEeiKuxgkY2OHWff3QxdhaVXgOPe6CrQ
	hnFpe1iOTvA1tUwD+2U/EE0ID2U/MYSYzn2pXULpLtBPml5+cJAUN+w6f2VIKZuBgDmmOiBl/3juF
	Dd5xgX48l/KMvm5yIMfV5N7mPZ/eQmXrCcQT0UBUFzyfAxV7KFIaSD1sccUXQHK8cVGiXHhykrJN9
	LdlbW2Xp7O94uY9aK6SiJ8s1rkK9RYVCzDrjddDTYwxUejEqkJD8V7JZhCkffNREfuE0SF6DDX5Oi
	pnV9Iwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIksl-0000000Bu9h-3hB5;
	Wed, 04 Dec 2024 08:37:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkrk-0000000Btxj-46lg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB0BDA41B5C;
	Wed,  4 Dec 2024 08:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E188C4CED1;
	Wed,  4 Dec 2024 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301371;
	bh=JWq/BGvkJk1GK8sFxZgwWJnaeKD4x2uHKRtWIOrvvJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTBfmq30FV+yv6D6qxx5+g49rCUcXNB+muo4iirc0b60cx2+yK6Ct7MFtF5qgpN9W
	 p5UH6vKUhwvs5XhLF0eHazQ29WG69FP5lk5viku+3wEyrR34A03I4o6U5SuAlJez+Q
	 maTf63n61b+Jq6J7VC9LXNeIdRTZcDf1r9eY3DjPN9nHhs89UTIQ7GuF3u/b6qv7ES
	 u5aB95NtHEAYXH48ZzLuEszqC9nax+AbRgj13xTHH3EOuTD/U8xSidRHWeGImT4ZzZ
	 JenzgCuaut10ssMm9qSGeKH9qvTzkaAJIegGe3PQrp2pG4oDd/CaSheehbquu02sel
	 CrUXij4gWaRnw==
Date: Wed, 4 Dec 2024 09:36:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add PCIe ctrl property
Message-ID: <kno3z5nszu4437kvon5nxmxv6qzhjagdjti2guljowmmvkbskr@6falbmmpidki>
References: <20241203173113.90009-1-afd@ti.com>
 <20241203173113.90009-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203173113.90009-3-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_003613_083507_259619FB 
X-CRM114-Status: GOOD (  14.44  )
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

On Tue, Dec 03, 2024 at 11:31:12AM -0600, Andrew Davis wrote:
> Add a pattern property for pcie-ctrl which can be part of this controller.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index 9ba9cb100ab30..ead0679b30e3f 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -74,6 +74,12 @@ patternProperties:
>      description:
>        This is the ICSSG control region.
>  
> +  "^pcie-ctrl@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the PCIe control region.

This device (parent) is a syscon already. There is no sub-block
representation, because what would be next? Third child with a node per
each register?

Best regards,
Krzysztof


