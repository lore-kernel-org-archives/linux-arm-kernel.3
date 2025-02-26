Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F217C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvkxqloIlTXo9JLh9EsUKKF24vwSjOiMeRjag/XPRuc=; b=UlA1dvfmL2DbS0qkzfQq805Dah
	CPJ+EfvQaxVT/pI6nXrb0elrpabW8sFLQSXRo/1TJzY4pjeSFBI/g5gFLkerBjvVp55FyGFSwpsVA
	mwH8CRh+77BiKoSHuscmOZ9+3Ypi0IEicSndnXg8p97553z6UpV880LJg3oLDsO6LJ+g5Pwfiu40q
	Q8G4Q05se62Zz/L3MHNIaJPjfJDdttP6+7jco46DB0lQXuwd8EChxut6QcFqc3n0vI2wtuApMBtUi
	LvSBTcNqAejzfnLFF9YUYD5cqW4SF68bb55i/YBAXdNuLhyI3unVGxSl7FthrSjbzH9TmFvStXfcz
	5Kp+cb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBOH-00000002cIY-057V;
	Wed, 26 Feb 2025 06:59:33 +0000
Received: from mail-m1973180.qiye.163.com ([220.197.31.80])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBEn-00000002arX-27jG;
	Wed, 26 Feb 2025 06:49:47 +0000
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c3c47c7b;
	Wed, 26 Feb 2025 14:49:41 +0800 (GMT+08:00)
Message-ID: <a18fb035-3e7f-443a-8b24-9a51cba5604a@rock-chips.com>
Date: Wed, 26 Feb 2025 14:49:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, martin.petersen@oracle.com, heiko@sntech.de,
 linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, James.Bottomley@HansenPartnership.com
Subject: Re: [PATCH -next] scsi: ufs: rockchip: Simplify bool conversion
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20250226021157.77934-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250226021157.77934-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0NNT1ZKH0hOS0NKHx8ZHkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a954104b35509cckunmc3c47c7b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kz46Fjo*GDIKMwsDTh4qMxwW
	VktPCRxVSlVKTE9LTk5JTkNISEtJVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpKSU03Bg++
DKIM-Signature: a=rsa-sha256;
	b=GDaQiCWDoYocllNU6WqKHl5m9xRxpcznUkUedTxHBomfvOO/UfsHDYxKuNmU/5Vl7SAtbkmy79QcfIew8C3GU5v5i1+sB1KHMHcsG7KO2GgLXUbCoUht9ILjVM/mZW3hwIRmTlkOljc6BudXvicBkuIWTqQ54c2maLyOufFlvqQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=cvkxqloIlTXo9JLh9EsUKKF24vwSjOiMeRjag/XPRuc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_224945_748516_639067CE 
X-CRM114-Status: GOOD (  12.06  )
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

在 2025/2/26 10:11, Jiapeng Chong 写道:
> ./drivers/ufs/host/ufs-rockchip.c:268:70-75: WARNING: conversion to bool not needed here.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19055
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks Jiapeng.


> ---
>   drivers/ufs/host/ufs-rockchip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-rockchip.c b/drivers/ufs/host/ufs-rockchip.c
> index 5b0ea9820767..350cb0f8d0c2 100644
> --- a/drivers/ufs/host/ufs-rockchip.c
> +++ b/drivers/ufs/host/ufs-rockchip.c
> @@ -265,7 +265,7 @@ static int ufs_rockchip_runtime_suspend(struct device *dev)
>   	clk_disable_unprepare(host->ref_out_clk);
>   
>   	/* Do not power down the genpd if rpm_lvl is less than level 5 */
> -	dev_pm_genpd_rpm_always_on(dev, hba->rpm_lvl < UFS_PM_LVL_5 ? true : false);
> +	dev_pm_genpd_rpm_always_on(dev, hba->rpm_lvl < UFS_PM_LVL_5);
>   
>   	return ufshcd_runtime_suspend(dev);
>   }


