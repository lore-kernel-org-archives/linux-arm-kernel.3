Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5446FFD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUxJyPfHJ25kpMbH/WVsav1gFuQrHxlT/vou9GJMgTw=; b=ESH3e01j6PsNDNebqvZJL8BVo/
	kdAQ2TKq7bNDInko5PBRrsedi0wLg4O7exeQVTcrbuuD53EuXR97MotE2m8zWrhiMUBtKFMV22Xka
	DoINVZMfo59waU5FTMtcXVZGWFiSC5UG7hdfr8M1PqZMbxn2g+U0EQEPt/8E9yzBNoV4x2+LCIlXQ
	xL8OiyI6Cx7IoPfdnoWs8/wPki5LM/d5cV1Gt7OfXr2SeHoBIZBZOrXIATSHzTBg+1c3lql+28aip
	ZjEG4YP+5FlImfq2qyFngsw92ij40Zb4tiObqdD9nNzb0AKBav3WCPK2m74IYkROoO4y8277EYPCr
	Ftd/m/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEky-0000000448M-46pt;
	Wed, 25 Feb 2026 13:16:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEkw-0000000446v-2teO;
	Wed, 25 Feb 2026 13:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025403;
	bh=k4j5Tev7iUH1peqZV6AeC8ai4b425sX1kPAuRJbg21w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jwLlY0cb8WeEQkIwA3O4/z+qEpZuuX1lrB1oIH7qZJOMsyEAQ3WRQT6OteRsHjYsu
	 RApEJFvU+XeQkqrTFmqeQNFBEKKSzQA18Ydrzp1ceQ9D+Udf56viCHul61EYfNXXSe
	 z3ApkyCtvHySmG50unPiIwc/pGoS9O6Bqe2hL+o9s9LqKwrIR250NFHlL4SeQ7hEg4
	 9k89ybPfTaVH1C6Zj1YL9PkNJpfzyFg6LV0jH4C9WF0Bq2bTYCmGl8PNNCawlFTiXY
	 TqbM67yxljMPAj+xGV7M6qurbMcYB9T7hpmaKFMUo33iQR0EX7BGEBUAqHGvlgn9on
	 IFPUsO6TnUpFw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C5A417E04C4;
	Wed, 25 Feb 2026 14:16:43 +0100 (CET)
Message-ID: <c81b458a-76db-4977-941b-5c9ddca0231a@collabora.com>
Date: Wed, 25 Feb 2026 14:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "bisson.gary@gmail.com" <bisson.gary@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051646_876521_E8A8951A 
X-CRM114-Status: GOOD (  18.64  )
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

Il 25/02/26 07:20, CK Hu (胡俊光) ha scritto:
> On Tue, 2026-01-20 at 12:36 +0100, Gary Bisson wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>> running in order to lock its PLL during its own pre-enable function.
>>
>> Without this change, the bridge gives the following error:
>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>> sn65dsi83 14-002c: Unexpected link status 0x01
>> sn65dsi83 14-002c: reset the pipe
>>
>> Move the necessary functions from enable to pre-enable.
> 
> Looks good to me, but this change the flow for all SoC and panel,
> so I would wait for more SoC and more panel test.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Tested on
  - MT6795 Sony Xperia M5 w/DSI panel (with local changes, as the panel is not
    upstream yet)
  - MT8395 Radxa NIO-12L w/ Radxa Display 8HD

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Nice patch, btw ;-)

Cheers,
Angelo

>>
>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
>> ---
>> Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
>>
>> Left mtk_dsi_set_mode() as part of the enable function to mimic what is
>> done in the Samsung DSIM driver which is known to be working the TI
>> bridge.
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 0e2bcd5f67b7..b560245d1be9 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
>>          }
>>   }
>>
>> +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>> +{
>> +       if (!dsi->lanes_ready) {
>> +               dsi->lanes_ready = true;
>> +               mtk_dsi_rxtx_control(dsi);
>> +               usleep_range(30, 100);
>> +               mtk_dsi_reset_dphy(dsi);
>> +               mtk_dsi_clk_ulp_mode_leave(dsi);
>> +               mtk_dsi_lane0_ulp_mode_leave(dsi);
>> +               mtk_dsi_clk_hs_mode(dsi, 0);
>> +               usleep_range(1000, 3000);
>> +               /* The reaction time after pulling up the mipi signal for dsi_rx */
>> +       }
>> +}
>> +
>>   static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>   {
>>          struct device *dev = dsi->host.dev;
>> @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>          mtk_dsi_set_vm_cmd(dsi);
>>          mtk_dsi_config_vdo_timing(dsi);
>>          mtk_dsi_set_interrupt_enable(dsi);
>> +       mtk_dsi_lane_ready(dsi);
>> +       mtk_dsi_clk_hs_mode(dsi, 1);
>>
>>          return 0;
>>   err_disable_engine_clk:
>> @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>>          dsi->lanes_ready = false;
>>   }
>>
>> -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>> -{
>> -       if (!dsi->lanes_ready) {
>> -               dsi->lanes_ready = true;
>> -               mtk_dsi_rxtx_control(dsi);
>> -               usleep_range(30, 100);
>> -               mtk_dsi_reset_dphy(dsi);
>> -               mtk_dsi_clk_ulp_mode_leave(dsi);
>> -               mtk_dsi_lane0_ulp_mode_leave(dsi);
>> -               mtk_dsi_clk_hs_mode(dsi, 0);
>> -               usleep_range(1000, 3000);
>> -               /* The reaction time after pulling up the mipi signal for dsi_rx */
>> -       }
>> -}
>> -
>>   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>>   {
>>          if (dsi->enabled)
>>                  return;
>>
>> -       mtk_dsi_lane_ready(dsi);
>>          mtk_dsi_set_mode(dsi);
>> -       mtk_dsi_clk_hs_mode(dsi, 1);
>> -
>>          mtk_dsi_start(dsi);
>>
>>          dsi->enabled = true;
>>
>> ---
>> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>> change-id: 20260120-mtkdsi-29e4c84e7b38
>>
>> Best regards,
>> --
>> Gary Bisson <bisson.gary@gmail.com>
>>
>>
> 

