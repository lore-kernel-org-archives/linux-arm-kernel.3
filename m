Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC79C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEH/1gxIk510Nqct1xMg/A/MiupcMO3/eGizj/qCq8U=; b=fT5+96t+uWQHOKl5cImLabmtFF
	T/z+vYRpw3cdSmc9TJYrduyjK8HUyUT89vtiElL8Se4To/3Yg/47z+zm6sWite9Uuj5vGou1n0zXZ
	qf9TV4dWoq/3nwKM8oJLf2JJKdUQsKKwCOENURh/fcDAbtENt2iOkCy2iD2AcSg7UOhFGt+X7Y2pJ
	X/4mWQnhVB7mJ+olzNRr87EOU2v1JdYixZcEr1EqhCDanIxNhzfYXaUBseLk+F/KHiYiqR+LTokBw
	zAQUurgmsErRTeMOPgbJEMLkhDUzX/zO/rnd8em83Pd1ZwlsMQA189IIa008+aiBoaD9v2XLi7iGr
	QrGDkGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treOF-00000002yfr-1dzV;
	Mon, 10 Mar 2025 14:45:59 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcxr-00000002kjv-38Tr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:14:41 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ACqr1I032195;
	Mon, 10 Mar 2025 14:14:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YEH/1gxIk510Nqct1xMg/A/MiupcMO3/eGizj/qCq8U=; b=2Hw0ok2xiRUCGTVk
	3ZLzBswqFGoVzIwoLTz4mfpwk/vpdLN7K7hD1r33l0Fu7Mr04uYvZ3HGyg5FiBM0
	xrwR8Tp4azVEURP8wcUx3OJ6SidBq7AogkO9S87iBWOAbEArTrh5OwOVPvl/c5uY
	iJUFgUzp0M7hP6CODjA6FQ8YRVZheRDeH4QCdzs27WnS6kegJxoxIwJ5oYTsJ13l
	shZ7Wur3nkVRlgG4YD5UVWyhx44H/cM/0lCGY1CfBhxYs9DJ8pjUMIbUfLnmiNB3
	8JAzYib25h6ddPT5Tm2wqNj5OytbPCgjV6JwbD64ypwBz2VGTAIkodYk8IT3H1T4
	gTp55g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458f573me0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 14:14:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F7394005E;
	Mon, 10 Mar 2025 14:13:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9E8B4DD53D;
	Mon, 10 Mar 2025 14:12:22 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 14:12:22 +0100
Message-ID: <37d0b2f0-05c9-4e52-9fa9-d73ed0c56ec0@foss.st.com>
Date: Mon, 10 Mar 2025 14:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on
 stm32mp157c-dk2
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-amarula@amarulasolutions.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250310122402.8795-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250310122402.8795-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061440_090596_80DE7041 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Dario

On 3/10/25 13:23, Dario Binacchi wrote:
> Replace the number 2 with the appropriate numerical constant defined in
> dt-bindings/interrupt-controller/irq.h.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
> 
> ---
> 
> Changes in v2:
> - Drop inclusion of dt-bindings/interrupt-controller/irq.h header
> - Add Reviewed-by tag of Antonio Borneo
> 
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> index 5f9c0160a9c4..324f7bb988d1 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> @@ -67,7 +67,7 @@ &i2c1 {
>   	touchscreen@38 {
>   		compatible = "focaltech,ft6236";
>   		reg = <0x38>;
> -		interrupts = <2 2>;
> +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>   		interrupt-parent = <&gpiof>;
>   		touchscreen-size-x = <480>;
>   		touchscreen-size-y = <800>;

Applied on stm32-next.

Thanks
Alex

