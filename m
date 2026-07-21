Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAEAC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sP7MrBG9kB7jM6qGOj+XgMqABnnG1TCj8gJkGQNSks=; b=p2dYbIDNJu+rlXhZPPrE6IyeOc
	wAnXsrp8W786BAIAkzoHc7HG43tehRRzTe/4ySOZEXWIFdrUqw6F5z0XwCVzsdS2nwlEZJCVhGRAt
	KRIH1tn90eld0JVS3EGYnUTWK/q8Rf/tkfEbVyezaG+I03Kex+mUxQEfNZ0W1W95XXOWVeG/i+VX5
	wN/yJpPLnEeZq/ibV7AkW+5/+dPem+DUm2mFRQtoCFeiEok9IgPSKOMSzN48v4IQZCermS/WkIzxo
	/I2W4ZX/ogvlp0VNXt4dNPMivPh67b9IrOCB3Wx5azzCT2vEY58fDEIwhPQQOhQvd2zR8UcWZFz7s
	IZoBBAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5eZ-00000008lur-3xLC;
	Tue, 21 Jul 2026 08:16:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5eY-00000008luC-0ut5;
	Tue, 21 Jul 2026 08:16:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D0C860A98;
	Tue, 21 Jul 2026 08:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FCA1F000E9;
	Tue, 21 Jul 2026 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621797;
	bh=1sP7MrBG9kB7jM6qGOj+XgMqABnnG1TCj8gJkGQNSks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sdvp391WLQldmXz+4YPdhsdbstRVrkVPeGU4lOTAB3d0VMsb/C7bFoA6YCgZllI9q
	 KdkYZAanur3GvyruRTwGsgIUoHS05j3XqlRzuiLpWTQdGyGEcqQWTKYtY9j0R7dPYW
	 i4FwpeQV/Eohyark05xX3eNRA7lui9dNGb1q5hS3YAKoVGx6ZOKkc9ctmRtTQdbQ4F
	 XyziqUrN2pWIR5jckDoGGXcg8szYmzkU+ct6ypRPc0hlkfN9fueeBHRW2lL018xbnM
	 8v5qnOFpHX2kbgEPuJ3eEE9YtngEgKEN6YFNRPXu8Qzmimk4o1kJFoWP6sgU7BBasp
	 nDapi9ohxjaIw==
Date: Tue, 21 Jul 2026 10:16:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Fabio Estevam <festevam@nabladev.com>, devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffy Chen <jeffy.chen@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yao Zi <ziyao@disroot.org>, huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: rockchip: grf: Add RV1106
 compatibles
Message-ID: <20260721-didactic-tan-dodo-112ffc@quoll>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-4-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714193656.2196447-4-sjg@chromium.org>
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

On Tue, Jul 14, 2026 at 01:36:40PM -0600, Simon Glass wrote:
> Add the compatibles for the general register files of the Rockchip
> RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
> controller.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Drop the grf-cru clock-controller child and use the syscon-only
>   group for the main GRF, since the CRU now provides the MMC phase
>   clocks
> - Use a single gpio-ioc compatible for the per-bank IOC blocks in
>   place of the ioc and pmuioc regions
> 
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2cc43742b8e3..fd9235ac1334 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -64,6 +64,8 @@ properties:
>                - rockchip,rk3588-vo1-grf
>                - rockchip,rk3588-vop-grf
>                - rockchip,rv1103b-ioc
> +              - rockchip,rv1106-gpio-ioc

And this also answers my previous email (pinctrl/gpio bank): you have
one GPIO IOC, not multiple ones, although commit msg tells different
story. Confusing. The compatible here defines register layout (see
writing bindings - it is explicitly documented there) so do you have one
device or multiple with the same register layout?

Best regards,
Krzysztof


