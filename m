Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8C4F532E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqovqAVOh/J3GxdWkjwkCOMcif7wlkSPNm8sBdge6o4=; b=3PAV6w0R7MBAy+zOqZANbmspL9
	Ci2a4iaV3sJtN/tAhXqJp4oyCz4/IiTr3zHu6YC+WQPORd0Pmv7A0pBvlAtXsfN9TdtdpcQIMi25t
	cN9l3jilE/jki1Nn4uZ204PY0WCAu3RKwVOES3a3ukRcNK0EfK5Jf4w2Oz3wkuQfV/w5CTG05ElZq
	NF6UFleAL5kc6RrkLJPiUSKjrb41RhMGDR5GJi3EBF27WPvjZB5hQHj11i7vDUM82xafIyAPYYkQM
	N++2tP0i6cEnyyfhZJPUdKBH/P6DV4APYkQLJ+FEP4MpuffjP7L+/XIr09QaiWo/WOX9n/3m4BeeF
	C5o8zKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wn0-00000000xDF-1S4B;
	Tue, 24 Mar 2026 08:07:02 +0000
Received: from mail-m3285.qiye.163.com ([220.197.32.85])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wmw-00000000xCR-2Kt9;
	Tue, 24 Mar 2026 08:07:00 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3812347a3;
	Tue, 24 Mar 2026 15:31:39 +0800 (GMT+08:00)
Message-ID: <418f84d2-fb2c-c4a3-6690-c86ec44d594f@rock-chips.com>
Date: Tue, 24 Mar 2026 15:31:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 1/1] scsi: ufs: rockchip: Drop unused include
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260320215606.3236516-1-andriy.shevchenko@linux.intel.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260320215606.3236516-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d1ec1a10009cckunm623cadc09c6d83
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkJIGFZOHktDHU4fGBlPSx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JeS80Zun1dOnGKzrio4K+VZ2PPPO3DJFTJeTYaTN0KG9mrg7FpwvVzLlzn0yn68uopv2X3SaR7uJB5V+MDT19eqNh/qx9zSRpDRIduhrPQlhgxz8gIM2qC3IXcagu6h0nhTePVbJpqG0j1j+qgFzlWpHkLOiGKh/NISYsnpiN3g=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=RqovqAVOh/J3GxdWkjwkCOMcif7wlkSPNm8sBdge6o4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010659_155025_7D275011 
X-CRM114-Status: GOOD (  12.14  )
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

在 2026/03/21 星期六 5:56, Andy Shevchenko 写道:
> This driver includes the legacy header <linux/gpio.h> but does
> not use any symbols from it. Drop the inclusion.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/ufs/host/ufs-rockchip.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-rockchip.c b/drivers/ufs/host/ufs-rockchip.c
> index 7fff34513a60..bac68f238e1c 100644
> --- a/drivers/ufs/host/ufs-rockchip.c
> +++ b/drivers/ufs/host/ufs-rockchip.c
> @@ -6,7 +6,6 @@
>    */
>   
>   #include <linux/clk.h>
> -#include <linux/gpio.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/of.h>

