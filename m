Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80CBC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzmGiqZJ1myMaU7XHapa/+3CFcP+F6+f0EFYnd+UGro=; b=ksgmIj/YLg0Qm9nKdVSGLeSKUL
	KwD/q83JvvIBh9dLz3yUhbLOgjlJvx9hFj8Sb9LEx+WGnC18MoZwPuDcJOl+1booeYWqabXMogXVu
	n3q+3S+fiujyS9JVqqlQ2vX7jvsYnVSQXfPHN/52ZsIlfAzYr1FeVwOtm6e+7/XPPNVL5vYWnfT6q
	mOBZC+3MkN4hdA5b9uQ5lswPq77g7b9FzgJAG2YcCYcVJx9NWwDyOcaVcp6rkJP1XESOTW81KaQzf
	AW+2VpYmv8F8FE7rAxmBOp411ulpd58WC+ftJBeDe+2c198yqP5rxBAH+OjPL/6/VkWcVz8EXJOD/
	aR6x57kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJMI-00000007NLD-2eFZ;
	Tue, 18 Feb 2025 08:53:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJKo-00000007Mwf-0Otm;
	Tue, 18 Feb 2025 08:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739868724;
	bh=GHXqmrQak7ff03YQn85C4Va97mNvM78oxehiTTDlVKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICbzQaUIT8G3ZOCfdX9MOtucwgIdnvnfOZpPWvds9KnrYistpHw7RZIXHeiEtX3Ir
	 bXMKyXP7Hj9q24omMdV55NYHLwtTxneKb78H1ib3WC6kCPXBbCjGMwWVB5JX2u8cWK
	 FGMJMvusQl6kR2xnMHYX0UqIW+D6fMJwG+vqWbEAqbPdLczj9CG3zW1KITtrBFH2MZ
	 iHS7GxfMyoDhKOIwc6Jg22nFpjr0hjrp1as6ZVVqMfgjRhXm5liS1Z94+BtjjbKEo+
	 FzZK6NXDeF0n9yIRXnkkeDjluDONmDRWCuDK4vmmjYw+aX26tZubo2nsMnsfPqYrqb
	 WUn3ou9maOMew==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1359D17E0657;
	Tue, 18 Feb 2025 09:52:03 +0100 (CET)
Message-ID: <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
Date: Tue, 18 Feb 2025 09:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
 <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005206_285305_33617877 
X-CRM114-Status: GOOD (  27.40  )
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

Il 17/02/25 16:03, Alexandre Mergnat ha scritto:
> Hi CK.
> 
> On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
>> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>>> External email : Please do not click links or open attachments until you have 
>>> verified the sender or the content.
>>>
>>>
>>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>>> mtk_dsi_lane_ready function, and the DSI module is set up during
>>> mtk_dsi_poweron.
>>>
>>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>>> nothing because lanes are considered ready. Unfortunately, when the panel
>>> driver try to communicate, the DSI returns a timeout.
>>>
>>> The solution found here is to put lanes_ready flag to false after the DSI
>>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>>> setup of the DSI module.
>>
>> I'm not clear about what happen.
>> I think this DSI flow has worked for a long time.
>> So only some panel has problem?
> 
> I don't know if it's related to a specific panel or not.
> 
>>
>> And another question.
>> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not 
>> actually ready?
> 
> The workflow should be:
> ... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = 
> true (to avoid re-do dsi lanes setup) | ...
> 
> I observe (print function name called + dsi->lanes_ready value):

Alex, the first poweron is called by mtk_dsi_ddp_start() - and the start callback
is internal to the mediatek-drm driver.

That callback is called by mtk_crtc during setup and during bridge enable(), and
there we go with suboptimal code design backfiring - instead of using what the
DRM APIs provide, this driver uses something custom *and* the DRM APIs, giving
this issue.

Part of what mtk_crtc does is duplicated with what the DRM APIs want to do, so
there you go, that's your problem here :-)

Should I go on with describing the next step(s), or is that obvious for everyone?

:-)

Cheers,
Angelo

> 
> [    9.086030] mtk_dsi_probe 0
> [    9.662319] mtk_dsi_host_attach 0
> [    9.662941] mtk_dsi_encoder_init
> [    9.984685] mtk_dsi_poweron 0
> [   10.043755] mtk_dsi_host_transfer 0
> [   10.043769] mtk_dsi_lane_ready 0
> [   10.055837] mtk_dsi_host_transfer 1
> [   10.055853] mtk_dsi_lane_ready 1
> [   10.179788] mtk_dsi_host_transfer 1
> [   10.179803] mtk_dsi_lane_ready 1
> [   10.179880] mtk_dsi_host_transfer 1
> [   10.179885] mtk_dsi_lane_ready 1
> [   10.179920] mtk_dsi_host_transfer 1
> [   10.179923] mtk_dsi_lane_ready 1
> [   10.179986] mtk_dsi_host_transfer 1
> [   10.179993] mtk_dsi_lane_ready 1
> [   10.180134] mtk_dsi_host_transfer 1
> [   10.180143] mtk_dsi_lane_ready 1
> [   10.180175] mtk_dsi_host_transfer 1
> [   10.180178] mtk_dsi_lane_ready 1
> [   10.180223] mtk_dsi_host_transfer 1
> [   10.180226] mtk_dsi_lane_ready 1
> [   10.180245] mtk_dsi_host_transfer 1
> [   10.180248] mtk_dsi_lane_ready 1
> [   10.180278] mtk_dsi_host_transfer 1
> [   10.180280] mtk_dsi_lane_ready 1
> [   10.180312] mtk_dsi_host_transfer 1
> [   10.180314] mtk_dsi_lane_ready 1
> [   10.203774] mtk_dsi_bridge_atomic_pre_enable
> [   10.203787] mtk_dsi_poweron 1
> [   10.203793] mtk_output_dsi_enable
> [   10.203795] mtk_dsi_lane_ready 1
> [   10.471517] mtk_dsi_host_transfer 1
> [   10.486962] mtk_dsi_lane_ready 1
> [   10.487244] mtk_dsi_host_transfer 1
> [   10.503733] mtk_dsi_lane_ready 1
> 
> Here the mtk_dsi_lane_ready function:
> 
>      static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>      {
>          if (!dsi->lanes_ready) {
>              dsi->lanes_ready = true;
>              mtk_dsi_rxtx_control(dsi);
>              usleep_range(30, 100);
>              mtk_dsi_reset_dphy(dsi);
>              mtk_dsi_clk_ulp_mode_leave(dsi);
>              mtk_dsi_lane0_ulp_mode_leave(dsi);
>              mtk_dsi_clk_hs_mode(dsi, 0);
>              usleep_range(1000, 3000);
>              /* The reaction time after pulling up the mipi signal for dsi_rx */
>          }
>      }
> 
> 
> As you can see, something call "mtk_dsi_bridge_atomic_pre_enable" then 
> mtk_dsi_poweron is called a second time. This issue is probably due to the probe 
> order (race condition).
> After all, IMHO, after a poweron, the registers status should be consider as 
> unknown (or at least HW default value), so, lanes setup has to be done. This 
> solution improve the driver's robustness.
> 
> 
>> Or mtk_dsi_lane_ready() configure the hardware and lane is is actually ready,
>> but something make it not ready again, what's the thing which break lane ready?
>>
>> If this is a bug fix, add Fixes tag.
>>
>> Regards,
>> CK
>>
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/ 
>>> mtk_dsi.c
>>> index e61b9bc68e9a..dcf0d93881b5 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>>         mtk_dsi_config_vdo_timing(dsi);
>>>         mtk_dsi_set_interrupt_enable(dsi);
>>>
>>> +       dsi->lanes_ready = false;
>>> +
>>>         return 0;
>>>  err_disable_engine_clk:
>>>         clk_disable_unprepare(dsi->engine_clk);
>>>
>>> -- 
>>> 2.25.1
>>>
>>

