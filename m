Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE9CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RKC2cgY7V1PsSwCTky/Dq59BzaDz/xD/QenK71otSA=; b=qODEXDd5eVikp5GbQk9jiTDEx9
	d7Spa+hO3BxVGh18yum7R/SrBhLJwHwlNMSMuJGww4y2P8Gz27Oa3YLyqdzruWvDiL4RJ4UmYBElK
	WGzfWiW4Ha0dpXrGwMjb+0mP3ESqfZmh1N0rb7sqOzAQBaVuAxf3BKugf70FCxE8zEX0A47oQjFTJ
	2lkK7RySw6Pqfg2/guY9wLV4KyCXX+SXR8I6X8k8GP3cK1h5ddsvtyqkn/11u1DQ5MWtx34OrUAIz
	k/howlQxkM3gySI/5/8AzAvGfjiuGPS/ONV+2zKNG+Ni6FTW64FJpK68Bt8oyi1PZNKqOcJdYqyQe
	muBu7PHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKxa-000000014NZ-350R;
	Thu, 18 Sep 2025 20:10:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKxZ-000000014NE-2c6Z;
	Thu, 18 Sep 2025 20:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B36F7601D5;
	Thu, 18 Sep 2025 20:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466C1C4CEF0;
	Thu, 18 Sep 2025 20:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226228;
	bh=5pcBDDtxTATLmNQEKcdAreF3a0z7FlcBT6ZHksKiokU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjAC46Ty9qbzcurfbOA3uIZu1qywMfSw0++diAkbCwBUyrbdLPzFqYRoQLGZKV7yJ
	 eoGbDzSzOrJlMZqJHgYZfdKE/FaqsHgKWkJxlDd8wqbO08MOCSy1iSSuZH85ZHceMs
	 mKUMisVyOWL+D2hcqqVU0XAM2Q8imy0pNbWzCbDrgI4Gada2NjG1gJ7sv6hkG4QwU3
	 zB9hJCKCgSIFwd588AgGXlSCZzagKISu+veUj0Z7S+dlOXHrly4tF5S2Hj30quCQ3E
	 FcJckMvyWh4BZDcCnPqmJLcY7Il/1hztoNdQsSYrTBtObSMI3dLo+iPv+881vYj8zM
	 kQ/j++g7axkNg==
Date: Thu, 18 Sep 2025 15:10:27 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] dt-bindings: touchscreen: convert
 raspberrypi,firmware-ts bindings to json schema
Message-ID: <20250918201027.GA2547040-robh@kernel.org>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com>
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

On Thu, Sep 18, 2025 at 05:36:08PM +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Drop firmware-rpi node and use only touchscreen node to fix warnings
>   you can see in
>   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/
> 
> Changes in v2:
> - Added in v2
> 
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
>  .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
> deleted file mode 100644
> index 2a1af240ccc3..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Raspberry Pi firmware based 7" touchscreen
> -=====================================
> -
> -Required properties:
> - - compatible: "raspberrypi,firmware-ts"
> -
> -Optional properties:
> - - firmware: Reference to RPi's firmware device node
> - - touchscreen-size-x: See touchscreen.txt
> - - touchscreen-size-y: See touchscreen.txt
> - - touchscreen-inverted-x: See touchscreen.txt
> - - touchscreen-inverted-y: See touchscreen.txt
> - - touchscreen-swapped-x-y: See touchscreen.txt
> -
> -Example:
> -
> -firmware: firmware-rpi {
> -	compatible = "raspberrypi,bcm2835-firmware";
> -	mboxes = <&mailbox>;
> -
> -	ts: touchscreen {
> -		compatible = "raspberrypi,firmware-ts";
> -		touchscreen-size-x = <800>;
> -		touchscreen-size-y = <480>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> new file mode 100644
> index 000000000000..697c508326b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmware-ts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi firmware based 7" touchscreen
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,firmware-ts
> +
> +  firmware:
> +    description: Phandle to RPi's firmware device node.

       deprecated: true

It should be a child node.

> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    touchscreen {
> +        compatible = "raspberrypi,firmware-ts";
> +        touchscreen-size-x = <800>;
> +        touchscreen-size-y = <480>;
> +    };
> -- 
> 2.43.0
> 
> base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> branch: drop-touchscreen.txt

