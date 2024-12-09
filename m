Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2E8E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvGrIzK31GTBFjNGvfPnzGTHYWWNCo7wk0oYnACbL3c=; b=w7KMGTc7/fAQ4JEuBeJJht1tr0
	1oc6vlY8RdeOh02H8CwWlHJ6++ysYMoLopIJMKZZjtUSjSRmRh68957SEro0aUaS0lN1fNh7mxiQY
	Q/mED1GpyHio/3jOjiy1nMNXo9oYcQ0ifxsjh7BvIw0sll0x9LskVaJN8qHkOsWmfsa+2jDhMnH55
	OV4HJ5SCjb1fouF0EF1ZHzDknaIw6s0FmPwCvRWP+bjTTrduFftbe+jzgnfBxTRJ7ZduhMFlsNSBI
	hiyT+k7L7Yv5lVwfWsvSSVLfZgrpMax7c2nzpGFsHPU4NCCzjpkWLVf7qF/IGWJ8KZY7Jqj2VF5j3
	Q19Uwzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKatr-00000007GZp-01BR;
	Mon, 09 Dec 2024 10:21:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaV3-00000007BK9-2cpI;
	Mon, 09 Dec 2024 09:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733738179;
	bh=nplaTSeRl93wINz5j7eOZBcNUOXjUDq4lRiwbGpfj40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kncwX2M3cPzLj6tuhX7ozxLhSdFfurogINElznEJ+g7f7tM+P/eAKGHnGdO2vorCe
	 kxwU0+7WBu5ArBUSqC1m2Dw3O4Sso6GqPmeEIpalobzZylB+DhBy21U/t08dNFp3Sr
	 /4Wq/zD66z4WoCiWWsukZ0kzobBxXBa01prLQckoMIW42CkAqpLlrBNs76s6oU7km2
	 4/MHePcpGQHbePjsuT6w20n/C75bZwq1KTCamUDBDZMwBSiWpPeCRNzVsxqjXXduC7
	 s6yJULljut9HnPmo0aL3ALBzSm3uVlAh52VJ94o2UBwtGWqvtnODK9DxUFdphpoWRq
	 aItkqqgKTO5yA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8140817E3624;
	Mon,  9 Dec 2024 10:56:18 +0100 (CET)
Message-ID: <7a4f8b11-e840-4e33-a6e7-4f58601ed31c@collabora.com>
Date: Mon, 9 Dec 2024 10:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] drm/mediatek: mtk_hdmi_common: Add OP_HDMI,
 vendor and product strings
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
 <20241205114518.53527-15-angelogioacchino.delregno@collabora.com>
 <6697eef88677950d36fbfbd6676f82f291621159.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6697eef88677950d36fbfbd6676f82f291621159.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015621_822965_A4244D68 
X-CRM114-Status: GOOD (  19.25  )
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

Il 09/12/24 10:09, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for adding the HDMI TX v2 driver, and to allow
>> a future modernization of the HDMI v1 one, perform changes
>> that enable the usage of the HDMI Helpers provided by DRM.
>>
>> Check if the HDMI driver provides the function pointers to
>> hdmi_{clear,write}_infoframe used by the HDMI Helper API and,
>> if present, add DRM_BRIDGE_OP_HDMI to the drm_bridge ops,
>> enabling the drm API to register the bridge as HDMI and to use
>> the HDMI Helper functions.
>>
>> Moreover, as part of data exclusively used (in the context of
>> HDMI bridges) by the helpers, assign the vendor "MediaTek" and
>> product "On-Chip HDMI" strings to the drm_bridge struct.
>>
>> If the hdmi_{write,clear}_infoframe pointers are not assigned,
>> vendor and product strings and HDMI helpers will not be used,
>> hence this commit brings no functional changes to drivers that
>> have not been refactored to use the new helpers.
>>
>> This also means that, in the current state, there is effectively
>> no functional change to mtk_hdmi and its other components.
> 
> OP_HDMI is for v2.
> vendor and product strings is for both v1 and v2.
> So separate this patch to two patches.
> 

They're both for v2, because only v2 uses the HDMI helpers, while v1 does not.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 4f708b04f5e8..0f60842462b0 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -408,9 +408,16 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
>>
>>          hdmi->bridge.funcs = ver_conf->bridge_funcs;
>>          hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
>> +
>> +       if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
>> +           ver_conf->bridge_funcs->hdmi_clear_infoframe)
>> +               hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
>> +
>>          hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>          hdmi->bridge.of_node = pdev->dev.of_node;
>>          hdmi->bridge.ddc = hdmi->ddc_adpt;
>> +       hdmi->bridge.vendor = "MediaTek";
>> +       hdmi->bridge.product = "On-Chip HDMI";
>>
>>          ret = devm_drm_bridge_add(dev, &hdmi->bridge);
>>          if (ret)
>> --
>> 2.47.0
>>
> 



