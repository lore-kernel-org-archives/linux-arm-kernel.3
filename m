Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46BEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWuajKBzp5P29va8dZADm3KIQPoT99vey4Xoq4mmV6I=; b=V/ZFiVWYUTO4ZRfAibAj/d2b6B
	reDldTByeE3fsA2lL+MEUmPCfwz/8tLf5Mx63Rw0yn3S3JSSE5RSR4efIt/d8Uy/CIH69qRb8n7LM
	TUT2hrXY8PtI9/FbZ5tBcNYRaQYwFhKNHRx7GdUBlRLLHysYFlF4pMskQP+vEZR1qfAxRl7Pj9/us
	SWOcEjHhIEvpG/4+4P9yhJyXbJ4tjPIBqzIA6oUly7dMVBFIGaA3wCHGBPJ00UNeoVV42Z1uX12Tj
	OkaaDi/NwtSt0PpEXOnQLzzJofaklllQA9ylH61FRt3nNMu2J9EnH2/BABOwQOeFsgR4XqomvBDf/
	YTmRnXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAn2R-0000000GEnZ-0rfh;
	Sun, 27 Sep 2026 11:27:23 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAn2O-0000000GEmZ-1aLK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:27:21 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C06E9240101
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 13:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790508433;
	bh=HWuajKBzp5P29va8dZADm3KIQPoT99vey4Xoq4mmV6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=FDKqYl2m9mgBMrcaQyDOw6uuRDzKZaAbEYIcvYmyKRN8YMH8VxaNmWINo/KxF4E1c
	 jMolL98c40uz3uSA4R4YSar3nduTbBbjC9kwaUSYbxoHImr+1iHiZTW0sYlHctmmYZ
	 38YwBJLxkKbdWsaTAGC3jjwobkf6wLXX6W9Jlv7Y3HRFOlVfYptrux0AEi7fRLCXsm
	 N02+RP1BSxYzaiXS5J6KutQ1fPOFVLB2wSHjkFNNFmX5Ma+ywTH2ihEI6DzxKz+X91
	 Ob/MCPng6t1dlgrNewOcUTxgGVh30PlDy/sIFtmcxizn2NZsmY8m8DnAc8U8fCzVQm
	 Oi0BPfG1QDPqw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ht2GN34T4z9rxB;
	Sun, 27 Sep 2026 13:27:08 +0200 (CEST)
Date: Sun, 27 Sep 2026 11:27:12 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Andre
 Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware
 spinlock
Message-ID: <20260927132707.5f484946@posteo.net>
In-Reply-To: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_042720_736627_C632D809 
X-CRM114-Status: GOOD (  18.50  )
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

On Sun, 27 Sep 2026 09:56:26 +0700
Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:

> Add the hardware spinlock of the D1 and T113. It goes in
> sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
> has no spinlock in its memory map.
> 
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi index 3b077dc086..228cc5c074 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> @@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
>  			clock-names = "hosc", "losc";
>  			status = "reserved";
>  		};
> +
> +		hwlock: hwlock@3005000 {
> +			compatible = "allwinner,sun20i-d1-hwspinlock",
> +				     "allwinner,sun6i-a31-hwspinlock";
> +			reg = <0x3005000 0x1000>;
> +			clocks = <&ccu CLK_BUS_SPINLOCK>;
> +			resets = <&ccu RST_BUS_SPINLOCK>;
> +			#hwlock-cells = <1>;
> +		};
>  	};
>  };

Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
the driver in the sun6i_hwspinlock_ids struct, drop
"allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
file accordingly? Hmm, there are actually a lot more devices, which support that
spinlock (H2, H2+, H3, H5, H6...). A31 was the first one introducing that IP
core, but newer reference manuals removed the spinlock section completely.
There it is an unnamed 4k block in the memory map.

Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hwspinlock"
string or add all the possible combinations like
"allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinlock".
I mean, it is just a naming game and there are 10+ SoCs supporting this
spinlock register file.

Oh, and I may be able to test it against the D1, I own a Sipeed Nezha. Though,
setting that one up for kernel + FreeRTOS testing is really, uhm, annoying.

greetings,
Wilken

