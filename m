Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD3FC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY17ZoztUK1pT2AXyZLmBdvwKx3peOWAZrkwlCco0uU=; b=RbuvxCsgoe11kLQt7JGaKi7v8O
	2BvZV0F63NUgubQvkBBCqvW/h4sRi9ceUTYAwGzdYohulgCTJ6qk/tEB+iz4oPTCnK8XmBMwv0K19
	Hgdwkw+Il/Err7R5OIn/si4XGVbOoE6Xjtn/rrY+Zo2dSiR/wWD4ArHtAo92fbPpk45yf00YeI0ho
	0R9IA+3G9RLKHBNHZrRp6MCg7nHoqz8XOvjSmnVq2ttFRAbOkQHMug8A9GNtkKwJSlrJGm+lh6jqs
	LqOGT8p0YJ1l8GCKkBXS0QGw4BahNpqjnsJyGoaTkb8rOfsej5d3m2SXdzs0Dw39Hum/F9S9OTeBZ
	PFWDK9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Cfi-00000001em0-45W4;
	Sat, 19 Apr 2025 18:12:10 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Cdh-00000001eZu-18tj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 18:10:06 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JIA2NU1243663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 13:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745086202;
	bh=VY17ZoztUK1pT2AXyZLmBdvwKx3peOWAZrkwlCco0uU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YhqxFwNbNXQkPfqJXbR4q6CJmrabNNr657kRZobA205KRF53mUgOHFlecDuzOO44+
	 Cq3wEZ6d9yxKeHo2ndqHRdrTTzNd8uQk6hsuW0IObJQLwJGsscghRLJnFEh/4BngRM
	 E6hL/ifdchctkF92VCqwzxSKTJ4OyiwpE3r+pIGw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JIA2Ac003447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 13:10:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 13:10:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 13:10:01 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JI9uIZ071610;
	Sat, 19 Apr 2025 13:09:57 -0500
Message-ID: <f9cb52e2-d211-47b1-9536-3aa81db916c7@ti.com>
Date: Sat, 19 Apr 2025 23:39:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1
 and PCIe1 DAT1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-4-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417120407.2646929-4-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_111005_413511_77084B2B 
X-CRM114-Status: GOOD (  13.06  )
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


On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
> address space of the respective PCIe Controllers. Hence, update the
> ranges to include them.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> index a7f2f52f42f7..4f5d277c97a4 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> @@ -126,6 +126,8 @@ cbass_main: bus@100000 {
>   			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
>   			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
>   			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
> +			 <0x40 0x00000000 0x40 0x00000000 0x00 0x08000000>, /* PCIe0 DAT1 */
> +			 <0x41 0x00000000 0x41 0x00000000 0x00 0x08000000>, /* PCIe1 DAT1 */

Do you want to map whole 4GB or just 128M ?


>   			 <0x44 0x00000000 0x44 0x00000000 0x00 0x08000000>, /* PCIe2 DAT */
>   			 <0x44 0x10000000 0x44 0x10000000 0x00 0x08000000>, /* PCIe3 DAT */
>   			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */

