Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879B4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uH1UtMVsZnSOWKqeKUzGnkqnDz2bFx5aeG1TzGDSIyg=; b=HXPvcfo3Kje0MBQSk3Z+e2C0Zv
	9UV7cIxIrUGManlGaphRhEaU+b2zfkM7WKPHgfJnF8oTwVeOeto33tbLbtt1JmqFS08rsJsX0lZcF
	nUVfgcTrZFxXBA7JB1cLMifemwBOAb73/wk0Xb0gfPbwVIxFQUGZs1Hp2BiPgHwks1XqiJGXEE+g4
	MemfhRaGbce1l85TCI55zThzKMo8gmzFvX0IAuKKxPGBqKqzwVv8tlqq1uW8VP5rEWMdgvgPTvjCE
	p9G9A0hteWIURZtrGj6g4vyS/C4/+TS0qSbUnyZKr6T8QLKE+IB+Xe/ENvxfTIuW68ZZk/lL7WpSK
	G7KRds6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0IS-0000000BUot-2heG;
	Tue, 24 Dec 2024 08:29:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0HG-0000000BUjZ-11s6;
	Tue, 24 Dec 2024 08:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735028907;
	bh=fPGKAEkjoUjrC502U/b/HN2G0sg/qsDBymW6yNgB+ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WISWNJ/lhUmpjM1wYwTclzaudCxnRtYimqrKbsFuEF5fdb/P2TMXcr87jjoiLc8vZ
	 IACiLKiXZ99QCSoN6zkuhxAcJszWodDMVKIDoa0fXDYqKQYX9+D3tZ7XJDa86S8km8
	 PnqmP9YOfY/VASeZG+vfIypmaQ1XQim7qWUtK68uBlFkBJGPg2r0JNBHsJ+FMLdXcG
	 SMjAAdZfymI0OjlM91etpiGgkLSu+bK563wlKAu2BO0fCodkKFBKlQB6pTPYSNi9n7
	 OuzvZvf8q8km9RkouF/v/arJX8kh3nlhjOPSX7CuFLrXPynWKnAOx5OtzuIuIhUUcb
	 Zz3tp3dDRMdyQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEC8517E137F;
	Tue, 24 Dec 2024 09:28:26 +0100 (CET)
Message-ID: <8ea0e19a-88dd-4c9a-a2a2-6322b6b529df@collabora.com>
Date: Tue, 24 Dec 2024 09:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix
 MT8186/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "simona@ffwll.ch" <simona@ffwll.ch>,
 =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <xinlei.lee@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
 <fa6e2d5eb434915006f56055634b5f22d9766e56.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fa6e2d5eb434915006f56055634b5f22d9766e56.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_002830_589632_D69FD0BD 
X-CRM114-Status: GOOD (  18.79  )
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

Il 24/12/24 06:36, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-19 at 12:27 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Registers DSI_VM_CMD and DSI_SHADOW_DEBUG start at different
>> addresses in both MT8186 and MT8188 compared to the older IPs.
>>
>> Add two members in struct mtk_dsi_driver_data to specify the
>> offsets for these two registers on a per-SoC basis, then do
>> specify those in all of the currently present SoC driver data.
>>
>> This fixes writes to the Video Mode Command Packet Control
>> register, fixing enablement of command packet transmission
>> (VM_CMD_EN) and allowance of this transmission during the
>> VFP period (TS_VFP_EN) on both MT8186 and MT8188.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> I'm curious that only some panel has problem without this patch?
> I think the fixed-patch sender has test on their panel.
> 

I think that depends on how the bootloader leaves the DSI registers before
booting Linux... but anyway, this was tested on the Startek panel found on the
latest HW revision of the Genio 700 EVK :-)

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Fixes: 03d7adc41027 ("drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c")
>> Fixes: 814d5341f314 ("drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index e61b9bc68e9a..978332cd52f5 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -139,11 +139,11 @@
>>   #define CLK_HS_POST                    GENMASK(15, 8)
>>   #define CLK_HS_EXIT                    GENMASK(23, 16)
>>
>> -#define DSI_VM_CMD_CON         0x130
>> +/* DSI_VM_CMD_CON */
>>   #define VM_CMD_EN                      BIT(0)
>>   #define TS_VFP_EN                      BIT(5)
>>
>> -#define DSI_SHADOW_DEBUG       0x190U
>> +/* DSI_SHADOW_DEBUG */
>>   #define FORCE_COMMIT                   BIT(0)
>>   #define BYPASS_SHADOW                  BIT(1)
>>
>> @@ -187,6 +187,8 @@ struct phy;
>>
>>   struct mtk_dsi_driver_data {
>>          const u32 reg_cmdq_off;
>> +       const u32 reg_vm_cmd_off;
>> +       const u32 reg_shadow_dbg_off;
>>          bool has_shadow_ctl;
>>          bool has_size_ctl;
>>          bool cmdq_long_packet_ctl;
>> @@ -367,8 +369,8 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
>>
>>   static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>>   {
>> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, VM_CMD_EN, VM_CMD_EN);
>> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, VM_CMD_EN, VM_CMD_EN);
>> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, TS_VFP_EN, TS_VFP_EN);
>>   }
>>
>>   static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>> @@ -714,7 +716,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>
>>          if (dsi->driver_data->has_shadow_ctl)
>>                  writel(FORCE_COMMIT | BYPASS_SHADOW,
>> -                      dsi->regs + DSI_SHADOW_DEBUG);
>> +                      dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
>>
>>          mtk_dsi_reset_engine(dsi);
>>          mtk_dsi_phy_timconfig(dsi);
>> @@ -1263,26 +1265,36 @@ static void mtk_dsi_remove(struct platform_device *pdev)
>>
>>   static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
>>          .reg_cmdq_off = 0x200,
>> +       .reg_vm_cmd_off = 0x130,
>> +       .reg_shadow_dbg_off = 0x190
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt2701_dsi_driver_data = {
>>          .reg_cmdq_off = 0x180,
>> +       .reg_vm_cmd_off = 0x130,
>> +       .reg_shadow_dbg_off = 0x190
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
>>          .reg_cmdq_off = 0x200,
>> +       .reg_vm_cmd_off = 0x130,
>> +       .reg_shadow_dbg_off = 0x190,
>>          .has_shadow_ctl = true,
>>          .has_size_ctl = true,
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
>>          .reg_cmdq_off = 0xd00,
>> +       .reg_vm_cmd_off = 0x200,
>> +       .reg_shadow_dbg_off = 0xc00,
>>          .has_shadow_ctl = true,
>>          .has_size_ctl = true,
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
>>          .reg_cmdq_off = 0xd00,
>> +       .reg_vm_cmd_off = 0x200,
>> +       .reg_shadow_dbg_off = 0xc00,
>>          .has_shadow_ctl = true,
>>          .has_size_ctl = true,
>>          .cmdq_long_packet_ctl = true,
>> --
>> 2.47.0
>>
> 


