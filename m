Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214F8C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y4m2oNhStesOsdExay51x41WEAVR6u+DkhtiZRBVUk=; b=1zy4hftINb5Oy6x8Xje3LlnEbx
	xpGb95lI4i1/IKTZFlen/c7E0qZNTpGuvwEb5z8sKZPPH+LSBAuSGXPt71BSurSP+Yb8a/Hsd4gf9
	OV9K0JQ9DrSFV3t8kW4t9GBXdQiB2c3rfxkxE9ihOM8EoDZsn9LBx8RG558hLyJTJzrp74zw723Yp
	sMGIvSHfKBI/+CtI946rsTGQ51tlDjHXs8bwrVToBEJkEfIX7KCCxjfQ3P5xNDpasQi6IUT2oaCfo
	cC/AN8KmK0mwNu345pKIR4UUDXa4bj2paVX5dIRj62c61rY1aANoyy6VZJAPndwefiXBKIBJOZ0/w
	4OlA73bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5yN-00000001TLX-2LW5;
	Wed, 30 Jul 2025 12:31:55 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5Q0-00000001Oby-27Ns;
	Wed, 30 Jul 2025 11:56:26 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1753876582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8y4m2oNhStesOsdExay51x41WEAVR6u+DkhtiZRBVUk=;
	b=y6DRBdhiu+qSIxoztA1GbGn7XPYsEK7g2k1hOC00eGsYENYlg6RYiRkQXZZ1dN6HRHmjb8
	r20mMm1Vd8dfXhse/2jZIyNAjyfffkUllQaIIqv6ODYbDg1nljJnCCbbHqn8ay6piFIL1d
	8IGCVGpUcS3662UB/Flj6b1AeDS1NzraYij7U9RHoU5KXTH+3Mu1nrUbFxjDCAfHCi76EL
	OdxzcuE+OAX06M3KGSgKOifnZZ+A58w3QdW1bffsX0M/BmnfFxuUFHaQ/o+Brmx9i4mDy+
	CKXTRVdlG9yLSN+alCp9ioBBvsJI3kbxVmFxjbck1CGqjlKL6jkgfAlzC1irzg==
Date: Wed, 30 Jul 2025 13:56:19 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on
 rk3399-pinebook-pro
In-Reply-To: <20250730102129.224468-1-pbrobinson@gmail.com>
References: <20250730102129.224468-1-pbrobinson@gmail.com>
Message-ID: <2d4974a72a1a5910f2770528bcb8b997@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_045624_779393_8F41D560 
X-CRM114-Status: GOOD (  19.03  )
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

Hello Peter,

On 2025-07-30 12:21, Peter Robinson wrote:
> As described in the pinebookpro_v2.1_mainboard_schematic.pdf page 10,
> he SPI Flash's VCC connector is connected to VCC_3V0 power source.
> 
> This fixes the following warning:
> 
>   spi-nor spi1.0: supply vcc not found, using dummy regulator
> 
> Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for
> Pinebook Pro")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index 05c48cb09df6f..ee0e6c1947acb 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -978,6 +978,7 @@ spiflash: flash@0 {
>  		reg = <0>;
>  		m25p,fast-read;
>  		spi-max-frequency = <10000000>;
> +		vcc-supply = <&vcc_3v0>;
>  	};
>  };

Thanks for the patch!  This addition to the Pinebook Pro device dts
file is looking good to me.  I just checked the schematics of both
Pinebook Pro production versions, i.e. v2.1 and v2.1a, to verify
the addition.

I've got a couple of nitpicks, though.  First, using "Pinebook Pro"
instead of "rk3399-pinebook-pro" in the patch summary would be a bit
more readable.  Second, it would be better to mention the existence
of the second production version, i.e. v2.1, in the patch description,
to clarify that the DT addition applies to both versions, with both
schematics mentioned as references. [1][2]

Anyway, please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[1] 
https://files.pine64.org/doc/PinebookPro/pinebookpro_v2.1_mainboard_schematic.pdf
[2] 
https://files.pine64.org/doc/PinebookPro/pinebookpro_schematic_v21a_20220419.pdf

