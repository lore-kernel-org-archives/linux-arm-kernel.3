Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C4DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3aM/2VGqiQvGYIHVm4rKRsnjQU7G5cTRzOIRtvsnJk=; b=NBfmRaiuO0mglSzy51cCKZoDha
	HYS+2rn6oMDpMKBv9q8Vt86lYcBo6D2xGHVfU77VKUEL8JT6F0dZLafFMDnoaOZ2ZZ5+rZflQA0pP
	LPmuN34B0XpM+38yoKDboJjLTSyfQZQGe9ItBOwq12pH3R1uXhC+fqi3jnyMP9wHuvIEb6gysmuaZ
	sWoJI2txUvRGz6G0TzQUUwNAH8i/8grnk15NdzMqURG4Z5JHlQGORcORdU/gdZoOgU7KqDj2etQfk
	e2V57zhALeHYDqvFEJVyVGqak973KoJAUhjK/UJ57rGbxkwNO9lTNQMM/WDzDZsACM66KS8HzkgQu
	0h1iRclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvmp-0000000Ak5p-2iP3;
	Tue, 10 Dec 2024 08:40:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvgL-0000000AiwU-2C2V;
	Tue, 10 Dec 2024 08:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819603;
	bh=X+tjjsPeLh8i0QPWhtWxfKi4DcKHgKLE/YTGz/q1zQs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjWTYFMCoXfrQyc3DurtEHV5N+EJaJmZTDdkMUzgAq4y1tvzfERQm5BnIgsoPNmGq
	 H9e952yr6xN+Zy9soveXM1Zt1n0td6BWZmEbFRTUvIlS9M8B36AQEpGaCOD8tNUqdS
	 AsLqs05j7z8OrHuXy9njoTMzYGUXCUNScoc/o0ffiHkUvcvnsjqnWk16n9l6qmE5Tf
	 3R9zDYq7VNIPqj7bnG3AtyjdJgktDfg6UhkR8T4drqg8sXXuafEupGI5JqTVHIksKD
	 OzOQK1lE4ms8rI541oJtzb9pBAHvUqfrdbPOXwJKEnqeiHieUZYLM30V3DLt9fzN2b
	 GZd1u5Ff3hZUQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E967017E14EA;
	Tue, 10 Dec 2024 09:33:22 +0100 (CET)
Message-ID: <50757699-aca2-423a-b463-5a4d74d63447@collabora.com>
Date: Tue, 10 Dec 2024 09:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
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
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <631fdcdfd44e0d401e62df67acc206b0762248c7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <631fdcdfd44e0d401e62df67acc206b0762248c7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003325_706994_E9A66B85 
X-CRM114-Status: GOOD (  20.33  )
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

Il 10/12/24 04:28, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit and that also poses a slight
>> difference between the V2 and V1 controllers in how they handle
>> Hotplug Detection (HPD).
>>
>> While the v1 controller was using the CEC controller to check
>> HDMI cable connection and disconnection, in this driver the v2
>> one does not.
>>
>> This is due to the fact that on parts with v2 designs, like the
>> MT8195 SoC, there is one CEC controller shared between the HDMI
>> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
>> adding support to use the CEC HW to wake up the HDMI controllers
>> it is necessary to have support for one TX, one RX *and* for both
>> at the same time.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>> +static void mtk_hdmi_v2_bridge_enable(struct drm_bridge *bridge,
>> +                                     struct drm_bridge_state *old_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +       struct drm_atomic_state *state = old_state->base.state;
>> +       int ret;
>> +
>> +       ret = drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
>> +       if (ret)
>> +               dev_err(hdmi->dev, "Could not update infoframes: %d\n", ret);
>> +
>> +       mtk_hdmi_v2_hw_vid_mute(hdmi, false);
>> +       mtk_hdmi_v2_hw_aud_mute(hdmi, false);
> 
> In v1, it does not unmute when bridge enable.
> I would like v1 and v2 has the same behavior.
> If possible, remove these code.
> If remove thee code would result in some problem,
> add comment to describe why need these code.
> 

I think you even said that in the first review...

Thanks for repeating, and sorry for missing that in v2, will be done
for v3

Cheers,
Angelo

> Regards,
> CK
> 
>> +
>> +       /* signal the connect event to audio codec */
>> +       mtk_hdmi_v2_handle_plugged_change(hdmi, true);
>> +
>> +       hdmi->enabled = true;
>> +}
>> +
> 




