Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF9C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxitm8n7F29DifZwUQzj7gNr+yPEqpgmZn1ppHGtpbk=; b=v4dWF6SO9wXZO5BYdr3sPjdWU0
	MWpYvOxs834c6s/O1spm9ikXnDAio+oJg4ow1oKaMHq4f56mrF1evQVHq9/+lmxQs1nyfKAubD0Be
	JT02J0hJ6q+Lzt+TKAAOw2mmIWPj9dRll+RLPIytyei/GNvvDkIvDfvKFwHX3MvjTomI+WIcOTmB3
	l2WnJORMZFGAuDLckm4HUYz3SzmPcCTWIHaqdsWzG/OhHIxCgc2bKSTrQSpvYkAFm2AviQAgsToWB
	XGLDT8NdbAL7hmIka48DtBMKJDh+THuI1QwoRmmvVaswZ5VKTtnPfpO5KENk5EqgGmGmzc1FLR/5Y
	+aaCmRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikbq-00000006KtW-0Fi6;
	Thu, 22 Jan 2026 02:39:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikbn-00000006Ksj-30g2;
	Thu, 22 Jan 2026 02:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rxitm8n7F29DifZwUQzj7gNr+yPEqpgmZn1ppHGtpbk=; b=3BtsDdP4E9nfirUm02GGHVDQt4
	7yGO1G/HoirThUsiWq8UGJ7P1cU2lCcrJVq48RV2+DdzRu/zYPOARWsn0x5AAsLt2TSM19d3qA/cg
	xrx4J68dgh+qNshT277mxchcUfeU0HTPrCtl2bcObOQHwwfqiNu25SzrJfLP7244JMqs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vikbN-003uAS-MA; Thu, 22 Jan 2026 03:39:17 +0100
Date: Thu, 22 Jan 2026 03:39:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>, Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
Message-ID: <b61182f9-36ca-40c6-aaf7-ae7d21698285@lunn.ch>
References: <20260121015357.291-1-kernel@airkyi.com>
 <20260121015357.291-3-kernel@airkyi.com>
 <aec69818-9fd0-4e50-bab9-f5e36304a4a2@lunn.ch>
 <305c6ceb-2b4d-496a-95c1-e6a0454347a5@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <305c6ceb-2b4d-496a-95c1-e6a0454347a5@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_183943_757887_744FC4D0 
X-CRM114-Status: GOOD (  15.69  )
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

On Thu, Jan 22, 2026 at 09:41:19AM +0800, Chaoyi Chen wrote:
> Hi Andrew,
> 
> On 1/21/2026 9:15 PM, Andrew Lunn wrote:
> >> +&mdio0 {
> >> +	rgmii_phy0: ethernet-phy@1 {
> >> +		compatible = "ethernet-phy-ieee802.3-c22";
> >> +		reg = <0x1>;
> >> +		pinctrl-names = "default";
> >> +		pinctrl-0 = <&rgmii_phy0_rst>;
> >> +		reset-assert-us = <20000>;
> >> +		reset-deassert-us = <100000>;
> >> +		reset-gpios = <&gpio3 RK_PD3 GPIO_ACTIVE_LOW>;
> >> +		tx-internal-delay-ps = <1900>;
> > 
> > What PHY is this? Does it actually implement this property?
> > 
> > It is also close to the 2000ps default. Have you put the board in an
> > environment chamber and run tests at -20C to +70C to see if it will
> > work with the default 2000ps?
> >
> 
> It is MotorComm yt8xxx PHY. I chose 1950 here because I find that
> the MotorComm PHY binding only offer the options of 1950 or 2100. 

Without the property it should default to something near to 2000. Most
MAC/PHY pairs should work without this property, if the board is
designed correctly. So i suggest you only have a tx-internal-delay-ps
if it is required.

   Andrew

