Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF48C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 23:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PJe2ch6Ms9zAWsGh5fiiCAopiENydoBhMUp03HMdLo=; b=4ilynStsBo3krnFmLXVYbNXoBt
	MD0grlRRUQ1S7VR6eBbxjC+VeSSQcEBvNPqnebBs6SxJvgQ9CxHmhqFLXmGTFgWS0JFzeEvIaFpg/
	h9KBzlmyOSdCh5G9spgW74VebeNyNe0EM8/Pyd8DIWVCWE+LDPGLi2B9lyVVV3I4Xcgd1J2IPTacJ
	/l9Tmomk9DcPX8QHF4CXoKINYGIDSYECmoOLzG0cqPA6638CyB6XpbADscLB1YBg487lr9+Kew870
	KG0Wk8u5O6nC9O+LkS0BVX+drrIxQzEQMj0yLYpZi/muBJmw0mLyhWVMQAfv1mHYeOAZG9BcJmFNA
	dNW7FoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiN0-000000065yQ-0sbr;
	Sun, 04 May 2025 23:03:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiL5-000000065og-0u9l;
	Sun, 04 May 2025 23:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=5PJe2ch6Ms9zAWsGh5fiiCAopiENydoBhMUp03HMdLo=; b=Su
	QSMudDNeSIFw4mG21Xq7Nd7Y6OEN3p/4e540kK6Sfexrcf2dcqu3LUJ71vvB9RDKuZmxAWfwJR69/
	vAEjQDOGoaMvFx+g+/RzpEcBPS0no2ZY16Wuo3tdc2BZ/KoyANwn11ZM2UyGhL2XD47BfpHMeLNLo
	CktRoO4lWndTV5k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBiKt-00BYej-Pv; Mon, 05 May 2025 01:01:27 +0200
Date: Mon, 5 May 2025 01:01:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
	conor+dt@kernel.org, detlev.casanova@collabora.com,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_160139_291024_C6F25A79 
X-CRM114-Status: GOOD (  18.89  )
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

On Sun, May 04, 2025 at 05:02:33PM -0400, John Clark wrote:
> On 5/4/25 10:12 AM, Andrew Lunn wrote:
> > > > +&gmac0 {
> > > > +	clock_in_out = "output";
> > > > +	phy-handle = <&rgmii_phy0>;
> > > > +	phy-mode = "rgmii-rxid";
> > > 
> > > See Andrew's remark on v1 of this patch.
> > 
> > Hi John
> > 
> > If you have questions, please ask. It is not a good idea to silently
> > ignore reviewers comments. Either do something about it, ask
> > questions, or politely argue why the reviewer is wrong, because
> > sometimes we are.
> > 
> Hi Andrew,
> Thanks for your feedback and the link to the RGMII delays discussion. I
> assumed you suggested switching to phy-mode = "rgmii-id" from rgmii-rxid.
> The vendor’s downstream kernel uses rgmii-rxid with tx_delay = <0x20>, as
> shown in my post. I tried rgmii-id and removed tx_delay, but the interface
> failed to get a DHCP address. Reverting to rgmii-rxid with the delay
> restored functionality. Any advice on correctly configuring rgmii-id or
> adjusting delays for this board?

What PHY is it? Are you using the correct PHY driver for it, or
genphy?

rk3576-rock-4d.dts and rk3576-armsom-sige5.dts show that it is
possible to use this SoC with the correct 'rgmii-id', 

	Andrew

