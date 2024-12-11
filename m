Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B30E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gz2g2xIWCKvpFm2gjUfw/XeL0J0V+9S7un6UZm1EU7U=; b=QTfyS9FomUOqcJAiHSY8ycaqbS
	Q4v3WLMdz5TJClSVkRhXZnuCEtx2Z9HGpeZk6/7lni9VG1NmQ04/e49WmenlYVJHcxKqdYcNRFLBG
	DKtaWFPgwh7nvbJmpiCKdL7Dr1Y6gu+gpmHV7k0l15ZqksbPY2w157BRTRf7LecyX5t6vsJ0FeEJV
	TVI8/0TeMbNLVBVTbfWUZouivSRsiA76/a2i4Xbs7/WZgaBCnLnQdxBIwBcrwwjWzEHaQ40lO7o7h
	OKXUgqYdI4a3Kcvc0uX1LNzhcDkD6xrOLyy5YHgqLzmflgzgKlGuzghf2Mk1g0FZ0eeSD9aB3gQvX
	ak2UdH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHEV-0000000E4Ih-2Goh;
	Wed, 11 Dec 2024 07:34:07 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHDS-0000000E4Bm-0oeC;
	Wed, 11 Dec 2024 07:33:03 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733902380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gz2g2xIWCKvpFm2gjUfw/XeL0J0V+9S7un6UZm1EU7U=;
	b=AGNzhKLHPaRUqC8zvMa2lNnnBRGsufL9vRHOj2JBd+HHGLWgwbudx7p/s4W8CbwlrA/1sl
	oI27U/WZOQtaKal39CTZbi/YBfzcMrOxE/U8UHSNnbT6sQHX+qYIcgDjhPQtS21Gytn8V9
	H5JHgbyhH1jkOdEOKOpg8oeWRDvJ23VHTJfoZvp3vF97Xk7U+uXdz0UVJ/g2J8+Kutlr8y
	PfO4R5+xakcYmM4tNKkv/QOBTiFJkQyyy27T9YjOA++rqLiau5Y9uflW3fed2Kt6olmyvK
	Uc8qBcPvCiU0xnGyJjn3KyrpJ2XJIrX+gHO5iWkN3twWVVN4wDV4u3XQm0iVDw==
Date: Wed, 11 Dec 2024 08:33:00 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Remove address aligned beats
 from rk3328-roc
In-Reply-To: <6453e714b2a48572ff1e57cd74b0f6d3@manjaro.org>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-7-pgwipeout@gmail.com>
 <2b68c2dd3618e5904a4eac1ec87d29a7@manjaro.org>
 <CAMdYzYpj3d7Rq0O0QjV4r6HEf_e07R0QAhPT2NheZdQV3TnQ6g@mail.gmail.com>
 <6453e714b2a48572ff1e57cd74b0f6d3@manjaro.org>
Message-ID: <e30217fec525af2a3b0e9752b0d1ea31@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_233302_534465_812F923F 
X-CRM114-Status: GOOD (  26.59  )
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

On 2024-12-10 14:44, Dragan Simic wrote:
> On 2024-12-10 12:29, Peter Geis wrote:
>> On Tue, Dec 10, 2024 at 5:45 AM Dragan Simic <dsimic@manjaro.org> 
>> wrote:
>>> Thanks for the patch.  Please, see some comments below.
>>> 
>>> On 2024-12-10 02:30, Peter Geis wrote:
>>> > Since commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
>>> > RK3399/RK3328"), the snps,aal, snps,txpbl, and snps,rxpbl nodes have
>>> > been unnecessary in the separate device trees. There is also a
>>> > performance loss to using snps,aal. Remove these from the rk3328-roc
>>> > device tree.
>>> >
>>> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> >
>>> > ---
>>> >
>>> >  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 3 ---
>>> >  1 file changed, 3 deletions(-)
>>> >
>>> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
>>> > b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
>>> > index 6984387ff8b3..0d476cc2144d 100644
>>> > --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
>>> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
>>> > @@ -155,12 +155,9 @@ &gmac2io {
>>> >       phy-mode = "rgmii";
>>> >       pinctrl-names = "default";
>>> >       pinctrl-0 = <&rgmiim1_pins>;
>>> > -     snps,aal;
>>> 
>>> Huh, I see that quite a few RK3328 board dts files specify
>>> the snps,aal node.  I wonder was it a "cargo cult" approach
>>> at play, :) or was there some real need for it?
>>> 
>>> Actually, I see now that you added snps,aal to rk3328-roc-
>>> cc.dts in the commit 393f3875c385 ("arm64: dts: rockchip:
>>> improve rk3328-roc-cc rgmii performance."), so I guess that
>>> your further research and testing showed that it actually
>>> isn't needed for Ethernet stability?
>>> 
>>> >       snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>>> >       snps,reset-active-low;
>>> >       snps,reset-delays-us = <0 10000 50000>;
>>> > -     snps,rxpbl = <0x4>;
>>> > -     snps,txpbl = <0x4>;
>>> 
>>> Unless I'm missing something, the commit 8a469ee35606 ("arm64:
>>> dts: rockchip: Add txpbl node for RK3399/RK3328") doesn't add
>>> the snps,rxpbl node to the RK3328 SoC dtsi, and the respective
>>> driver does nothing about it when the snps,txpbl node is found.
>>> 
>>> Though, I see that rk3328-rock-pi-e.dts is the only other
>>> RK3328 board dts file that specifies the snps,rxpbl node, so
>>> it seems that removing the snps,rxpbl node here should be safe,
>>> especially because it was you who added it in the same commit
>>> mentioned above.  If there were some SoC-level issues, all
>>> RK3328 boards would've needed it.
>> 
>> Good Morning,
>> 
>> You'll notice the author of that patch was me. Setting aal, txpbl, and
>> rxpbl was the original fix I came up with for the rk3328, which I
>> applied to the only board I had. Someone else later on isolated it
>> specifically isolated it to just the txpbl and applied it to both the
>> rk3328 and rk3399 directly.
>> 
>> This was just something that was left hanging after that result.
>> 
>> Looking at how rk356x was done, I suspect there's an even more elegant
>> solution. However I don't have the deep level knowledge nor
>> documentation to implement it.
> 
> Sure, I noticed that you authored the original Ethernet stability
> fix. :)  With all this in mind, please feel free to include
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> 
> and I'll prepare a patch or two that clean up any and all leftovers
> in other board dts(i) files.

For future reference, to help anyone going through the mailing-list
archive, here's a link to the above-mentioned cleanup patch:

https://lore.kernel.org/linux-rockchip/e00f08d2351e82d6acd56271a68c7ed05b3362e8.1733901896.git.dsimic@manjaro.org/T/#u

