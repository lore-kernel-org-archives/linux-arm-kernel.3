Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775D9CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNcp0jt8ycZyGM+jdoQzuN6K9tYOZMv8ijTmZn5ihck=; b=cwjAwhUoJXF3iUCdJ96gGU70Io
	FYmPi3HuzwYO5aV+XCmDxtmN7duqDEnzT/szd1bAnutmGFtVdNafwsROdEPG7PfILmhcgjIXyDj+v
	a7+JjZk2c+z+TrMWYW5Qo7a8DgsUF2+7tFscUJbbIGnua4YtOlvxR9+/9hCWJ8JXZM/DYmVN5WDAp
	3VBgbIBea04GwTbgbquainFHIM1ZmbwZqKKqdkD92Kt3qBURXOQVAC9iQjxhZRbGLwjxARJ1VqEKE
	56NSyKfsXPjTnNoj5xK/E+RSB3zq6zsqPMSrQyIu6bfQXKFgpL10/AbEFWfipDUQIY1bqpg+K6Eow
	atmLK9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnea-00000001VD6-0vLz;
	Sun, 14 Sep 2025 14:24:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxneW-00000001VCB-3gxo;
	Sun, 14 Sep 2025 14:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB0BA4185D;
	Sun, 14 Sep 2025 14:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86559C4CEF0;
	Sun, 14 Sep 2025 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757859867;
	bh=Sfx4QXafuRHlGko82oAUy9i/VeAeMfX/h5ATJQNUnZg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WIpd0AB27Ab4KH4RxsLbYkzBAw4CPwxBAw9j2l+FS04nSeISV7vZCSquTpnBAzHGL
	 brT5FiNknFi2VakGjHXr4lw/AILvOfeGFbwMa0Gw6ixWSXtLXn2ViPjP8jtMO6M2Qd
	 n/yNtsTjpWSSrKF9DCL4aplqttgMFrdmohlpaEsCfaDMZlW2MIiDMo5uOtI2jGa1hn
	 6SyIh6s7oVf5LXQEorkiMNk0mnYk9cUUo6waI+6/t8afxF28pDYPZYjN8iPjoLd4RV
	 D60KuuLDpKmmT/un/RnwZ5Qktoxm+m6mgv5/+SdYTEYhYBdYRd8vOvY7OLWvqWHOCT
	 3I0gStVWzGy3g==
Date: Sun, 14 Sep 2025 09:24:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amarula@amarulasolutions.com, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250913092707.1005616-3-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
 <20250913092707.1005616-3-dario.binacchi@amarulasolutions.com>
Message-Id: <175785980651.1915009.6987347922143634218.robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: touchscreen: convert
 raspberrypi,firmware-ts bindings to json schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_072428_967338_2D09DEAF 
X-CRM114-Status: GOOD (  10.80  )
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


On Sat, 13 Sep 2025 11:26:53 +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Added in v2
> 
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------
>  .../touchscreen/raspberrypi,firmware-ts.yaml  | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.example.dtb: firmware-rpi (raspberrypi,bcm2835-firmware): 'touchscreen' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.example.dtb: firmware-rpi (raspberrypi,bcm2835-firmware): compatible: ['raspberrypi,bcm2835-firmware'] is too short
	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


