Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC2F106B510
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLOm9XjuNpTv3crP433snW9Y0q8ywlGOwYlifFWD9Ic=; b=hQUdoDxUptBAOV2c/YLLCAouzG
	t87WvYUf5XwY7+03NLOZTV0NdJI+1MYv4n0v0ooyl1eAHrZM4uAQzh065SUhL+RNvPieplcnEZrOd
	mOf1LiIpbanaTGDRE/Z+7x7XAm3b5zfdi3iTU2Ki8eLjD3WlSnIh6yQ9bn37jAo4gCRO9LitJ6f5T
	ZwpR8xlxQYcN9DcqlI8vdni3VDy7Y5qe0pncJGvRe7Jl25idp56n5RTIz0y+EdphG9DKRXt3yv8vR
	BHiUGxzmL+27I8/zCczj64NbrkZN68wJ39QkrUNJcS/HWtk73RSpBvi4M3jWxj5WDPWkxmy60Z4gi
	9lAYARLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NEZ-00000003MgO-4AU4;
	Wed, 25 Mar 2026 12:21:15 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NEX-00000003Mg3-2ChM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:21:14 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 148B01FC3D;
	Wed, 25 Mar 2026 13:21:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774441271;
	bh=PLOm9XjuNpTv3crP433snW9Y0q8ywlGOwYlifFWD9Ic=; h=From:To:Subject;
	b=JAU0gmmPMd1iVqtE16jH7H7pDG2riyi1NUZlA/MxZ12t+WjaNP1dMxqSShWUHGkIV
	 Xzf+zvn83Qp/1T5tk370e1X7QyfyIxFKXqc5wHCzJKZS/an56mZ6vUO9pQiI9s0i4i
	 IqSgEJtDtP4EdCKn/hISN0aIShN70LRhl/utqg4QYUgpWYMs4evzd17/evnV7jE+Ag
	 1vX++PbpqmN6QkeW3OeZkZ/vshzTpLcoY/mdVkaWTFVzyhxpGlm39d1un80Qj8BOyb
	 VKKXfOH5gpbFe09WcN9hdsUR31159AxcBI1rCIJ7sXBF/h00n8xPSDlBsCW+Y0SvAz
	 aD2lAmBjVYleQ==
Date: Wed, 25 Mar 2026 13:21:04 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
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
Message-ID: <20260325122104.GA19112@francesco-nb>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_052113_742816_4AF248B2 
X-CRM114-Status: GOOD (  20.37  )
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

On Tue, Mar 24, 2026 at 03:48:29PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> > On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > > This patch series adds support for the Variscite DART-MX95 system on
> > > module and the Sonata carrier board.
> > >
> > > The series includes:
> > > - Device tree bindings documentation for both SOM and carrier board
> > > - SOM device tree with on-module peripherals
> > > - Sonata carrier board device tree with board-specific features
> > >
> > > The implementation follows the standard SOM + carrier board pattern
> > > where the SOM dtsi contains only peripherals mounted on the module,
> > > while carrier-specific interfaces are enabled in the board dts.
> > >
> > > v7:
> > > - Order nodes in symphony dts
> >
> > Can you run https://github.com/lznuaa/dt-format for new file to easy
> > track and check by script later.
> 
> I applied with below change
> - update copywrite to 2026

How do you know that the correct copyright year is 2026?
The copyright years does not change to today just because it is the year
it was submitted.

I think that you should refrain yourself for doing these kind of changes
to the code when you apply patches.

Thanks
Francesco



