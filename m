Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C284C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cks1cJ9xfELg4JUmWK+0lpYkKgp9d7kXFMM0AFQQmTg=; b=G+n6B3vgFQ16Nbtcd7Xy5ssu2t
	ywlTnNKzCl37BYPq1uFbnwj3Lx/7Ch7TtCCbNkDBrQYng2XTuAEAOuEvADUfXM1DhTAj/Mixuf3yA
	Stqg6Lut5dCf7yfZnh7BDCzdq7QZ8IA+YAnyPImIXFtA44OLfFX+GqNchCSvFiVKNFXPoS+WryIMZ
	DXMqZ28pJybOxGofpTHPQjtlKm6kRSy+1Tv2WbMC8ZDJ1jiJvSqBWYBiu5TrPIk0y1IztyPFGdCf+
	YNqPGHCvKSAfXjmxKhfv/bTJj0utFiZ0A6G8l7I9334VM4ombrrU5MGyfQioMG4YSHtjqgEA5AG0O
	Xy+NBk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ET4-00000004jMj-1xzZ;
	Mon, 14 Sep 2026 21:44:02 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ESz-00000004jLd-3ALJ;
	Mon, 14 Sep 2026 21:44:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260914214351euoutp01fb2c52443c76324af56642af1775fd9c~VTgoHKQsB2279322793euoutp01K;
	Mon, 14 Sep 2026 21:43:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260914214351euoutp01fb2c52443c76324af56642af1775fd9c~VTgoHKQsB2279322793euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789422232;
	bh=cks1cJ9xfELg4JUmWK+0lpYkKgp9d7kXFMM0AFQQmTg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Gt1Pgp7fZ7ueqZw6A8frr9jnYyxGlOxe+nOszBSG6658nl/drPglL2DctmgsRj1cH
	 0yQjZgTokH2lAJm+oCbTMLQnKeB6rmeee21rISPDuQ/GZ/k9BciN5WVkZINYJJLLFz
	 8E3opR0J9LKlhgl9E7rbAYd3TUK774AILuMQmYVU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914214350eucas1p2a1d39759752b500b940f9596b5ef7387~VTgmk_GQ92704027040eucas1p2d;
	Mon, 14 Sep 2026 21:43:50 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914214347eusmtip187c1d69eecfa6816899035d6db67e411~VTgkUZfqc3045430454eusmtip1C;
	Mon, 14 Sep 2026 21:43:47 +0000 (GMT)
Message-ID: <1c8d3bc2-b4ae-436e-806c-e95956961e6e@samsung.com>
Date: Mon, 14 Sep 2026 23:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp
	Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal
	Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260910-esoteric-axolotl-of-symmetry-c02f5f@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260914214350eucas1p2a1d39759752b500b940f9596b5ef7387
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132716eucas1p2d093509db255e62e6bd546e734f04e63
X-EPHeader: CA
X-CMS-RootMailID: 20260904132716eucas1p2d093509db255e62e6bd546e734f04e63
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132716eucas1p2d093509db255e62e6bd546e734f04e63@eucas1p2.samsung.com>
	<20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
	<20260910-esoteric-axolotl-of-symmetry-c02f5f@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144359_191396_EF193B74 
X-CRM114-Status: GOOD (  15.85  )
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



On 9/10/26 10:18, Krzysztof Kozlowski wrote:
> On Fri, Sep 04, 2026 at 03:27:05PM +0200, Michal Wilczynski wrote:
>> The video output subsystem has its own system controller, documented as
>> dom_vout_syscon. Among other things it holds the mux that selects which
>> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
>> to reach it.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml    | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> index 0039319e91fe6e6aadc4300114626348e4dfb7ce..47334f6c1243c9950e6fba44daacd41f42b55781 100644
>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> @@ -24,6 +24,7 @@ properties:
>>            - enum:
>>                - starfive,jh7110-aon-syscon
>>                - starfive,jh7110-stg-syscon
>> +              - starfive,jh7110-vout-syscon
>>            - const: syscon
>>  
>>    reg:
>> @@ -90,4 +91,9 @@ examples:
>>          #power-domain-cells = <1>;
>>      };
>>  
>> +    syscon@295b0000 {
> 
> Don't need new example for every compatible. You already have three...
> and this one is exactly the same as the first one. Drop.
> 
> Best regards,
> Krzysztof
> 
> 

Will do, thanks !

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

