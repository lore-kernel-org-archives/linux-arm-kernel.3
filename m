Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD51CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6feVhl/WbyW4RkUuMaZ8jTOMx0aNRMOaPCXk+NnkC0=; b=LriBAE3vJCYj8q7v9SJLacNeiu
	5RFolp0iGiMulgkQo4TODcWRV1mIOTD9999JaoZLsDFV9m5hAet8y2eJHSjOvS3zF0beG1nH9we5j
	JxWoHq83U5qhOVnKXUNpi5BDQy+Z7rkGSHWekh0fpLH2fFY3NcjSLZL/kKlP36FcooNsmuUz/Oywa
	yZITYX2XBbhSnieekGl0yYY8q/tkt6ynvans4SV+rQbBOjb5osZ9XFJvt6hZrM4FPzHB86DOb1+Gk
	PntUIMYC4Hhpw6HjrvEB0YR33rIlrmV7+e3bKPanIhynXaEGCy9Npg2ayNCc4i+D2ToW6wVRpSX7c
	eFqPUteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLqW-0000000CCK8-0NJW;
	Sat, 13 Jun 2026 10:44:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLqV-0000000CCJw-067J;
	Sat, 13 Jun 2026 10:44:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D41140790;
	Sat, 13 Jun 2026 10:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53281F000E9;
	Sat, 13 Jun 2026 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347450;
	bh=v6feVhl/WbyW4RkUuMaZ8jTOMx0aNRMOaPCXk+NnkC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JeL2B7Il2rkaurY5b0dmZaGG8qobcTRBQhgHikVn7zb533OB+VLpUBGDs7qBVTsCr
	 morceHXuyslii8vyuIBw6tyCPTNxc4hbwERlc8drfYOUR5alFzaQLOXu5jlTeMCdSd
	 nP5LhF+p43EqamQdLhSIYh0C5hxidJnwHmErghpr1TIYW0nhY0zddPB2Cr43oiN0C6
	 TUD+S5mTzQMc0L4ZJE24PB1XowFts1DaXpxyy/fYptfGk40C4dM9aSB16ekjZ9W1i5
	 Ef5mh9rscvxljyuhr+7kJLh3rjZQyA0p6mtISWzG4BWDrsKu7eWXdG7pDY3/E+Mq9w
	 RgWaU8nL+PtBQ==
Date: Sat, 13 Jun 2026 12:44:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: Add UGREEN NASync DH2300 MCU
Message-ID: <20260613-elite-panda-of-success-75eecd@quoll>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-2-ab8db1617bc0@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-2-ab8db1617bc0@flipper.net>
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

On Fri, Jun 12, 2026 at 07:34:15PM +0400, Alexey Charkov wrote:
> Document the UGREEN NASync DH2300 embedded controller (HC32F005 MCU),
> which is responsible for gating the SATA drive-bay power rail and
> providing a hardware watchdog.
> 
> This is based on disassebly of a GPL binary from vendor firmware for which
> no source code could be found, so parts of it can be inaccurate. Only
> the power gating function is confirmed.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  .../devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml | 62 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
> new file mode 100644
> index 000000000000..847970c609cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml

Place it in embedded-controller

> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ugreen,dh2300-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UGREEN NASync DH2300 embedded controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@flipper.net>
> +
> +description:
> +  The UGREEN NASync DH2300 NAS carries a HC32F005 microcontroller on I2C that
> +  acts as a board embedded controller. It gates power to the SATA drive bays
> +  through an internal register and apparently also serves as a watchdog
> +  (unconfirmed, as vendor kernel sources are unavailable, works without it)
> +
> +properties:
> +  compatible:
> +    const: ugreen,dh2300-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulator:

This should have specific name matching the actual regulator name, e.g.
pin.

> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      The SATA drive-bay power gate controlled by the MCU.
> +
> +  watchdog-gpios:
> +    description:
> +      Optional GPIO line used to ping the hardware watchdog function of the MCU
> +    maxItems: 1

Best regards,
Krzysztof


