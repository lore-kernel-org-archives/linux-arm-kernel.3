Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85585CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XubC4XJFkTjrKVdNnbxXzGPi/vI6kP6ei2o439H52bo=; b=ftnwJlG9KxG9IYGyRZxO/F4sve
	zbYCTPEo4aAQ4D1rqjbWXY/ROoMW45PrSEuX+FYtfxQ2KnlpYA1zo+F7jvKpu1oyl5/5WfTp4IjjT
	lMLOjK6FrcrVkt6PaZ0KWj95f4Mit6QWOkngqzGytl8pfQ0hwHrX9uHiusiG2nhNFZHwyY0/0DrF2
	A2OH+p/nk5QCzSrPHLTpiSEUSZFyo9RhZi5TM/FzG/eVWBHKn/1RH9Nv5qynzfWTdWWWDGZRKw7pJ
	A9v7JM2NHvB5RDMjkzn1+0uOMw9Ys5XkXJMvHkNdm18mu//ptQo4ziPDPtMs7fQEgwDjHtnbeHC0y
	0BBc7Keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXk8-00000004dAh-2nI1;
	Thu, 30 Oct 2025 18:51:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXk5-00000004dAO-1bXJ;
	Thu, 30 Oct 2025 18:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8881C61135;
	Thu, 30 Oct 2025 18:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9089C4CEF1;
	Thu, 30 Oct 2025 18:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761850284;
	bh=FBCCR/Suue4f/BvtdNxzoMBDqCveM6h0dVOlYqgroZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppahJgI3Xpdl1cneURrtsR7KIjC+5T47cH07+HkmD4gKk5zbtBbcJ7WlO5RtFoDGB
	 Agf3/JtDIpzT0bS9yvmQmQxyN6MEBMVjerBSWgqL7LqLflyyi0dPVIn1J4kE4PG/nK
	 q6EAr0bkeofrSkl4D7UdD/TRn1xSWZFL1xIptv+Xv53fOu5x+4LIQ5w9sg9O4QfYGJ
	 NrWp2HIU+xkwZmrtcL3sAtuDnpFkugmTDZMWKykXc5JTuelFgbnUz2heyaxVB6hgat
	 6t/Bnpm073zqJY11MUlgRPwAkRGaNeLHmm5w9AABv+WHTMAeO+v3+QTSzn9kYAxZFs
	 3RzUr4Zp4XgRA==
Date: Thu, 30 Oct 2025 13:51:22 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20251030185122.GA236742-robh@kernel.org>
References: <20251029173713.7670-1-ansuelsmth@gmail.com>
 <20251029173713.7670-3-ansuelsmth@gmail.com>
 <20251029-mutual-scotch-7ca52e17da69@spud>
 <69025bc9.5d0a0220.1f0440.deb9@mx.google.com>
 <20251029-henna-easily-227513366e90@spud>
 <690266d4.050a0220.3a144c.eef7@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <690266d4.050a0220.3a144c.eef7@mx.google.com>
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

On Wed, Oct 29, 2025 at 08:11:10PM +0100, Christian Marangi wrote:
> On Wed, Oct 29, 2025 at 06:35:51PM +0000, Conor Dooley wrote:
> > On Wed, Oct 29, 2025 at 07:24:04PM +0100, Christian Marangi wrote:
> > > On Wed, Oct 29, 2025 at 06:07:22PM +0000, Conor Dooley wrote:
> > > > On Wed, Oct 29, 2025 at 06:37:10PM +0100, Christian Marangi wrote:
> > > > > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > > > > for the USB controller.
> > > > > 
> > > > > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > > > > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > > > > mode currently configured on the system for the relevant USB port.
> > > > > 
> > > > > The first USB port on the SoC can be both used for USB 3.0 operation or
> > > > > Ethernet (HSGMII).
> > > > > The second USB port on the SoC can be both used for USB 3.0 operation or
> > > > > for an additional PCIe line.
> > > > > 
> > > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > > ---


> > > > > +  '#phy-cells':
> > > > > +    description: Describe if the referred PHY is the USB 2.0 PHY or USB 3.0 PHY.
> > > > > +    const: 1
> > > > 
> > > > Which is which here?
> > > >
> > > 
> > > Mhh I think I didn't understand here. #phy-cells describe the
> > > parameters to be used for phys property in a different node.
> > > 
> > > The current usage would be
> > > 
> > > <&usb0_phy PHY_TYPE_USB2> for USB 2.0
> > > or <&usb0_phy PHY_TYPE_USB3> for USB 3.0
> > > 
> > > This node expose 2 PHY that can be referenced by the single parameters.
> > 
> > Ah, I didn't know that the 1 cell variant here was type not index.
> > 
> 
> Yes in the driver I'm maching for type not index as it's very confusing.
> Any hint on better describe it on the schema? Maybe I can reword with
> 
> "Describe if the referred PHY is PHY_TYPE_USB2 or PHY_TYPE_USB3"

"The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3, as defined 
in dt-bindings/phy/phy.h."

Rob

