Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F699C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 02:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1ICQTT0Rg5TH6VqXWjJIx5h6SXfLiF2uQPFAA/zAgM=; b=G5JlC2Z2y6vaSShtiQuWMxZKJp
	DwKeZjRY/EzPhqjioE9sH4qWJuPpHg/sqgdvyc5mHgbr9H+JvH2m+KAvbMtVmdqB1PBgrEKpF3Vl8
	OnRp5vsJH2bZwkz5Wg75mquwrZhjxPH35FNFLzLFIsLTpgCL/24FGhgtB85gSrzK1GH7x1V5tn2on
	G4q2hFBSj+ehlrgvoDtf1BI+ixO4bWHhMXIYADeIckK0qrfqA7ZYfFp8CnHQNh2xsDO7dnymhFGLM
	ZOdlHg4gmlSliN/Gamwi28SZB3fxdpLO8rM6yIStSUuegu3MBr+qv07uhjDxJOg10NExO2aF3mXJA
	brKOi8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLueL-00000006W1u-3NaH;
	Mon, 02 Jun 2025 02:11:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLucD-00000006Vx1-29oD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 02:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=d1ICQTT0Rg5TH6VqXWjJIx5h6SXfLiF2uQPFAA/zAgM=; b=uS
	z9ekKVA1+8dCedTF/EeSwI2lQx7MPHqdYeB0SO68ckLK9NFGwbh4CISZ2FuLJoXu7Zj2IH1BvIv70
	3D4WZzR7ovjqTenu3t1Cvo7+Slb/Ho6/acontFtxtmhm327klwlQ2mSMG3k9mrutK1LP9YnXRA7c2
	nk1F6b4/n54tpzE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uLubr-00ETbT-6u; Mon, 02 Jun 2025 04:09:07 +0200
Date: Mon, 2 Jun 2025 04:09:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_190929_555157_682285AB 
X-CRM114-Status: GOOD (  18.79  )
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

On Fri, May 30, 2025 at 01:40:38PM +0000, Christoph Stoidner wrote:
> 
> 
> On Mi, 2025-05-28 at 21:29 +0200, Andrew Lunn wrote:
> > > Yes, that's what I measured. For analysis, I added some
> > > debug outputs
> > > to
> > > the phy reset and the 1st phy register access. And as I can see,
> > > the
> > > phy register access happens when userland sets up the network:
> > 
> > Please repeat the measurements with NFS root.
> > 
> > You will find that the kernel brings the interface up right have
> > register_netdev() is called, and starts transmitting. It can happen
> > before register_netdev() even returns.
> 
> Thanks for that hint. As you said, with nfs root the register access
> happens much earlier. I measured:
> 
>        [   1.713185] DEB-PHY: mdio reset exeucted
>        ...
>        ...
>        ...
>        [   2.672892] DEB-PHY: register access
> 
> However, the delta time of 0.959707s (9597ms) still meets the T2
> ("prior to MDC preamble for register access") that is defined in the
> PHY's datasheet with 2ms.

I agree it is long enough, but i'm also surprised how slow the kernel
was. Are you using a fixed IP address, or dhcp?

	Andrew

