Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9C2C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2QdfPMZKjTriOw/UTDyBbsrhrWHxRSetfZIlOQ8wps=; b=U+wirKWtokLNMm0DCiWbf3XLwi
	cXp1z6OjlvuExO+gf3bPbrHpyRDx0BI0UM2WkvIavxSfts+t43oBKY99MR2UPYrAlkXIqRWDVT7Y5
	oYb3ZlVv+0ShsTx9z8M5BG1Aswv9hqDM+qhwHmU4+ewbOfpK6Nb8udQnSc7kRRvegyynd5P4DK3fP
	F6izY6aYxWeJ/4HNezeaSz2UZ3rr1rpR25aSiswQw8YDhM8O6q0ddHVzmtn/xTOTYRWIIm52J0DD6
	/8EyQYou/LiyfeqRFNHWbp8sZMnIEcXqCw+PuPV04sklpCHJj7ghaVvcxlHx4ZUAxKCfu1oCxW+68
	I/W+KsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfza-00000006N2k-1xjY;
	Tue, 01 Jul 2025 18:46:06 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdX9-00000005z1c-0CuW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:08:36 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561G8Tq43682752;
	Tue, 1 Jul 2025 11:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751386109;
	bh=u2QdfPMZKjTriOw/UTDyBbsrhrWHxRSetfZIlOQ8wps=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YvqxZK1RLT+rgLhoas2X7ZELky8RTCy3U1gssPxAE5Gyz88Vm+V4OZ9r5KVepH4Og
	 OCznBMhMkUrlQpy/3ebg1/vl3ooC5O3CgVKPhhUdBmZW4UOG2WL/k/4BqBu5tQxWWH
	 eOoINwCYQageT6yoPUcfz45x56NmuC/yoj/DXrSE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561G8TgT028847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 11:08:29 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 11:08:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 11:08:28 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561G8SmU1852701;
	Tue, 1 Jul 2025 11:08:28 -0500
Date: Tue, 1 Jul 2025 11:08:28 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v5 1/4] arm64: dts: ti: Add bootph property to nodes at
 source for am62a
Message-ID: <20250701160828.lmmfgfrmfcqiwpzz@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250627115753.2246881-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_090835_247417_2BBF85FB 
X-CRM114-Status: GOOD (  16.47  )
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

On June 27, 2025 thus sayeth Paresh Bhagat:
> Add bootph property directly into the original definitions of relevant
> nodes (e.g., power domains, USB controllers, and other peripherals)
> within their respective DTSI files (ex. main, mcu, and wakeup) for
> am62a.
> 
> By defining bootph in the nodes source definitions instead of appending
> it later in final DTS files, this change ensures that the property is
> inherently present wherever the nodes are reused across derived device
> trees.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 14 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    |  1 +
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  2 ++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 63e097ddf988..770f1258b0aa 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
>  

...

>  	main_pmx0: pinctrl@f4000 {
> @@ -262,6 +271,7 @@ main_pmx0: pinctrl@f4000 {
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;
> +		bootph-all;
>  	};

I don't think the boot phase flags for the pinmux nodes need to be here. 
The child nodes for the MMC, UART and Ethernet pins should take care of 
this.

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi 
> b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index ee961ced7208..df4aa131097f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -12,6 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;
> +		bootph-all;
>  	};

Same here. If we need any pins from the MCU domain during bootup those 
nodes can take care of adding the boot phase flag.

~Bryan

