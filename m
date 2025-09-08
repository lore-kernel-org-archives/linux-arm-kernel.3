Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BECCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfVTIp2A7Sw2rpIN3wM/h4WBz/JckQgyOt9XwAtS6PI=; b=KkhJ8M/EDfl/CiyQv/bgzimlpz
	WKHoATkmqPtNWXiajD967DAtX62wsARmtdFXAoGgSKlaIbMOWhI4008OgkjIsCczZd6l1j5qIM9Pw
	WZmFruNnss0OANQZTnIjWt2+NznEKZBPW84l76MSNXPZr1AjWFTs2dxDsmg1l6o79teWqSZ3+GeEG
	/mSpW0p9RufPv7pj74a+rsVYpe+swd2owkB7NVUpYJtEAMEoIMhNFwe00xmhVYsQoODXM/pQsQEm4
	HS429kx4gOKMxQoFwd6JtHNAmv0sgkfIrXHmpbd+S+bBNMQ/4gXYFBz9lAtTqyL28Ueo2AgmFHBct
	g4MJpPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTgr-0000000EWlN-1xaU;
	Mon, 08 Sep 2025 04:41:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTdn-0000000EW9c-3Cqz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:38:09 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5884bsRg019426;
	Sun, 7 Sep 2025 23:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757306274;
	bh=pfVTIp2A7Sw2rpIN3wM/h4WBz/JckQgyOt9XwAtS6PI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=E0KjteQsW6WXeCswCtS7OQVklLvTUacN9PCAn/HT8jJKQYlK8KhIgPNM4t29bs9Ft
	 O6scojsRAOJjDOvk9LPhaZrfTRu4wRspCJ56lrtPkD6oNgGPOHIf3498DuJN//Lgkl
	 VDVPaWIdip2VlsnQoSRVvfJ/WBvYgC+VDEh/GGsA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5884bsZw2144177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 7 Sep 2025 23:37:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 7
 Sep 2025 23:37:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 7 Sep 2025 23:37:53 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5884bmLQ268966;
	Sun, 7 Sep 2025 23:37:49 -0500
Message-ID: <7cf605e3-e1be-43e4-ba14-c1310b4f5869@ti.com>
Date: Mon, 8 Sep 2025 10:07:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Update DSS EDP integration configuration register
To: Harikrishna Shenoy <h-shenoy@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-ravikumar@ti.com>, <m-chawdhry@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <aradhya.bhatia@linux.dev>,
        <devarsht@ti.com>, <s-jain1@ti.com>
References: <20250907182806.1031544-1-h-shenoy@ti.com>
 <20250907182806.1031544-3-h-shenoy@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250907182806.1031544-3-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_213807_903317_C7A576E1 
X-CRM114-Status: GOOD (  12.56  )
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


On 07/09/25 23:58, Harikrishna Shenoy wrote:
> Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
> TRM Table 2-1 MAIN Domain Memory Map.
> Link:https://www.ti.com/lit/zip/spruj52/SPRUJ52-J84S4 AM69A TRM


Broken link

>
> Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")


Above commit only refactored the changes and carried the bug.
The commit that introduced this bug should be:

603669b16701 arm64: dts: ti: k3-j784s4-main: Add DSS and DP-bridge node

Thanks,
Beleswar

> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index fbbe768e7a30..f0cda14c2530 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -2573,7 +2573,7 @@ port@1 {
>  	mhdp: bridge@a000000 {
>  		compatible = "ti,j721e-mhdp8546";
>  		reg = <0x0 0xa000000 0x0 0x30a00>,
> -		      <0x0 0x4f40000 0x0 0x20>;
> +		      <0x0 0x4f40000 0x0 0x100>;
>  		reg-names = "mhdptx", "j721e-intg";
>  		clocks = <&k3_clks 217 11>;
>  		interrupt-parent = <&gic500>;

