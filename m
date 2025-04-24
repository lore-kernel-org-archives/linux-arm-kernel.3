Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C91DC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIvPXdQKZDqfBdhJUUNkyfS3h78xf0CmbbJ5p0gZbuQ=; b=LUsdD0O+RuvYAZjeRYRiLbe7Nl
	XAj3QpbW5TzbkVfmftccofacNJTLgnj9Xivg0rUdaBYnxjWGL3Il/6OOJe9d/3yinaDOpdVJaNQWL
	xEYorMbRCLQzhp41i67tC20HyLl99hOlS4/2Vg6lPUx/sIhhh+IC4oXE582ZKv2JlZHbEB2fU/V/O
	UfeaNp3KWIgKFmJ3RLEF0TS6GokevXWt0pWgJVZr/8JzPyg9oEnaoI0gnP7o+dY2NZZo/KhYNbOZg
	O5HC6/pcCJVodHcYuUHuyqSRWlviSWh2y69+rRyTCbvt8g3SA5qaTQ5LvOXKZsYi08BARS2QYtFnR
	Au9QBBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vMR-0000000DxqU-2cPE;
	Thu, 24 Apr 2025 12:07:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tSO-0000000DblZ-1STI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dIvPXdQKZDqfBdhJUUNkyfS3h78xf0CmbbJ5p0gZbuQ=; b=hasb/4sw7LmyLY4HU0iGqP2yVd
	TyoW53yqIN21buFvq0HesHjcCGBTB8GAww5teyjhCQ2QhIKGYqMRJYKnRU736Ch9ImrtRSG5YcpZe
	7MGRo9qubtTsMVK8U55X67bOxaNmzmZbnCSG9xllJ6Scj/YoeEz/C9yQ8x/qR480I2UfIGCq+87PC
	6TG9SHCWNtR6sBEPSeqiNBT3IH8WACaLqbN9NN/rvmssl+gv6qj1eWl4NzAdKzZrM1pFGQ2AdwbI0
	Z44NA32b+QB9PBplzplj9CViiryQ9bhlaVNBMaukDoCZ//sYB52uPiB4aifJoQxZ3hKAYHv8863vk
	K1GldL1A==;
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tSL-0000000BijN-21kq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:05:23 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9CCA2340DF9;
	Thu, 24 Apr 2025 10:05:18 +0000 (UTC)
Date: Thu, 24 Apr 2025 10:05:14 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424100514-GYA48784@gentoo>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
 <aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
 <20250424014120.0d66bd85@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424014120.0d66bd85@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_110521_781451_C5EA69CF 
X-CRM114-Status: GOOD (  19.19  )
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

Hi Andrew, Andre,

On 01:42 Thu 24 Apr     , Andre Przywara wrote:
> On Wed, 23 Apr 2025 18:58:37 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> Hi,
> 
> > > +&emac0 {
> > > +	phy-mode = "rgmii";  
> > 
> > Does the PCB have extra long clock lines in order to provide the
> > needed 2ns delay? I guess not, so this should be rgmii-id.
> 
> That's a good point, and it probably true.
> 
> > 
> > > +	phy-handle = <&ext_rgmii_phy>;
> > > +
> > > +	allwinner,tx-delay-ps = <300>;
> > > +	allwinner,rx-delay-ps = <400>;  
> > 
> > These are rather low delays, since the standard requires 2ns. Anyway,
> > once you change phy-mode, you probably don't need these.
> 
As I tested, drop these two properties making ethernet unable to work,
there might be some space to improve, but currently I'd leave it for now

> Those go on top of the main 2ns delay, I guess to accommodate some skew
> between the RX and TX lines, or to account for extra some PCB delay
> between clock and data? The vendor BSP kernels/DTs program those board
> specific values, so we have been following suit for a while, for the
> previous SoCs as well.
> I just tried, it also works with some variations of those values, but
> setting tx-delay to 0 stops communication.
> 
I'd not bother to try other combinations, and just stick to vendor's settings

thanks

-- 
Yixun Lan (dlan)

