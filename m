Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B436F506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdRqNxwZxmS6i4BBNbYVIlQ1I2je+p4LCk+ipP3YYm0=; b=zpmsFNQuUGTcBQdY1gP7ctu2T0
	cmVppfSEh/xwLFx8lR5oTAVnTsjIDHK4TMp5df+S3T2i81SAJV4B4X1YZkqKxOuj3XICa2S9IL2gF
	PCpLeD9iSsJYH1Hx3KIEVbYqtqiVHuy9H8jGBktcgVYH4BRJcX/ONOZxUINJpLt4JEd7lpSAQ3RSX
	EUEO3b5kOxrNMAPLpHIdGLaO2FJMufQQkDm859c0BP7hC4Dt4MZ1rf/4aog6XtP+Duo5EBA2aVCoP
	rukj7pw1pajZtvuF0aJbQnm2uqx7kQTec6Veh7mQR0cOwdH+/YJuQfA9vH6sCXWWppyBbliiOR2ev
	snZbjwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29GZ-00000004FJm-3Oim;
	Mon, 16 Mar 2026 14:49:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29GX-00000004FJR-20CV;
	Mon, 16 Mar 2026 14:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A113660123;
	Mon, 16 Mar 2026 14:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16D2C19421;
	Mon, 16 Mar 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672596;
	bh=Axd7d+UawpXOv/3tS8iWGfE+PXjHS0Z55o+fN4jSdxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QA4RAok9Ze+T6wBSM1kua6xsah1KbxXsTpa9lmceu7Lc78mUbOpajRUyCAJE4XBog
	 mWrImeDMPJWpntKR7W3b4gk3dMH84hstaEmfbobAugO4EZnG4ZiA8s6rtnzKJO8iMd
	 XXAVrx1fWbrnwL7Hg7j9D1SbkghmMwUakerJ5jXroxlUUEJJ62C5iEvwy4Jv98gPRs
	 mtGHMt3FzHLUEqFxpwr0KKrAxPkj83KcYJe+GSBv+zp30mEOLPo/w0g05f+mS5AXJ6
	 CYV+2+McXKkHH2oxQAqkESdoccYUaXSb5tBBbAyV/JIx2Vmdc/G/LNO/xM3k3QCopu
	 K21re0Jr1hWtg==
Message-ID: <e1e91ada-4d21-4384-983a-676a3aa09bd7@kernel.org>
Date: Mon, 16 Mar 2026 15:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] dt-bindings: power: power-controller: Convert to
 yaml format
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>,
 Jerome Neanne <jerome.neanne@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Osipenko <digetx@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <20260316-power-controller-v1-1-92c80e5e1744@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260316-power-controller-v1-1-92c80e5e1744@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 16/03/2026 15:47, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert power-controller.txt to yaml format. Drop the example because
> there is already one in regulator/active-semi,act8846.yaml.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/power/power-controller.txt | 17 ------------
>  .../bindings/power/power-controller.yaml           | 30 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/power-controller.txt b/Documentation/devicetree/bindings/power/power-controller.txt
> deleted file mode 100644
> index e45affea80781292316c75ed387ba38402501c5b..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/power/power-controller.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -* Generic system power control capability
> -
> -Power-management integrated circuits or miscellaneous hardware components are
> -sometimes able to control the system power. The device driver associated with these
> -components might need to define this capability, which tells the kernel that
> -it can be used to switch off the system. The corresponding device must have the
> -standard property "system-power-controller" in its device node. This property
> -marks the device as able to control the system power. In order to test if this
> -property is found programmatically, use the helper function
> -"of_device_is_system_power_controller" from of.h .
> -
> -Example:
> -
> -act8846: act8846@5 {
> -	 compatible = "active-semi,act8846";
> -	 system-power-controller;
> -}
> diff --git a/Documentation/devicetree/bindings/power/power-controller.yaml b/Documentation/devicetree/bindings/power/power-controller.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff698365d778446c08ceeb5f3ef144d5e97d2f79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/power-controller.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

You relicensed the text, so you need to get some acks for that. Your
cover letter or patch changelog should explicitly ask for that and of
course you must Cc previous authors.


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/power-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic System Power Control Capability
> +
> +maintainers:
> +  - Rafael J. Wysocki <rafael@kernel.org>
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +
> +description: |
> +  Power-management integrated circuits or miscellaneous hardware components
> +  are sometimes able to control the system power. The device driver associated
> +  with these components might need to define this capability, which tells the
> +  kernel that it can be used to switch off the system. The corresponding device
> +  must have the standard property "system-power-controller" in its device node. This
> +  property marks the device as able to control the system power.
> +
> +  In order to test if this property is found programmatically, use the helper
> +  function "of_device_is_system_power_controller" from of.h.
> +
> +properties:
> +  system-power-controller:
> +    type: boolean
> +    description:
> +      Indicates that this device can be used to control the system power.

Just like it was in case of other core properties, I think this should
go to dtschema.

Best regards,
Krzysztof

