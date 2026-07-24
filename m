Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E635C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzE0BRt0k4cK2r7lKLDhy/lGjmtBWr3yCpJradIEDBI=; b=KejQzt7NB2x1M8aNiU1vQzl2c5
	U46DxU4HKi9dBoUGk/14RUiB+g7UOz0mE+CHdDKnznt94k19DX7yBdAffymISj1OF8yJ1yHOKowhc
	0n0o4txNs9fk6xp2qmtDAZuVi0s5oE1C7BnA5gwGUhnqCVj6Jwtsjy0X3h651F1tTXFODNM5B7r2q
	Pg4TfoY9Vf4TUjzVzuKmszJkzFGCo3sl+C6xjI5WiYMcojSUARJb7QXHodPzYs64DFpwAv6QmfGvx
	ghHXbQYtJLBW0wo4Gp9B/OainK3yHdajzOoL5dS6gMF/wvIKVo5iNcEVNXyF77+uMRreoOt+spF5K
	e9EAA3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMau-0000000HE3i-0IWt;
	Fri, 24 Jul 2026 20:34:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMas-0000000HE2t-3UiL;
	Fri, 24 Jul 2026 20:34:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 677B740938;
	Fri, 24 Jul 2026 20:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD171F000E9;
	Fri, 24 Jul 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784925243;
	bh=OzE0BRt0k4cK2r7lKLDhy/lGjmtBWr3yCpJradIEDBI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=QoRbqQB+cSEfc+gruKvWH71dqHXIKiEAVMUkrP4D6/k6KV7XiTA3ZIfAzZ+4yaDTH
	 NxyJEDfssp/b55URyzKqR6wrSTDmOOYC8EmxzRAHLZiC7BK94wWKno5ihn0UZvuw4i
	 BJ5A57Yskt4LWr35CX9FpEe8vhtRz0Vt3tUP0411YaBL7NpIZjA1/g2q8XBw2v/1Cf
	 Y4b7VxlsUOKvnKFfW5EYGaXTDToXYDXrdpY3Fcipt6Ckl427BQYjq2qFfZ1YeN39a2
	 SsUFbKgDTfe34N9iUR7EyMb0QjVkNDhvsjQ6nD3F0Eh4D32vjml44uZtoyUSFuj602
	 evDru+Ew9eItg==
Date: Fri, 24 Jul 2026 15:34:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260724184523.193661-2-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-2-ansuelsmth@gmail.com>
Message-Id: <178492524234.1087066.16396953078954543669.robh@kernel.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
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


On Fri, 24 Jul 2026 20:45:20 +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.example.dts:18:18: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
   18 |         #include <dt-bindings/soc/airoha,scu-ssr.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1705: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260724184523.193661-2-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


