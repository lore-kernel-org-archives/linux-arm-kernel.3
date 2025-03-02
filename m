Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14013C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2oXP3IgRs0rEnuo1niIjmyUv1NI5JCJJQ+v2uiGwMI=; b=OX51QKu7+s/8SvlMMVjryjHCy/
	Ci4SfJ/iuYsxyD52o8AS0sEZrXXbngy66KiSBdvaD+AKTv8YR54WkFrWCEzQ6LvVq8dKR5aFbUKAb
	AZbKGsOiUweBmUwVDEbfiDFljItzPJkasxiV8XSpdJhLhXTRVRBPTctUrHGrMsUy0XRR2YcwQ7Fbj
	52FaJrxGCGboLf+Ks6zTFpG9h1SW2USGLWzFWkqSZtEGChFvAs6SEOSbH/M+potOPLoqlf4bOM/68
	enswQCwHmVvdsGzzSsmzElOoA1SXkzjYfV3F3FxNh1kFejsM8zDW29ERZLZwcm/PfK6du9FS7hhHm
	kJXjXjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tom1T-0000000GJBj-0CHt;
	Sun, 02 Mar 2025 16:18:35 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolzt-0000000GJ5D-3F6M;
	Sun, 02 Mar 2025 16:16:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B59DD25286;
	Sun,  2 Mar 2025 17:16:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8mzO5PnjFYc; Sun,  2 Mar 2025 17:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740932213; bh=24etwHDO43cgkA43Fvv7V97Li/I7jEmBfGtyam7R4FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1qDYU19UIJxtbJclJuBESKTf/+cG2z3j4fCzAWLSJ9qrzXbEly5vnmFqOixyoZfL
	 0YPsoEXi3eeNwH4/i/1i1RNlVaQMXfmRDqO/i1dBqMQacCT6F8bDcT7Hc0vun21Ny2
	 N+XPzWaSuRmyvo1zfibKrIh+YWmsRFm2vMMNp4rTXSqqMv352pA7lnEo+6bkCIb1l1
	 AW7Cb3a5kG7vtkED73cKZ2x5E9CxGarKuG77IBb1zvY1z447ghKpySnuSaWUwo52ev
	 yQMAJ7Rj4YQyrAao7Beif4DJi0VdjqFuzXaGZci0YY91a6k8HdZuX0FGztJptwfRhE
	 Bxtu6nu9FtxqA==
Date: Sun, 2 Mar 2025 16:16:36 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>, FUKAUMI Naoki <naoki@radxa.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
Message-ID: <Z8SEZOoQWiS4jl7n@pie.lan>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104835.36439-1-ziyao@disroot.org>
 <0aefd292-7980-434d-9c18-4ab9f6a0b40e@kwiboo.se>
 <Z8MklJfFz2EA6oNS@pie.lan>
 <d6928adc-1df2-494f-a3d3-7b028c220547@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6928adc-1df2-494f-a3d3-7b028c220547@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_081657_945709_4EF0A1DE 
X-CRM114-Status: GOOD (  28.06  )
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

On Sun, Mar 02, 2025 at 12:56:42PM +0100, Jonas Karlman wrote:
> Hi Yao Zi,
> 
> On 2025-03-01 16:15, Yao Zi wrote:
> > On Sat, Mar 01, 2025 at 02:01:05PM +0100, Jonas Karlman wrote:
> >> Hi,
> >>
> >> On 2025-03-01 11:48, Yao Zi wrote:
> >>> SD-card is available on Radxa E20C board.
> >>>
> >>> Signed-off-by: Yao Zi <ziyao@disroot.org>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
> >>>  1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> >>> index d2cdb63d4a9d..473065aa4228 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> >>> @@ -12,6 +12,10 @@ / {
> >>>  	model = "Radxa E20C";
> >>>  	compatible = "radxa,e20c", "rockchip,rk3528";
> >>>  
> >>> +	aliases {
> >>> +		mmc0 = &sdmmc;
> >>
> >> Suggest using mmc1 for sd-card because the e20c typically have onboard
> >> emmc, compared to removable sd-card.
> > 
> > My board doesn't have an eMMC: it's optional as well, but all variants
> > of Radxa E20C come with an SD-card interface. The vendor devicetree sets
> > sdmmc as mmc0 as well[1].
> 
> This is strange as Radxa typically want to align with mmc0=emmc and
> mmc1=sd-card, as seen in [3] and [4].
> 
>   Align with other Radxa products.
>   - mmc0 is eMMC
>   - mmc1 is microSD
> 
> Also mainline U-Boot for Rockchip SoCs typically always treat mmc0 as
> emmc and mmc1 as sd-card, and for most SoCs it will even override the
> board aliases to have some predictability across boards.
> 
> > 
> > I won't insist on it and am willing to take the change if you still
> > consider mmc0 is better.
> 
> Yes, my position is that we should use following:

Ack. I got your point but there's a typo (s/mmc0/mmc1) in my reply.

>   mmc0 = &sdhci;
>   mmc1 = &sdmmc;
> 
> I will send out a short sdhci series based on top of v2 of this series.
> Driver changes was not needed to get basic sdhci working on RK3528 and
> is only required to get HS400 modes working.
> 
> [3] https://lore.kernel.org/r/20240620224435.2752-1-naoki@radxa.com
> [4] https://lore.kernel.org/r/20240619050047.1217-2-naoki@radxa.com
> 
> > 
> >>> +	};
> >>> +
> >>>  	chosen {
> >>>  		stdout-path = "serial0:1500000n8";
> >>>  	};
> >>> @@ -20,3 +24,13 @@ chosen {
> >>>  &uart0 {
> >>>  	status = "okay";
> >>>  };
> >>> +
> >>> +&sdmmc {
> 
> This node should be placed above &uart0 to be in alphabetical order.
> 

The original patch keeps the order of nodes in the SoC devicetree
(sorted by MMIO address), but alphabetical order seems more common. Will
fix in v2, thanks.

> >>> +	bus-width = <4>;
> >>> +	cap-mmc-highspeed;
> >>> +	cap-sd-highspeed;
> >>> +	disable-wp;
> >>> +	rockchip,default-sample-phase = <90>;
> >>> +	sd-uhs-sdr104;
 
Thanks,
Yao Zi

