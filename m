Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA36D5B84C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 05:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5hIEno3hSw6Bs0nElkBzz+S0GGKfeU4NL68Zcym0TA=; b=f7JimbLDnRICG00RqHZZeEn9XE
	BkT0eAfJ4XT2BkhQwnDUBmMFzCwUaQpkramlxJfsYn2DFTMnZ6VDoa3nyZPSmnuS73bSJ0UjP5EGe
	Vir3wKoaJWKCna+lE6+qBJNrjHGuWrLq3BdQtnvk0eyJtGed4Ws5jl9cNAJ391F8vTB+B52U/U+Zb
	xl/mcXIPgn8vzVnRBxUGW3bw48TDpA9l4AaCqmjWFmxNldbvtZp4Djiy/nBMQk1kI22HvKZ5Bw6fi
	tmKK0ptxAYkedCvr6cP/hvtwLpaWeaiebYNm1IZOiGTY96Y6xs+jsD/WjWJgAVNKBaOBdi7gdciZz
	p2Jvo0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fGJ-0000000DJDH-0Hvv;
	Tue, 29 Oct 2024 05:59:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fEg-0000000DJ5N-3gJq;
	Tue, 29 Oct 2024 05:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y5hIEno3hSw6Bs0nElkBzz+S0GGKfeU4NL68Zcym0TA=; b=NbrwfI7aCxqhCar/MFfBqte2mf
	VGpnwyAfOfOh9lRUXfqFcG42dV5YmDVFqRY8J6BHuxzjYZktxw94kcQstkaCDifpGDCKhfJ28j9ME
	1hEM7NxgPSOWMhvNMbTOv0+my+QF6FOLbzvtDnVxyMDLLxm0lsrObclwmLDpcT0g8koFLu+EzSFqc
	oizBkhahfbGiY7y16s/95CbXy/nKXo2yYrEG0sAxBGhJ8YJXNKecY13vxY1KcN65YDl3/4Bo4cDz4
	D9RnOzStcM0gxOrICT6d92LrRXZejeZB7efsDRjKfZonPNUp1mub0wTCuTODyBTntFmIHNc7SCA0n
	vledpmHA==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t5fEb-0005Ts-O7; Tue, 29 Oct 2024 06:57:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Yashin <dmt.yashin@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: add Banana Pi BPI-P2 Pro board
Date: Tue, 29 Oct 2024 06:57:39 +0100
Message-ID: <5957455.DvuYhMxLoT@phil>
In-Reply-To: <20241028213314.476776-3-dmt.yashin@gmail.com>
References: <20241028213314.476776-1-dmt.yashin@gmail.com>
 <20241028213314.476776-3-dmt.yashin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_225746_971586_8053D8CF 
X-CRM114-Status: GOOD (  16.74  )
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

Am Montag, 28. Oktober 2024, 22:33:13 CET schrieb Dmitry Yashin:
> Banana Pi BPI-P2 Pro is the SBC made by Shenzhen SINOVOIP based on
> Rockchip RK3308.
> 
> Banana Pi BPI-P2 Pro features:
> - Rockchip RK3308B-S
> - DDR3 512 MB
> - eMMC 8 GB
> - 100M lan + onboard PoE
> - 40 pin and 12 pin headers
> - AP6256 BT + WIFI
> - TF card slot
> - 2x USB 2.0 (Type-C OTG and Type-A)
> - Headphone jack
> 
> Add devicetree binding for Banana Pi BPI-P2 Pro.
> 
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 1e3eceb266b7..0c85c15d5c04 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1104,6 +1104,11 @@ properties:
>            - const: rockchip,rk3568-evb1-v10
>            - const: rockchip,rk3568
>  
> +      - description: Sinovoip RK3308 Banana Pi BPI-P2 Pro

isn't BPI the short form of Banana Pi?
So the naming is sort of double and I'd expect it to be
    Sinovoip RK3308 BanaPi P2 Pro
similar to how the R2 below does is?


Heiko

> +        items:
> +          - const: sinovoip,rk3308-bpi-p2pro
> +          - const: rockchip,rk3308
> +
>        - description: Sinovoip RK3568 Banana Pi R2 Pro
>          items:
>            - const: sinovoip,rk3568-bpi-r2pro
> 





