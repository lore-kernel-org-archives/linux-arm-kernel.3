Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DBBC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lud/orpWCqDvSqvMG+PNDdoot4w51To9S3IfgDckrw4=; b=BDD1WIceexf0rA+41moBX84deA
	sxSO9/Mo5IlflWy7SFHdWnoi2Ppdu6xdXbEiLZvkiY4BQu8/6HXAxzOsVnleYW6F5aWuUVpvUa750
	smWOU08GaRevQAkBpe2T9As9m4Y148N3kd8eUU5zq2AXmlSkAC1cv2aXKM2hPRfQc5yc/qzgiJE3a
	FfvSJdG8x/3rf0oD0nYETk5hMJICyToap1UK6cpiXwOQ33xsow3/7w7VuMQM0JiU774rbtinGWQVG
	Ut7+iJjJkdXUGJYGj+AsLzssOUxhNGhdbgZB0BZJJm+mCmB0U7joTPet3IHWqakhgYhjutVbWuO4X
	nHq8mFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FX5-00000007i8y-0iYH;
	Tue, 22 Apr 2025 15:27:35 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ELp-00000007RTh-31FB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:11:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEBoIB1983572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331110;
	bh=lud/orpWCqDvSqvMG+PNDdoot4w51To9S3IfgDckrw4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f754SAX9JbOlRl9Zeyr3XxtKdM6x7L5PlBjoBK0OVXs1amsTlP2H6b9jZ/PGZjdSk
	 tpBgGfI26yFVdRid5jfmWMMpJjreVhut2xHXVlrSxNWhtgD72i9+aTDIqQOXQMzsfv
	 tuAYX0XxOs7tqqd+7QfZWphASZjTGTZ+YlsyrUmE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEBoVY024798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:11:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:11:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:11:50 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEBkKf122223;
	Tue, 22 Apr 2025 09:11:47 -0500
Message-ID: <cca0a53c-6ee9-4837-86c6-3e67b8ead5ed@ti.com>
Date: Tue, 22 Apr 2025 19:41:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0
 DAT1 and PCIe1 DAT1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
 <20250422120042.3746004-4-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422120042.3746004-4-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071153_949763_962CB18B 
X-CRM114-Status: GOOD (  14.15  )
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

Thanks Siddharth

On 4/22/2025 5:30 PM, Siddharth Vadapalli wrote:
> The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
> address space of the respective PCIe Controllers. Hence, update the
> ranges to include them.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Link to v1 patch:
> https://lore.kernel.org/r/20250417120407.2646929-4-s-vadapalli@ti.com/
> Changes since v1:
> - Fixed the 'ranges' to set the size as 4 GB instead of the incorrect
>    value of 128 MB.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> index a7f2f52f42f7..b6e22c242951 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> @@ -126,6 +126,8 @@ cbass_main: bus@100000 {
>   			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
>   			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
>   			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
> +			 <0x40 0x00000000 0x40 0x00000000 0x01 0x00000000>, /* PCIe0 DAT1 */
> +			 <0x41 0x00000000 0x41 0x00000000 0x01 0x00000000>, /* PCIe1 DAT1 *


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> /
>   			 <0x44 0x00000000 0x44 0x00000000 0x00 0x08000000>, /* PCIe2 DAT */
>   			 <0x44 0x10000000 0x44 0x10000000 0x00 0x08000000>, /* PCIe3 DAT */
>   			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */

