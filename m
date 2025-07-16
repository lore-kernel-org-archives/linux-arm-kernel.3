Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66907C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4auTgd22pGNH1jdtfbwwfWJp1o28eejDDqqLR3Yb6nk=; b=oBRaHOHtD9t52PmryBR6NJL7c7
	SmzH23V1XQS9oY3ETm77jfK8EZtUCMdPsKzhsyfjQq5BFZpoWHFCo9Y5R1CIwb4EE1/ya3ESWYeaE
	W3jirFg0bEZVcuOqPNHq9DG8FuiCzKzi9rZsfBLav5La6aAQ/ptO7mTiWwjghW17qnOlWZjiIO9X/
	uBR2OT8MW/uUJALyf/63ogxDkxl+uZml6FVP4DAtJ4cLoCNkgStyfuiMGB39M2RiqFVkK2RYiuWgi
	dxwk+cNZYZQy9r/4dCAEi3+QANhP+8ccD0fuFO7uQNw10od1DLDAmEzkabjxakPQkFKVpGW/VDLfn
	VFOaeGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1cO-00000007i4q-1i33;
	Wed, 16 Jul 2025 12:52:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Xh-00000007hNj-2eo9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A9E4614A3;
	Wed, 16 Jul 2025 12:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3DDC4CEF8;
	Wed, 16 Jul 2025 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670044;
	bh=0pzCJliJ0HW2L3subDrWq+mOU/BVWiu8FjkzdTE7CYQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Z/53GU+YHmWDPHxVUHuXogBFzIsiDKRhdgkakLprnSi9sq0p2BiWrLjLX0mLgWKVY
	 kMueCPBXRzMBfSvt5xgYQg9TZnFUbLtSDRttQf08/WqtJHN2lixY4jHXKitaOnu/hi
	 uSQSzuwfXygFA0Hv70b2nBTl6iApAdtz8jt0IqIYdp/0Ll/7LaiS9UlTLmgSo14pD6
	 cXNiKemXlw8MGCI4DNrAgbHnr9mAXZQl7JrVIjcSE7RXj78DRVS2a5LWmLmOtTV99E
	 rg6PePaVt/QNxI0zrlefDqsj722M7LRe1c9eO1QSorQR15IMDv5EdR3dsZ+2edYXbc
	 wMNIeZoqhYnqQ==
Date: Wed, 16 Jul 2025 07:47:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, lumag@kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, u-kumar1@ti.com, 
 devicetree@vger.kernel.org, ebiggers@kernel.org, kory.maincent@bootlin.com, 
 bparrot@ti.com, dale@farnsworth.org, krzk+dt@kernel.org, 
 geert+renesas@glider.be, linux@armlinux.org.uk, linux-media@vger.kernel.org, 
 heikki.krogerus@linux.intel.com, mchehab@kernel.org, 
 claudiu.beznea@tuxon.dev, linux-kernel@vger.kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sbellary@baylibre.com, 
 andre.draszik@linaro.org, ardb@kernel.org, dagriego@biglakesoftware.com, 
 florian.fainelli@broadcom.com
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250716111912.235157-4-y-abhilashchandra@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-4-y-abhilashchandra@ti.com>
Message-Id: <175267004341.4181720.11859014527517980567.robh@kernel.org>
Subject: Re: [PATCH V2 3/4] dt-bindings: media: ti: vpe: Add bindings for
 Video Input Port
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


On Wed, 16 Jul 2025 16:49:11 +0530, Yemike Abhilash Chandra wrote:
> From: Dale Farnsworth <dale@farnsworth.org>
> 
> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
> can be found on devices such as DRA7xx and provides a parallel interface
> to a video source such as a sensor or TV decoder.
> 
> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v2:
> - Remove array and just use hsync: true in bindings
> - Remove array and use enum for bus width in bindings
> - Use pattern properties since properties across ports are same
> - Update copyright year
> 
>  .../devicetree/bindings/media/ti,vip.yaml     | 211 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/ti,vip.example.dtb: /example-0/vip@48970000: failed to match any schema with compatible: ['ti,dra7-vip1']
Documentation/devicetree/bindings/media/ti,vip.example.dtb: /example-0/i2c/camera@37: failed to match any schema with compatible: ['ovti,ov10633']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250716111912.235157-4-y-abhilashchandra@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


