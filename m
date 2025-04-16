Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99A3C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGJOBV2NCbibTwnn6S0LQ3XdHwwjhkuTmDxeIQQsE7Q=; b=YYqdOT4QVUdiyYpEgCPi7QpEJ6
	F3mYRUFJNDc7kwIRptzkhH+8/shlHl3zX/vgF4tSHjn77XpmARu6aDrzdE18Vm6O9OqvBsq/2OFPW
	b4ziFMhhCswboHFZFybdFYWTa2jPq+21grM2qwpPKClKAPdv2Bb5mg4KZ960utTe7Nlc/GtS4dJIB
	oH48DkO/KTGo/np3eteOtRIfNYXsMxt1I1U/W4RteJGU9UbNO2o84AC9ejRWKhobpDs9vAnb+1GRO
	/Bzlwy79x7tSvQ3TKZ2B0ihYEvTXUsk+KZ2pSvj/j/j15shZtPtTSIh/5llTExYFEhlO0nuT+ls92
	B1fksXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u505L-00000009Cue-2sUO;
	Wed, 16 Apr 2025 10:33:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zjt-000000095cc-1r0r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:11:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DA5D152B;
	Wed, 16 Apr 2025 03:11:23 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 867EE3F694;
	Wed, 16 Apr 2025 03:11:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:11:18 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250416111118.2afd8f89@donnerap.manchester.arm.com>
In-Reply-To: <20250416100006.82920-1-amadeus@jmu.edu.cn>
References: <20250416100006.82920-1-amadeus@jmu.edu.cn>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_031129_531751_3CE689C7 
X-CRM114-Status: GOOD (  16.27  )
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

On Wed, 16 Apr 2025 18:00:06 +0800
Chukun Pan <amadeus@jmu.edu.cn> wrote:

> According to https://radxa.com/products/cubie/a5e,
> the name of this board should be "Radxa Cubie A5E".
> This is also consistent with the dt-bindings.
> 
> Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Indeed, thanks for sending a patch!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> index 912e1bda974c..03c9a9ef5adc 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> @@ -8,7 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  
>  / {
> -	model = "Radxa A5E";
> +	model = "Radxa Cubie A5E";
>  	compatible = "radxa,cubie-a5e", "allwinner,sun55i-a527";
>  
>  	aliases {


