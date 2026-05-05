Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D029FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbcTkEPCAgd6R4MFZQ+L2NjbJTyupiBIV3wUCIEbFv4=; b=omYa1LWnFVbeadJN5L1PKf/jHs
	jPIJw+gL46fpZogfigcNQua/R2+9SWAYLgeDY+X62XNMTjmtf0STj+PcpzPh6HXB5QDzMmUcWUbmZ
	C55JVv3TA6ZadarTbWoC2AsR3wPYGwZ5s5lMdcIe8L8MrhvJxuvJ0T6waJyN+yQnuGMtY+wsKhM00
	ttm/bxzYPm0cIUSScd65fKR6bZPHnR/M5jowEsuvv7nqNVUyc2fAx62n/WOoZo+09GMEJE7Q67A0Y
	vF0fLAMka4PQ8Tyeuwzi1XBZpNDflk5jgh2dLOkoFZrlh4qMblaWV5hsZFulYidqlZivhBzTYiBop
	vOF2OUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDdr-0000000G0iM-1ed1;
	Tue, 05 May 2026 11:08:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDdn-0000000G0h8-1Ej4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:08:41 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 4BA2D1FC1A;
	Tue,  5 May 2026 13:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777979310;
	bh=HbcTkEPCAgd6R4MFZQ+L2NjbJTyupiBIV3wUCIEbFv4=; h=From:To:Subject;
	b=r5Gx+ozA/g/XpULNnrqSG0AN0IiIp2qSeRKjZJvtfERzakuX1fLcenY6HdByg+Qae
	 81OsHgf9EBxhM4jhFFHxzMVEc4/OK5vgouGu8LI0YrEKWw+1diTEka/5S0UwSHYXSw
	 Wl9QlRTbcZDjwlWSX4Bd2Q2go7rRt/q0BkEYvgO2ZWyx9EvCsxjwe+FlhQ6GrByBhY
	 9BNZgVxuy6RtMO0ptleOwatK2nCzHgIoEGpHPiZe8JEFlj5XiNiB77cv1I1PiqkjTj
	 FK/9RKzg8xmSc5qWPeqksTWI+96u6z0QlKZVSU6EB7VP9qecse+aWtiNPDU8ubHkoe
	 JnNeKMj2wTKlA==
Date: Tue, 5 May 2026 13:08:25 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, josua@solid-run.com,
	w.egorov@phytec.de, matthias.schiffer@ew.tq-group.com,
	d.haller@phytec.de, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, emanuele.ghidoli@toradex.com,
	ernest.vanhoecke@toradex.com, rogerq@kernel.org,
	eballetb@redhat.com, robertcnelson@gmail.com, afd@ti.com,
	u-kumar1@ti.com, stable@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luis.parga@ti.com, srk@ti.com
Subject: Re: [PATCH 07/13] arm64: dts: ti: k3-am69-aquila: fix USB clocking
 for compliance
Message-ID: <20260505110825.GA69476@francesco-nb>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
 <20260505110631.1144200-8-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505110631.1144200-8-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040840_252988_BC13F7A1 
X-CRM114-Status: GOOD (  13.86  )
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

Hi Siddharth,

On Tue, May 05, 2026 at 04:36:08PM +0530, Siddharth Vadapalli wrote:
> According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
> the USB 3.2 Specification, SSC should be enabled by default. This protects
> against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
> 
> Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
> index 5119baf62a4c..7c98ee81ccb5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
> @@ -1423,6 +1423,7 @@ serdes0_usb0_ss_link: phy@3 {
>  		resets = <&serdes_wiz0 4>;
>  		cdns,num-lanes = <1>;
>  		cdns,phy-type = <PHY_TYPE_USB3>;
> +		cdns,ssc-mode = <2>; /* 2 for internal SSC */
>  	};
>  };
>  
> @@ -1502,6 +1503,11 @@ &serdes_ln_ctrl {
>  
>  &serdes_wiz0 {
>  	status = "okay";
> +	ti,core-clk-sel = <1>;  /* Select internal reference clock */
> +	ti,ssc-enable; /* Enable SSC */
> +	ti,ssc-type = <1>; /* 1 for Downspread */
> +	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
> +	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */

These properties must go before status. Please see the coding guideline.

Francesco

