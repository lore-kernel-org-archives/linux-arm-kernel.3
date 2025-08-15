Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB75CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 02:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhX7uXaxU+2Gglt/gH8ZNapg5luz/gjuSFA1JXtTgps=; b=q/H59LsngO2A9DAtH6uWnsSvl/
	fD7KrZFJ50qka1H+kUgR796iGC7DjE7nTGMExBdUPtxqQMgU1M1j0AejxcJjDDMHsyEH9Bp1K4qMx
	1rtxwfGWteLZse3kh1plsroNS7DKlZGWUUOaGvMBGQWavzDkrSgXPNaUSZU/jBi+tgwWF/RIAbgFZ
	Dh/acta2neMoIJghFWg65zhJd/CV8+KBRvY/EuRF7/B/1pd8gG6P3d+s+NzyMvCqAcbOz4YQr9pBQ
	L+nnwiK2KzxCD/TEvh0eXeM0jakSN/mKnzpF2r5woX0D2NTufCuZ7UCwRJ7mcETM8qbTKTS8OAdgq
	mfT4yWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkGs-00000001B42-0ASB;
	Fri, 15 Aug 2025 02:34:22 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkDG-00000001AKN-3qqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 02:30:40 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57F2UX4w2063384;
	Thu, 14 Aug 2025 21:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755225033;
	bh=nhX7uXaxU+2Gglt/gH8ZNapg5luz/gjuSFA1JXtTgps=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YbkiXE4xIQaGr2nwUV9gmOBmbvOu5Jk/yHJ/yhd2p2s1X7W1uaX9ey/kmzL0SVU3X
	 W+Db6tFTNhwjtZe7XpalDtE4/FG2eQb+M+KfXmdVtIrWmtgBV1XSWPgzIvLdWb9dME
	 Ge+O3TmrGxjTCQnST6Qa5HU01avr6h9WsO6rYkYk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57F2UXhG1585090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 21:30:33 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 21:30:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 21:30:33 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57F2US52344700;
	Thu, 14 Aug 2025 21:30:29 -0500
Message-ID: <b257999d-df16-405c-830b-5397da37c6ed@ti.com>
Date: Fri, 15 Aug 2025 08:00:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] arm64: dts: ti: k3-j7200: Enable remote processors
 at board level
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-2-b-padhi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250814223839.3256046-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_193039_111980_8636947D 
X-CRM114-Status: GOOD (  13.76  )
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

Hello Beleswar,

On 8/15/2025 4:08 AM, Beleswar Padhi wrote:
> Remote Processors defined in top-level J7200 SoC dtsi files are
> incomplete without the memory carveouts and mailbox assignments which
> are only known at board integration level.
>
> Therefore, disable the remote processors at SoC level and enable them at
> board level where above information is available.
>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       | 3 +++
>   arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi | 3 +++
>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi     | 9 +++++++++
>   3 files changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> index 5ce5f0a3d6f5..628ff89dd72f 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -1516,6 +1516,7 @@ main_r5fss0: r5fss@5c00000 {
>   		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
>   			 <0x5d00000 0x00 0x5d00000 0x20000>;
>   		power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
>   
>   		main_r5fss0_core0: r5f@5c00000 {
>   			compatible = "ti,j7200-r5f";
> @@ -1530,6 +1531,7 @@ main_r5fss0_core0: r5f@5c00000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   
>   		main_r5fss0_core1: r5f@5d00000 {
> @@ -1545,6 +1547,7 @@ main_r5fss0_core1: r5f@5d00000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> index 56ab144fea07..692c4745040e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> @@ -612,6 +612,7 @@ mcu_r5fss0: r5fss@41000000 {
>   		ranges = <0x41000000 0x00 0x41000000 0x20000>,
>   			 <0x41400000 0x00 0x41400000 0x20000>;
>   		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
>   

Please leave boot critical fw as is.

Here are my suggestions

  create one boot-critical-fw-dtsi for mcu_r5fss0 , include this fw 
files in all boards.

other IPC optional firmware can reside in one dtsi or dtso,


> [..]

