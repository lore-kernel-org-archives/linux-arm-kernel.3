Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E1C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmefoQc4jPjF+J0TGd7A2/RbBqOLDCX0rbqb1Fx0Osg=; b=kRtYl+OFUUWGeDr7/NIDC3T64I
	k2vqYNbwCkXiZhm94vEmEpfUaNE5Ip/A4SCAY9Zvp7u6Qbxk7VHgqlxL+3KJISd0K5L86ISaesswC
	EVHsRWQ3+4K5FRCO0/1TqK1Nz//go9TAbE3hmSRPalZNAqlVrmcDbbLyq8eWtUOh5KB4Qcq8USxOX
	TWeGtGEMA5Uqqjijqv1N9JbJXW11Rc7X75jA41I+XPoY9oB3HK1cXy8+dde89aJypfTFOSjoPVMcL
	0kok0TeoZTA6Pa5OVsXYt7BdIqgWU0twuw7j3OM9ChSWmRUAGtXmMtsg0sK0IL22fTSrEiDS58803
	JlhXSZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MLr-00000008HwC-2AX7;
	Wed, 23 Sep 2026 12:45:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MLq-00000008Hvz-1jsg;
	Wed, 23 Sep 2026 12:45:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADB28601FB;
	Wed, 23 Sep 2026 12:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C161F000FF;
	Wed, 23 Sep 2026 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790167529;
	bh=EmefoQc4jPjF+J0TGd7A2/RbBqOLDCX0rbqb1Fx0Osg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U8NAhJ7wizrCzNw6S0+XjZ1LdYSxSz93GWHotpuZo7QUlcz6vhwmTjfSEiG5Uqeqn
	 zFaQALfsTmT5mf4AwYG5kgzRKHOsWc23QV/Ro9KjCsUN/dN4YNr8j5l457yvNOf9li
	 qpEI7Ocq9DL7NisThDaoRbYRVhYmYVimGeaG/vxCBQQuL+gERUmRZ6ur5+Xw/CX4Td
	 9plBepGYn8qKYsIhKwJGZuAJBLceN7NcrjbiSxl9EoKRow/ojrlyzZTY0n4MuS1cmU
	 lJ9UXUcwVAvCr+zBR82RGBkfQVVqH86sJX/TdkuLyWIsPvc8lc6oQWVHcE2OaeYwvi
	 CjKXwYJHikDVA==
Date: Wed, 23 Sep 2026 18:15:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Frank Li <Frank.Li@nxp.com>,
	Christoph Stoidner <c.stoidner@phytec.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>, Vincent Mailhol <mailhol@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>
Subject: Re: [PATCH V5 0/4] arm64: dts: freescale: Add chargebyte Charge
 Control Y
Message-ID: <arPJ5TUZEeb2SAV3@parshuram>
References: <20260907150420.18787-1-wahrenst@gmx.net>
 <9cb548d3-f3cf-4757-a9ff-5f878479c7d7@gmx.net>
 <arFDUby0v52HSNnU@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFDUby0v52HSNnU@SMW015318>
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

On 21-09-26, 09:46, Frank Li wrote:
> On Mon, Sep 21, 2026 at 03:09:23PM +0200, Stefan Wahren wrote:
> > Hi Frank,
> >
> > Am 07.09.26 um 17:04 schrieb Stefan Wahren:
> > > This series adds support for the chargebyte Charge Control Y, which is
> > > an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
> > > Charging System) charging stations.
> > >
> > > sashiko reported in the first version of the series [1] that X_nRST_LAN
> > > is available via GPIO line names, but there is no reset mechanismn in the
> > > device tree. This finding is valid. Since the reset line feature isn't
> > > implemented for LAN8651 driver yet, I like to proceed with the current
> > > version. The LAN8651 handles reset via SPI commands and in rare cases
> > > we still have the possibility to control the reset from userspace.
> > > Btw the pin has a pull resistor in hardware, so it's not floating.
> > >
> > > sashiko complained in the fourth version of the series [2] about the
> > > reset polarity of ethphy2 and the different drive strength across the
> > > data lines. Both is intended.
> > >
> > > [1] - https://lore.kernel.org/linux-devicetree/20260818093147.E556C1F000E9@smtp.kernel.org/
> > > [2] - https://lore.kernel.org/linux-devicetree/20260903082122.A777C1F000E9@smtp.kernel.org/
> > >
> > > Changes in V5:
> > > - fix delete-node for pinctrl_leds (reported by sashiko)
> > > - add Krzysztof's Reviewed-by
> > I didn't received any feedback for V5 yet. Do you have any comments or could
> > it be merged?
> 
> Wait for vinod pick phy binding part.

Done now

-- 
~Vinod

