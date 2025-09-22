Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB2CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5J4Ljpda680ALq6ch3ruxt7+r3NdpzeV0HnX9n1YUCk=; b=kGrquN1MgoDtj0/Xzz2oB3WBL6
	lHo4xAxlULYeSGgoSKFFSosaB5cQkRAYc+8Coq2PqEA2BetbG/YFtyJ+hSRIOY72c0IIITFUCfLSg
	QTSNjk+aePEFzyQr0dyjKV061htpZynmExSd8FnEMBor88XwKqvPaHJmQUCS3L6sFTsBiO11zj8dM
	mxxoVpfth0/rCJ+0a9+6WZ09A5Z0mDfbHyCXJGgWoNWQ+2VtWiQSysO0RDz0NHF0/3fdfTEcDvY4+
	0bIYQyKdWkIhtj365Ioq8itQz7ONM/Qt//nmfmmyzfseqt6ASqVKGcFNhva8+WAtQci5QVdL4Q0Jk
	uTDwui1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nXO-0000000BUZo-0Sqp;
	Mon, 22 Sep 2025 20:53:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nXL-0000000BUYu-1uAq;
	Mon, 22 Sep 2025 20:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7C3244E0A;
	Mon, 22 Sep 2025 20:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAF5C4CEF0;
	Mon, 22 Sep 2025 20:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574406;
	bh=DiuQfD9Kf/1+kF5x4UO9UHkDanaUR9E+z4BreblPOCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tB/fzyHUWZbuqImOMTSE6YgmnNXw2HWCrZmo7b5cuNhEfebwfcpoOP7CUvyK8cp8C
	 IwhDys3lfXo8dcf+TmwAzsuXndIBvwup156n6ru1mDtzkNWyeQyDxLQVgJdJaIOwTj
	 /H2sliKqDMLrmd6pMjJJ0buiOYjkdMo1LHIgFPwZ2oU0DPr/lK2vf2SBjGLmPA2Mtf
	 b64+8ahSI/mu5cbnbYtryr0C9vpwm+c0aU7rnzNhdOueCppDjl5te39XPUFeH1yl4G
	 u7N1g66f8WIWJ2pQJQXSsBL1bekoA+NoVJu8idM/xpGM/mGSTzFlUyINc2Xnc/A1/u
	 I8h6opdNrT66Q==
Date: Mon, 22 Sep 2025 15:53:25 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: bcm:
 raspberrypi,bcm2835-firmware: Add touchscreen child node
Message-ID: <20250922205325.GA1304482-robh@kernel.org>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
 <20250921173353.2641438-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921173353.2641438-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135327_531108_30A60D2C 
X-CRM114-Status: GOOD (  19.52  )
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

On Sun, Sep 21, 2025 at 07:33:43PM +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Move bindings into raspberrypi,bcm2835-firmware.yaml
> - Remove raspberrypi,firmware-ts.yaml
> - Update the commit message
> 
> Changes in v3:
> - Drop firmware-rpi node and use only touchscreen node to fix warnings
>   you can see in
>   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/
> 
> Changes in v2:
> - Added in v2
> 
>  .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 27 +++++++++++++++++++
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------------
>  2 files changed, 27 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> index 1f84407a73e4..044544c17e8e 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> @@ -103,6 +103,27 @@ properties:
>        - compatible
>        - "#pwm-cells"
>  
> +  touchscreen:
> +    type: object
> +    additionalProperties: false

Needs a $ref to touchscreen.yaml

> +
> +    properties:
> +      compatible:
> +        const: raspberrypi,firmware-ts
> +
> +      firmware:
> +        deprecated: true
> +        description: Phandle to RPi's firmware device node.
> +
> +      touchscreen-size-x: true
> +      touchscreen-size-y: true
> +      touchscreen-inverted-x: true
> +      touchscreen-inverted-y: true
> +      touchscreen-swapped-x-y: true
> +
> +    required:
> +      - compatible
> +
>  required:
>    - compatible
>    - mboxes
> @@ -135,5 +156,11 @@ examples:
>              compatible = "raspberrypi,firmware-poe-pwm";
>              #pwm-cells = <2>;
>          };
> +
> +        ts: touchscreen {
> +            compatible = "raspberrypi,firmware-ts";
> +            touchscreen-size-x = <800>;
> +            touchscreen-size-y = <480>;
> +        };
>      };
>  ...
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
> -- 
> 2.43.0
> 
> base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
> branch: drop-touchscreen.txt

