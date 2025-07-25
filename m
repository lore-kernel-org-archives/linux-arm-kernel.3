Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1CBC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmt5nuNio/LewifnBtDmnf6URUfC7IpoRiUfddBYCRA=; b=wCMzv2XfeBgb+pX3IT28uy56Fq
	s1Orp8L2cIEYZmPHjrG8asXh411WvjGRI80aigCm56bBvXrQoohKtkJdDbG8eg6oj+P4yupG4ic5d
	xvU/aGhuBUPNrR/RczsULP9dLzg5EGJPwq1G49W3PI30DHneIrGdBKfMqtdssSca9CgcQz3Nk40xd
	OtCYtHdPRSY63GuR+/CKvRH6tLIZXSetViMgNpdUqPCyvywmspNkj1WMlj8ELjG7AgoKoawFdXN5M
	oG1d1gqzHeorN0lmUXzVPWUAX+CmxPLsAwKsNNO/AdEW7ct/HcfSZwZBaOf5D6z4Ap4GxnfI1E7Ur
	erw7mJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOZZ-0000000AbUO-3M1a;
	Fri, 25 Jul 2025 19:59:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOSH-0000000Aafy-03HO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 19:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52C43A56606;
	Fri, 25 Jul 2025 19:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BEC4CEE7;
	Fri, 25 Jul 2025 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473103;
	bh=HIFZCasQnvflawLHEinivIZ7CGoYHgz1TfOYSlsci5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7IReT1m8egDm2RiZG6IZs9XJkWSVWWEaWM2T9QRwgauUdX2AFDzeVRji+7xYvf7w
	 2q5Iq3z3/d+RbsVRQ2TymUaZsf7afz1W1pHCg6neFeqOeAH092Rfhqb0RwuYUv7/pA
	 2sUaBr7obPmpG9Dd+eD7eFRQnZXyNO/znE8rgPc/yqfp/pRLxTXZbhso5dJxsmagpv
	 TEojpnKd1CEmpaXLYT1n7FyiMD7faZq0Mif46V7ZOTZe5uPTjHDb2XJEnNM0sbPn1w
	 2KIQ1Ox/iZbrveQ7eeXIjyiu0LwcAfEAOsUWt8NOXvbsJPC5FW7GzEYVn6MTJJP2R/
	 lSDhPTaQdiSJQ==
Date: Fri, 25 Jul 2025 14:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <20250725195143.GA1735522-robh@kernel.org>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
 <175345006903.1002291.4212198267952446360.robh@kernel.org>
 <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_125145_118258_07662E89 
X-CRM114-Status: GOOD (  12.88  )
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

On Fri, Jul 25, 2025 at 04:06:45PM +0200, Maud Spierings wrote:
> 
> 
> On 7/25/25 15:27, Rob Herring (Arm) wrote:
> > 
> > On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with intgrated boost controller.
> > > 
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > > ---
> > >   .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  5 ++
> > >   2 files changed, 83 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> 
> Pretty sure I did that, but I've never gotten those tools to work quite
> right, I'll look at it for v2

What's the issue?

Rob

