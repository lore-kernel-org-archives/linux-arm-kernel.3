Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFE7CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DS+neLfgYJvNoWvrI31OahgxQCII44SXZ6kBTdc/S4=; b=QWnP4VrrI6rIW2CW21V6NRdzp7
	995cdNFoPijFapEwjLeYBCOrcNPVbAEuT8ihrkvmpB/DfYxFLoS+f5HucdYmNnbSJYc3OPEDMwvzu
	02d8k3tdzP9sl3K49BwpgB7ISWWHPlljM8Ul0vvYk32ARmrXv1t+alP/s94orq1RtUyXT2x4RmCsN
	sH6Mx8rCsD2kgyqO4Jak+meKnwhZLj/1Cgk1PlEIwVHLHIFnSqGfSe0gVz9r6m21/Z3Oc0QvnR42n
	6eYitPplDeoO1vgcCCVvEmtoIEav1S6vZD38VhmF/GVPopmY3GZBC7GMXkuxN+UiftfF91b/rsWal
	qKbVN96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDep-0000000G0vo-0RPW;
	Tue, 05 May 2026 11:09:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDem-0000000G0uN-3q1N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:09:42 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 574F81FD00;
	Tue,  5 May 2026 13:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777979379;
	bh=3DS+neLfgYJvNoWvrI31OahgxQCII44SXZ6kBTdc/S4=; h=From:To:Subject;
	b=K2SVKeSciQubWujhQ6z+Cya8PHpiiAK77j1jNWAUh4s0cgu1OAB2Gr0zqPHOxMAw9
	 s4OsY759mEmmCGZl+V8YcDQUs7F9gBhNtAIDb4NIDfRS66t7qqLhWYrgD1Wl8r9qRz
	 TR43ZKyhLS6HIey0iK06ep1fFdn3VgHM9q0IVoHloiXgZab613IlMJ+fdtKuCFzGWJ
	 OAYs9udWaXqadc5oKYXYvE0qi6hm+gjF/sA8LgfD3goAMPocaMeL6Sf/jknaS1+YzD
	 XNd/PHmghCYZbQ9kYTae5V4IsXBtCj2TDYUrJbkiGXwEU73PrxpQEodY8J5oYcMM/Z
	 CHLyO70rDJEgA==
Date: Tue, 5 May 2026 13:09:37 +0200
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
Subject: Re: [PATCH 13/13] arm64: dts: ti: k3-j784s4-j742s2-evm-common: fix
 USB clocking for compliance
Message-ID: <20260505110937.GC69476@francesco-nb>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
 <20260505110631.1144200-14-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505110631.1144200-14-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040941_110898_6216E9FD 
X-CRM114-Status: GOOD (  13.41  )
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

On Tue, May 05, 2026 at 04:36:14PM +0530, Siddharth Vadapalli wrote:
> According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
> the USB 3.2 Specification, SSC should be enabled by default. This protects
> against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
> 
> Fixes: 39b623c05c46 ("arm64: dts: ti: Refactor J784s4-evm to a common file")
> Fixes: bed97e94ee2d ("arm64: dts: ti: k3-j784s4-evm: Enable USB3 support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> index ff3a85cbc524..0884773ad230 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> @@ -1010,12 +1010,18 @@ serdes0_usb_link: phy@3 {
>  		cdns,num-lanes = <1>;
>  		#phy-cells = <0>;
>  		cdns,phy-type = <PHY_TYPE_USB3>;
> +		cdns,ssc-mode = <2>; /* 2 for internal SSC */
>  		resets = <&serdes_wiz0 4>;
>  	};
>  };
>  
>  &serdes_wiz0 {
>  	status = "okay";
> +	ti,core-clk-sel = <1>;  /* Select internal reference clock */
> +	ti,ssc-enable; /* Enable SSC */
> +	ti,ssc-type = <1>; /* 1 for Downspread */
> +	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
> +	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */

before status


