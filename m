Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5904CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 05:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa7ucSJKWasZ2KGuuAlceNV2b8JCAsYjJZF+dbJsVKo=; b=q6Q+9ztbZA2UVI7I3l4b3lRjCl
	RY8LuazPj8NBK218jeHXWzaDhRB2iuBQ4jZ6nuVy8tZeg8YF3o1NmQXd6rLkar9F6mXmxek9cy0qV
	YwlEqbPlo6UUxAvt4ko40cLgAAeXMQFaC0YANW1zWC69JPrvrYAcLR7JunyJe7zbpRxIfauCvwgXZ
	R4RUmSnwwSqfnyGxzjeEdz88/QWK+16BDGZtcAIeAUDRJjg2KtmfcpLR8TdZpC/KgrSTbxbJ23w2H
	8g92kPnf0He5TNdGhJ13FWrrokg2rOPON7lq6kVeWlNJ+jqzo/XLTN4ioZm0qEjIuDNKf+3lq+vT3
	fr4Dpavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnyj-0000000G2sW-1cOZ;
	Tue, 25 Feb 2025 05:59:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnxC-0000000G2mY-3cda
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 05:58:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51P5vpku1682408
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 24 Feb 2025 23:57:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740463071;
	bh=Sa7ucSJKWasZ2KGuuAlceNV2b8JCAsYjJZF+dbJsVKo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E6eCWB0J1TLY5hBPfkrtc1a2eK8EFTk/UyJiTby3O9u/0pw/qwRsMItfJ80h2z3uw
	 +qwXG1ZvE8PrNcO3YTTjFj8sNzEM4UKN+O+XsFh3j2FgLAig7jZYb6v8dMC57zoyex
	 KcK5ejqvpwXouATTxqPcQcCK2OJSpzLyQ/rO+DBk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51P5vp7g009513;
	Mon, 24 Feb 2025 23:57:51 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 23:57:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 23:57:51 -0600
Received: from [172.24.25.83] (lt5cd2489kgj.dhcp.ti.com [172.24.25.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51P5vlMG101472;
	Mon, 24 Feb 2025 23:57:48 -0600
Message-ID: <1c110279-ed22-4505-8fe2-2664b9880132@ti.com>
Date: Tue, 25 Feb 2025 11:27:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Correct
 the GICD size
To: Keerthy <j-keerthy@ti.com>, <robh+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <conor+dt@kernel.org>, <kristo@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20250218052248.4734-1-j-keerthy@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250218052248.4734-1-j-keerthy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_215803_112328_9C86E617 
X-CRM114-Status: GOOD (  14.33  )
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


On 2/18/2025 10:52 AM, Keerthy wrote:
> Currently we get the warning:
>
> "GICv3: [Firmware Bug]: GICR region 0x0000000001900000 has
> overlapping address"
>
> As per TRM GICD is 64 KB. Fix it by correcting the size of GICD.
>
> Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Cc: stable@vger.kernel.org
> ---

Acked-by: Udit Kumar <u-kumar1@ti.com>


> Changes in V2:
>
> 	* Added the fixes tag
> 	* Cc: stable
>
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

