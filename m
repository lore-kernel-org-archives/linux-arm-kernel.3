Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EB1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsG1T4j3H1rmWv/R1QZBJpKu8PHH3LDSWe8LQRzkGjk=; b=eyWP6NRsnTxSY6JunAciPaMALN
	C0ArtnrYbnXU++SYk5nyjGWHV4F6+j8Bwrvd+GMQuJS4i80JtILgSC+0WuNqKhHEh/LjiHaSo3PH4
	IwPIcdB9XOOGuHFV54m1d+NE4sZCC5BQ+ifVgeVFBKVs2JUzIyD9Sfeqr10FUEyzDwAG1g0rJE4EB
	tYlQ1ZgAogv6Ld7yLLaKy4kzphBLujJ15TeeYKDlWcN9PW8J8oZ65EvZx6m33/iuu1OZ3Qrs9Y6DX
	suzj3hJ14EM/jHHsy7LUSB/lzc1OQPNgFDLSXZPnUiET3+fEcWwsSx0eLleleLdHW4VTA56kjQlVK
	6NE53kTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNt-00000005InF-0PqM;
	Tue, 15 Apr 2025 10:19:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4d5Q-00000005FCN-2vVw;
	Tue, 15 Apr 2025 10:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744711210;
	bh=9yw0Qzz1F9KcriheuD2Lay5nFwu3/DTc+aJ7BlFLoTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DwHUv9d1qTN+uPe8HwwTS+BIN8TB0IIPrqWppWKEa6OHF2/zGpdeH4DkkM0vnOxk5
	 1n3kY72+9K554uTmWtJxThiJFOYDc5/815u3xZE2/nFY0dPOMRJ/1mZrWiL4QvqoWh
	 V8xmlhAcLRoeBoT3g8wIzoVgot/pahpErOJH4iyXlPUeOPCqgliBAcZkoAa0xq8eBc
	 D0fvajYGv5N5b896UpLKVs7PwhcTiNr//tm8zPltooPJG2pr2HjQaBquBP+OyBEWP4
	 ZfX96iMBdrhAySsvZrSgDdy8IWjHnrjbQBbH4tCeus4czUZbE9Jre50OmW40KyINOt
	 ZdzKBlFhlQjaQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BF1F17E0FA7;
	Tue, 15 Apr 2025 12:00:09 +0200 (CEST)
Message-ID: <385e75f7-9b45-46cf-9202-1951c7e0fe5e@collabora.com>
Date: Tue, 15 Apr 2025 12:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/23] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
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
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
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
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
 <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
 <a73ae86c406de1002c7fcff9f34c2eeaaa5f03dc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a73ae86c406de1002c7fcff9f34c2eeaaa5f03dc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_030012_877480_E4E64ADD 
X-CRM114-Status: GOOD (  17.06  )
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

Il 15/04/25 10:14, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2025-04-09 at 15:13 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>> argument.  Except simpler code this annotates within one line that given
>> phandle has arguments, so grepping for code would be easier.
>>
>> There is also no real benefit in printing errors on missing syscon
>> argument, because this is done just too late: runtime check on
>> static/build-time data.  Dtschema and Devicetree bindings offer the
>> static/build-time check for this already.
> 
> Please rebase this patch to the first patch of this series.
> I would like to apply refinement patch first then apply hdmi v2 patches.
> 

Please use the original patch if it still applies, then:

20250112134708.46100-1-krzysztof.kozlowski@linaro.org

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> [Angelo: Rebased over HDMIv2/DDCv2 series cleanups]
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 784bc05c9541..00a638a3caf4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -269,12 +269,9 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
>>           * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>>           * registers it contains.
>>           */
>> -       hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
>> +       hdmi->sys_regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
>> +                                                               1, &hdmi->sys_offset);
>>          if (IS_ERR(hdmi->sys_regmap))
>> -               return PTR_ERR(hdmi->sys_regmap);
>> -
>> -       ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
>> -       if (ret)
>>                  return dev_err_probe(dev, ret,
>>                                       "Failed to get system configuration registers\n");
>>
>> --
>> 2.49.0
>>
> 



