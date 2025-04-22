Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9333AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 05:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+rfxkhJ2uRVgkvDr5SGLSGdiYjFntxQGRjvdTnKR/M=; b=RPCy6h0D8kPA0O1eo4yZUmN0xP
	1YRFldTTemQc6Gg0vD3Oq1SdRiBL3ZMqGBrvmFWEIKnHivYmrThJhEBqJ6RZtYEUrJGVfERCO2SQP
	MSuECOSfjZJ+LybtW+2qbzF4f4QJJa7nxQhUFlnflb3ouSlc0yvbUszWIhDr8wUDdCqMnjVXdTxpP
	qWAm78B2IzwFzUrIQCXin9YRQr5mPyutZnlio3mH27isuxWP72lqTd09cN95lnFhdGWcQL9eE1Y4m
	Q0puBk21g/4aCkJfivytSR4Bx1iGorX65MhWcxzhdLrNe6ZTU2Hy6pHZNu2B7lp4A0uW+MTdZb+Qf
	KjnPPaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u75mi-00000005pMD-1VPk;
	Tue, 22 Apr 2025 05:03:04 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u75kn-00000005p6L-09EE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 05:01:06 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M50rVn1116663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 00:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745298053;
	bh=S+rfxkhJ2uRVgkvDr5SGLSGdiYjFntxQGRjvdTnKR/M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MfieWodQynoJ9H638e1BShbI4G//i+9dDNYJBn1Cm4N5O58nSnlOssnB1QMcyuhcF
	 onJkVD8iIlRJLTjFAEO4Ee+/77iOF4+a0KPKaFIAevAJYZ03TZJl2stT22d0SMkQCs
	 RYysu3xCK7oVREKNQi9A02eZPGCEvr/MUnHTlxD4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M50rEG019135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 00:00:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 00:00:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 00:00:52 -0500
Received: from [172.24.227.136] (moteen-ubuntu-desk.dhcp.ti.com [172.24.227.136])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M50nMg123169;
	Tue, 22 Apr 2025 00:00:50 -0500
Message-ID: <bd73d05a-6859-42aa-b1d9-91d8e122a677@ti.com>
Date: Tue, 22 Apr 2025 10:30:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: ti: k3-am65-main: Add missing taps to
 sdhci0
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-4-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250417233040.3658761-4-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_220105_124269_EC02A821 
X-CRM114-Status: GOOD (  12.38  )
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


On 18/04/25 05:00, Judith Mendez wrote:
> For am65x, add missing ITAPDLYSEL values for Default Speed and High
> Speed SDR modes to sdhci0 node according to the device datasheet [0].
>
> Fixes: eac99d38f861 ("arm64: dts: ti: k3-am654-main: Update otap-del-sel values")
> [0] https://www.ti.com/lit/gpn/am6548
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 94a812a1355ba..5ebf7ada6e485 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -449,6 +449,8 @@ sdhci0: mmc@4f80000 {
>   		ti,otap-del-sel-mmc-hs = <0x0>;
>   		ti,otap-del-sel-ddr52 = <0x5>;
>   		ti,otap-del-sel-hs200 = <0x5>;
> +		ti,itap-del-sel-legacy = <0xa>;
> +		ti,itap-del-sel-mmc-hs = <0x1>;

Reviewed-by: Moteen Shah <m-shah@ti.com>

>   		ti,itap-del-sel-ddr52 = <0x0>;
>   		dma-coherent;
>   		status = "disabled";

