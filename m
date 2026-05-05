Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6169DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVJfobToIIbQS+LK3dO6loNuJTGbzehi/g6dvyC5Lo8=; b=vAtWd3U7dAORi2eiTVACgnpdvV
	Pyr/q49TTGSnsQeCGIAuTzjW6XLbRxGr19YlHQaPEBa+Ikp/ClsVkneskqS+run/n6jxNBFtCgeMQ
	S5lvOAOf9HQz8OMH5DgTAKD8HoHcjWnLysD4FPMuLtU2VOcbgSwjE4P1vNo2w/dT9PtSimCZIBULl
	vdgo+u3gneYkWHI4zPqKJ+zN4n+pPN14NoxCNDXQ9b/K34PA0udlUm9PDv9Ht7JWDbCVj6Kq9ZVPD
	8UwkyWYfHIIMCXdiaa79bYhFjpa7VZn8uvMHSYiMOQcq/mmU91AR337cTwSLfX8akmZ2ktSoeDcnc
	77j0k3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDeb-0000000G0rW-3Nsc;
	Tue, 05 May 2026 11:09:29 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDeZ-0000000G0qB-25Qj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:09:28 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 354AC1FCE7;
	Tue,  5 May 2026 13:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777979365;
	bh=IVJfobToIIbQS+LK3dO6loNuJTGbzehi/g6dvyC5Lo8=; h=From:To:Subject;
	b=ahuSEwFqljaHr1P6lJsEoyZmO0bWCVLmwjY4uM/I1oxqM1w5hl+bm3Kq/pfYrqkf8
	 2wZKUOIGPUMteNwkiITvj+0Vcfqmo0ovLNnReEgh2+8lpQJZ7gxsAPYhAJjMMy51Gx
	 Zoz5CKDpTU+gF8YQdYvt3eF6sC4RoerU41r5zEb/XfDI1b9zuw4fXJ+gkB1tcOWHXY
	 zZThRIdhGwwhYfMY15YVyr85Nrh6MgTUMK7/kHJmm0/XhPa/SuocPCCsk6l3pmmIDQ
	 FMSZn1qJP0BmTP/gVTFfwuw4arUtzilATcAGoa6EJtwWmvFlsqOambbUhgdOO0ZD/0
	 /nzVsil2cGSjA==
Date: Tue, 5 May 2026 13:09:22 +0200
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
Subject: Re: [PATCH 12/13] arm64: dts: ti: k3-j722s-evm: fix USB clocking for
 compliance
Message-ID: <20260505110922.GB69476@francesco-nb>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
 <20260505110631.1144200-13-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505110631.1144200-13-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040927_692905_9C391764 
X-CRM114-Status: GOOD (  13.95  )
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

On Tue, May 05, 2026 at 04:36:13PM +0530, Siddharth Vadapalli wrote:
> From: Luis Parga <luis.parga@ti.com>
> 
> According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
> the USB 3.2 Specification, SSC should be enabled by default. This protects
> against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
> 
> Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Luis Parga <luis.parga@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index e66330c71593..de62b7e135c6 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -746,6 +746,11 @@ &serdes_ln_ctrl {
>  
>  &serdes_wiz0 {
>  	status = "okay";
> +	ti,core-clk-sel = <1>;  /* Select internal reference clock */
> +	ti,ssc-enable; /* Enable SSC */
> +	ti,ssc-type = <1>; /* 1 for Downspread */
> +	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
> +	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */

before status


