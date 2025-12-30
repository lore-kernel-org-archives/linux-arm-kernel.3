Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05B2E95A71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aateUwJAsBS5ebefM0Zc7Bz+yjeqfX9VuoGySIleu9E=; b=zh+7pXPkXhBj3ssw/3oGZfNcD2
	JeM4COIs74zCzmqMERg3qXvTW31WChG9QfqIN+6cki0ksiCUFlqMeg2iYDj8ZfuszEJI3P8kgPZbO
	/hOZjC9/7f1dTylqnqmEQJq3idMw5qDpvciiUlem3Cc3Sb5cKQSaItcp2lrXUo91ZGm5QIb3q/BVm
	k3nIqreMknBOqZEoxFCd6iqfCZ3AuVuUhPrfjQ8nD8m67LO/DTObOHM0pCCNv5xnJJ8ooP1P/4XoL
	viFXhylCxkl2BBNUSNpQsjViX46mri++GNeJHXwE2H05EbA3BXmiGSfX1XeFlqFZJYUV4dfahUiRN
	+Q5t3E0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXFb-00000004jFi-3ioe;
	Tue, 30 Dec 2025 10:46:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXFQ-00000004jER-0pjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 10:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aateUwJAsBS5ebefM0Zc7Bz+yjeqfX9VuoGySIleu9E=; b=PZTl4DwF3xaHNqfimFBTn4RXBA
	DkT3T/aWBGIF1MgWAaP11qTxSOxD0I0+IQRzQKSUSwWJL+lfdJHbhp4FSPoa/kW19siILDLIP2W/2
	pFve28IcEjalh5z3HMTU7ZyJa2/qV9V4swmuu/Ydy7Stw5Y8+56nU8Ab48r4pJLvQ+NE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaXFJ-000raV-5k; Tue, 30 Dec 2025 11:46:33 +0100
Date: Tue, 30 Dec 2025 11:46:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1
 and v2
Message-ID: <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229193706.73564-4-marex@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_024646_000411_1188B7A8 
X-CRM114-Status: UNSURE (   7.49  )
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

> +&fec1 {
> +	fsl,magic-packet;

Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.

WoL for a port connected to a switch? Have you tested this? Normally
you would have WoL on each port of the switch, and not on the conduit
interface.

> +&fec1 {
> +	fsl,magic-packet;

Have you tested WoL?

> +&fec1 {
> +	fsl,magic-packet;

WoL again?

	Andrew

