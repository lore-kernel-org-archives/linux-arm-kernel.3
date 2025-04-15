Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B3C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFq+f28rvVPKPSrubIQp1tokt+o0pF9109v9jVjSGIo=; b=s0m3xPkmwuTdwUnD1t72ADcemM
	9R/WXMqhTIDBKKD8i69YfMN5uXoSweuysQDDOVkz/McLXW1n8L3UnJUmm9H7Kxk8OPU/bbDf1+iVR
	OrPIEdChcBMf/f2onwlWqWAj7gGXYoDW4Rj2zVS5F6lrebj376vAogNRic95vhA7Qa2KvRvqRKraM
	SRYZITMbK3psXEzK3yZOAfiebaP6tgx6sV79O0gmKRsH75x5753ko03u+Uo/yzi1fxwUxyrY3vsMx
	x+w0Sd68duJ6G31xsSMRSVRMILOljJwggVMjO/jOhhv1YOUz7hDQuCMep0MH1PGLHNKAQsB/WYfHP
	oNSP7urA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jd0-00000006UJv-2Y2D;
	Tue, 15 Apr 2025 16:59:18 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jF3-00000006Qbw-1inA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:34:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FGYRMV071702
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 11:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744734868;
	bh=iFq+f28rvVPKPSrubIQp1tokt+o0pF9109v9jVjSGIo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lDtzA1FoWC9cSnfpYWCdhYJpszR/YkBTzbinL0HRYQxpLJ50Nt+NbGPXtSmxhT7aB
	 WL4SOmdHi3ysvYV6GgjcdlF84LpYDt3y6dD5VtWrUDfkDo4yYVWQQCK6x+ydv7Jv1F
	 YX/xLyjKxE+sOW0cTc041kx4Fh/2s0ozHt9qkiRI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FGYRnV057982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 11:34:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 11:34:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 11:34:27 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FGYQOS059307;
	Tue, 15 Apr 2025 11:34:26 -0500
Message-ID: <fe5583ca-d476-4e57-b412-3dd4fe4ff82c@ti.com>
Date: Tue, 15 Apr 2025 11:34:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/11] arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass
 ranges
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_093433_626679_30BBB5BF 
X-CRM114-Status: GOOD (  12.75  )
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

On 4/15/25 10:31 AM, Judith Mendez wrote:
> Add cbass ranges for ATCM and BTCM on am62x device, without
> these, remoteproc driver fails to probe and attach to the DM
> r5 core and IPC communication is broken.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am62.dtsi | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
> index bfb55ca113239..59f6dff552ed4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
> @@ -86,7 +86,9 @@ cbass_main: bus@f0000 {
>   			 /* Wakeup Domain Range */
>   			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
>   			 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>,
> -			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
> +			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
> +			 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
> +			 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
>   
>   		cbass_mcu: bus@4000000 {
>   			bootph-all;
> @@ -103,7 +105,9 @@ cbass_wakeup: bus@b00000 {
>   			#size-cells = <2>;
>   			ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
>   				 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>, /* Peripheral Window */
> -				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
> +				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
> +				 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
> +				 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
>   		};
>   	};
>   

