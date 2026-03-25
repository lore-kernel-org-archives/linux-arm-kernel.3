Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DC8109C040
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N4WM+cmPpBaKwZWyDFo1qlxcYPuytvpbUHsAspj/Fw=; b=EHp1PV8bzDTtYjA4UbbPxvDtDb
	evFs9cTS0O0u694LtCRocCsTVF7bNGCy5r+F4t7oGBASWmXJ3uPbAN4oMUQiKSdwQBrzi2ii9yDUD
	taDCMcoBumNQ/nywa7Kzjxo5+bh1y/8r7Z3AFp4/wO4f8evnPkOo5vvpu9dXFBq4fUg1Em6nWooEx
	wxsCrra5X48kAcoGB+73TD0i/AlX8Uujp55ZxHGfvE3mwMX81KCn8/3qDuKLSjTPzru5+efDPgkHI
	ikwyTwovmQnCqB9fyQZZS5CWekMnEE3bb/PHBz2tCxknhblOWd+QErQdgf/dXMfbUqRMXkpSeOnOB
	3FefXNAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ScQ-000000042dD-30dQ;
	Wed, 25 Mar 2026 18:06:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ScN-000000042bi-2cUz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:06:13 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0B98F20202;
	Wed, 25 Mar 2026 19:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774461968;
	bh=4N4WM+cmPpBaKwZWyDFo1qlxcYPuytvpbUHsAspj/Fw=; h=From:To:Subject;
	b=gvaf1Xkmq4pXHVPZjj6KAFXDHN/fL0TeZTegQTWxY1b+5waPJE2O9hyyMIE0BDy+1
	 OrcP2dfTtNcosLeKdO4I7eCUMq/qYLMut8F2HlBbO3lkdCb8cWxY/EDTStoRYOBxAV
	 ppUtyOkxfDD9RTmN2PzjQtEvW6nwWjMK88v2Wb87MwR7er+TVtNUpc/Yib/uCS8WFt
	 a/ucL2qyzRRciW0bqeVzx3bAyM8RE1GAGxOyEZfZtBZIVtZ6eRbC2PB1JqVtvfJcXy
	 5tv0r5eVg7RGzYnoFJdzGD7sJ0EPmBJWJDAbab6ZFigKjiZN2Iv5tR4rO2eu5BQ9dA
	 474/tmhHHqNrA==
Date: Wed, 25 Mar 2026 19:06:04 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <20260325180604.GA2972@francesco-nb>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
 <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_110612_553992_2FA69DAA 
X-CRM114-Status: GOOD (  25.61  )
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

On Wed, Mar 25, 2026 at 10:50:57AM -0400, Frank Li wrote:
> On Wed, Mar 25, 2026 at 01:21:04PM +0100, Francesco Dolcini wrote:
> > On Tue, Mar 24, 2026 at 03:48:29PM -0400, Frank Li wrote:
> > > On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> > > > On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > > > > This patch series adds support for the Variscite DART-MX95 system on
> > > > > module and the Sonata carrier board.
> > > > >
> > > > > The series includes:
> > > > > - Device tree bindings documentation for both SOM and carrier board
> > > > > - SOM device tree with on-module peripherals
> > > > > - Sonata carrier board device tree with board-specific features
> > > > >
> > > > > The implementation follows the standard SOM + carrier board pattern
> > > > > where the SOM dtsi contains only peripherals mounted on the module,
> > > > > while carrier-specific interfaces are enabled in the board dts.
> > > > >
> > > > > v7:
> > > > > - Order nodes in symphony dts
> > > >
> > > > Can you run https://github.com/lznuaa/dt-format for new file to easy
> > > > track and check by script later.
> > >
> > > I applied with below change
> > > - update copywrite to 2026
> >
> > How do you know that the correct copyright year is 2026?
> > The copyright years does not change to today just because it is the year
> > it was submitted.
> 
> At least it should include 2026 because it is new files in kernel
> tree.

The copyright year is not changing nor being updated just because you
are adding the file to the linux kernel tree.

Francesco



