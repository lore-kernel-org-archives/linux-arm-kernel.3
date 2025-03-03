Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E67C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ1xW2NPwpJqRZbwpFeIMuaFkeaa4B6mXxYKzB9+m6E=; b=ipp4JvKZvdzOH4MDHjWah2uQs5
	N9SK7cPsHzTVTAl+byoBGkN8D585QKR+w/S/x6a1rExpC7vSOXeeWGqnEtHJczIV+DgBFoJfF6gif
	U7hZO6Qad9edrUgw0fekidDkLHuNEJuRE/yDIApiyiKIqSz8cXHYKYTio/9/2i+o0Pf0N/9+VgGdh
	w4W5l9/fNuHj12aXsfKFXuXhx3IIwxLtWn9pNdCVRXSR6rfAkAqPxC/N0C1f3Acyh+AvChuIBUZNl
	JrWOIeccTGC61VksuYoEGwa/Ct+YAYy6/08FQx2z5Bv5RNSGA3my5ctKro5RVmiPZSE4kFYet/J9h
	0+5Ke3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0RD-0000000HRwA-1Cuc;
	Mon, 03 Mar 2025 07:42:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0Pe-0000000HRof-1rX3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 07:40:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5237eP7M2626084
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 01:40:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740987625;
	bh=GQ1xW2NPwpJqRZbwpFeIMuaFkeaa4B6mXxYKzB9+m6E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RBX5fAtOXtag7wzZX1/8h/+h6f5p88bKSHwRSH+/JDboHIdH52smlDBb44yPjGvQf
	 1d8O++uq5j1eIMqsrVsrs2kgANSnAcU1hM3JNvZsyXCZVW6t+sGve7Alw1IBHuf6jF
	 QezRUPyF0XU8eYWWRBscDC72kUm80xvHor/CPlS8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5237ePv9099697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 01:40:25 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 01:40:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 01:40:24 -0600
Received: from [10.24.69.250] (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5237eLjR131041;
	Mon, 3 Mar 2025 01:40:22 -0600
Message-ID: <3d01a502-47a6-467e-8743-392fde26e66e@ti.com>
Date: Mon, 3 Mar 2025 13:10:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: ti: k3-am62a-phycore-som: Add boot phase
 tags
To: Wadim Egorov <w.egorov@phytec.de>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
References: <20250228101817.865811-1-w.egorov@phytec.de>
 <20250228101817.865811-2-w.egorov@phytec.de>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20250228101817.865811-2-w.egorov@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_234030_679988_805F9C56 
X-CRM114-Status: UNSURE (   7.37  )
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

Hi Wadim

[...]

On 28/02/25 15:48, Wadim Egorov wrote:
> @@ -168,6 +174,7 @@ &cpsw3g {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_rgmii1_pins_default>;
> +	bootph-all;

One of the child nodes have bootph-all, so drop this from the parent.

BTW don't you need main_pktdma to have bootph-all to go along this for
ETH boot support?

>  };
>  
>  &cpsw_port1 {
> @@ -182,6 +189,7 @@ &cpsw3g_mdio {
>  	cpsw3g_phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id2000.a231", "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> +		bootph-all;
>  		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> @@ -196,6 +204,7 @@ &main_i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_i2c0_pins_default>;
>  	clock-frequency = <400000>;
> +	bootph-all;
>  	status = "okay";
>  
>  	pmic@30 {
> @@ -318,6 +327,7 @@ serial_flash: flash@0 {
>  		cdns,tchsh-ns = <60>;
>  		cdns,tslch-ns = <60>;
>  		cdns,read-delay = <0>;
> +		bootph-all;
>  	};
>  };
>  
> @@ -326,5 +336,6 @@ &sdhci0 {
>  	pinctrl-0 = <&main_mmc0_pins_default>;
>  	disable-wp;
>  	non-removable;
> +	bootph-all;
>  	status = "okay";
>  };
> -- 2.34.1

-- 
Regards
Vignesh
https://ti.com/opensource


