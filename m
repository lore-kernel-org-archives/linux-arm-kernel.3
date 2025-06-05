Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F0C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H10o/tY3AC1MMCzRbOwQ4LuZubC3gNtit07JxX/EFNA=; b=AvgvtMM+U1rVW1JUqR5RdLt3z7
	oB7wU9rPyqOq0P7vtQmrDVKuPam0TA6yLi7wucRd2pBf1tRJLHFnhoNsncJlXIqxOvxQd+e0L9gcx
	J0Yw4kL1B4UnZuZ6IcbwtVW0XlIlFVtaM4UYPrlqt8X67jreaYpJ7BOqjndm4YpOmqXqwL1jpt8n2
	MjOS7IKgzKrFDfaO33n5nb2BblrSDQ6bPbn5EfxL2lky8X8Y8L0JMvgUtpPo7J5v0twJq96EMnivR
	Gb3cnIcRRZx6+gAO8r7sVU9e8kPm8QPtf3ZptOJrFf+IeCLPOi/aMvEljFMgz18tNk5Rz+Cd3DfWk
	Av5YxP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzyw-0000000EZ6Z-0HIf;
	Thu, 05 Jun 2025 02:05:26 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMztv-0000000EYQE-25tr;
	Thu, 05 Jun 2025 02:00:16 +0000
X-UUID: cdf716fe41b011f0b29709d653e92f7d-20250605
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:42cce35d-b191-4d52-8bd2-d3791e58895d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:40a90521bca85b4a2152347b6db4d582,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cdf716fe41b011f0b29709d653e92f7d-20250605
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2077564834; Thu, 05 Jun 2025 10:00:07 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 2D31716001A00;
	Thu,  5 Jun 2025 10:00:07 +0800 (CST)
X-ns-mid: postfix-6840FA26-862248265
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id 8FE2816001CC7;
	Thu,  5 Jun 2025 02:00:05 +0000 (UTC)
Message-ID: <6399b093-f8ce-4dff-9cf8-f483d221d034@kylinos.cn>
Date: Thu, 5 Jun 2025 10:00:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASOC: rockchip: Use helper function
 devm_clk_get_enabled()
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
 <3b3d8f60e553af09a51b501b8ff5406fa5e898dd.1749006565.git.xiaopei01@kylinos.cn>
 <24654754.ouqheUzb2q@workhorse>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <24654754.ouqheUzb2q@workhorse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_190015_837404_BF4491BD 
X-CRM114-Status: GOOD (  13.30  )
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


=E5=9C=A8 2025/6/5 01:42, Nicolas Frattaroli =E5=86=99=E9=81=93:
> On Wednesday, 4 June 2025 05:13:30 Central European Summer Time Pei Xia=
o wrote:
>> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prep=
ared
>> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now =
be
>> replaced by devm_clk_get_enabled() when driver enables the clocks for =
the
>> whole lifetime of the device. Moreover, it is no longer necessary to
>> unprepare and disable the clocks explicitly.
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>  sound/soc/rockchip/rockchip_sai.c | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/ro=
ckchip_sai.c
>> index 79b04770da1c..2ec675708681 100644
>> --- a/sound/soc/rockchip/rockchip_sai.c
>> +++ b/sound/soc/rockchip/rockchip_sai.c
>> @@ -1448,16 +1448,12 @@ static int rockchip_sai_probe(struct platform_=
device *pdev)
>>  				     "Failed to get mclk\n");
>>  	}
>> =20
>> -	sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
>> +	sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
>>  	if (IS_ERR(sai->hclk)) {
>>  		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
>>  				     "Failed to get hclk\n");
>>  	}
>> =20
>> -	ret =3D clk_prepare_enable(sai->hclk);
>> -	if (ret)
>> -		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
>> -
>>  	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
>> =20
>>  	ret =3D rockchip_sai_init_dai(sai, res, &dai);
>> @@ -1512,8 +1508,6 @@ static int rockchip_sai_probe(struct platform_de=
vice *pdev)
>>  	if (pm_runtime_put(&pdev->dev))
>>  		rockchip_sai_runtime_suspend(&pdev->dev);
>>  err_disable_hclk:
>> -	clk_disable_unprepare(sai->hclk);
>> -
>>  	return ret;
>>  }
>> =20
>>
> Please get rid of the err_disable_hclk label, and change the
>
>     goto err_disable_hclk;
>
> in the resume failure condition to a=20
>
>     return ret;

ok,thanks!

> Other than that, patch tested to be working fine.
>
> Kind regards,
> Nicolas Frattaroli
>
>

