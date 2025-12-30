Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF5FE92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwLimuBH2pouyJ0zPW8xHExLdPzunz5tvUiU1WuWwyc=; b=X8VxHJ/QnFLJVp6SNN4MOyOe4g
	qZzr3+FFxSu2FNm38Lcqw7bfjHJBuLKchC8b5it0/60RnU5CfXRN5YYQBpPzuZet9eX9euEiHskIT
	ERFrY3wSbVUkTxbRRvnHV9O9sHdMJK9/Zwqo6pHcr0hRuRIH3s77ETO29asiyy2n++2oeJUSneltA
	gEwv/GIU9HuNTI/FfQF/GS63RyPRlJ1EB4+avnUSeaib9D2T3HIS0I0Z/7kJ9DPNcPW+WA8s5sFaS
	YaHNqduLyzF2SB3VSAR+vVoptmxk8uI6Dhwxrb4NyBTESIT3gql+Kpr6mP5kOfLcuS2jsdD4Tqd+d
	jAonJ1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPgk-00000004KRK-1xCO;
	Tue, 30 Dec 2025 02:42:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPgj-00000004KRD-38Tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2D306000A;
	Tue, 30 Dec 2025 02:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE8BC4CEF7;
	Tue, 30 Dec 2025 02:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767062540;
	bh=ex91xnF6MkNj7hiFlM7l/hy/nOh8ImjY8BhkJIjbKtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFqlen2QR6aChTne53MHAx91TnowKZLIlOlNnsjTxmoHllG26h/2ZCr8aafvipojx
	 q5I5cUBDSmHm9wtRx4kQwQCGTysMxIPbBJjAk5a2sHRn1E7LMKHumemKcmylnJkMtS
	 mfuldetu8tElRCdQqEndNX/eQwj0m16QqH8BJf6/E6uaGaWCUCIzc6VS9RX+rDMRqB
	 VtmwDDCKGYe4a1VY7tIA0+bgM6oOuNmZs0EucEpgQXW3FnhzuzSXDWRKiokVLtjURh
	 a2A6jcZP21dofp/0uzef+YJLdcy6lymNAls30E9f7djJUsO996HPVYjNTfRfVrmem2
	 Ds9Og6lLevZ3Q==
Date: Tue, 30 Dec 2025 10:42:14 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: imx91-11x11-evk: Refine label and node
 name of WM8962
Message-ID: <aVM8Btd9CYEfg9zz@dragon>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
 <20251203070605.1868821-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203070605.1868821-2-chancel.liu@nxp.com>
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

On Wed, Dec 03, 2025 at 04:06:01PM +0900, Chancel Liu wrote:
> Refine label with "wm8962" and node name with "codec" to follow
> devicetree specification.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> index aca78768dbd4..313ebc7e8a9c 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> @@ -132,7 +132,7 @@ &lpi2c1 {
>  	pinctrl-names = "default";
>  	status = "okay";
>  
> -	audio_codec: wm8962@1a {
> +	wm8962: codec@1a {

The node name could be better named as audio-codec.

I fixed it up and applied the series.

Shawn

>  		compatible = "wlf,wm8962";
>  		reg = <0x1a>;
>  		clocks = <&clk IMX93_CLK_SAI3_GATE>;
> -- 
> 2.50.1
> 

