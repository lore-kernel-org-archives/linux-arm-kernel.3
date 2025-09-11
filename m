Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RmRZf9ZN1qFLW6+btemuGyf7rW4veZ9+qaLWx/0nFc=; b=CsRMNwXD2FvJ0Zz/8jisO96A8e
	A0ILe/0jaVSaIc7R32DlRm5Bp8p/vrw4pKmK1aZ1XOmd6YcqSvYiYAkwm1J331NjdEGqAO7iXmLpT
	bheygfnpRbdts/f21HnVyhFBav+lNOV9hVO0JuzPhrdQ0vOIncb/vFm9AmRnQGTB88xknJop3wc9L
	F7vnxNsb7kZn+qtNzDRulo4Z3NytIW97jLHaJOL+MbdHAISMv0UM5RImYcD6bvuMta7mE8BNROnuf
	iQwiTvdRPSu7qK/VTlWTyr0cTF0ELYwOC/cCgR8WD+w8x06N0yKqKvKJ2ZLnyQs4H+QimZNhKXQnI
	xSv2BZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVxo-000000007L5-3Wib;
	Thu, 11 Sep 2025 01:19:04 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVxl-000000007JD-26qr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=3RmRZf9ZN1qFLW6+btemuGyf7rW4veZ9+qaLWx/0nFc=;
	b=g1xf8/Kk96D+nhvpAAMglx6bg62mJo7C01X9Baabluk5kI8Vhew44CTTCE2gPS
	Gug2mn1yubXbDZZMks/F3HTMSpLKDeFglg0rT3XbrW1OhlEaQcamSwdP0/gESPo8
	PUEbunxNocZP2AJLxOIuKTveghzGMDjh6wF3x3o9O+psY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3ZdlvI8JoJilfBA--.45492S3;
	Thu, 11 Sep 2025 09:18:41 +0800 (CST)
Date: Thu, 11 Sep 2025 09:18:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
Message-ID: <aMIjbtfLTzCMZZjV@dragon>
References: <20250822140742.3352401-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822140742.3352401-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgA3ZdlvI8JoJilfBA--.45492S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWkWr1DGr15AFyxWF4kWFg_yoWDtrb_Aw
	4xua1qyan5tFnFqan0qrWkWr9IgrWUCr13Jr13Wr4kJF97Zr4DtryDtF93WrZrCa9rKrW3
	Awn8XryFy34akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbRBTUUUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRGvFWjCI3FnMgAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_181901_919775_8DADD5AB 
X-CRM114-Status: GOOD (  13.90  )
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

On Fri, Aug 22, 2025 at 04:07:41PM +0200, Alexander Stein wrote:
> MicIn is connected to IN3_L. Add routing including the Mic Bias.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

It doesn't apply to imx/dt64 branch.

Shawn

> ---
>  .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> index 2d4eaf9c02b88..1924d51bcbcd8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> @@ -245,6 +245,13 @@ sound {
>  		audio-asrc = <&easrc>;
>  		audio-cpu = <&sai3>;
>  		audio-codec = <&tlv320aic3x04>;
> +		audio-routing =
> +			"IN3_L", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"IN1_L", "Line In Jack",
> +			"IN1_R", "Line In Jack",
> +			"Line Out Jack", "LOL",
> +			"Line Out Jack", "LOR";
>  	};
>  
>  	sound-xcvr {
> -- 
> 2.43.0
> 


