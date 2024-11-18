Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFF1D49222
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZQPhYsdXm9k5pHLTPXcoYc+MFp1NSFwbR+EMV0NTt0=; b=YMIaFDgqsDVQkJ
	zJJpeTKKT8q/l08I/uobOT1l/mRkvPz0fmBwVQ7WYnusPbh89Ph0cHKYpFcZrkpa3Scxe+jSUv0av
	d+U4ECwyARC7JRjrkJaNxK98MbL998Xh4VJ7yWxM16LUK0a4uI8O1pQv8+Z2u64uooR5haC8POrb1
	/B94wu26oORpNupt6XFB/lH+468VAYilMt0KJsMEbCVYnsugAZijp/zAle1rv9S6JQVF20izHSqj3
	gi9m1bVIbLgsyQv1zZem3Fj6EqT/0PxrAYYhPS3oII81Or3hLbd0h+kq/PBpyxPJB3p1LvKo5cbfK
	d29xOBW0NOu0EVm/WuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1xC-00000009cKg-2ltW;
	Mon, 18 Nov 2024 13:38:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1sO-00000009aub-2hH2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AC765C4354;
	Mon, 18 Nov 2024 13:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AEAC4CECC;
	Mon, 18 Nov 2024 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731936791;
	bh=+5pvSOuLXKYeKoNoRYSwaH7BlhZ+w4zgc0P/TP1RzcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PWjYBUU/MEhTDeY3PtbV9E1sKL10BsWvYBDJW7/ux8XfYmsBX0YgHUPJwJ1KyjyKd
	 /ljy8eYSaKMoh77/TZgGrbk60+ahMmfmZFrCv6kEKwbDJeUFM9HEDeXoOF2CfIRakA
	 phiQc6FTwpi6Q0RU7dG/ye3iJJzTjupi97iDRmfFENnPWuvr3sCd9zvtSgMh0Fsyqj
	 IV6J47XX0PNV/0DvKKzNtPmrOidNFgOIqLxg47TdodPH16ciaMpFNqvy/P8qHx8SaO
	 04zgqvMtmYVpXiBx7ftitXYXPdzBNSnclt0EQJKkC9UCVUHEwKQOwwxrfBVVuL40Js
	 GhDguBYZJfHag==
Message-ID: <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
Date: Mon, 18 Nov 2024 15:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241113110955.3876045-2-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053312_729119_94FD7BE4 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 13/11/2024 13:09, MD Danish Anwar wrote:
> The ICSSG module has 7 clocks for each instance.
> 
> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
> 
> Add these clocks to the dt binding of ICSSG.
> 
> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> index 3cb1471cc6b6..927b3200e29e 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> @@ -92,6 +92,16 @@ properties:
>      description: |
>        This property is as per sci-pm-domain.txt.
>  
> +  clocks:
> +    items:
> +      - description: ICSSG_CORE Clock
> +      - description: ICSSG_IEP Clock
> +      - description: ICSSG_RGMII_MHZ_250 Clock
> +      - description: ICSSG_RGMII_MHZ_50 Clock
> +      - description: ICSSG_RGMII_MHZ_5 Clock
> +      - description: ICSSG_UART Clock
> +      - description: ICSSG_ICLK Clock
> +

There are actually many more clocks [1]
What is the purpose of adding all these clocks in the DT if driver doesn't
use them?

Only CORE and IEP clocks parent can be configured via clock muxes.
Those are already defined in the icssg?_cfg nodes.

[1] - https://software-dl.ti.com/tisci/esd/22_01_02/5_soc_doc/am64x/clocks.html

>  patternProperties:
>  
>    memories@[a-f0-9]+$:

-- 
cheers,
-roger


