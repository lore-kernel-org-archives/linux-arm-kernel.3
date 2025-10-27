Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B403CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBZdXoT907f08SPItfQLZWprDtn11vqyK0a71q4BicE=; b=g0dQKpOhk1lQJz45lzzF/HE+KK
	HNEyDy0LU1GdV98NACReOWRMoX2QbToAyDC/SdD32OOjdB4zfusj5idwnHsK+N5oC0lPmR4D+bEY8
	hZ20M9D66giVwhh/ZuAZfgcishuEBx12VnGkGQclKMqJvD+Bxzlc9ajyT092w7uDfvvBWBtzhkuld
	3e0dij9LWKMLLPxQ5rkpuayGzw8dQafReUMuFzDWG+26Z+xniEekCIyckwDgK1RZ/YrFPM/ll8GmS
	Cimsgc+7QzTK/B1afrENuJcwIOWioNfTXgw+jYbKub8HJj6s3DshcHwE4bybI52BdrUOEyZPYMVGK
	js4erWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJwu-0000000DaaJ-08Xn;
	Mon, 27 Oct 2025 09:55:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJwr-0000000DaZs-3Imp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:55:35 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 57AE31661;
	Mon, 27 Oct 2025 10:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761558824;
	bh=8RzIiPz9xOCm407auoA7e2dNUBBDbF25UtoP0pWX+Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDLKMdYt1C/3C4fcJR8kOHsTcT3x9RdIFNrLPubQoDvb5jspOjsaXCyXDMkl9oYiF
	 Apy10haJGbrecedgzqXqZH2QCk+6E1oerm4n4vHSxUBkPnj0xobXjGOD5MOFa5NQVt
	 pQnS6YsUD9wfpyJWtR4/O4dQE9mODOUWaJwQSoQ4=
Date: Mon, 27 Oct 2025 11:55:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027095518.GD1544@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
 <20251027093346.GB1544@pendragon.ideasonboard.com>
 <aP8_UjqvCHbrP3lH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP8_UjqvCHbrP3lH@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_025533_968455_16357ADE 
X-CRM114-Status: GOOD (  22.96  )
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

On Mon, Oct 27, 2025 at 09:45:54AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 11:33:46AM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 27, 2025 at 09:07:32AM +0000, Russell King (Oracle) wrote:
> > > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > > devices produces an interrupts storm. Disable EEE support to fix it.
> > > 
> > > As this is the second problem that has been reported recently, please
> > > bisect the conversion of stmmac to phylink managed EEE support and see
> > > whether there is anything in that which is causing this.
> > 
> > Emanuele Ghidoli has bisected this to commit 2c81f3357136 ("net: stmmac:
> > convert to phylink PCS support"), as reported in [1]. I can test that
> > commit and the commit just before tonight.
> > 
> > [1] https://lore.kernel.org/all/341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com/
> 
> As you will notice in that thread, I have responded to it last week, so
> I am well aware of it. I am also well aware of the claims Emanuele made
> in his commit description are demonstrably false.
> 
> That's not to say the commit isn't a problem, but the explanation of
> why it's a problem doesn't make sense right now, and thus what needs to
> be done to fix it is unknown.
> 
> I don't think going around disabling EEE on individual platforms is the
> right approach.

I fully agree with you, seeing how eee-broken-1000t spread on many
i.MX8MP DT sources raised a red cargo-cult flag. I didn't have the
knowledge to properly diagnose and fix this myself, hence this patch,
hoping someone more knowledgeable than me could help. Based on the
replies received so far, it seems I was right to be hopeful :-)

I'll perform more tests tonight, printing the interrupt status values as
you requested in a separate e-mail.

-- 
Regards,

Laurent Pinchart

