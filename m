Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EDFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 23:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhUPKqB3Z6gxAzqHQ1FtfaODqlcrqGTZeJh5Ki7nLyI=; b=0mx6jHJqLBK9yevUQ8+mJVRpXD
	K4ngJ5JM9FqQkCebPAN/4v/PJ4mooF3X1GUJT24cYJHi+XTzF9l2xsVirJnT60B10XvSlaaLnkbwn
	VLpDd2BdL7yTMlTdVwQlmc+1S2jO3SC6djUZqYrZ9zdOHlBxs7i69dog1Go0BGgbfaw6KgSVIoh5p
	H6ydC0yexWDvxNLbe3Ys3ArF3/qaUQg3haEo0gB8rt6POtKYKvOdXwAJokWYIGoln2cD3a1Ehb9p8
	LCGrvY00QFeG9NIkBJn0lI50AAj3tMXm4T5h9ub/+jNRChLQrwk0o+34m8dXHVI1KxeydpaGVP9qb
	MJB7nINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrZd-0000000EENG-1Zus;
	Fri, 03 Jan 2025 23:59:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrXW-0000000EE8I-21i9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 23:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11B111480;
	Fri,  3 Jan 2025 15:57:42 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098BD3F59E;
	Fri,  3 Jan 2025 15:57:11 -0800 (PST)
Date: Fri, 3 Jan 2025 23:56:00 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: sunxi: Add
 gpio-reserved-ranges property
Message-ID: <20250103235600.7834a6a6@minigeek.lan>
In-Reply-To: <20250103204523.3779-4-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-4-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_155714_582892_B330DA3D 
X-CRM114-Status: GOOD (  18.05  )
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

On Fri,  3 Jan 2025 20:45:19 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi,

You would definitely need some text here, at the very least this "90"
deserves some comment.
But what is this property meant to say, actually? Looking at the DT I
guess you want to mark GPIOs as not connected/exposed or such? I don't
think this is the intended purpose of this property, it's more for
describing ranges of GPIOs not implemented in the GPIO *controller* -
say there are 18 pins on PortA, but pins 9-12 are not implemented (no
registers) - check Documentation/devicetree/bindings/gpio/gpio.txt.
But keep in mind that the Allwinner pinctrl device does not use this
kind of per-port binding in the first place, and I wouldn't know of any
SoC having non-consecutive pins per port anyway.

So I think this is not needed, not in this binding, and not in the DT.

Cheers,
Andre

P.S. Feel free to discuss things in replies to emails - that's why we
have those mails. In the past you seemed to always answer very quickly
with a new series, even though you seemed to disagree on some things
(RTC?)

> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 450240570314..24b90a5538d6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -83,6 +83,11 @@ properties:
>  
>    gpio-controller: true
>    interrupt-controller: true
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 90
> +
>    gpio-line-names: true
>  
>    input-debounce:


