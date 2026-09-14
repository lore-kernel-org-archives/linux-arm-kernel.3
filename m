Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0136C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Nyo7GT+zGK8kFY6xMQ5v9wIBzeTrs98NHfRYd/LE2Y=; b=ykAGRoT0Y9r3erDKTY8NI7YgD+
	u+UczpBZpomUi3zAgP3P2mTsC8MieibKKpS35Hq0OxtPyikKNc/Spp/XFgiNPW+VdPu+ncIa6SMhG
	7qWRAUQQqQxQJZeJSDplE5Pn+0663o1vfd7OIURqRjIHJECPZnJubUOFQRTg1lDrny2oRNNoSaBtX
	ZwvdDEnyv7LVkO+Ie+A8Uc6ulktTIcXOjIRXQ58vJiAYKo1Xn+Sb9TQQMgVfy92Gb15YfDvEtQRAB
	RTGMKsZ9ovx65lnptGuDYUgJL6Sra73WjPXCw+kti8KiW66/Mpba4P1wZfEmA/T9a+Gg3YXIGOoW6
	t7TBuxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64pG-00000003EHS-48fq;
	Mon, 14 Sep 2026 11:26:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64pE-00000003EGk-1AIx;
	Mon, 14 Sep 2026 11:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789385173;
	bh=lXVPwq7s2VUOFgW7l33ir3TRXWPIYSzWJPDJTQ63R+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cGGB0QNMA3UGaFW+2zS9yJ2f0H9CIkbzniMnzaf5CY35eK4B6hGXWbzssm1GNP0XA
	 kLXyg/waZcQo6l7/lZGAV6gRv/HHyDq4BIxldXCaL8BFmyRdoH4TwIz3vEuvOdg9Jf
	 E+dx868sHUpJfNl5Gi7YIOfkrYwliAvLDiRcoU8+0WffH0urqgo0B8lwnK0av25B8n
	 PNUDXcX67mvM+ZVVesjNycvTIHj5EmTQmyz5HcyLnqPCfcY9wP8TYdxRG0O0sCKXeQ
	 IImkggd+Z3tGxYzxuts56gFpuORikG2V8XMgdKOFsqlv9BfvyrAIFuYUC24rg6GTW4
	 v10dtaDm5DakA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D193C17E0894;
	Mon, 14 Sep 2026 13:26:12 +0200 (CEST)
Message-ID: <69562510-23f3-4993-b740-60ba83979237@collabora.com>
Date: Mon, 14 Sep 2026 13:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] drm/mediatek: Add Write DMA (WDMA) Engine for
 Writeback support
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
 <20260715135703.46540-12-angelogioacchino.delregno@collabora.com>
 <232cbc7ff5f2c50230eddf4db1f8eb7145a41d23.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <232cbc7ff5f2c50230eddf4db1f8eb7145a41d23.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_042616_472283_484E8300 
X-CRM114-Status: GOOD (  18.06  )
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

On 8/27/26 07:33, CK Hu (胡俊光) wrote:
> On Wed, 2026-07-15 at 15:57 +0200, AngeloGioacchino Del Regno wrote:
>> Add a basic driver for the Write DMA Engine and initial compatible
>> for the MediaTek MT8173 and MediaTek Dimensity 1200 MT6893, and
>> hook it up to the mtk_ddp_comp and mtk_drm_drv in order for it to
>> probe.
>>
>> This display controller component is used to enable the writeback
>> engine that can be used for faster display image capturing in the
>> userspace (for example, screenshots and screen recording).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   
>> +static const struct mtk_ddp_comp_funcs ddp_wdma = {
>> +	.clk_enable = mtk_wdma_clk_enable,
>> +	.clk_disable = mtk_wdma_clk_disable,
>> +	.config = mtk_wdma_config,
>> +	.start = mtk_wdma_start,
>> +	.stop = mtk_wdma_stop,
>> +	.register_vblank_cb = mtk_wdma_register_vblank_cb,
>> +	.unregister_vblank_cb = mtk_wdma_unregister_vblank_cb,
>> +	.enable_vblank = mtk_wdma_enable_vblank,
>> +	.disable_vblank = mtk_wdma_disable_vblank,
>> +	.layer_nr = mtk_wdma_layer_nr,
>> +	.layer_config = mtk_wdma_layer_config,
>> +	.get_formats = mtk_wdma_get_formats,
>> +	.get_num_formats = mtk_wdma_get_num_formats,
> 
> I does not see you modify mtk crtc.
> mtk crtc would use some interface only on 'first' ddp component of a pipeline.
> WDMA would not be the first component,
> so register_vblank_cb, unregister_vblank_cb, enable_vblank, disable_vblank, layer_nr, layer_config, get_formats, and get_num_formats are useless.

It's true in this specific case, but this was done while performing the big
mediatek-drm restructuring.

I decided to split the full changes in two separate series, because the one
restructuring mediatek-drm is literally huge... and this series is adding
only things that can be applied before the full restructuring takes place.

That was done in order to speed up the upstreaming and nothing else - so you
can safely ignore the fact that there is extra functionality in this driver,
because those extras will be used once the other big series is merged.

It's a lot of code, please-please-please don't make me split things up even
more, because then the commit log becomes messy :-)

As for the comments on 8189/8196 (link rate and qos), you're right in that it
makes sense to split the algo additions from the soc addition: I've done that
already and will come in v7.

Cheers,
Angelo


