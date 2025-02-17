Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28245C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zn9X5QbkJIdIagTel3G7oOAnIXhkOjaCrnBaeYGODeE=; b=EzJyvVuztaqDl9uzgA7O8StA+w
	LSSzFASF9/vCevoY6BWN3Ni/fqjsNz01msG7ywjhiR9uguC5lMx1kM30S6mw3HHe7L9cx9gf4UrlQ
	GHDDlJ3w7uKQz0FagtQ0SHtvHiVZinREAPi15YeoJ3rhIhH0C+QN39gEh5PM2mZ471LA9LEPxrsQ0
	AuXT/zsvPt6XexJeDQFM8r7PPy0b00QslhQEJMAjqY+6T57N9SyOLLqiBbpYdmZz8qe8RGNdIG/KH
	lRiRkrkzoqmjEbl46zOC292fplL3oJ/GNyhgUyHmvLCB3iJ3sfoxujVToeB6Hai9tGrwnhZF1Pf8u
	ZjrAgnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk39x-000000054Nc-0peY;
	Mon, 17 Feb 2025 15:35:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk38S-000000053X2-2UhI;
	Mon, 17 Feb 2025 15:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739806454;
	bh=lyGfHrjhZ3jptbHzIILAzBz3U/SLoQdMy2EzDU6nSXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a1VS6O25oIsd0ptLDudjGC9gQqK/8d9OW1uYWMPEwY/goXTIElKTAw6J5Juio8/qd
	 14MqJJ2qkXQa3WITW6nDmoWe6RO4oSIug3DhUgU31l33ycBd9NvI4/e2aD8YMM71px
	 exrlMpEQ3n42aZTu9NmpZclEvnAAjkb6bft7PAEdZEdfoBnQGwT5Mjb3hzGYoT7RxA
	 fD3i9IE7RFHdy67eG/+cqq0T3Y4ReU7vEzoJ+tPORmhgp47M6REl2ELw7S0R1laiop
	 fJI67ItULKckWvdchfZgmUh76Xd7TKaS8vti1ngdk8SpXwEhN5gDza0YADdtAkn+7k
	 ztQjn0KGh52XQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D92817E1507;
	Mon, 17 Feb 2025 16:34:13 +0100 (CET)
Message-ID: <5d09d32b-d5cf-44a9-96de-30c8b5e23256@collabora.com>
Date: Mon, 17 Feb 2025 16:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/42] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
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
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-28-angelogioacchino.delregno@collabora.com>
 <6378d714b5f5197b70aba1adaa6ca5d358aa2c41.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6378d714b5f5197b70aba1adaa6ca5d358aa2c41.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073416_787351_F79CF54E 
X-CRM114-Status: GOOD (  19.50  )
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

Il 14/02/25 04:20, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 12:33 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for moving the common bits of this driver, merge the
>> contents of mtk_hdmi_output_init in mtk_hdmi_register_audio_driver
>> function to aggregate all of the initial audio setup together in
>> the same function and to make it clear that all of the setup that
>> is performed in mtk_hdmi_output_init is specifically related only
>> to audio and not video.
>>
>> While at it, also remove the "%s driver bound to HDMI" debugging
>> print disguised as informative.
> 
> Previous reply only to Angelo, so re-replay to all agian.
> 
> This patch does not include print modification,
> After remove this message,
> 

Sorry, forgot to remove that, too many patches to care about :')

Removing for v7.

Thanks!
Angelo

> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 ++++++++-------------------
>>   1 file changed, 8 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index e43dbcc0d068..98e8c186dff4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1025,20 +1025,6 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>>          return 0;
>>   }
>>
>> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
>> -{
>> -       struct hdmi_audio_param *aud_param = &hdmi->aud_param;
>> -
>> -       aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> -       aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> -       aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
>> -       aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> -       aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
>> -       aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> -
>> -       return 0;
>> -}
>> -
>>   static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
>>   {
>>          mtk_hdmi_hw_send_aud_packet(hdmi, true);
>> @@ -1617,6 +1603,7 @@ static void mtk_hdmi_unregister_audio_driver(void *data)
>>   static int mtk_hdmi_register_audio_driver(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> +       struct hdmi_audio_param *aud_param = &hdmi->aud_param;
>>          struct hdmi_codec_pdata codec_data = {
>>                  .ops = &mtk_hdmi_audio_codec_ops,
>>                  .max_i2s_channels = 2,
>> @@ -1626,6 +1613,13 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
>>          };
>>          int ret;
>>
>> +       aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> +       aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> +       aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
>> +       aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> +       aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
>> +       aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> +
>>          hdmi->audio_pdev = platform_device_register_data(dev,
>>                                                           HDMI_CODEC_DRV_NAME,
>>                                                           PLATFORM_DEVID_AUTO,
>> @@ -1668,11 +1662,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
>>          mutex_init(&hdmi->update_plugged_status_lock);
>>          platform_set_drvdata(pdev, hdmi);
>>
>> -       ret = mtk_hdmi_output_init(hdmi);
>> -       if (ret)
>> -               return dev_err_probe(dev, ret,
>> -                                    "Failed to initialize hdmi output\n");
>> -
>>          ret = mtk_hdmi_register_audio_driver(dev);
>>          if (ret)
>>                  return dev_err_probe(dev, ret,
>> --
>> 2.48.1
>>
> 


