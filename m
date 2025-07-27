Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6F1C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9NhXYJcH+yY6nJX1iUsIHJhpbBG7niwyYpMLRWPFrc=; b=G4CM5/A0l/A0PKDMYvWYXzP4PZ
	QoxxHyHcTVb9zB116k+87hcAiNI7MYTePUtxJOGnR19vmAC6A4a9hBdt5WgWm25n55oLFA6uUPXi2
	u3iu/ly4uz/3Z5jsQzVDRSS9+7P/Xj0Nv4x3kiC5QnfIDwb29C7YFmNOMfC6xKWmt3bQrdeg6OSXo
	CYuZFOyNsQ1uXb8IaB5ijd8OZ9OMf6twCALXHI878ptmnL38LzqvdHykEEa1MSBw8fP+3LdXrA/t9
	UXWMk9k79cMP7jhHiFBYQM0ew9WUkaS9Oi61kTpGykTIRId2WbiIPwRxGqUb2Ob/biyhEDZxZBEiN
	WcCDaQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6tV-0000000D8kq-0rHF;
	Sun, 27 Jul 2025 19:18:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6qx-0000000D8ZO-1kJY;
	Sun, 27 Jul 2025 19:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w9NhXYJcH+yY6nJX1iUsIHJhpbBG7niwyYpMLRWPFrc=; b=eLSaEq0Jrz4esE4zAy9u21ruJf
	oXLyBz8ySedtBGAgdrfqENddXD4olmduDyjzQayWmSB4r/9pQYvNR0Xq2e4wXesnqM3m/uvArkiGL
	EFnKEtlSRCfOGwxJ/gTK+7RLEvrxOFWhWCLq4iCBTEDtg4G/VWxyzX941K/Dxzl9b8zg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ug6qn-0031Oc-2o; Sun, 27 Jul 2025 21:16:01 +0200
Date: Sun, 27 Jul 2025 21:16:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
Message-ID: <be508398-9188-4713-800a-4d2cd630d247@lunn.ch>
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727180305.381483-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_121611_462228_FEB7C80F 
X-CRM114-Status: GOOD (  18.01  )
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

On Sun, Jul 27, 2025 at 06:03:00PM +0000, Jonas Karlman wrote:
> The Radxa E24C has a Realtek RTL8367RB-VB switch with four usable ports
> and is connected using a fixed-link to GMAC1 on the RK3528 SoC.
> 
> Add an ethernet-switch node to describe the RTL8367RB-VB switch.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Initial testing with iperf3 showed ~930-940 Mbits/sec in one direction
> and only around ~1-2 Mbits/sec in the other direction.
> 
> The RK3528 hardware design guide recommends that timing between TXCLK
> and data is controlled by MAC, and timing between RXCLK and data is
> controlled by PHY.
> 
> Any mix of MAC (rx/tx delay) and switch (rx/tx internal delay) did not
> seem to resolve this speed issue, however dropping snps,tso seems to fix
> that issue.

It could well be that the Synopsis TSO code does not understand the
DSA headers. When it takes a big block to TCP data and segments it,
you need to have the DSA header on each segment. If it does not do
that, only the first segment has the DSA header, the switch is going
to be dropping all the other segments, causes TCP to do a lot of
retries.

> Unsure what is best here, should MAC or switch add the delays?

It should not matter. 2ns is 2ns...

	Andrew

