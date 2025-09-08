Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0015ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14TSHFLKvEMEzuJ+6xG5V1fqFjVsb8UT1QEiAfFWu+A=; b=sI/99M5RcEhrSBK9rYmboJBeaz
	D1vmv8iYf8rAQJIdtI4miSgMEucKpmyq0CfRJoOm0w8FqnvAfyhe8EebT0+6CehHYVdPVT3B+DLGf
	9BEh+6Chsac5m1kihJjHX+1m/VXJi3Y+QpNOOGalP1aJG74gbt+uDh7WW6oIEpJxMA2f/m6NJhXtH
	mNYPcXWYJ3VTJn7qSmelCRNSLZOwCqEGDmFFhgYh4EKuV1E6OT/mLp11kMNDaZyJRTS9lBHsB0STL
	6L4qDVuadAeF63QLsucjbWNrnPhKh1hSp3Zt6QM0vU5tVLwmlYhW5uZ4NtsYt1REG2gB6Z68JI2+9
	kNt+Oi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVwC-0000000FAPz-1l9l;
	Mon, 08 Sep 2025 07:05:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVom-0000000F7u9-3et0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 06:57:38 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5886vW7D045455;
	Mon, 8 Sep 2025 01:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757314652;
	bh=14TSHFLKvEMEzuJ+6xG5V1fqFjVsb8UT1QEiAfFWu+A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=b+mIez9JOG1FWUgo8ybpolDVqENmbHZOniVnCo9h2pTrRWDcypaYxmW+alqdhtr/J
	 sQxuK4NAxpETi8ZC64Q3QmXrW3NWx7WOBM0Iy90FJCwl0ILBQhYo+viYCoDYIqLcu2
	 uqPQrIZ2QD++TQh8tAyACG8Q292hEI20GyCaYDBw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5886vWd23581255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 01:57:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 01:57:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 01:57:31 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5886vRbk166893;
	Mon, 8 Sep 2025 01:57:28 -0500
Message-ID: <63c958a2-3973-4171-8a74-80381218723b@ti.com>
Date: Mon, 8 Sep 2025 12:26:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: ti: k3-pinctrl: Fix the bug in
 existing macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250904112538.529857-1-a-kaur@ti.com>
 <20250904112538.529857-5-a-kaur@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250904112538.529857-5-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_235737_095293_80B5CC32 
X-CRM114-Status: GOOD (  12.20  )
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



On 04/09/25 16:55, Akashdeep Kaur wrote:
> Currently, DS_IO_OVERRIDE_EN_SHIFT macro is not defined anywhere but
> used for defining other macro.
> Replace this undefined macro with valid macro. Rename the existing macro
> to reflect the actual behavior.
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---

Fixes: 325aa0f6b36e ("arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros") 

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>


>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 7c5b5783769c..36bb403d718e 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -88,8 +88,8 @@
>  
>  #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
>  #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
> -#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
> -#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_ISO_OVERRIDE_DISABLE     (0 << ISO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_ISO_OVERRIDE_ENABLE      (1 << ISO_OVERRIDE_EN_SHIFT)
>  #define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
>  #define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
>  #define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)

-- 
Regards
Vignesh
https://ti.com/opensource


