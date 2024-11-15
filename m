Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153ADD6DDF8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:To:References:CC:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gL17cNe8aUMuYGVpdJHNMdCT/ltALl3FTv9dzom/v2g=; b=j/tkp2c6PSt78aQck5lasO2gy3
	TrpnPN8Vm24q8uJubAHpkpdq3nAMdl+5PMLt1C7FSI1Fr4XPH41Qtsb4x2982mxdD4LdBzebw6WaL
	2v0+Z9iINGEjJB5kj0a4d0TXPSjYDSxM2zNUDTkusqyKikQFnAoVuwd1e5WQOgy6PFZvZDphSgias
	maxJOC+z4OVRo1sZqcQoIlm3Xs0A3zkhz7cNDLI/iBsW+GOZXW/IV+mV5CpYO0OI3BKmeQv2mkwgc
	sJMTQPnr1a1z26W4T11/ndHGQEGMd4YJ77i/rmEEo9srPVaPYdTUzZBhVqRegX1Iwg4WGeSxkcWRT
	no16MGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBw6i-00000002l3k-1uXc;
	Fri, 15 Nov 2024 13:11:28 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBw5m-00000002ksW-0AH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:10:31 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 17A1FA0796;
	Fri, 15 Nov 2024 14:10:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=gL17cNe8aUMuYGVpdJHN
	MdCT/ltALl3FTv9dzom/v2g=; b=j4+bHq7Jo+dhNWLyZXAaJT5+Ai6ztopDA46K
	mkzikFbuuvIc6qdTZrRQbXuVCk1FvlKJc3MdFcBNm1upXpxy38ILmDztpH3XAhJV
	OdhBXl4zlnJANOedHrj2Zg6KsagE9WnyTACOZ+h0tsJWB0IRHLzZljG5fooOsTRW
	09mZOvvtiHxzWBoiHUbS+0YLHQSRNbBlE+dBSkXH9fTqXk9KeGP2eZioVGZZ71VL
	EMqYLSycdJGtS5/KvrE0Z8XUHKj1E4dsg8YBYSLGLPGSnUso8CdjseM2FqTmQ0U2
	zw0r6+7U3hgDnKvVXCFZzMee3E/KknkgoVPI9+4f36twRV/rS6mTf8Vyi8hePYkW
	AfZWOeQOpQ94I/lNgPUvArwxYecB8oZgxlNM/HS3khczmjeid1H32Ey+8KExdtRL
	8m1Bj/NS95HaPBNHHS0spB7pAH297hrqhQPoFYI62K6eEQKHRY30sfN2AX72PK4K
	Z9xJ7A02LODEwkl6K3eQ4sgdKBY1ihsgDkWUKkyE6/qNmjuBDCJgPFSh9C0L+fFP
	AvdN+vSU8H5t9bGp14aHPhw6GoaZtprZDZn3Z06IFOtPkr2NIyrg0F46BPHUHNc4
	u9AMe2XzOGxi9t3i3FREaD/x/ZQqtifxivIHt5Y8NTgdN5D/z1JIyWsxerkVrTL8
	Q/3Ish8=
Message-ID: <f1d3f71d-2e36-4ff2-9487-8494e7241c31@prolan.hu>
Date: Fri, 15 Nov 2024 14:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for DMA of F1C100s
CC: Mark Brown <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Chen-Yu
 Tsai" <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor.dooley@microchip.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Amit Singh Tomar <amitsinght@marvell.com>
References: <20241102093140.2625230-1-csokas.bence@prolan.hu>
Content-Language: en-US
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20241102093140.2625230-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855617C6B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_051030_537709_7ECC0C0C 
X-CRM114-Status: GOOD (  13.39  )
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

Can this be merged? The merge window is coming up, and there's still the 
other half of the series waiting on this.
Bence

On 2024. 11. 02. 10:31, Csókás, Bence wrote:
> Support for Allwinner F1C100s/200s series audio was
> submitted in 2018 as an RFC series, but was not merged,
> despite having only minor errors. However, this is
> essential for having audio on these SoCs.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit c2ee9f594da8 ("KVM: selftests: Fix build on on non-x86 architectures")
> 
> Link: https://lore.kernel.org/all/cover.1543782328.git.mesihkilinc@gmail.com/
> 
> As requested by many, this series will now be split in 2, the DMA and the
> ALSA/ASoC codec driver. This is the DMA part of the series.
> 
> Csókás, Bence (1):
>    dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
> 
> Mesih Kilinc (4):
>    dma-engine: sun4i: Add a quirk to support different chips
>    dma-engine: sun4i: Add has_reset option to quirk
>    dma-engine: sun4i: Add support for Allwinner suniv F1C100s
>    ARM: dts: suniv: f1c100s: Add support for DMA
> 
>   .../bindings/dma/allwinner,sun4i-a10-dma.yaml |   4 +-
>   .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi |  10 +
>   drivers/dma/Kconfig                           |   4 +-
>   drivers/dma/sun4i-dma.c                       | 217 +++++++++++++++---
>   4 files changed, 200 insertions(+), 35 deletions(-)
> 


