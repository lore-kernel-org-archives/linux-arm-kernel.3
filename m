Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E8C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 04:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syXPu5InInWJTrJB4xJD5Dhlu4FirwQK/41pDLqMUNg=; b=BuyJlFVhd5DLJ9n5CRkQnSaA3n
	Fs+My2Vqu94vjmEVa8EiBLuFPrLerj0kZW5iKCOAfd39/6wkSWJm7sRrjku6Gtw0iXSZuisPf8R2F
	39tK3ivOTGY8MF+8tuOr1Zva2UH4M6zrQ2jEANt79gIbR41Ggoieb9zPNgUgOpgCgv42WHLk00dkK
	Wkrex/qNo98abKs87ZpWRql25m87HwumYZKCPNlMSDfOdXiPHOUnIbTY1QIKV6MAGdQ0h/7zV78W8
	tkGyAYKPVGuBQqAvGr61won0inXr2vivfP0M407WBJQKzM8LRBSaSzKayqjGoFe2wUVX1urMB7PxQ
	KZWHhSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZiXK-0000000AdQV-2mrp;
	Thu, 10 Jul 2025 04:05:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZiUx-0000000AdIm-1O5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 04:03:04 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56A42xTx1390678;
	Wed, 9 Jul 2025 23:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752120179;
	bh=syXPu5InInWJTrJB4xJD5Dhlu4FirwQK/41pDLqMUNg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LpizOoYbWndo+NrFkg6FHUQtiyiTBBUTESsx8YYoUNNwlfQP20f3djyiSOsHAihCc
	 YH0EqIXikpStj8/Y7LT42Hm+NV77k8ZnftiU/XeDLukyB2QAEH9UGGoXA8suRm7Bec
	 3hIQRapOkjf2/bM/WUcCju9Bo/K/rB8Cqhyl8nDU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56A42xRx3127345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 23:02:59 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 23:02:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 23:02:59 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56A42tbS976034;
	Wed, 9 Jul 2025 23:02:56 -0500
Message-ID: <4d531a8b-1d32-4618-a984-6f4435f6a676@ti.com>
Date: Thu, 10 Jul 2025 09:32:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: add boot phase tags
To: Bryan Brattlof <bb@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250709-62a-uboot-cleanup-v1-1-70f8e6cde719@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250709-62a-uboot-cleanup-v1-1-70f8e6cde719@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_210303_588392_CF1B0733 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

[...]

On 10/07/25 05:38, Bryan Brattlof wrote:
>  &main_gpio1 {
> @@ -693,6 +703,7 @@ &main_uart0 {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_uart0_pins_default>;
> +	bootph-all;
>  };
>  
>  /* Main UART1 is used for TIFS firmware logs */
> @@ -737,12 +748,21 @@ &cpsw3g {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_rgmii1_pins_default>;
> +
> +	ethernet-ports {
> +		bootph-all;


This is redundant as child node cpsw_port1 has the flag below?

> +	};
> +};
> +
> +&phy_gmii_sel {
> +	bootph-all;
>  };
>  
>  &cpsw_port1 {
>  	status = "okay";
>  	phy-mode = "rgmii-rxid";
>  	phy-handle = <&cpsw3g_phy0>;
> +	bootph-all;
>  };
>  

-- 
Regards
Vignesh
https://ti.com/opensource


