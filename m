Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E56CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv72l0hD8jDyK3VWKJExO+bl1rbU9EYOwEy7E6rmeXM=; b=VTTgC7aLYZ7FSlfsYJI7grsEXd
	kIKRwceh6my9j4i93NGyeDpn/XosiCEXB5tdZ7gt8nkguSDMy2mILBysXEzES7D5rFtm59yiLeFQI
	BRb5QVOx9jd6KYCR9+TlSPyKBNLAfUwSyr7gti+kRXAIN17g/EzcRLtPff5v2O9YkWzoFf9hDOXH0
	CW351MWRQFTEGb8yl7FYsg/kZTEgN1GZd3/9+l4azpEERNVUFjFCv3ddxalQ9bl9PGZDk4VFf3n7g
	EN24E4ephJHNads9N9B++dYcKmi8UvHyPgpw2EMXPrrf3d4vm50CoCH9hYkU94HRtju9gIQhMINNW
	Y6m6S7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvhX-0000000DEkU-3xGG;
	Sat, 03 Oct 2026 09:06:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvhW-0000000DEkL-2J9z;
	Sat, 03 Oct 2026 09:06:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54CEE602C2;
	Sat,  3 Oct 2026 09:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CA61F008A0;
	Sat,  3 Oct 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791018397;
	bh=Wv72l0hD8jDyK3VWKJExO+bl1rbU9EYOwEy7E6rmeXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZBGCzPG19VqMPJ/xEM8Kkge9Bg0ygZJ3inmdOrgAgzhyOYWy6+jmxQqIPUE0f5o+I
	 p8BF3hziXT/Z0Y7NjBWfY6ArV8LakvLRQp9yR1vkbBYn+1XXqIur1qqKL2Ohkr3+u9
	 7STomURNJ5izwpHrRPZ06G1UCC9UMpsUxY93RArxjW0RY/QpFba+MtYC5n1XQc//rb
	 bV6dPQAEzoCucmBCNcGAcvjyk/HU+RrU0MkBwALYpwVaaCwZeJvysAA7XuGkwlxds2
	 tBaQzRuHZPjIXOyOmxj8f6J7D8FFVZmyd+r4QgrdYiPYnjwy+YNnfYbWVbis9Rvx+T
	 ZcO5L5KR192GQ==
Date: Sat, 3 Oct 2026 11:06:33 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Frank Li <Frank.Li@nxp.com>, Christoph Stoidner <c.stoidner@phytec.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
	Aswath Govindraju <a-govindraju@ti.com>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Mailhol <mailhol@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: (subset) [PATCH V5 0/4] arm64: dts: freescale: Add chargebyte
 Charge Control Y
Message-ID: <asDFmf_G0v_MWY3k@parshuram>
References: <20260907150420.18787-1-wahrenst@gmx.net>
 <179016749941.155868.1810345055482953110.b4-ty@kernel.org>
 <72033c48-5219-4ed4-94fd-1b7d8ef8017c@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72033c48-5219-4ed4-94fd-1b7d8ef8017c@gmx.net>
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

On 23-09-26, 18:11, Stefan Wahren wrote:
> Hi Vinod,
> 
> Am 23.09.26 um 14:44 schrieb Vinod Koul:
> > On Mon, 07 Sep 2026 17:04:16 +0200, Stefan Wahren wrote:
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
> > > [...]
> > Applied, thanks!
> > 
> > [1/4] dt-bindings: phy: ti,tcan104x-can: Fix property constrains
> >        commit: c7f2322431cb6d108b18fb4154606b49e2bc50f7
> thanks, but what about
> 
> [3/4] dt-bindings: phy: ti,tcan104x-can: Document Microchip MCP2542

Not sure why I missed this, I have picked it now

-- 
~Vinod

