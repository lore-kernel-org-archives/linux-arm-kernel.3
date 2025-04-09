Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA13C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sX+DO5n+VlcFaDrXvJswz7sia3hrV/XIjVaEF5rLkg=; b=zHvr0kb7XwpVMThQWIXolDjax6
	rPbWKK0rgKeNnAjiuMrrLL3QEVvGBTXuGWDNk07dyl35hZ2g4OLzhp6/sZOYJvomXdh7ATGhnl9vD
	NUiM6K5Fy+SIVo4xnAZebhf/jWkj0GguTKU34jZ0sMtg9ZxYdU/pkwOaODHn9FP4Vrt5xn6RaeSN2
	6Hdo+MQtUaX+lYLrHn46cEkkUDQuYDTMAqB5iP0xYZhxg8h2KhIFFrs/DYbaW89fYjNn0j9eB46Wj
	otEdddI09KAXp4uq7XwzJ8ugFXk1fBPfHPc+E1eoCsnUDGq92V4mgFNdooCL6v/o6IdE0LX5om+YQ
	K4p5TdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wjx-00000007XKs-146V;
	Wed, 09 Apr 2025 14:49:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WCb-00000007Pec-3xa8;
	Wed, 09 Apr 2025 14:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F233445DA;
	Wed,  9 Apr 2025 14:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73142C4CEEE;
	Wed,  9 Apr 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744208092;
	bh=iAuzqC8Qd+VEzJGSAubYlMUnCIszvAwVM1YYMjubFpU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GNOPrJi3FLcGTxPcYU2A8vmzBGKk7I1qAEeYRrBXEMQbtQnt9BZvoRGuqBgfQNuTp
	 A7wQ/j0Pklll8ErvQGkIclgOTMixumnPq4i0Ps83xy68CpO6cMp8lI7NunM5s9c8j+
	 Fn1hYsNaBm32ER+RlP/uFkoJXxmuOOnm75r3jE+9AaeSD56tRhsBK+6jsSnCb2zCjE
	 PQfAkYxvsx4i8xQR8/W75alFaWyZyT0cDAHjc5rkRnWzwgVkh4A2Fn0K1txLZC5e8h
	 7yoIO/AFAh4OynLqMFR5DSq3Pg6sCF7QpmbYvEMaN7UAqbwSRC3AVISpKhzEnFVX4J
	 q1fiBjrv/OGuA==
Date: Wed, 09 Apr 2025 09:14:51 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 quentin.schulz@cherry.de, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Benjamin Bara <benjamin.bara@skidata.com>, 
 linux-usb@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20250326-fanatic-onion-5f6bf8ec97e3@spud>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
 <20250326-fanatic-onion-5f6bf8ec97e3@spud>
Message-Id: <174420798613.310269.1187763839287532334.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_071454_043716_BFE3EDD3 
X-CRM114-Status: GOOD (  20.78  )
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


On Wed, 26 Mar 2025 17:58:11 +0000, Conor Dooley wrote:
> On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
> > The Cypress HX3 hubs use different default PID value depending
> > on the variant. Update compatibles list.
> >
> > Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
> > Cc: stable@vger.kernel.org # 6.6
> > Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/misc/onboard_usb_dev.{c,h} driver
> > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> > ---
> >  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > index 1033b7a4b8f9..f0b93002bd02 100644
> > --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > @@ -15,8 +15,14 @@ allOf:
> >  properties:
> >    compatible:
> >      enum:
> > +      - usb4b4,6500
> > +      - usb4b4,6502
> > +      - usb4b4,6503
> >        - usb4b4,6504
> >        - usb4b4,6506
> > +      - usb4b4,6507
> > +      - usb4b4,6508
> > +      - usb4b4,650a
> 
> All these devices seem to have the same match data, why is a fallback
> not suitable?
> 
> >
> >    reg: true
> >
> >
> > --
> > 2.43.0
> >
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 1e26c5e28ca5821a824e90dd359556f5e9e7b89f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250326-fanatic-onion-5f6bf8ec97e3@spud:

arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1 (usb4b4,6502): 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1 (usb4b4,6502): 'vdd2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2 (usb4b4,6500): 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2 (usb4b4,6500): 'vdd2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl (rockchip,rk3399-pinctrl): gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 190]], 'phandle': 185}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 189]], 'phandle': 184}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#






