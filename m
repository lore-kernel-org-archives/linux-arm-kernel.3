Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E904E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg9YDNE7NZL6QA341dAe3fFHFsuKrAmaQvYm2F6huJE=; b=WOXokqHNn0GKVLUPdHYE1Ke0LZ
	WNsa9m/t420XIDKU6aKVojriOG/38vOyJhEcYqCaKONEkKPIXb78uc24kdROPy6b3d19H9cfuLMNV
	iDU/vdf7tZj5SFBsFH1tVcrxMnp4KWheqNDCbSQ3DfseR44otYUSYmVfbx87ixRbmC8oyokA75LKm
	WXLd8ONfpcfd5GadWNuXkwJWiwmwsXJNIuU6edSwxWNKwGm+iJvo4bdTu/TYHfQ5Hf1hST1kOTjC+
	nNIAe7RNehkw9CEOiH0nAAVV07vTP79PGLaGB7m7YcnZc5YrB+O7qaVBh8RsuzMgwUY5w4+N3B9Vg
	zRxSrZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaSg-00000007ATS-2EeG;
	Mon, 09 Dec 2024 09:53:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaOa-000000078sM-14b2;
	Mon, 09 Dec 2024 09:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733737770;
	bh=vDVoR6QJHDbAwKUmHAbTLSwKdLlywl2nMTNdrlzT7ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gLAlzeCQfkpTQp2EmlKFXooBQiBUryzCmDJjPB+gfcQaqEw9EgdVaJvhwctpQkX/J
	 Ob4ObKCYSBfEZ3dkPmuc9169HstBj8Ik0XVxy/ySYno8CqPJGYv60WspYpeKEoWNci
	 MrsJaNcevihSx7KjRvZH0SRmaI9Yt4Nl+pgIep0xDJZYhpyoJ+/Fm4Jlmq77RVkBjI
	 kmpgr6Ww4ESZP+Yr5sExjFYAKcqexK6sXrZm+aWPfdb4E/fcN5azk1XtffGLoF8cn7
	 GTpBsrD7cM8xOqhgz6HUMcTXtlXvEIy11dXbFRfJIryJtBZoQw1fZGF5cvK+M0xd/i
	 sdm6z27mHpq6Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F2EB17E3615;
	Mon,  9 Dec 2024 10:49:29 +0100 (CET)
Message-ID: <b5a77637-64b0-4ed3-9619-e76d094505af@collabora.com>
Date: Mon, 9 Dec 2024 10:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-14-angelogioacchino.delregno@collabora.com>
 <c0e144b3a90881066d0974157e66ac23f09a0fc5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c0e144b3a90881066d0974157e66ac23f09a0fc5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014940_455867_6E59C261 
X-CRM114-Status: GOOD (  14.22  )
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

Il 09/12/24 09:17, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for adding the new HDMI TX v2 IP driver, assign the
>> pointer to the DDC adapter to struct drm_bridge during probe.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 1b23ab6969ec..4f708b04f5e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -410,6 +410,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
>>          hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
>>          hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>          hdmi->bridge.of_node = pdev->dev.of_node;
>> +       hdmi->bridge.ddc = hdmi->ddc_adpt;
> 
> I don't know why only v2 driver need to assign this?
> Could you point out the code where access this value?
> 

v2 uses hdmi helpers, which make use of bridge->ddc.
mtk_hdmi_v2_bridge_edid_read() calls drm_edid_read().

drm_edid.c -> drm_edid_read()
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/drm_edid.c?h=next-20241209#n2704

...while v1 feeds the (internal) ddc pointer to drm_edid_read_ddc() instead.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>>          ret = devm_drm_bridge_add(dev, &hdmi->bridge);
>>          if (ret)
>> --
>> 2.47.0
>>
> 



