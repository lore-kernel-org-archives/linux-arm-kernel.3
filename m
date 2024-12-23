Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C822E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhQAW8QrF0FhUZLJgd4RVxOB+zK7JtzkMs61geLc59k=; b=rsc9jTyhLbdpTD8wTCAuZXkBUA
	Kv3MbgHoLJ0RuF+huhrhWkhY3qHPpo/hXBfPzkv0F0xVhsvDn99Mt4UBQ7z0sjjzv3rSsJKQ8J/5W
	f6Od5lynOFlbscusaaEw7Nps2ip68U07t95+KzcFZSiy9d3jKYxPSBi8o74AEpFwEdPLQ12wuu8D1
	L9A/H1NF6GQeT2KjP5KLu9PQ6xSX10vT63NvqPaa37Qqs7QIIwD6aatr9Z1+AsUcMbxg209pchJcy
	H/SMPPItaiCYGY08zdL4e+5NmUwdvfxXKMiPyjNvhuSSpjnpNlR5K7FSQJBdUJ25DFPTT5QDRX171
	L7Io4zcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgdy-00000009uHY-2syx;
	Mon, 23 Dec 2024 11:30:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgYH-00000009tRi-2jk2;
	Mon, 23 Dec 2024 11:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734953084;
	bh=NRcfmDjn8UNSALsqpI/fU+BwsweJgc6KVSgcC1eHNQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtEPt0jghy373yLNV58v7ldO8eammTxNBuz+XQOcFD9Ov7oSWSla3JUU3N7jmQw3I
	 NjzIz1C3pKIIyTvXPc1dcQ7kbQGWUCeObLBTDg8jwE7h/tlZ7r9+m9Z9NJ/ylv59KB
	 SNW5UceRV5Y5Sopw5HguvhjAhu8pEnXIioqcgsNHL4aOkArMx9+pdhhyWFH/6WI7v7
	 nj9gDGUMBbtaimTSqeqcCsG2crJ7zwPdBFT10JSDT/80YXpCsD7q3bpWrh2gvq+1EO
	 kOegUlAj2EAA6LurT2sr/iIdzXHvwaR5B4/tqf3oPZTwS9sJn65vwluU9uVCr3pDFP
	 MjYdTnrftWh5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AC6F17E362C;
	Mon, 23 Dec 2024 12:24:43 +0100 (CET)
Message-ID: <c6b67d11-3532-4347-aebc-c47cf54470b1@collabora.com>
Date: Mon, 23 Dec 2024 12:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/33] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
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
 <20241217154345.276919-12-angelogioacchino.delregno@collabora.com>
 <8c5857cc3602342e9d1b4cf6689a0d5a044d9a1d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8c5857cc3602342e9d1b4cf6689a0d5a044d9a1d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_032445_847399_4EC497E8 
X-CRM114-Status: GOOD (  22.31  )
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

Il 23/12/24 06:22, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-12-17 at 16:43 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> The probe function of this driver may fail after registering the
>> audio platform device: in that case, the state is not getting
>> cleaned up, leaving this device registered.
>>
>> Adding up to the mix, should the probe function of this driver
>> return a probe deferral for N times, we're registering up to N
>> audio platform devices and, again, never freeing them up.
>>
>> To fix this, add a pointer to the audio platform device in the
>> mtk_hdmi structure, and add a devm action to unregister it upon
>> driver removal or probe failure.
>>
>> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 59a8a81fa0ec..9131c2fdfba8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -172,6 +172,7 @@ struct mtk_hdmi {
>>          unsigned int sys_offset;
>>          void __iomem *regs;
>>          enum hdmi_colorspace csp;
>> +       struct platform_device *audio_pdev;
>>          struct hdmi_audio_param aud_param;
>>          bool audio_enable;
>>          bool powered;
>> @@ -1662,6 +1663,11 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
>>          .no_capture_mute = 1,
>>   };
>>
>> +static void mtk_hdmi_unregister_audio_driver(void *data)
>> +{
>> +       platform_device_unregister(data);
>> +}
>> +
>>   static int mtk_hdmi_register_audio_driver(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> @@ -1671,13 +1677,22 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
>>                  .i2s = 1,
>>                  .data = hdmi,
>>          };
>> -       struct platform_device *pdev;
>> +       int ret;
>>
>> -       pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
>> -                                            PLATFORM_DEVID_AUTO, &codec_data,
>> -                                            sizeof(codec_data));
>> -       if (IS_ERR(pdev))
>> -               return PTR_ERR(pdev);
>> +       hdmi->audio_pdev = platform_device_register_data(dev,
>> +                                                        HDMI_CODEC_DRV_NAME,
>> +                                                        PLATFORM_DEVID_AUTO,
>> +                                                        &codec_data,
>> +                                                        sizeof(codec_data));
>> +       if (IS_ERR(hdmi->audio_pdev))
>> +               return PTR_ERR(hdmi->audio_pdev);
>> +
>> +       ret = devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_driver,
>> +                                      hdmi->audio_pdev);
>> +       if (ret) {
>> +               platform_device_unregister(hdmi->audio_pdev);
> 
> When devm_add_action_or_reset() fail, it would call mtk_hdmi_unregister_audio_driver() inside it.
> So it's not necessary to call platform_device_unregister() here.
> 

Oh, right. Yeah, that was quite an overlook from me.

I'll fix that in v4.

Thanks,
Angelo

> Regards,
> CK
> 
>> +               return ret;
>> +       }
>>
>>          DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
>>          return 0;
>> --
>> 2.47.0
>>
> 


