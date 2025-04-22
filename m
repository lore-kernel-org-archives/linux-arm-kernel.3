Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v51vKfr7DzpGiS8TUuiN8VaxEHUFx90HhYyLRwpldc=; b=5F69M3lTYfHiGPEFSJCxj5ML4n
	KZymWsCS1Yz9jDnrRKjmgARxKIeGQ780fEaDnLFcMzdNRBcPZnsh5mKwozGUSx+6yZriUL25PeNdB
	TR+XB50XXI1uETx9aGnsOhprC1UtxNgVqDzCkevlTZUtbttrBNC6Uk2nYQodVf8birer20OdwUgW3
	mLDB6bLOUY96hdWvG5WJQqvlmhwUAcPCAr/1vY8KSKAPZAIRNFhsr8tPqvKYajxzgCM1WO2IcnuAV
	iCUBpJihozF0GzkcHakKfzc0Y/sH1kdkUF3zq60NmZSfugnvMc/t4987K0IwI/9VH6pv+xXvxk/fb
	h4S241/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GBm-00000007qD1-16BH;
	Tue, 22 Apr 2025 16:09:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dt4-00000007LX8-1EZS;
	Tue, 22 Apr 2025 13:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329328;
	bh=YNaemJenIfGTVf0p9VaES18mR2J/Nfm3GWA/YnugfoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HTTVR17XhX+/F2KAZSI8Cpfg0uWxw1EvyRZHnLgzNx1xDApfvatz6gLY4ujC5VKlu
	 s2dFte56ef8paMWJZIkY2OfG0h5nN3HhJOjgp9WQAOjzWIlthM+WMtjJxXQuuW4yD6
	 x36cLZvPOpPpI2yyT/4QB08f38OQmO4FvqRadnp6BkDzmCfTyVv/C57G40TW84tb//
	 wcrIsiMQHEHUI38zsnUS/s0vaPolM9vmpomJUgf18rJNAhOjiwUBTEF4YEuM8jCTo0
	 E4ziBIinGgyF2lb1xjThpZORo7hzFFb4Nab81ccJARuwtzZ4DYPcvrrEJCN2N8bvBQ
	 IgUBOUlu5YUZQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C65E17E0B9D;
	Tue, 22 Apr 2025 15:42:07 +0200 (CEST)
Message-ID: <17b19733-b203-40bd-ba14-07eb66f02d6c@collabora.com>
Date: Tue, 22 Apr 2025 15:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_dpi: Allow additional output
 formats on MT8195/88
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
 <20250409131306.108635-5-angelogioacchino.delregno@collabora.com>
 <270828a4074dcb0d1017cee0c5ce0406991fbc8d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <270828a4074dcb0d1017cee0c5ce0406991fbc8d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064210_512619_115672D5 
X-CRM114-Status: GOOD (  19.99  )
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

Il 22/04/25 08:01, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2025-04-09 at 15:13 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Allow additional output formats in both DPI and DP_INTF blocks of
>> the MT8195 and MT8188 SoCs (as the latter is fully compatible with,
>> hence reuses, the former's platform data for both blocks) by adding:
>>
>> 1. New formats to the `mt8195_output_fmts` array for dp_intf,
>>     lacking YUV422 12-bits support, and adding RGB888 2X12_LE/BE
>>     (8-bits), BGR888 (8-bits) RGB101010 1x30 (10-bits), and YUV
>>     formats, including YUV422 8/10 bits, and YUV444 8/10 bits; and
>> 2. A new `mt8195_dpi_output_fmts` array for DPI only, with all of
>>     for formats added to dp_intf and with the addition of the
>>     YUYV12_1X24 (YUV422 12-bits) output format.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index a9e8113a1618..9de537a77493 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1093,9 +1093,29 @@ static const u32 mt8183_output_fmts[] = {
>>          MEDIA_BUS_FMT_RGB888_2X12_BE,
>>   };
>>
>> +static const u32 mt8195_dpi_output_fmts[] = {
>> +       MEDIA_BUS_FMT_RGB888_1X24,
>> +       MEDIA_BUS_FMT_RGB888_2X12_LE,
>> +       MEDIA_BUS_FMT_RGB888_2X12_BE,
>> +       MEDIA_BUS_FMT_RGB101010_1X30,
>> +       MEDIA_BUS_FMT_YUYV8_1X16,
>> +       MEDIA_BUS_FMT_YUYV10_1X20,
>> +       MEDIA_BUS_FMT_YUYV12_1X24,
>> +       MEDIA_BUS_FMT_BGR888_1X24,
> 
> What's the order you follow?
> I would like RGB together and YUV together.
> 

Actually, BGR888_1X24 should come before RGB888_1X24 now that you make me notice..!

Those are ordered by preference (and the order won't be respected in the actual
code anyway).... as in:
- For RGB 8-bits, RGB888_1X24 is the one that should be preferred
- For RGB 10 bits there's only one so ...
- For yuv modes - YUYV is preferred to YUV
   - there's only one for each, so in that case it's alphabetical
     meaning that yuyv8 comes before yuyv10

If you want, you can reorder them as you wish anyway - there's no strong reason
against any kind of ordering.

Besides, if you can change to the order that you prefer while applying this commit
that's great - otherwise just tell me what order you precisely want and I'll send
a v2 for the entire series :-)

Cheers,
Angelo

> Regards,
> CK
> 
>> +       MEDIA_BUS_FMT_YUV8_1X24,
>> +       MEDIA_BUS_FMT_YUV10_1X30,
>> +};
>> +
>>   static const u32 mt8195_output_fmts[] = {
>>          MEDIA_BUS_FMT_RGB888_1X24,
>> +       MEDIA_BUS_FMT_RGB888_2X12_LE,
>> +       MEDIA_BUS_FMT_RGB888_2X12_BE,
>> +       MEDIA_BUS_FMT_RGB101010_1X30,
>>          MEDIA_BUS_FMT_YUYV8_1X16,
>> +       MEDIA_BUS_FMT_YUYV10_1X20,
>> +       MEDIA_BUS_FMT_BGR888_1X24,
>> +       MEDIA_BUS_FMT_YUV8_1X24,
>> +       MEDIA_BUS_FMT_YUV10_1X30,
>>   };
>>
>>   static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
>> @@ -1208,8 +1228,8 @@ static const struct mtk_dpi_conf mt8192_conf = {
>>
>>   static const struct mtk_dpi_conf mt8195_conf = {
>>          .max_clock_khz = 594000,
>> -       .output_fmts = mt8183_output_fmts,
>> -       .num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>> +       .output_fmts = mt8195_dpi_output_fmts,
>> +       .num_output_fmts = ARRAY_SIZE(mt8195_dpi_output_fmts),
>>          .pixels_per_iter = 1,
>>          .is_ck_de_pol = true,
>>          .swap_input_support = true,
>> --
>> 2.49.0
>>
> 


