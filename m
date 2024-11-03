Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB4EE67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 08:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jADZZ7en+gydtucAasF5Pal9zTL96eGVMOGaLqmJrXk=; b=CBWo3vrmeuqWPqRiRBBOl/l9RE
	iqFQVn0NTCiaR8eGXEo99Kqu/cxSvWmHkxPdqKLWQcAHd7K+iztfkfZf6D1CrGOR5PvyDLX+FTeSI
	x4dBgkRxaopfkoEUjkrD1yWhSIxI3ziqxeM69ajZRVXfViWC188lQPOu5OlOo4a8n76RYJmXCtD+g
	f6w9mPguY7dISmVzFjAGBnEH+xFg5tl0QBz1FOcSD795iZFSbqGNVE182OGzn7drQKp96ZcdBywgF
	XgIqUtFM6ni+Cx2p0L1Qjzz43itcSHnf8lVbSoxfemDdJCYmLNUmTLpW2ItBXAYT9bgFD0+od8nQl
	IDcBjj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7WR9-0000000BC5h-1SfH;
	Sun, 03 Nov 2024 08:58:19 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7WPS-0000000BBvo-2BVI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 08:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jADZZ7en+gydtucAasF5Pal9zTL96eGVMOGaLqmJrXk=;
	b=KMRjrisjTVC3p4foZE3GdlDsBF9C5IIHpxOGOmELcDe5Mz7p7aKybJbsrJlNPM
	k0NmYgb3/lYaNPEypitE3i2m/qp+2zmh6VOJRfcq/HwPls9KKR56jx594IOcqx+U
	28ITKauXX6tnDnmlpvbVOaESdu2DYdKzCFntxRkseEV4s=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXHyKmOidnFxOXAQ--.16305S3;
	Sun, 03 Nov 2024 16:56:08 +0800 (CST)
Date: Sun, 3 Nov 2024 16:56:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-verdin: add single-master
 property to all i2c nodes
Message-ID: <Zyc6pVCVLW+s4Bi9@dragon>
References: <20241025095915.22313-1-eichest@gmail.com>
 <20241025095915.22313-2-eichest@gmail.com>
 <ZyWv+BVp91xYr4UZ@dragon>
 <ZyY33Ai6xndqTHzi@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyY33Ai6xndqTHzi@eichest-laptop>
X-CM-TRANSID: Ms8vCgBXHyKmOidnFxOXAQ--.16305S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWkCry3Cr1rGFWktFWUurg_yoW8Cr4Upa
	10kF1UJrn5Wr43CrZFqw1xZF9I9a1rJr4kurW5KryxK3WYyFyYqF40kws3Wr4jvr4xWa1S
	yF15Zr1Skw15ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBMKZUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgCMZWcnHxgt4gAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_015634_942430_50F35B78 
X-CRM114-Status: GOOD (  20.07  )
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

On Sat, Nov 02, 2024 at 03:31:56PM +0100, Stefan Eichenberger wrote:
> Hi Shawn,
> 
> On Sat, Nov 02, 2024 at 12:52:08PM +0800, Shawn Guo wrote:
> > On Fri, Oct 25, 2024 at 11:58:02AM +0200, Stefan Eichenberger wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > 
> > > By default we expect all i2c nodes to be single-master, we do not have
> > > any module or carrier board that uses multi-master mode on any i2c
> > > controller. With this property set, we benefit from optimisations made
> > > exclusively for single-masters.
> > > 
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > index 5fa3959141911..95d5d2333ca1e 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > @@ -367,6 +367,7 @@ &i2c1 {
> > >  	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> > >  	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > >  	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	single-master;
> > 
> > Hmm, I do not see this property is documented in i2c-imx bindings.
> 
> According to the discussion we had in this thread
> https://lore.kernel.org/linux-i2c/2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3/
> it is not necessary to have the property documentation in the i2c-imx
> binding because it is already documented in the dt-schema:
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

Ah, thanks for the info!

Shawn


