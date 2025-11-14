Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6EDCE8D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ck6SOmONUUBFapcwaTAajZaO0W9Pz5IV9Dw+0dnbis=; b=28ugVlhGL/H1U8egTIgLMqd3ZP
	1w+Z62SdGwyzx4Y7mxmgd0nG6n3E7onJ0WDY9HVCTxzXX5snXikGzZraSsI/ebbmOCH6yRCmL/2IU
	xiLXD6uA/KD1mn6F4k4KfoWI/7QRLmsgt+Hy/7aKMAheZkL26/8Jt9NMrO+tycnDKZgmvjf6FLEdR
	fdMzRnZl0eKTKLwXOsurEjB9MKAOxE+9OaHPMHESPGaiNsE8C55jqBd3mrSYkzgMvkhZWTbsa7Cgx
	vxy7EfBAUVj8xf6HrVqj+P00sa3jpxWPfKLqjxPqqpQkBXftyIc8uMEoLWyoYsLxrE8kpxX9iaih1
	y6DY8Frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxlX-0000000CrTE-0xbW;
	Fri, 14 Nov 2025 17:39:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxlV-0000000CrSo-26Sx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6Ck6SOmONUUBFapcwaTAajZaO0W9Pz5IV9Dw+0dnbis=; b=4kpHF5tYp2Yz6vjrWw3CUwrXXh
	l8dl4e4oNdfuSFYI3a9N/QON/D4BNgazftXzA980LfiWzTzWj6UouLxL25prrHnradLIQ/H6sD/tU
	MJmUMRGukz9tVd1T79/2VyjYGixXBJpnmKrIjPbr7PRr+aL8yrboMKZjninYXpB5HBvE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJxlH-00E0Yl-B0; Fri, 14 Nov 2025 18:39:03 +0100
Date: Fri, 14 Nov 2025 18:39:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <1b39ba56-e38c-4661-9973-b56fdaa1bcae@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
 <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <9bcd63d2-f75f-4cb6-a81f-eefc983a99bb@lunn.ch>
 <PAXPR04MB91854DD6096AD550074FA16189CCA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91854DD6096AD550074FA16189CCA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_093917_578958_973729EA 
X-CRM114-Status: GOOD (  15.82  )
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

On Wed, Nov 12, 2025 at 04:31:52PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Wednesday, November 12, 2025 7:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
> > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Bartosz
> > Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
> > 
> > Since this has not been merged yet, there are no existing systems.
> > 
> 
> In this context, "system" refers to both Linux and the remote firmware. The remote firmware 
> for i.MX platforms has already been released and widely used by our customers. Maintaining 
> compatibility with the existing firmware would provide a better solution for customers.

From what i understand, this is not just GPIO. There is also I2C? And
RTC? I would expect a generic implementation of these as well? I find
it unlikely you can persuade all these subsystem Maintainers to accept
your protocols as is. You need to make changes so that GPIOs
interrupts work correctly, so i would just accept you need to change
the firmware. And i've given you a way you can keep backwards
compatible to your out of tree driver...

	  Andrew

