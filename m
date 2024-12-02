Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A5ED10DDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX++2BfI71EfbL0UifJIyYdnjIn03M87iaL/MLYsMe4=; b=VLTI7v32CyN2PiDTOgaQpUS6an
	MjW3UW+iimjzafxa14qUjPu1mjnMW4GKP7QwBcofznyrYXUFrZk7rqCau+zP73eDbsm7VxMGZW9T4
	uEegza2ehJwPbYg+rHhkq+g1nkb2oGePaeC2lzKOMcHll0kM4PPigGmD3LJteeUl3EZWu/jK3LM9+
	bWkcU3FL4wa07QmJxAUXT76FAUbjT/5ietSuexhB5363ENmNv0TqreqsL0CSad5uXiYbq8Woo0kgi
	JD6KiEJIhnn2OIC8xxu29aDB/zWt+AcaOcYC+IiGkZuxS828/6MCIb607//CCJAOE1o8teVPT81PN
	hURpUhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3Bx-00000005dpV-0Oy7;
	Mon, 02 Dec 2024 09:58:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3At-00000005deF-1ur3;
	Mon, 02 Dec 2024 09:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zX++2BfI71EfbL0UifJIyYdnjIn03M87iaL/MLYsMe4=; b=i/dJ/qDZA4x76D5c0J418PwECQ
	pPOKivungXawQrf6RAPl5Qkpki5ptQMnwt6cWyxMj81J8JQG5s0V4B8s9z46wVRtMDLDP9BgCHuBu
	qmo/ukICI31OS4muDHfZxYHggjmt4paR2h1nCFoQqKKFtrvJPj+YAD+/TaC1UpD9y/9WkDg2bE3mc
	wYZmq2jl2BWnEnBhLcRltjz3FuNkDg9xVwXK/5VYnBcQzsB0MTrN1T12AzMuRX8nJ4b3e4tottRWv
	4Nf5TZg3lHKGR51Rp6jX083np7KoII81O2a48MBF/ZSTMuN52ni2047l5iKt1qnFK7h5qN+hCtnEE
	5NbaPxBQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tI3Am-0000Ii-BO; Mon, 02 Dec 2024 10:56:56 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jakob Unterwurzacher <jakobunt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Iskander Amara <iskander.amara@theobroma-systems.com>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: increase gmac rx_delay to 0x11 on
 rk3399-puma
Date: Mon, 02 Dec 2024 10:56:55 +0100
Message-ID: <2578458.4XsnlVU6TS@diego>
In-Reply-To: <63b3be80-cb6c-49e5-858f-70fd826140c5@cherry.de>
References: <20241202090408.201662-1-jakob.unterwurzacher@cherry.de>
 <63b3be80-cb6c-49e5-858f-70fd826140c5@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_015703_517132_E6DEDDD7 
X-CRM114-Status: GOOD (  32.18  )
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

Am Montag, 2. Dezember 2024, 10:52:06 CET schrieb Quentin Schulz:
> Hi Jakob,
> 
> On 12/2/24 10:04 AM, Jakob Unterwurzacher wrote:
> > During mass manufacturing, we noticed the mmc_rx_crc_error counter,
> > as reported by "ethtool -S eth0 | grep mmc_rx_crc_error" to increase
> > above zero during nuttcp speedtests.
> > 
> > Cycling through the rx_delay range on two boards shows that is a large
> > "good" region from 0x11 to 0x35 (see below for details).
> > 
> 
> Is this missing a "there" after that? "that there is a large good region"?
> 
> > This commit increases rx_delay to 0x11, which is the smallest
> > possible change that fixes the issue we are seeing on the KSZ9031 PHY.
> > This also matches what most other rk3399 boards do.
> > 
> > Tests for Puma PCBA S/N TT0069903:
> > 
> > 	rx_delay mmc_rx_crc_error
> > 	-------- ----------------
> > 	0x09 (dhcp broken)
> > 	0x10 897
> > 	0x11 0
> > 	0x20 0
> > 	0x30 0
> > 	0x35 0
> > 	0x3a 745
> > 	0x3b 11375
> > 	0x3c 36680
> > 	0x40 (dhcp broken)
> > 	0x7f (dhcp broken)
> > 
> > Tests for Puma PCBA S/N TT0157733:
> > 
> > 	rx_delay mmc_rx_crc_error
> > 	-------- ----------------
> > 	0x10 59
> > 	0x11 0
> > 	0x35 0
> > 
> > Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> 
> This would be a candidate for backporting I believe.
> 
> Therefore, a

also please include a

Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")

> Cc: <stable@vger.kernel.org>
> 
> here would have been nice (in the commit log), c.f. 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#select-the-recipients-for-your-patch
> 
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > index 9efcdce0f593..13d0c511046b 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > @@ -181,7 +181,7 @@ &gmac {
> >   	snps,reset-active-low;
> >   	snps,reset-delays-us = <0 10000 50000>;
> >   	tx_delay = <0x10>;
> > -	rx_delay = <0x10>;
> > +	rx_delay = <0x11>;
> 
> While at it, we could reorder this alphabetically and move rx_delay 

I would disagree. This is a "fix", so should ideally only do the minimal
changes to make life of the stable people easier.

Doing this one-line change is way easier to understand than stuff also
moving around.

Heiko

> between pinctrl-0 and snps,reset-gpio? c.f. 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node 
> rx_delay and tx_delay seem to be vendor-specific but without the vendor 
> prefix, but so is snps,reset-gpio so that should be fine to reorder this 
> way.
> 
> Considering we have an option for KSZ9031 on RK3588 Jaguar and RK3588 
> Tiger and the "same" MAC IP is used and that we use the same TXD and RXD 
> delay than on RK3399 Puma right now, I guess we would want to check 
> those don't need a change as well? (funnily enough, all RK3588-based 
> boards in 6.12 actually have 0x00 for rx_delay and 0x43/0x44 for 
> tx_delay, except ours which are at 0x10). Not a blocker for this patch 
> though, so:
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin
> 





