Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E17FC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpLhwj82ljP6BWCPze3kv+WGHqGB/Kweoia9J1dReqA=; b=E6bMod819OEB1NHvhJqy4rwHnM
	dcp/YwQuYR/jwKv3oFaijcDkF6vUiCjLR7tCXWiAtsWp6ZtazTS6mrQulYsz36ohlb9+nMrlZjIgi
	n+Eroca5m7qf4yxJmp/NwGGCpnddjEC2ulOPli24XKcUhb314C1vKe9OgxDI+g8ufxz94lM4/fL8C
	yOjrq4Gyh5VqyJzS9sblJtEcgHmE18XCdH0EOap41AekeZtJpY1DQ2Gxoo3pzDx/MayOhUsbznaYT
	xclhXAnlYndEcJMYHMJ0iePFECOvY3ygFldxj6ygOIk5MOIVuXgepRlIhCnqs2qdn48XhaTyQdsh6
	laB21J5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0Fy-00000004SGY-1SS1;
	Mon, 17 Feb 2025 12:29:50 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjysp-00000004F7i-0ty9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:01:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51HB1dqQ645577
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Feb 2025 05:01:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739790099;
	bh=BpLhwj82ljP6BWCPze3kv+WGHqGB/Kweoia9J1dReqA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BveExQw5MYWQ53bkpSQsvFS2hbRkI1cl9dY5MXbI95HsbRRGtjPP1nK/B0Pdb07um
	 a87ZiVE1c9SiELSdDe0m55SzRf++EcfPubzFNil+ndbIkOys9yWXpFX0W0TsrxKvxp
	 Elof3S/hqB9mcpwZFD/OD2+ft6ja3zmyxGWnlgX8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HB1dhI122938;
	Mon, 17 Feb 2025 05:01:39 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 05:01:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 05:01:39 -0600
Received: from [172.24.22.234] (lt5cd2489kgj.dhcp.ti.com [172.24.22.234])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HB1Zg9077443;
	Mon, 17 Feb 2025 05:01:35 -0600
Message-ID: <d4a4c96a-819b-4332-9a8b-5eab0fc7e78f@ti.com>
Date: Mon, 17 Feb 2025 16:31:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-j742s2-main-common: Correct the
 GICD size
To: Keerthy <j-keerthy@ti.com>, <robh+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <conor+dt@kernel.org>, <kristo@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250217103814.2657-1-j-keerthy@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250217103814.2657-1-j-keerthy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_030151_301995_57D8489B 
X-CRM114-Status: GOOD (  14.00  )
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


On 2/17/2025 4:08 PM, Keerthy wrote:
> Currently we get the warning:
>
> "GICv3: [Firmware Bug]: GICR region 0x0000000001900000 has
> overlapping address"
>
> As per TRM GICD is 64 KB. Fix it by correcting the size of GICD.

Please add fixes tag

Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a 
common file")
Fixes: 4664ebd8346a ("arm64: dts: ti: Add initial support for J784S4 SoC")


>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 83bbf94b58d1..3b72fca158ad 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -193,7 +193,7 @@
>   		ranges;
>   		#interrupt-cells = <3>;
>   		interrupt-controller;
> -		reg = <0x00 0x01800000 0x00 0x200000>, /* GICD */
> +		reg = <0x00 0x01800000 0x00 0x10000>, /* GICD */
>   		      <0x00 0x01900000 0x00 0x100000>, /* GICR */
>   		      <0x00 0x6f000000 0x00 0x2000>,   /* GICC */
>   		      <0x00 0x6f010000 0x00 0x1000>,   /* GICH */

