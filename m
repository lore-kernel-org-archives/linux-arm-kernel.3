Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91038C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 05:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRU7MBSf2wWijMMbUefq1mXuYp0x7VCTRKxEugD/E+o=; b=z/7ZpdIYVMshPrRi7cvtSjETtE
	PdSQkDFOPEfbzgJoh3zO5XtvMLaHnjPxXe7we/D2sPmnOpV0QoiMzcSoVGtCN4pMhVgGAOP0RKDSW
	pdvo9LKISIijakkAZ/TIssb14XtCIYzJUrMntMaByyjCdy0EtTa9KKDUVmPWfFHmUmDMQkCor5Mdr
	M1w39IZv8R0Ncly6udUTBbz1pAv10xHEYd5PxQDbuYii4C54kzthQds4LHcBxcgWiVXIFxkW58MlS
	cuy1a8KrE2HDeefQqESvJvhFZE7kdX1053ioF+BdP/Y/xC61kJM7x8Nd9O8ZtfY2gU1zA4pOUH0pB
	5gGaacBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9mQ-0000000BmlO-1Mba;
	Tue, 05 Aug 2025 05:00:06 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9io-0000000BmCw-2ZFk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:56:24 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5754uGaO206029;
	Mon, 4 Aug 2025 23:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754369776;
	bh=DRU7MBSf2wWijMMbUefq1mXuYp0x7VCTRKxEugD/E+o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=G3Z6h5jZvN1fnqoWcZmjOkbHJQKq+XtmD+mb6onaxsjXu3J4ysgPJXkjThlWOZCFV
	 XMhcQiI5LUdSMwsYyzqEioeQwHpRTrybU9n1oLqpYsaQ5B79rlONY0xCFpVnej78/0
	 0+5xB/0UkLSLwqxkliMf+zKyd5GqUhVNbY3PdkkI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5754uGEV2542974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 4 Aug 2025 23:56:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 23:56:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 23:56:16 -0500
Received: from [10.249.145.16] ([10.249.145.16])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5754uBGR1259545;
	Mon, 4 Aug 2025 23:56:12 -0500
Message-ID: <dcacfd08-8a2b-4da3-a7b2-42150540eaab@ti.com>
Date: Tue, 5 Aug 2025 10:26:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
To: Brandon Brnich <b-brnich@ti.com>, <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Udit
 Kumar <u-kumar1@ti.com>, Darren Etheridge <detheridge@ti.com>
References: <20250804180106.2393256-1-b-brnich@ti.com>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <20250804180106.2393256-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_215622_816053_AB8ADE7C 
X-CRM114-Status: GOOD (  16.86  )
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

Hi Brandon,

Thanks for the patch.
On 04/08/25 23:31, Brandon Brnich wrote:
> This adds node for E5010 JPEG Encoder which is a stateful JPEG Encoder
> present in J722s SoC, supporting baseline encoding of semiplanar based
> YUV420 and YUV422 raw video formats to JPEG encoding, with resolutions
> supported from 64x64 to 8kx8k.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
> 
> Changes in v2:
>   - remove invalid clock-names attribute
> 
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 5cfa7bf36641..fb24c14614b4 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -385,6 +385,16 @@ c7x_1: dsp@7e200000 {
>  		ti,sci-proc-ids = <0x31 0xff>;
>  		status = "disabled";
>  	};
> +
> +	e5010: e5010@fd20000 {
> +		compatible = "img,e5010-jpeg-enc";

This is missing ti specific compatible. As we don't use the IP block
directly but there is a wrapper used to integrate with TI platform, so
it is better to use TI specific compatible too to account for the future
compatibility as discussed here [1]. You can refer AM62A device-tree [2]
for references on this.

[1]:
https://lore.kernel.org/all/50d97c30-4926-0bbf-1209-dfd25043e359@ti.com/
[2] :
https://gitlab.com/linux-kernel/linux-next/-/blob/master/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi?ref_type=heads#L1150

Regards
Devarsh

