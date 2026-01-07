Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC33D0D15D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLxJzEAuCES3geMqNvzFCMY6goF2EGqYqOkgiIUgsAU=; b=X1nYEP3rIVYfWxSqsZ2CgHNUtj
	FpEl+7sx7VwPZyMh00bLfwxCQOeJwTGvDcLellTko1L3XVpTLFqAfWPTuUE0F3u4wNZb8eUGTpKgG
	GeMhet6OfEVu2TSWW1ktatZ9rPgG7rK7tAN3tw1oasQkDQHtZOJf2Uqhy6OVCLu7GvYXqcC+XonjD
	nUOfyr8inm083/xKZdOIQXYZRagm4ix4ngAnafD23dTxCefDOQaKUFWemIeGtW78Ee1eorNSHnSDq
	wF/xlakxI1RgUeOD8kHdN/gqz1ArCrD/KvbUaX4InQ44XkSC02ZIJYWzoGIwZaGo2UfulgRdOziHj
	ohn4BcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY6w-0000000FTBW-3mhe;
	Wed, 07 Jan 2026 18:18:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY6u-0000000FTAo-2Qwi;
	Wed, 07 Jan 2026 18:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NLxJzEAuCES3geMqNvzFCMY6goF2EGqYqOkgiIUgsAU=; b=S6jwNDPK2SZ61UorwD/NvWswSi
	BxM8CrcEXgskDOl2oXdOG6EdiBXrBNAS9WcwjeiqLoJ2ZItdWcXZkpRsjYv8F7EjBVoZUvzSh5U3G
	pgGd8gCiCmWoapbpGZUsQBCSg67jXnq/KMey+NR3mPGF3oSv0zBiydCw1Z52G8KP5ees=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdY6V-001qIX-6H; Wed, 07 Jan 2026 19:17:55 +0100
Date: Wed, 7 Jan 2026 19:17:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>, John Clark <inindev@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>, Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
Message-ID: <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch>
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107070322.323-3-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_101820_618985_3FB693AA 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

> +&gmac0 {
> +	clock_in_out = "output";
> +	phy-mode = "rgmii-rxid";

rgmii-rxid is odd. Does the PCB really have an extra long TX clock
line, but a short RX clock line?

Try changing this to rgmii-id, and drop the tx_delay property.

	Andrew

