Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F26E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATcqg704XGrYGg+mwPO/uGfEE/fj6lNNBOhrpQJmw3Y=; b=oGAaKf/313WJBWjXoPrLSy/iHt
	LM6wlUhciyBL7p7ad+kf8+Wl9LzyU+EvRECjR0qp/gtWxsdDS9lJKAHyawSZU5go2GQKBXTd7ebG2
	IHKjbaVjaV4jvSrqSDVcTZCSqWIVDB8dZc6DtnSihU4inihVLxsUU4w0qB/m45fBhcN/KN5aSsmeR
	FbfSuK1Gf3MYBv5hgPQ+Q/i65oPfDUhHHeY4mn9CYgbsqxtcCRKnKxphtNx/Rmq9FmAaeVZZJ/JWv
	6T9I6R0SqL4+lkhMR4CfFv7s992odJOSoWtbwqd27vkYG7EN8ur0fBOnCJATURsSCbTyDifiMz0lG
	Hc7hMUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPggI-00000009ueQ-1UzR;
	Mon, 23 Dec 2024 11:33:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgat-00000009tr6-18pK;
	Mon, 23 Dec 2024 11:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734953245;
	bh=iT8rP9qGXx/56h5Esz0UpqUy+cj0ktj8OxMn+u16KYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M9qvnOV9hOQF6VVJlCDo058mU472XkLN5yGMwRs/juFTgEwtqIGz8ZZQQISQygSjb
	 mwO0yDmvBdwF3O0llrHY9t3z0iUqxUcRcmHipJPEf/b1gu/h6l08ppkMzj1tJiToHC
	 HymUXL35r5Tz3nypDM0uZXupv+o+wgghRspAJGpSQYvI58srGBxOXdbBrz+GLAlw8a
	 Y6jghHEnbHDIxaShbhohMbsfMrxB2kgA/aayLHraP0pI3/+cTNkcihy7c7bqhnRMLL
	 I3LjNBGVdoeQLApQFYtQmOyopS82PsSj5PtAEy8oY32j04enrA18edN+KIVeQ20n9z
	 E2sB/IZamKKbQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B392D17E12AC;
	Mon, 23 Dec 2024 12:27:24 +0100 (CET)
Message-ID: <c3ebdefc-0a02-4f89-8469-8584529230a8@collabora.com>
Date: Mon, 23 Dec 2024 12:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/33] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-25-angelogioacchino.delregno@collabora.com>
 <498667e57b24c754d87742854bfbedfc821931cf.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <498667e57b24c754d87742854bfbedfc821931cf.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_032727_472462_637308E8 
X-CRM114-Status: GOOD (  21.92  )
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

Il 23/12/24 07:35, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-12-17 at 16:43 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
>> defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
>> and indicate that the mtk_hdmi_{remove,suspend} functions may be
>> unused (as they are, in case PM support is not built-in).
> 
> I see many driver use CONFIG_PM_SLEEP,
> and SIMPLE_DEV_PM_OPS() is defined to support suspend/resume function is not exist when CONFIG_PM_SLEEP is not defined,
> so there is no strong purpose to apply this patch.
> 
>>
>> While at it, to improve readability, also compress the
>> SIMPLE_DEV_PM_OPS declaration as it even fits in less
>> than 80 columns.
> 
> You have many typesetting in some patches.
> But I think typesetting is not related to the main purpose of that patch.
> I would like you to gather these typesetting modification to a readability patch.
> 

It's a cleanup per-se, and I think that pushing a commit for one line would be
cluttering the commit history way too much... and it's the same for the other
drivers anyway.

Also, backporting (if needed) is easier when those very small changes are in
tandem with the actual bigger change.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 5d46d486c68f..7e4536391cfb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
>>          mtk_hdmi_clk_disable_audio(hdmi);
>>   }
>>
>> -#ifdef CONFIG_PM_SLEEP
>> -static int mtk_hdmi_suspend(struct device *dev)
>> +static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>
>> @@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
>>          return 0;
>>   }
>>
>> -static int mtk_hdmi_resume(struct device *dev)
>> +static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>          int ret = 0;
>> @@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
>>
>>          return 0;
>>   }
>> -#endif
>> -static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
>> -                        mtk_hdmi_suspend, mtk_hdmi_resume);
>> +
>> +static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
>>
>>   static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
>>          .tz_disabled = true,
>> --
>> 2.47.0
>>
> 


