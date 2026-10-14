Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772F3CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9drWIXfr1DDCei/MMFdnXnXQjS0PR3I+D9u3gYliR1s=; b=AKr1LigCq68Sls4tWNUDsK8GEG
	WjM9f8gcMaIBvbJnEJe9ycH/UFrVRC4rOxHDQhxndoYWzryksT3WaisptKD0588mDTmqGLP+bOphY
	oe2UaWm1zpRCTXC+1X1c3wchkplACJUpFp13M2khCk9IbSkTAnZo+IeuuUEFYx9/trUtDQL8DQOdJ
	EJdrP1beX1Z8ZGZdv/C1z3OFq+INnX6WGRhFR4wMIxGZrTa1PwKTUQ5NuYuaZvxaWq0oLgZgMBTos
	jRYxeiFGUG7eePKCWffKs1AIRNFrDEaDgU2SZlvSg6Gv2RyS1B23QaMrMVLjZOISgYL248FeTLMzQ
	by/GjBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2mZ-0000000G4sG-1KJW;
	Wed, 14 Oct 2026 17:28:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2mW-0000000G4rP-2vEh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:28:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D5741A122D;
	Wed, 14 Oct 2026 17:28:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2AF360368;
	Wed, 14 Oct 2026 17:28:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51E38103289C5;
	Wed, 14 Oct 2026 19:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791998921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9drWIXfr1DDCei/MMFdnXnXQjS0PR3I+D9u3gYliR1s=;
	b=DZTjr4rcD+U5hXiQ9kZTaTOKC2GXTRTIsMAo+WCZcrT6F3sSswagtAMUmWEUX12H0lBz8N
	xxd1/ThZHjPRScs61HupWe1i4jhO43uMK8JPmPScISePuBcl2XiFX5GHOTKmKVrOqrDRI4
	gERKpF9ZYqWmpBwtxonAeZnudDPMuAvCrAdnfrZWwsXd2YdD0Nf7rX0h4+/4k53Y6xk6tV
	HC8E8EL9m9E1bYVdRFtk6F5tfhFQnEYtBDfBGTv6oyLBwJcTXAd77IJzZ3w3YyD3G62O7D
	MdhwpTjrIdq3O/DiyxTYrHAhjZvDfKqdnv3xud/gF7Cciq2oz2omThfldbc1ZQ==
Date: Wed, 14 Oct 2026 19:28:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: rtc: Add property for Raspberry Pi
 5 RTC
Message-ID: <20261014172835a731fd1b@mail.local>
References: <20261014083016.332338-1-sander.speetjens@gmail.com>
 <20261014083016.332338-3-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014083016.332338-3-sander.speetjens@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_102848_878622_9B0E8EC7 
X-CRM114-Status: GOOD (  16.60  )
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

On 14/10/2026 10:30:15+0200, Sander Speetjens wrote:
> The Raspberry Pi 5 has a built-in RTC that can be battery-backed
> via the VBAT pin. When a rechargeable coin cell is used, the
> hardware requires a trickle-charge voltage to keep the battery
> topped up.
> 
> Expose the trickle-voltage-millivolt DT property so the driver can
> program the correct charge voltage for board specific configurations with
> the attached battery.
> 

You are missing a comment from Krzysztof:
"Commit msg could explain that you do not reference rtc.yaml due to node
naming rule."

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---
> V10 -> V11: No changes
> 
> V9 -> V10: No changes
> 
> V8 -> V9: No changes
> 
> V7 -> V8: No changes
> 
> V6 -> V7: No changes
> 
> V5 -> V6: No changes
> 
> V4 -> V5: As discussed with Conor Dooley, the reff to uint32 is removed
> and a PR is made on dt-schema adding millivolt to property-units.yaml
> 
> V3 -> V4: Add a reff to uint32
> 
> V2 -> V3: Fixed the firmware property naming
> 
> V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
> the existing raspberrypi,bcm2835-firmware properties.
> 
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> index 983ea80eaec9..dc71fd57834e 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> @@ -133,6 +133,11 @@ properties:
>      required:
>        - compatible
>  
> +  trickle-voltage-millivolt:
> +    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
> +    minimum: 1300
> +    maximum: 5000
> +
>  required:
>    - compatible
>    - mboxes
> @@ -144,6 +149,7 @@ examples:
>      firmware {
>          compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
>          mboxes = <&mailbox>;
> +        trickle-voltage-millivolt = <3300>;
>  
>          firmware_clocks: clocks {
>              compatible = "raspberrypi,firmware-clocks";
> -- 
> 2.56.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

