Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A05FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjLjHLo8vq7UGuwshBiMLZYXrkFgE8mMbQVqHPTdM0s=; b=RV4k21uuvJNY4wdxHb3qLFwLKo
	k3y++H4Dn/Ec5SHz0mQFHIEHg1HDEAHVIOFAObuCEExNoD9qYsihteZc6kXmfMBF33qGfznEKj6u6
	3NrGIxvT0P+Q74w3uWQFcXnm9l3USBhHGdRW57kSP6Z/bAa8Sw3/DH+LqnobhW6BKzbdbV16mO7BM
	FIENaaO0edt/VcsZM1AvAxJDMF7Z8lza91zzMi5RK6HmvGNA4HQksdCSV8KReUP5YelEDfvTTRvCw
	llmJGdiPiDDvsZywxwBD2p1BH9d60VWsTFyif/ia4CMgUHuZDv13OHmG60ZbQbjMBOqmT8MhqSR+H
	NL0oPfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWtJ-00000000Z5t-1CVg;
	Mon, 10 Feb 2025 16:44:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWqC-00000000YPS-3hB8;
	Mon, 10 Feb 2025 16:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739205658;
	bh=r4Zl1Il+gtt1dA7St3DHw+gh1dkHbNQGgMehLLYT3qU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hzs/7cliPJwuqFeWIC9LzOcF+4J7NHbs8elAwwQ3+jEpQjCIsRGcj8xlroObpRAiy
	 0Z/94dDtoG75jVop2vvJ0VX8Ea4gqOj2KIAGwp7kjl8tSW7rBaYzbB60MyFq1jUZSP
	 P+mZYNiPNxnALC41pxnU/3L3eT5xhKfbx7BAxQcYdkziJlcNvBOr6/U1jSfulu02+4
	 5iAyt021HBwPBTtNAZrYfdof/Dx3c1rvcqWqet63s9SpvTU5wGmBdTQdw/CBnvIPns
	 2463/QrH7thrjYXPd8zcOQKlnzTOLyfXrWqz3Ia4sIOICgIkUaZw/SLVL52uRVWVSb
	 oRDVxLkVp2gqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15E0F17E10C2;
	Mon, 10 Feb 2025 17:40:57 +0100 (CET)
Message-ID: <4a741f4a-8480-4d5a-bdf2-b81025587937@collabora.com>
Date: Mon, 10 Feb 2025 17:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/34] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
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
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
 <38a949ea89ed322579d9cc1aa820c374c33adcfa.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <38a949ea89ed322579d9cc1aa820c374c33adcfa.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084101_269081_62C740B6 
X-CRM114-Status: GOOD (  21.95  )
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

Il 10/02/25 07:58, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for splitting out the common bits from the HDMI
>> driver, change the mtk_cec driver from being registered from the
>> HDMI driver itself to be a module_platform_driver of its own.
> 
> CEC is not the common part, so the reason is not related to splitting out the common bits.
> I think the reason is HDMI v2 driver does not use CEC driver, so you want not to build CEC driver when HDMI v2.
> 

Yeah, that's right, I'll change the commit description to clarify that, thanks!

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Makefile   | 4 ++--
>>   drivers/gpu/drm/mediatek/mtk_cec.c  | 7 ++++++-
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
>>   drivers/gpu/drm/mediatek/mtk_hdmi.h | 1 -
>>   4 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index 32a2ed6c0cfe..bdd3a062f797 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -21,10 +21,10 @@ mediatek-drm-y := mtk_crtc.o \
>>
>>   obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>>
>> -mediatek-drm-hdmi-objs := mtk_cec.o \
>> -                         mtk_hdmi.o \
>> +mediatek-drm-hdmi-objs := mtk_hdmi.o \
>>                            mtk_hdmi_ddc.o
> 
> You don't need to separate mtk_cec to a independent module.

Yes, I do need to do that. You cannot compile two platform drivers in one obj.

Try to compile your suggestion and see how spectacularly it fails ;-)

Cheers,
Angelo

> You could include it in v1 and exclude it in v2.
> 
> Regards,
> CK
> 
>>
>> +obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>>
>>   obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
>> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
>> index b42c0d87eba3..c7be530ca041 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
>> @@ -12,7 +12,6 @@
>>   #include <linux/platform_device.h>
>>
>>   #include "mtk_cec.h"
>> -#include "mtk_hdmi.h"
>>   #include "mtk_drm_drv.h"
>>
>>   #define TR_CONFIG              0x00
>> @@ -102,6 +101,7 @@ void mtk_cec_set_hpd_event(struct device *dev,
>>          cec->hpd_event = hpd_event;
>>          spin_unlock_irqrestore(&cec->lock, flags);
>>   }
>> +EXPORT_SYMBOL_NS_GPL(mtk_cec_set_hpd_event, "DRM_MTK_HDMI_V1");
>>
>>   bool mtk_cec_hpd_high(struct device *dev)
>>   {
>> @@ -112,6 +112,7 @@ bool mtk_cec_hpd_high(struct device *dev)
>>
>>          return (status & (HDMI_PORD | HDMI_HTPLG)) == (HDMI_PORD | HDMI_HTPLG);
>>   }
>> +EXPORT_SYMBOL_NS_GPL(mtk_cec_hpd_high, "DRM_MTK_HDMI_V1");
>>
>>   static void mtk_cec_htplg_irq_init(struct mtk_cec *cec)
>>   {
>> @@ -247,3 +248,7 @@ struct platform_driver mtk_cec_driver = {
>>                  .of_match_table = mtk_cec_of_ids,
>>          },
>>   };
>> +module_platform_driver(mtk_cec_driver);
>> +
>> +MODULE_DESCRIPTION("MediaTek HDMI CEC Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index ca82bc829cb9..da725182f0db 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1805,7 +1805,6 @@ static struct platform_driver mtk_hdmi_driver = {
>>
>>   static struct platform_driver * const mtk_hdmi_drivers[] = {
>>          &mtk_hdmi_ddc_driver,
>> -       &mtk_cec_driver,
>>          &mtk_hdmi_driver,
>>   };
>>
>> @@ -1827,3 +1826,4 @@ module_exit(mtk_hdmitx_exit);
>>   MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
>>   MODULE_DESCRIPTION("MediaTek HDMI Driver");
>>   MODULE_LICENSE("GPL v2");
>> +MODULE_IMPORT_NS("DRM_MTK_HDMI_V1");
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
>> index 472bf141c92b..e40bc4651995 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
>> @@ -8,7 +8,6 @@
>>
>>   struct platform_driver;
>>
>> -extern struct platform_driver mtk_cec_driver;
>>   extern struct platform_driver mtk_hdmi_ddc_driver;
>>
>>   #endif /* _MTK_HDMI_CTRL_H */
>> --
>> 2.47.0
>>
> 



