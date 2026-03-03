Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43D7EC1451
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/CfIfXWFFMybwcWawNA33L/UyTFgFLiRUjQhmp0KQE=; b=mLCY6AxzMTvYL8LYbR3LeCyqQF
	xEBSYkVdcGODHpA306fdHuE4K+UanKI4lmOQ3tyy5EVi3JSp/aOGK03JWdstotY+s9eTXuEpKm10G
	TTeLsxSLm9E/7caz4HE54dni4NTdzO+ZCZxYwA2Mg6R0HJz3GXgZ386W1t24rZmd5RdmjZxZlnr+z
	huHwqNRg0hmYHLdNB6noxVI1LzVYTElNrNDaxAktasSABO29BYlncpvW/s4+rMeAnpdYL1h58DImy
	QFiYEwGEsINHfyuJWpVw60q5LhbGrs5CVx0l//Z/nRwTf/ExRN8vCRa/2vhVIlwxg8hB5aQpzgCVz
	0NDuzXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQgJ-0000000FKHX-1OPF;
	Tue, 03 Mar 2026 14:25:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQgG-0000000FKGC-170I;
	Tue, 03 Mar 2026 14:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772547897;
	bh=Wuu0sJNWhS9l8RA8loMZGodMF057v2ZgnGI93IEHQH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LAKKkoLBDxV7fhvW7PQbnxmgd+EEhNbbiZhMIXv3zudJUMUxwzojDI/8vl/gjIRCK
	 KTmBe+bwNOUd+Ap3ntDXb6MR3sYa0QS1x4Rfrcaus8KXPpNZyuZBpGP57Lko1P3Apa
	 kqSWmH0N8k4nBRk5D4HweaGTGLd6BWvRpz6Fql7yjdVunGI6CImaNvJy8N25cQomuP
	 R41mlxjoa+SyjZUuGm6bDkLHGNq3kmBR+ah7mAjmIo240KUIhymLkTBzLEb1vUGbhH
	 7ljpQVo4NITw7KjLe1XNtCV0B/gtkI6y1YevzWozsQVp4w/Ms1K/F4nxlXkgOez76G
	 7sMaw+DhRA53g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4A9D17E03E5;
	Tue,  3 Mar 2026 15:24:56 +0100 (CET)
Message-ID: <4b318ffd-13cb-435c-af1a-2896d0e6cadb@collabora.com>
Date: Tue, 3 Mar 2026 15:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "l.scorcia@gmail.com" <l.scorcia@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
References: <cover.1771863641.git.l.scorcia@gmail.com>
 <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
 <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
 <CAORyz2Ki5aPNbcY5-_mRwFgwT46VN_pRV2iP7z7x3snzrbKz=g@mail.gmail.com>
 <dcb797934bdb4467037559ee5e91bee0a568c03a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <dcb797934bdb4467037559ee5e91bee0a568c03a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_062500_453557_AADD6C08 
X-CRM114-Status: GOOD (  25.51  )
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

Il 03/03/26 08:56, CK Hu (胡俊光) ha scritto:
> On Wed, 2026-02-25 at 09:15 +0100, Luca Leonardo Scorcia wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>>>> The mt8167 DSI controller is fully compatible with the one found in
>>>> mt2701. Device tree documentation is already present upstream.
>>>
>>> If mt8167 DSI is fully compatible with mt2701 DSI, I think the binding document and device tree should be modified.
>>> In device tree,
>>>
>>>      compatible = "mediatek,mt8167-dsi", "mediatek,mt2701-dsi";
>>>
>>> And this patch is not necessary.
>>
>> Hi, if I understand your review correctly that's what v2 [1] of this
>> patch did, but the change was rejected during review.
>>
>> As far as I can see there is no win-win solution here. This tricky
>> situation derives from the fact that in last year's submissions the
>> change was only partially merged - the bindings went upstream while
>> the driver did not, and now we have to work around this. In v3 I tried
>> to address the issue by actually implementing what the binding
>> document says.
>> I'll be happy to resubmit v4 but I need to know what's the consensus here.
> 
> You mean Krzysztof's comment?
> He has two comment.
> The first is 'remove'. You actually not remove "mediatek,mt8167-dsi". You change it.
> The second is about fallback. I'm also not sure why he says it's NAK. Also a bad wording?
> After Angelo's comment, Krzysztof does not response.
> I also do not know what Krzysztof think.
> I agree with Angelo. Single "mediatek,mt8167-dsi" does not reflect the hardware compatible but fallback does.
> Maybe describe more information (hardware) to Krzysztof, and ask what's the better way to do.
> 

First of all: I would be happy with having

compatible = "mediatek,mt8167-dsi", "mediatek,mt2701-dsi";

in the devicetree, and to drop this patch - but that's not possible, check below.

The problem that Krzysztof was raising is that the bindings currently define
the "mediatek,mt8167-dsi" as single compatible with no fallback, and removing
it would break the ABI (as the bindings are not used only for Linux, but also
for bootloaders).

Even though I can try my best to convince him, this is a real problem: mistakes
were made in the past, and the only way to get the mt8167-dsi supported right
now is to, unfortunately, add the compatible in mtk_dsi.c.

I don't like that, and I see that you (CK) don't as well, but that's the result
of past mistakes... and apparently we can't do anything about this if not to
*uselessly clutter the driver* with that.

So, that said...

I'm sad to say that this patch is the only way to get this SoC probed by mtk_dsi
and that there's no other way around it, because the bindings maintainers are
forbidding us from removing the bad compatible (which was *never* used anyway)
from there and making it right with allowing it only under 2701 fallback.

I'm moving krzk to the To: field of this email in hope to get back a reply that
sounds like "you misunderstood me, you can do it", but I'm not positive about this.

Krzysztof, please confirm or deny what I said.

Regards,
Angelo


> Regards,
> CK
> 
>>
>> Thanks!
>>
>> [1] https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com/__;!!CTRNKA9wMg0ARbw!lIBnCRkybM1oxoARb70JlLMPlXHKqW9dwSmVqXGsvj3LE9hsWuINkPgtrlr8Jl8-atOvzYoMjtavHOr3$
>>
>>>>
>>>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>>> index af4871de9e4c..ad10e86b161d 100644
>>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>>> @@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
>>>>
>>>>   static const struct of_device_id mtk_dsi_of_match[] = {
>>>>          { .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
>>>> +       { .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
>>>>          { .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
>>>>          { .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
>>>>          { .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
>>>> --
>>>> 2.43.0
>>>>
>>>>
>> --
>> Luca Leonardo Scorcia
>> l.scorcia@gmail.com
> 



