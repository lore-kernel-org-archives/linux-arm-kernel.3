Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FDAEDEC05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dMeUX2Xk9StLIqbGPYXzES8zoDvxqM6/CpgP+M7sCk=; b=UoNluxK08XbHX89u0AhhJUnjCS
	0oZm/OZDC9HWzBthlC26Jhb/83e10sndM6Tad8VUNidPNp+74Ma86IQrsLjAlqlqARMt54LTVTnAF
	ghl+J3fjdxY4ytovOvMy94anWxYydIjGT+dHtevEKy9oyy5PzMNVs2QaDbkpzFMrDuXrC6smfWyOi
	JxoDosacTmYDSCUjzhqZQxPTe54M9TsdEwyuojL6HDfZfULhBm4lG2T9vMYGDC4Qh/RIckgAdo/SY
	cGOLghWEdj8WLx0JwGczxxQ7e1nMwPTWva5IY53CxgYajG5xHklaF4rExH8+n5y/VZTfpYaSog4Nd
	6TNECz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8kR-00000001slT-0zQk;
	Thu, 05 Mar 2026 13:28:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8kQ-00000001slE-29zH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 13:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1dMeUX2Xk9StLIqbGPYXzES8zoDvxqM6/CpgP+M7sCk=; b=b9KFWaAZwFJOJCdF/fD/2b8ijT
	CnuA/DEpdWGGiUZKousRrMYZkfwPBdqft4Fkd2zg/sgL1OU6Kj43aG6rJXif0aEpG6D6UBrSmZL6z
	TTtg4SX3Z6i7Bp4nrfP0LOebQMSeUT0iLparxgkHMBZwy23/87MSucrq5G9vL6ns5dmZmcY1PvgJY
	w5l9CpVPMmSDFarjc6bfj374jGhFsMNchXHccQpb2tI5MX3kgSyzalmLP/QMotw1uRziQ+JtePB7p
	G2D3Jahot/rczu0QPiMy0qGQZN0Aw2bQB8SqRXFmUvr4GKnBi3yJkLqCdKmZkibVqINjXuBZ3bDkn
	caik8Xmg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8kL-0000000F3Et-2LC8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1dMeUX2Xk9StLIqbGPYXzES8zoDvxqM6/CpgP+M7sCk=; b=BAYSc8DI/atjiwBSNuMx04jOlC
	WyE5kJjHsIJb/FolbwHzzh5FxYMude3XTNFs1PzECU8uOsZB9jnfsIi3ZQCZ3KiqZpwnCADAWTVHl
	mpV2ahH+/fWWIZDR918qn4oUm25sYfRWUq++LNJ0kllVTtJZ0Hl3uTujp2dXhW4EocEw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vy8kG-00AJok-91; Thu, 05 Mar 2026 14:28:04 +0100
Date: Thu, 5 Mar 2026 14:28:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' properties
Message-ID: <cacefc69-dba3-4ff6-a039-85fe35a91e0b@lunn.ch>
References: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
 <db997887-2431-4baa-8e96-04f53ea59060@lunn.ch>
 <874imug18l.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874imug18l.fsf@BLaptop.bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_132809_635661_F37DBA3A 
X-CRM114-Status: GOOD (  17.94  )
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

On Thu, Mar 05, 2026 at 08:54:34AM +0100, Gregory CLEMENT wrote:
> Hello Andrew,
> 
> > On Wed, Mar 04, 2026 at 08:12:43PM +0100, Gabor Juhos wrote:
> >> The 'marvell,usb-misc-reg' property is present both in the EHCI and
> >> in the XHCI USB host device nodes, however it is not documented. Thus
> >> 'make dtbs_check' produces warnings like these:
> >> 
> >>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
> >>           from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
> >>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
> >>           from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
> >> 
> >> Apart from the fact that the properties are not documented, those are
> >> not even used by any USB host drivers. At least 'git grep' says this:
> >> 
> >>   $ git grep -n 'marvell.usb-misc-reg' v7.0-rc2
> >>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:30:  marvell,usb-misc-reg:
> >>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:41:  - marvell,usb-misc-reg
> >>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:50:      marvell,usb-misc-reg = <&usb2_syscon>;
> >>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:372:                              marvell,usb-misc-reg = <&usb32_syscon>;
> >>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:383:                              marvell,usb-misc-reg = <&usb32_syscon>;
> >>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:396:                              marvell,usb-misc-reg = <&usb2_syscon>;
> >>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:406:                              marvell,usb-misc-reg = <&usb2_syscon>;
> >>   v7.0-rc2:drivers/phy/marvell/phy-mvebu-a3700-utmi.c:231:                                                         "marvell,usb-misc-reg");
> >
> 
> I don't follow:
> 
> > The phy-mvebu-a3700-utmi.c does use it, and does document it:
> >
> >   marvell,usb-misc-reg:
> >     description:
> >       Phandle on the "USB miscellaneous registers" shared region
> >       covering registers related to both the host controller and
> >       the PHY.
> >     $ref: /schemas/types.yaml#/definitions/phandle
> >
> > And the patch which added the property to the USB nodes also added the
> > PHY nodes.
> >
> > commit 05d168a56fae8ff50432d5dfe6e7423b989455a8
> > Author: Miquel Raynal <miquel.raynal@bootlin.com>
> > Date:   Tue Jan 29 10:36:34 2019 +0100
> >
> >     arm64: dts: marvell: armada-37xx: declare USB2 UTMI PHYs
> >
> 
> You stated that the property is used and was properly added.

I can understand your confusion. The commit message is not great. I
had to read quite a bit of code to convince myself the change is
correct.

The property is used and documented in the Generic PHY driver,
phy-mvebu-a3700-utmi.c. And the properties being removed are in USB
nodes. The properties in the PHY node are not removed.

The properties in the USB node have never been used, as far as i can
see.

	Andrew


