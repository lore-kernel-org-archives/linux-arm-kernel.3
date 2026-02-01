Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755A4E7C718
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTwXB7b7fyAa7LptV2bR7VURTzSkmLzoKfvh/LkKyAQ=; b=q6FRfy6vbPZO2CzPwytDH82E11
	Hd6KJh1aQpY7TnWLXvge6EETUPS4OhoGeME6r8Nh7MUWS/C0sD66xM/mp4aD9LY7XuoakAYAuQozN
	stZbGgMGCJCRahBoiOpCWAvb/sbZj5bzR/qs8aoPiK15P0AC2Xie7L0gz7cf4Hf1YHFL4n7bPqhlP
	81MEIpAZCRPffPgOG34UMPpblfH5n/H1UjrExxFM0x83JoVe8q2jBnUdzWF7jiJ4GqEC9kRW/1mT8
	uMZW6+M7TeMoScoeruyDzBEgyuRzyzSe6L0DMd0GSBPuhPpnAVwdiEN0SReP/HszlrAbEOJwOSB9j
	OZuSddRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmWhZ-00000003VJV-3oNN;
	Sun, 01 Feb 2026 12:37:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmWhX-00000003VJA-0Dh3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 12:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5B1841840;
	Sun,  1 Feb 2026 12:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6668DC4CEF7;
	Sun,  1 Feb 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769949430;
	bh=dGFx1VFWlzUONLDaiGnHfQKX+Ch//O+EYhfbY6SQQX8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NFgo0gX4uOKnO4aLFv4fzv4vMsy2AG0BojmtvNr3bxDP12Dy4tyzj4qveTTpDRSIL
	 Q57sjRmwqvpHVf9xjj3oOPLIzPqaBO19MQsd1xiCkW0LOdjMsyqiVFs6kueibSWxBl
	 1sYm3LXChw7MeaYK/Ub8UiFaoEGvviYemv9+CkZWtqd4PV5DPtY0J7EFMnSkYcgYGG
	 E43PXEL1yydK0NyN3j3U6zkLJnWdARgy158qhSyWH8/4dMVB131XON+0oOzbVBQ53E
	 tocKg05grXKjzgNVU8Tffwm9bKKaYquC4APg3Uq28iowVCVS780fHLlShu3D3Bb5jY
	 /om+toEnczXnQ==
Date: Sun, 01 Feb 2026 06:37:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Herve Codina <herve.codina@bootlin.com>, linux-usb@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
Message-Id: <176994942956.410099.10343293169382130437.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert
 to DT schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_043715_113549_950C0893 
X-CRM114-Status: GOOD (  11.35  )
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


On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
> binding to DT schema.
> Changes during conversion:
> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
>   driver matching.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
	http://devicetree.org/schemas/usb/generic-ehci.yaml#
Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
	http://devicetree.org/schemas/usb/generic-ehci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


