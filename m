Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF93EDEBF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klDi2j33s2Z1BYzA7gT3sJcyM8DyJt/FGOXGD3b8PME=; b=laxe+RuAhWYVtjyPVCZIK4gl8J
	eJP1zZ6wErnpi4/k0Sb+z7oT6N9AEFVssSM7s84DyDKM9TdDKk9j/JuHZnvWJv29eevpPwMb+zHtA
	chUayqMTJRRQrYIAILfOqS/4OqnDDFoYZbP+LAlTRTsHOSeVqhT2LMKDqw+cc8t12u/oF9S4X9jV4
	ClZXJqjw2hBJNhFgyHtRV3+tBgBiHyVDgSUIW2ek7ffafJaL11Rp+PdyogYuVJNfps7Vi2XQX7bru
	PHV/I7XYZ/lO2E7LuafL+vGXk0LslAL3DkdpdAEeyWqLXafJ8+1eFV1wP8rwp4wC2jWyVK8v1SWae
	MFhsBgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxZjC-0000000G82K-0bGR;
	Wed, 04 Mar 2026 00:04:38 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxZj9-0000000G81Z-3HXB;
	Wed, 04 Mar 2026 00:04:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vxZiz-000000008Ax-1oPl;
	Wed, 04 Mar 2026 00:04:25 +0000
Date: Wed, 4 Mar 2026 00:04:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt
 port to lan5
Message-ID: <aad3Acno6QWPbw7T@makrotopia.org>
References: <20260303202006.37515-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303202006.37515-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_160435_844493_EF393B2F 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, Mar 03, 2026 at 09:20:06PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> It turns out that the label mgmt confuses users and now official case is
> released where the port is labeled with number 5. So just rename it to
> lan5 to follow naming convension (lan1-4 from mxl switch and lan6 for lan-
> combo).
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Confirming that the port is labeled as "5" on the official case sold
by SinoVoip/BananaPi.

    5
[=     =]
[ RJ-45 ]
[       ]
  1G LAN

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

>  arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> index a48132f09411..1175ee156cb3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> @@ -207,7 +207,7 @@ &gsw_phy0_led0 {
>  };
>  
>  &gsw_port0 {
> -	label = "mgmt";
> +	label = "lan5";
>  };
>  
>  /* R4Pro has only port 0 connected, so disable the others */
> -- 
> 2.43.0
> 

