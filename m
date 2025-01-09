Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107ACE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjlJPdHZfFlnWi9zFpTiPy4i/wlFmKUpofmp/B7kgII=; b=wIhxlYuICSZlSwUpSGOGM9BmZs
	wuyCvCOPRNf32hTm8npJ9IPEAJbkQlt5Nsg+GdhlQ3QAacB+mQmEGreC4F3yKvJhl6vnAkqdaWnA3
	UgnOQ/xV+zWiMFVcKIJsORcSLOo0tdbMAfrqPat2VhYe3avzTr5AqCOdMGmm7qSKUQxdJTZYtnq1i
	KsTWfkw0PkUNF8xev8hFKA5mOOL2GgbBy05gXcA5d5NXqhk5OSvk1rVrfDJBwS9AFyF7NhhlNoNmF
	MoL7X5ow7td5OKQULv6AL2HxrZkLTRLYkAl5NTFeavXd3+PougePVxV52b5mk7B7ZYJhXvVUk1y1q
	49MTgowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVr4K-0000000BmLL-3UwM;
	Thu, 09 Jan 2025 11:51:20 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVr35-0000000BmBz-3q6M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:50:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509BnwEK3155882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 9 Jan 2025 05:49:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736423398;
	bh=cjlJPdHZfFlnWi9zFpTiPy4i/wlFmKUpofmp/B7kgII=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lGhWg8zTGMA3RxVhxbjdXCKCKTUWgoiq2kq6TVUfw/I+NMSKnEE27ZSy2j1e+81YF
	 HzOzK/i2xsxpEDD9zXQf96TTA3Oj/RgXSMX9sJHlaQZUr3Z+MVulXwonWjzOgCI7x9
	 YmaJaB3UvRFMuIGnGrSkV7nSFFBGVwjlVqhD3URY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509BnwYF041983;
	Thu, 9 Jan 2025 05:49:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 05:49:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 05:49:57 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509BnukD112901;
	Thu, 9 Jan 2025 05:49:57 -0600
Date: Thu, 9 Jan 2025 17:19:55 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <kristo@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <afd@ti.com>,
        Romain Naour <romain.naour@skf.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250109102627.1366753-2-romain.naour@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_035004_045131_5EC7E8AF 
X-CRM114-Status: GOOD (  15.94  )
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

On Thu, Jan 09, 2025 at 11:26:27AM +0100, Romain Naour wrote:

Hello Romain,

> From: Romain Naour <romain.naour@skf.com>
> 
> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> provide refclk through PCIe_REFCLK pins.
> 
> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> module's PAD IO Buffers.
> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> applied on vendor kernel for BeagleBone AI-64:
> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

[trimmed]

> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index af3d730154ac..32a232a90100 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/phy/phy-cadence.h>
>  #include <dt-bindings/phy/phy-ti.h>
>  #include <dt-bindings/mux/mux.h>
>  
> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>  			reg = <0x4140 0x18>;
>  			#clock-cells = <1>;
>  		};
> +
> +		acspcie0_proxy_ctrl: syscon@18090 {
> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
> +			reg = <0x18090 0x4>;

0x_0011_8090 is probably *not* the "PROXY" register i.e. it could be
locked with the help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1"
registers, in which case the CTRL_MMR region needs to be unlocked to write
to that register. On J784S4, that happens to be true, which is why the
proxy register 0x_0011_a090 was used at [0]. Please test with 0x_0011_a090
which is the "PROXY" register on J721E as well, i.e. it can be written to
unconditionally.

[0]:
https://lore.kernel.org/r/20240930111505.3101047-1-s-vadapalli@ti.com/

[trimmed]

Regards,
Siddharth.

