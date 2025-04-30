Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C4AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzZVq/fjsWYxZI6f7ZSLLSgCG96lHBZGmkDw/IbXKNo=; b=5DYRLxCLs1GBqAq3DVV52oAXEg
	r94luk/V7wGH+wgUggbVShDKgQO3i/IDVDf/BgXH244EmXadskIiJuOoEDr4+kR9meqbgxmMryG5r
	ofAwrDeg4CvIItwmTePKbcXIoArOytHQhA81VqAzd72r7o/e8mW1XlJ721BZIMiSSww1MQm5/fYQB
	zwGQuoi0Vznf6bgiz8MwjywTzflEN+mZOzYbfwlHQfuQwE3gmQj7TOQT49Z9NgDlF2aJjgSs6D/Bu
	7B56TkOb0BIdLuwWVACxwtrH4rgvm27B49/JFJZbOGWwOQmPGu5dj3Qbn6cn5wo+U/dJjeYl42CM9
	uIDWkO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1BI-0000000Btmx-43eo;
	Wed, 30 Apr 2025 06:44:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA19L-0000000BtYq-05nS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 06:42:34 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZVDU026607;
	Wed, 30 Apr 2025 08:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JzZVq/fjsWYxZI6f7ZSLLSgCG96lHBZGmkDw/IbXKNo=; b=nK98GykpHV+rAGjG
	26I4b5dRGewwj4dKBq7N+81FkrpR4VJ3KlfI5TtWr16oRSUSPiqv/XPO1Ly+5UDO
	YotXr94Aj5pTgbByru/zv2ciJljauu+DBQ9ZXLR5qmUqhumDr9zwDuUOX5LHSfE6
	6LU2JNLKLkZ9B4hHiDjOJZnU2uwomTEV6CKn/OrItvHsZ3qgdLc+Lt30vj+GLV8Q
	f966Irk5NprnPGyS+M7kClmk+kGjgjFd9XgppQVVstm670FDA2tQaWm/6t8f5wYs
	cgvucTmmIn3lX/6sJDaoWSPerGrMBYPePDuGt7Ub7SsHrEThWrDazNPi/0OWW+3/
	umNmvw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmse9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:42:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D54DA40050;
	Wed, 30 Apr 2025 08:41:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E054A375E3;
	Wed, 30 Apr 2025 08:39:47 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 08:39:46 +0200
Message-ID: <011681f1-a327-44de-b5d0-5230303f7540@foss.st.com>
Date: Wed, 30 Apr 2025 08:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: add low power timer on STM32F746
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>
References: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_234231_344425_0E1F5B43 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Ben

On 4/4/25 16:35, Ben Wolsieffer wrote:
> Add device tree node for the low power timer on the STM32F746.
> 
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>   arch/arm/boot/dts/st/stm32f746.dtsi | 34 +++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
> index 2537b3d47e6f..208f8c6dfc9d 100644
> --- a/arch/arm/boot/dts/st/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/st/stm32f746.dtsi
> @@ -43,6 +43,7 @@
>   #include "../armv7-m.dtsi"
>   #include <dt-bindings/clock/stm32fx-clock.h>
>   #include <dt-bindings/mfd/stm32f7-rcc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>   
>   / {
>   	#address-cells = <1>;
> @@ -245,6 +246,39 @@ pwm {
>   			};
>   		};
>   
> +		lptimer1: timer@40002400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x40002400 0x400>;
> +			interrupts-extended = <&exti 23 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&rcc 1 CLK_LPTIMER>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			trigger@0 {
> +				compatible = "st,stm32-lptimer-trigger";
> +				reg = <0>;
> +				status = "disabled";
> +			};
> +
> +			counter {
> +				compatible = "st,stm32-lptimer-counter";
> +				status = "disabled";
> +			};
> +
> +			timer {
> +				compatible = "st,stm32-lptimer-timer";
> +				status = "disabled";
> +			};
> +		};
> +
>   		rtc: rtc@40002800 {
>   			compatible = "st,stm32-rtc";
>   			reg = <0x40002800 0x400>;

Applied on stm32-next.

Thanks
Alex

