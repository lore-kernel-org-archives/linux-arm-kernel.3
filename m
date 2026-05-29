Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD23CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MezAljbMtu/a/IWnbTDAtFD/p1r8DFJmzsXD7QfO5sE=; b=18uDEFUplOmOInyeqAiApZ8Yd/
	xI2XkVXjqf+Rcydn9+jyR1gbuXfc7tk4C7iNqlrN+o2XJBb+ZRPctzDKud0kQAMAojNqz5ssJUZ9E
	mXWcqN8jPmBmPdLj0YacPcoHWNZRnucl4B29Emrvlgb/DmHVxGhD4+pa/MHjbkI58IX/BSuqf6LST
	cWmkdlpfM4SJcakbYAbSEspLz6eGmIUNmMuzpubPnfzbGMHXzrnXm2kgwiW5RHeWubrvCrbUn9d+5
	iDUcmFRQAKGZx1s1HFCIE6SFxyOyhLUMbywm1IVL5DstV/vApQ4Q8Tp/A8Q9HkNUHCzN+WFSlRuLW
	ohPuaNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1oL-000000085sh-2IPn;
	Fri, 29 May 2026 18:19:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1oJ-000000085s7-1rx8;
	Fri, 29 May 2026 18:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MezAljbMtu/a/IWnbTDAtFD/p1r8DFJmzsXD7QfO5sE=; b=iudeHZxJStlryOmQAUHhsleY6G
	6XU21yner9VdSVJz2LnIP66KoBRM3GZ3FMalVNbytmY4chArURs0O4Um31YsLhxSP9UTyIuvArUnr
	pBGSlvQyxFlIV9a7MRAPChCJ6sewkACEUUtK80hGptBuDlq5bOXMgBph63rx5Y/70Pg9cClKVjBbe
	alBOV5l6R8Yivt0+ULO6bzAQiwKRScSZ1Po2AjcaSpWhJKxpkZV6B974c8sCnfmy1R5ppPEgk+xjg
	2/2M59Qq6ylmGuu8I5GcIDs/cUXizKa+cYPYXKQ+yGa3OJYrwUYgV9u0OuW8Q/aC+PgkFYeKPlDNb
	H3E2FJjw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 MidG971 <midgy971@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Midgy BALON <midgy971@gmail.com>
Subject: Re: [PATCH v2 1/4] accel: rocket: Add support for Rockchip RK3568
Date: Fri, 29 May 2026 20:19:50 +0200
Message-ID: <5132269.NnENhoQgcM@phil>
In-Reply-To: <20260529155824.3099831-2-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
 <20260529155824.3099831-2-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_111955_483678_5EDC9493 
X-CRM114-Status: GOOD (  25.59  )
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

Hi,

Am Freitag, 29. Mai 2026, 17:58:21 Mitteleurop=C3=A4ische Sommerzeit schrie=
b MidG971:
> From: Midgy BALON <midgy971@gmail.com>
>=20
> The RK3568 has a single NVDLA-derived NPU core (0.8 TOPS), the same IP
> family as the three-core RK3588 NPU already supported by the Rocket
> driver. To accommodate both SoCs:
>=20
>   - Introduce a per-SoC rocket_soc_data structure carrying dma_bits and
> an optional noc_init callback, plumbed through of_device_get_match_data().
>   - rocket_device_init() now scans for both rk3568 and rk3588 RKNN cores
> and picks the narrower DMA width (32-bit) when an RK3568 core is present.
>   - Add rk3568_soc_data and rk3568_noc_init() handling the three RK3568-
> specific initialisation steps that must run after the power domain is
> on and clocks are enabled:

if you need bullet points to describe your patch, that strongly indicates
these need to be multple patches.
I.e. the move of the relevant parts to a per-soc data is one patch
(and only having the rk3588 soc-data in that one).



>=20
> 1. PVTPLL initialisation: The NPU uses a PVTPLL ring oscillator
>    managed by TF-A via SCMI for rates above 400 MHz. A two-step
>    clk_set_rate() sequence (600 MHz then 1 GHz) forces two SCMI calls
>    to TF-A even if the kernel clock framework would skip an unchanged
>    rate. The PVTPLL must be running before the NPU NOC bus will
>    acknowledge a de-idle request.
>=20
> 2. Explicit NPU power-on (PWR_GATE_SFTCON): The RK3568_PD_NPU power
>    domain is marked always_on in pm-domains.c, so the generic power
>    domain framework power_on() callback is a no-op. The NPU hardware
>    can remain power-gated at boot. Writing bit 1 =3D 0 to PWR_GATE_SFTCON
>    (PMU offset 0xa0) explicitly powers on the NPU hardware before the
>    de-idle request is issued.
>=20
> 3. NOC bus de-idle: Disable NPU NOC auto-idle (NOC_AUTO_CON0 bit 2),
>    request de-idle (BUS_IDLE_SFTCON0 bit 2 =3D 0), then poll
>    BUS_IDLE_ST (PMU offset 0x60) until bit 2 clears (bus active).
>=20
> The RK3568 DMA address space is limited to 32 bits, as the NPU AXI bus
> and IOMMU page walker cannot address memory above 4 GB.
>=20
> All PMU accesses follow the RK3568 write-mask protocol: upper 16 bits are
> the write-enable mask for the lower 16 bits.
>=20
> Signed-off-by: Midgy BALON <midgy971@gmail.com>

[...]

> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/=
rocket_device.c
> index 46e6ee1e7..0ed8251c8 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -27,6 +27,9 @@ struct rocket_device *rocket_device_init(struct platfor=
m_device *pdev,
>  	ddev =3D &rdev->ddev;
>  	dev_set_drvdata(dev, rdev);
> =20
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3568-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
>  	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
>  		if (of_device_is_available(core_node))
>  			num_cores++;
> @@ -37,9 +40,25 @@ struct rocket_device *rocket_device_init(struct platfo=
rm_device *pdev,
> =20
>  	dma_set_max_seg_size(dev, UINT_MAX);
> =20
> -	err =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
> -	if (err)
> -		return ERR_PTR(err);

for both changes in rocket_device_init():

rocket_device_init() gets called from the main probe function, so before
calling rocket_device_init() you can already access the specific soc data
from the compatible and can derive both that for_each above, and the dma-
width, directly from that.

No need for that loop below.

> +	/* Use the DMA width of the first available RKNN core.  RK3568 cores
> +	 * are 32-bit; RK3588 are 40-bit.  If both are present we pick the
> +	 * narrower mask.
> +	 */
> +	{
> +		struct device_node *n;
> +		unsigned int dma_bits =3D 40;
> +
> +		for_each_compatible_node(n, NULL, "rockchip,rk3568-rknn-core")
> +			if (of_device_is_available(n)) {
> +				dma_bits =3D 32;
> +				of_node_put(n);
> +				break;
> +			}
> +
> +		err =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_bits));
> +		if (err)
> +			return ERR_PTR(err);
> +	}


Heiko



