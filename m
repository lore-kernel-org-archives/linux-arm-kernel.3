Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B065EC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 04:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxIm5BWYRHWRtfm3BI4yfvGxCISf/AMNRZprOku6zEE=; b=ZtPVwqBj2awmtLa8FW+/oGmpmB
	VuYopGj8lr5wZsr52NjguIBLobAVcb3zNfCS9QYkymkcKMswmeYBh5wgf7XIEdUTS+ONElhQnKO2E
	BkUc7cvEEiPy2ejfwjq8EUV2tsM99IAJuxnHiU6MQ9O5Oj5Q3idkqs8dRGNowUW33WS71NWHnfpq0
	7UllWURoLmxF5ougEz4T6gDXgCbaHbkoA+bv1/XY14JidcIJkxM3kHFCAEbumX3eLcy9ImNIcoEYK
	mhyAmP5lnS0JhwsPz+BKHqY9ma9ppUV87VI8oC/O0zeyZrRQ6P9l7lFUJS0BWvhQbT/9yuNJGFwD1
	+YTDld6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5zO7-00000000o03-1cZr;
	Sat, 19 Apr 2025 04:01:07 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5zMC-00000000nrT-0aLl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 03:59:09 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J3x1jV1073856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 22:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745035141;
	bh=OxIm5BWYRHWRtfm3BI4yfvGxCISf/AMNRZprOku6zEE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UtdRLOIu0pJM/6XS5NGxLt3cnLdiygCDXQ/ujxTPjbsX+mBNG/QBs2WHXto0YAQZL
	 QThe7bTqs19acGe17QtazFNyPc5lbM5uyEi2z7qus6Izdy7sAouZQIiL4SrAJJJ87J
	 OOQsZeQy+LZ4UlN+sZPtfRMx2/LFe+O/hFviUXsQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J3x1fX045034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 22:59:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 22:59:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 22:59:01 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J3wwhQ128798;
	Fri, 18 Apr 2025 22:58:59 -0500
Message-ID: <80b5867b-958a-41ff-854a-6a3173ddbdc0@ti.com>
Date: Sat, 19 Apr 2025 09:28:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Add
 bootph-all to HBMC nodes
To: Anurag Dutta <a-dutta@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>
CC: <vaishnav.a@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250411082637.2271746-1-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411082637.2271746-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_205908_319317_CEBE57D5 
X-CRM114-Status: GOOD (  13.99  )
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


On 4/11/2025 1:56 PM, Anurag Dutta wrote:
> Add bootph-all to HBMC controller and hyperflash nodes for successful
> hyperflash boot on j721e-evm.
>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>
> Test logs : https://gist.github.com/anuragdutta731/90a492589557c2ec2881e1de50a62006
>
>   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 4421852161dd..9ada749f16ba 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -570,6 +570,13 @@ &usb1 {
>   	maximum-speed = "high-speed";
>   };
>   
> +&hbmc {
> +	bootph-all;
> +	flash@0,0 {
> +		bootph-all;
> +	};
> +};

Could you check once , if this is duplicated

commit fbdb8aa4eab84 "arm64: dts: ti: k3-j721e-evm*: Add bootph-* 
properties"

adds bootph-all in arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi file for 
flash.

AFAIK, parent node should inherit property of child for bootph.

In case you are not getting in u-boot then u-boot shall fix this[0]

[0] : https://lore.kernel.org/all/20250327080642.2269856-1-m-shah@ti.com/

> +
>   &ospi1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;

