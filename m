Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6AECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsXgy79YQM8xFjDDJv3MmdWbtXzsXjmMRTsnJF+N7QQ=; b=R8HTB9nvg6089areqgwdDKMkY8
	OmOog8yq2kJBsT872i2wLRRkSONBf4SeOPeXWGDgPGLB+qzAGU9DYG/qBlE9KRBV/9SwmrlMHrF9w
	1FFI2ZxH4PBqzVaoI7f2Hw0y0P9RNWHHnzevRa3oenfRdvquP3oCtxA9Cr/K9/8EDnLgG9jpSBipa
	AsZBmHpa6ByIhSd86btvBG46ev8hvPLDD876wuTalPxjV1rkTXRkIPBrxMa86OSmoWoBiu0ob+9zQ
	NKLGKgfwREVjJJrCwV2gl6+AshnmdYj6dIIMuM6roSVweJwSVaxtgu/LmYMcNrXhmEFmno91l6sWS
	X3KlkdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nmZ-00000000M1t-0fxL;
	Mon, 06 Oct 2025 16:09:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nmX-00000000M13-0btE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=rsXgy79YQM8xFjDDJv3MmdWbtXzsXjmMRTsnJF+N7QQ=; b=3J
	xLZjiDErY7C7g608pdU1azoFgSf0U5SnEz2JPs7RketC1YVKXVo7f82/qOw5hjqdNKlWZhigoZ2wk
	oMbNP6PjI3gGZLL3tW2WrDO5yM/0JZ5gY8J+I3XN8iPLQxJ3BJ9Ty4x7uhRNvBqfWyTRis7jXOWva
	04PaoVm2KlYVDYQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v5nmT-00AJ51-VT; Mon, 06 Oct 2025 18:09:45 +0200
Date: Mon, 6 Oct 2025 18:09:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: BCM53573: Fix address of Luxul XAP-1440's
 Ethernet PHY
Message-ID: <4fcba9c1-ff83-40b5-b7eb-758fd43ea978@lunn.ch>
References: <20251002194852.13929-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002194852.13929-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_090949_181193_9D2CC3EB 
X-CRM114-Status: GOOD (  14.94  )
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

On Thu, Oct 02, 2025 at 09:48:52PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Luxul XAP-1440 has BCM54210E PHY at address 25.
> 
> Fixes: 44ad82078069 ("ARM: dts: BCM53573: Fix Ethernet info for Luxul devices")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
> index ac44c745bdf8..a39a021a3910 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
> @@ -55,8 +55,8 @@ &gmac0 {
>  	mdio {
>  		/delete-node/ switch@1e;
>  
> -		bcm54210e: ethernet-phy@0 {
> -			reg = <0>;
> +		bcm54210e: ethernet-phy@25 {
> +			reg = <25>;

Does this really not work, or is it relying on the PHY responding to 0
as a broadcast address?

Thanks
	Andrew

