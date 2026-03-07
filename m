Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE614FC9EE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ogfbg1M6Kwn9q0V8kWS6sHtl//2/A8S+4IAJsg6lKA=; b=1PmfPy0CNmj6Zn0i5u3l6N0Pgp
	6eeSyti1Zhdg4TkXjADPfhRMwCBzR+gTpvI8a3oACpL9BfCOeng5P6JrlcNz+IDB5nmrS1SjMnV8B
	siil9X1Q1NbfrTjxR+bzpnLTm6dZ3sMAO+9z6J1wO/e+vIQsHjaS3W7Cdfd/18Nd0h85mZng4ZgZi
	iXzcZ+DY5WApeaDKVf/w4NyJhtKjDgAAFjr8kPaOEi3t6X2wJ4J+oDwAQR7jE3RhRCTBJnw1ca9kF
	GHdZXtZvv4JKXDIzrA9xuYN/5c/XwnROCY58k+u1sCkN5XH4uTllz0reYIwKF9hSop77HJV9VVwb4
	xTC5uT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyowA-0000000569E-0Mwe;
	Sat, 07 Mar 2026 10:31:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyow8-00000005695-2Tz2;
	Sat, 07 Mar 2026 10:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D821F6001D;
	Sat,  7 Mar 2026 10:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AE8C19422;
	Sat,  7 Mar 2026 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772879467;
	bh=H0bhtWlTe74X5pdg6/C9tE7jpgoOT0G6XZ+1Urq0LdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lI+YeJ9GndcmufpeYFz2zlFcI2wvLofYk+q3JuqTNqoTvbVjAalw9iXWOJ6CD1vn6
	 ai8EjwgIQSPj/MTeA64q3cI2jk4l+6N4hOby4exBjvc5z9nOGLWYrlVQ5CrI2fVPCL
	 BCB/KOAVjbo8YN0hiePBi8i19fM202vvxrL2w9WFWH/zYVI40RmH3Wb4KkVs+ofMEk
	 uNJVxdL7MDUeffNAJE4Ml/19tmut4FuIv5fBWftUmILVZWZ9DsgAH+rnz+YYzpIgS0
	 uqaeW9Pxmq8q8KhIAcHie0R48RL49e+STbHc3hRQsMajUueXZFQPAUkAV+9Nip8G17
	 sQmEaaqu3QLHg==
Date: Sat, 7 Mar 2026 11:31:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20260307-strange-dinosaur-of-joviality-e6bc72@quoll>
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
 <20260306190156.22297-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306190156.22297-3-ansuelsmth@gmail.com>
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

On Fri, Mar 06, 2026 at 08:01:51PM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.


A nit, subject: drop second/last, redundant "documentation for". The
"dt-bindings" prefix is already stating that these are docs.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

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

...

This must contain the header you are also adding/referencing here.


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 364f0bec8748..d75f59118a9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -779,6 +779,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
>  F:	drivers/spi/spi-airoha-snfi.c
>  
> +AIROHA USB PHY DRIVER
> +M:	Christian Marangi <ansuelsmth@gmail.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

No maintainers for the header?

> +
>  AIRSPY MEDIA DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -- 
> 2.51.0
> 

