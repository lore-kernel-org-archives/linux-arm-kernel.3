Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE9CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX9YVYA5jAptiqiz3ePOledX+7UoRF1EJu9+pXKGhZ4=; b=LKLxRw4rastSHq90CM8jbAA25i
	Yi/yGS7BFUNKm4uy4/TBwDepdWHjNx7HkxUFPJq6S344FIJpkjjFXncZWgwAaeRQkiXBdg2/zV6Hz
	aH1vD0zznWQHRIQE7Qdr3dr2YPIeZWW55eAWY6/Sxb5/YDhs3wiijtnND1ud4TDssMFBmm/x+fm10
	KDzvpEqI7ixBSu1ilRGsIkS6+fA7TxGmFBUKi6wg9OrcCVaWlAEZvsB+mfjatD5vLrEmNQ9vNYCt7
	D+vt7s4D/Xa8cMk3E+0McHbB7f3GPW62/wSzl6HUPyvMXPxElEqYJEtP1gH00u9TKMDyvmcNebGRl
	vbzXN5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPBN-00000009p2q-3f6u;
	Fri, 07 Feb 2025 14:18:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgP9N-00000009oaz-2ZxZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:16:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 517EFqeS3015119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 08:15:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738937752;
	bh=DX9YVYA5jAptiqiz3ePOledX+7UoRF1EJu9+pXKGhZ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H529LbRA3dyOtGm1qwWVVsm8+cYmWi8NhQtbcBehTXvYlPKm8skBqWQViaFJ3N07b
	 919psV9wHQXE+ZMUk6t4MesmwxINdOSaKNyJGxKU5cBZIb3muGJIFzwarJ4Xe/IYnF
	 I+o27B8qhmRiNNNtqGQIJeIuhy9gUF5N7p+XtdaE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 517EFqgh021501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 08:15:52 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 08:15:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 08:15:51 -0600
Received: from [10.250.151.109] ([10.250.151.109])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517EFm2C044276;
	Fri, 7 Feb 2025 08:15:49 -0600
Message-ID: <274838d7-08e5-4e09-b872-47644b96a219@ti.com>
Date: Fri, 7 Feb 2025 19:45:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: ti: k3-ringacc: include platform_device header
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <peter.ujfalusi@gmail.com>,
        <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <srk@ti.com>
References: <20250207065123.879863-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250207065123.879863-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_061609_787942_64B8C6A4 
X-CRM114-Status: GOOD (  14.45  )
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

Thanks for fix Siddharth

On 2/7/2025 12:21 PM, Siddharth Vadapalli wrote:
> Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
> users therefore will not include "platform_device.h", resulting in
> compilation warnings for the APIs declared in "k3-ringacc.h" which assume
> inclusion of "platform_device.h" by its users.
>
> Fix the compilation warnings by including the "platform_device" header
> file, which should ideally have been included since commit under Fixes.
>
> Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on commit
> bb066fe812d6 Merge tag 'pci-v6.14-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
> of Mainline Linux.
>
> Regards,
> Siddharth.
>
>   include/linux/soc/ti/k3-ringacc.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
> index 39b022b92598..6bbb58068048 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
> @@ -8,6 +8,7 @@
>   #ifndef __SOC_TI_K3_RINGACC_API_H_
>   #define __SOC_TI_K3_RINGACC_API_H_
>   
> +#include <linux/platform_device.h>
>   #include <linux/types.h>
>   

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   struct device_node;

