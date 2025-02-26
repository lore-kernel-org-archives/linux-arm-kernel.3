Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E323C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vU92AfkXpo1upHQPW1E57oSrBRV5YkhXMeN9wMA5lys=; b=BrolH/jjbAigAi+xTnaBlFWQwF
	0HF5DZdbw/IQI+P6DpDjNUkEs5KzhhLrZkrvLwMiiT3ftW/BXOJJ4mHy7ROoF6MjBtPbg+nJJOyUA
	3c0gsWm72OfCTMicfBwHgQDviWVw+zCLNEqBrRq5hzOstCSfmFPm5tyd1Ifv3S31wDxYY3KzQRlqt
	44Qo1dbZYGu4djyVHPLOV6GcWNI2zYjLJjz3nP+Vi3FZekq7qRfc368LmWmk+1sgrTKlobHbDyeWJ
	5EeJ5Eeb55qBWJw9wijVC0fuj0bi5v4G3Z4uzx1of+szF9ntp+Yyj5wrfEOgiF9bnthwwyv26PMFl
	dvZDexKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBMl-00000002c6d-25Th;
	Wed, 26 Feb 2025 06:57:59 +0000
Received: from mail-m1973181.qiye.163.com ([220.197.31.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBEB-00000002aku-0915;
	Wed, 26 Feb 2025 06:49:08 +0000
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c3c2a2d3;
	Wed, 26 Feb 2025 14:48:58 +0800 (GMT+08:00)
Message-ID: <a4f43d3e-2e41-4163-8938-5aa1592db371@rock-chips.com>
Date: Wed, 26 Feb 2025 14:48:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scsi: ufs: rockchip: Fix spelling mistake "susped"
 -> "suspend"
To: Colin Ian King <colin.i.king@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-scsi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250225101142.161474-1-colin.i.king@gmail.com>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250225101142.161474-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNCHlYdTBlJHhodGBpOSENWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9541040a1509cckunmc3c2a2d3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6PBw4UTILHQsaTh4TMzIq
	VhkKCSNVSlVKTE9LTk5JTkhCTEpJVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUNNTjcG
DKIM-Signature: a=rsa-sha256;
	b=M1sany9xNBK7VREkWV+9K9oI/K7EOJWY8i/mkHFni5If+uuFp4nTfsfWo9NCBVfDJdv9SDXXVnASaacyLeGHJB5rIQt9n3k0cBugM1hAYPP0B+QlPaT6e/DmwYoHFTvU8BUo6xe397yo4rW3fLRhW2Du3oV/FRStof5aetgnBqQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vU92AfkXpo1upHQPW1E57oSrBRV5YkhXMeN9wMA5lys=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_224907_600201_DEDE14D2 
X-CRM114-Status: GOOD (  12.24  )
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

在 2025/2/25 18:11, Colin Ian King 写道:
> There is a spelling mistake in a dev_err message. Fix it.
> 

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks Colin.


> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/ufs/host/ufs-rockchip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-rockchip.c b/drivers/ufs/host/ufs-rockchip.c
> index 5b0ea9820767..dddff5f538b9 100644
> --- a/drivers/ufs/host/ufs-rockchip.c
> +++ b/drivers/ufs/host/ufs-rockchip.c
> @@ -307,7 +307,7 @@ static int ufs_rockchip_system_suspend(struct device *dev)
>   
>   	err = ufshcd_system_suspend(dev);
>   	if (err) {
> -		dev_err(hba->dev, "UFSHCD system susped failed %d\n", err);
> +		dev_err(hba->dev, "UFSHCD system suspend failed %d\n", err);
>   		return err;
>   	}
>   


