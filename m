Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F760D43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIHIHPfH6OgeKiARQYIOZs8H5AMrRFipvkUG3E4Iwp0=; b=A/nbrPw3ezOAJ79CLMoWSD4lxz
	agktKj6FmEu6vi3bhRDi9ty9Am9BmqMBCalU553FUPYF7rnRBZzEXct5aUNMBVCI3zaRGqbTalb5R
	H31VZHE0hOSc4bwe3asiKP08h/dNfG/WTyvFmNg2LbxgZkK0rSfr9SaFfy2R62EcCuMmBx4UIo0k9
	5fy3QyUPkxTmXfma3ssrTG8Em3/vR5QtXaGetQ/vA9P2lkYX1FhTf6k6WSb6q+D23HxcsDyP4Ht0u
	5FcWfoad34jtdckpL1qxMIcvKeTatiQ5JitdgjGY5/Qm+2LoEQPkAY8Pn/DBRt2yuvp7DV6u0Dy0N
	P0Vd7Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t953M-00000007Y7d-27Ug;
	Thu, 07 Nov 2024 16:08:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t950A-00000007XcE-36Ow
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9B0BA4481F;
	Thu,  7 Nov 2024 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C94C4CECD;
	Thu,  7 Nov 2024 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995493;
	bh=++Ve2R0sTl3/Af3ywbFC4oo8hw4a8zRpz8+lgtmrgu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHHwuF4fxfRW3tQjxVEZ4VJfnCvaN1TO837iTx6nKNtwcVYVhMgPP2hylh24GcwL4
	 a6i0fd0+GhfSvKYhOIdoltsV0KhycO6jLLedxhAPHSjvC95vZQL++eY42jjVwrgiGt
	 YCAkX6I5DoUZUY5usnPt8tbbPqCfjJP4iJXf+rN6lvA4qnu75YO9vh5Jd+u4lcICag
	 xT0CrlMrtiGM7uU7lnm1/HhWRrgdZ5YPDcwmpBpJZRZhY1Nv0EB/g8r3KKlOOl/C+i
	 qYSWy9OEcAV0RTMlHQglL1+PAzLO1mOGd+4WDzY//q4094mwQ9R+RvEw9L7kCCsK5r
	 dsPqx893IaLPQ==
Date: Thu, 7 Nov 2024 10:04:51 -0600
From: Rob Herring <robh@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <20241107160451.GB2770783-robh@kernel.org>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_080454_934302_E9D58E55 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"
> 
> These issues were identified using the checkpatch.pl script.
> 
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-

This and...

>  .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
>  Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-

...this I'll take. The others need to be converted to schema.

>  Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index d82c32217fff..530420475a4f 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -304,7 +304,7 @@ pins 50..69.
>  It is also possible to use pin groups for gpio ranges when pin groups are the
>  easiest and most convenient mapping.
>  
> -Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
> +Both <pinctrl-base> and <count> must set to 0 when using named pin groups
>  names.
>  
>  The property gpio-ranges-group-names must contain exactly one string for each
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> index 8b9388cc1ccc..1983d7eabd2b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> @@ -43,7 +43,7 @@ Read parameters:
>   - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
>                          Mandatory, except if devbus,keep-config is used.
>  
> - - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
> + - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
>                          to read data sample. This parameter is useful for
>                          synchronous pipelined devices, where the address
>                          precedes the read data by one or two cycles.
> diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> index 6581478225a2..1bc655d285ce 100644
> --- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> +++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> @@ -15,7 +15,7 @@ Properties:
>  
>  - #size-cells: Must be <1>.
>  
> -- ranges: There must be one one triplet of (child-bus-address,
> +- ranges: There must be one triplet of (child-bus-address,
>    parent-bus-address, length) for each active chip select.  If the
>    length element for any triplet is zero, the chip select is disabled,
>    making it inactive.
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index 6904072d3944..500b76ba2ab3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
>  own binding.
>  
>  The common pinctrl bindings defined in this file provide an infrastructure
> -for client device device tree nodes to map those state names to the pin
> +for client device tree nodes to map those state names to the pin

Actually I think this was correct. See "client device" used above. 
Maybe "client device Devicetree nodes" would be a bit clearer and use 
the right form of Devicetree.

Rob

