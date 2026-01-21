Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC52C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7ghTfnkGlMABgB6b39pbrc4sBL1ZVp7IHCaNMdWFww=; b=D07y7WLiJAmPdu+HPjl2U4Nzpl
	6226QnWm0RVuDTyv+4le4I0cElkYMNcRRvP88C+UURuaOZMWEJv7MLKp5v3ZMgQVKUqLPKBQd8YoI
	QShYAhm9LFqbraAQG70TEjVY+mnMpjYX/VY2gooyiSwEAYSLdh0Dy6H2X7lP+YbSttZeUypdohaxg
	sdMaC80IYnNJOEvfuSOkbALTbRtZTNuLJU12TRUlwwFVc+pjAgWXYUf5DzaoEDP9Ouwooo49drjIR
	5LyRIIusgnmDZoJAMgsRI96jGIc7igNlM/lqcqoeJMws3sxTjlhdPpVyGpnEoB8X8eTVqbXj6IJfO
	oLpeONKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXm7-00000005SsV-1xpH;
	Wed, 21 Jan 2026 12:57:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXm4-00000005Srk-3HsM;
	Wed, 21 Jan 2026 12:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=b7ghTfnkGlMABgB6b39pbrc4sBL1ZVp7IHCaNMdWFww=; b=iFVf/pZiPKFKH1RjII4ZTl2l9y
	6XgHI1657zr28jOqp4azg5wqRjGA1XekJ0r46jLQCx2IqhnfHGqIyHY2G6oRLzXDp9h7zY9zQ3uqq
	9JZ6IPipBWrq7JMhjepyho9QqC34jtHka+ALzQbLLrIevdjKCQJX+NX+e5x15IQM74r0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viXlv-003ooy-C2; Wed, 21 Jan 2026 13:57:19 +0100
Date: Wed, 21 Jan 2026 13:57:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 board
Message-ID: <b25d6eb2-e105-4060-86fa-c1a06396ca92@lunn.ch>
References: <20260121031548.402-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121031548.402-1-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_045728_818564_DE9B0AF0 
X-CRM114-Status: GOOD (  12.13  )
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

On Wed, Jan 21, 2026 at 11:15:45AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> According to the description in the net documentation, PHY modes
> "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
> to be delayed on the PCB.
> 
> The Rockchip platform has long used the above mentioned PHY modes and
> private delay prop to describe the internal IO delay settings of the
> chip, which is inconsistent with what is described in the documentation.
> 
> Some background, for RK3576, you can assume that:
> 
>         tx_delay_time(ns) = 0.0579 * delay_line_count + 0.105

Where did this formula come from? Is it in the datasheet.

      Andrew

