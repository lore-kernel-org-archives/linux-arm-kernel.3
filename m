Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBDCCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPfd07ZOdvUhzODlvHhJl75jq74vTGl43U5ZELEC+hQ=; b=P+GZ+I0n4eOEIIFgx0eqVy22x2
	vfqGstZ7b71/othyceoE60dZLUbQ7QR2ycMjWYvufI6dvdCxGaDlFbm8BDQMxdW9xg2hCq8phv2MO
	rLT3MYPecZ9TILwAUy9nVGvHe7v98I/8cGgp/X0fFKmKhcFTejMhqnfLMLtZ1vdfFMEH8MjPyPhNP
	xSAe75B3Vg5uhxmGs4vo1trUPH9QC9HF5l39diP51jVkOPfnPcB/Jc2CFSP+LD1gCvBWQOZIyM4x1
	9z7qki69/vqsiRmnF1s925awnDHoTAGKFqlozHW4ygBKyu/r3tLwW61s8t2l5pliSsvRJC7/FLyi9
	9AlcQR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy2Ms-00000002t53-1o8M;
	Mon, 15 Sep 2025 06:07:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy2Mq-00000002t4e-30q0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 06:07:13 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F66qpD979199;
	Mon, 15 Sep 2025 01:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757916412;
	bh=cPfd07ZOdvUhzODlvHhJl75jq74vTGl43U5ZELEC+hQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OaYUMthyr33aAC7dzCX+PEMhliUlbpvZGq0mAsf11GEWYWfILThL2tt8dE3t9qx7D
	 eszInXNJSlZMdht14Kv0TvAkopuGwLqdcKm4TRA4Tb3ff50rxa+5S+yy+1VoYogtei
	 6Kkv7lcwH1cfiCJNndoR+v7v0Qr22OqtqFuIR9q0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F66qGX3184091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 15 Sep 2025 01:06:52 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 01:06:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 01:06:52 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.233.62])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F66jEK3245914;
	Mon, 15 Sep 2025 01:06:46 -0500
Message-ID: <cc5a5e12-4e71-4662-9a0d-f925c5bc50ed@ti.com>
Date: Mon, 15 Sep 2025 11:36:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am625: Add OLDI support
To: Swamil Jain <s-jain1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
        <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250913064205.4152249-1-s-jain1@ti.com>
 <20250913064205.4152249-3-s-jain1@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250913064205.4152249-3-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_230712_898455_53DDE88E 
X-CRM114-Status: GOOD (  11.76  )
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

On 13/09/25 12:12, Swamil Jain wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The AM625 SoC has 2 OLDI TXes under the DSS. Add their support.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 47 ++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index dcc71db8afd4..d240c157d819 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -793,6 +793,53 @@ dss: dss@30200000 {
>   		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>   		status = "disabled";
>   
> +		oldi-transmitters {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			oldi0: oldi@0 {
> +				reg = <0>;
> +				clocks = <&k3_clks 186 0>;
> +				clock-names = "serial";
> +				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					oldi0_port0: port@0 {
> +						reg = <0>;
> +					};
> +
> +					oldi0_port1: port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +
> +			oldi1: oldi@1 {
> +				reg = <1>;
> +				clocks = <&k3_clks 186 0>;
> +				clock-names = "serial";
> +				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					oldi1_port0: port@0 {
> +						reg = <0>;
> +					};
> +
> +					oldi1_port1: port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		dss_ports: ports {
>   			#address-cells = <1>;
>   			#size-cells = <0>;


