Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DB3EFCE37
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO/knfXLU58cqQbFLyikJauWIRCu+bpWpmfL7N87xUg=; b=TVFA7kACGOvqYxdSY+SCOkx0bA
	GbZ9W3qVfc91UdBni+pmRiE4Edc5HBu0ctTD1XIKbzwkPN6ap1eRyiJUrXaL4VMRF+DFskeQp8N/M
	HssPNMkpTixn/JILtAP6JtnHqx5Y2CCcjMS5vRK380dgStvrwpy9s9sTHL3sjOj5vcMIXIXy8NAXj
	DbMo+jqe2/GbfPCmx+9bM+PQPCudt08GPbr63HgWEwtJtBGSrmF6a4SVvCfgq2B4MU/7w1f26WdKs
	HwuC42bTro2F2UmVGpsMdHtpVkOR32IEhOpgCcjieHIij3fyhJXU/X+mwePVjW6MAR1IXatD3apy+
	aOARFGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsDU-00000000Poy-1oyr;
	Wed, 04 Mar 2026 19:49:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsDR-00000000PoY-2y7V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lO/knfXLU58cqQbFLyikJauWIRCu+bpWpmfL7N87xUg=; b=AW9t9KFci9gSdrFAV5W6jtjGiZ
	JRt5C6fcGfNY9FuA4VRF05gn2vztRet5pA2TP+D1U61BG4wBE4flqORzUJFcKgXlw3CpHR4xxw6vs
	BME7ZBjXIyMu2pOb1NZZbBY0Y1d/e/AQSF8U0zlbd/JM13YYTa7uVT5poYROy1CSoAqM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxsDI-00AAWR-Go; Wed, 04 Mar 2026 20:48:56 +0100
Date: Wed, 4 Mar 2026 20:48:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' properties
Message-ID: <db997887-2431-4baa-8e96-04f53ea59060@lunn.ch>
References: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_114905_867440_F6434312 
X-CRM114-Status: GOOD (  13.05  )
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

On Wed, Mar 04, 2026 at 08:12:43PM +0100, Gabor Juhos wrote:
> The 'marvell,usb-misc-reg' property is present both in the EHCI and
> in the XHCI USB host device nodes, however it is not documented. Thus
> 'make dtbs_check' produces warnings like these:
> 
>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
> 
> Apart from the fact that the properties are not documented, those are
> not even used by any USB host drivers. At least 'git grep' says this:
> 
>   $ git grep -n 'marvell.usb-misc-reg' v7.0-rc2
>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:30:  marvell,usb-misc-reg:
>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:41:  - marvell,usb-misc-reg
>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:50:      marvell,usb-misc-reg = <&usb2_syscon>;
>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:372:                              marvell,usb-misc-reg = <&usb32_syscon>;
>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:383:                              marvell,usb-misc-reg = <&usb32_syscon>;
>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:396:                              marvell,usb-misc-reg = <&usb2_syscon>;
>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:406:                              marvell,usb-misc-reg = <&usb2_syscon>;
>   v7.0-rc2:drivers/phy/marvell/phy-mvebu-a3700-utmi.c:231:                                                         "marvell,usb-misc-reg");

The phy-mvebu-a3700-utmi.c does use it, and does document it:

  marvell,usb-misc-reg:
    description:
      Phandle on the "USB miscellaneous registers" shared region
      covering registers related to both the host controller and
      the PHY.
    $ref: /schemas/types.yaml#/definitions/phandle

And the patch which added the property to the USB nodes also added the
PHY nodes.

commit 05d168a56fae8ff50432d5dfe6e7423b989455a8
Author: Miquel Raynal <miquel.raynal@bootlin.com>
Date:   Tue Jan 29 10:36:34 2019 +0100

    arm64: dts: marvell: armada-37xx: declare USB2 UTMI PHYs

So this change does look correct.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

