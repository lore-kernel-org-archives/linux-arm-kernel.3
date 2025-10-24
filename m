Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC73CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMmgOl8ui4kNlXoOKvjsz68XoceROSQ0xrPWCtX2xuo=; b=0lnk0rBf1GuwsxOZyoJzT6yOS9
	xAQmSiefPTK37IpDUDqkzTQ+q00tN1RdLR+U53LocIRL1FprVDSGCxRYrK7+VueCNmsWXMQzDrAlH
	Nx7IWzyfI9jn5AiHNxpnZfDiP1QRDRz+QchDChALtIiPDmwLjk6xrBIv45M/XYaSCXrH6glLLekmP
	EGkH2PIQQPI7ofA1vEK90LGuI+VvYiImwEiNOxnugreILfWiRfbZFLYqOsYXsYJ5IjriweExxCSPU
	Reutz3MIK69rHPsBVmTkLfEEDvn/gy0LlGL0E7biGCa0lPnZaok/3kU7MhNAI+O+IObwasl0Jx2+w
	bXofcMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCNM-00000008Wy2-2POR;
	Fri, 24 Oct 2025 07:38:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCNK-00000008Wx8-2til;
	Fri, 24 Oct 2025 07:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761291492;
	bh=4Q/i2AfvzaHtxQMuaNR55KE24+V/RETj+PZmgX0d3dE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWKvLEZT6CiFPTHQkO1X2YLgdN/fTq1eAbHAhmwIb+c/iRejgob+HFVQx1mRW4AN8
	 cDUVqfiIK/RdX/Qe81kVBwFlouVoTFHcoT95e3tilRkG6wytUFhNDo6FoIShQQKKtQ
	 +p1K/ibluWb5qz4pysDWtJ5HLrP04pbO+UGN7nRPBLpP6yFayf9PRmTVg7vEPXCZUz
	 Y5CfZGQltutBrf5MhmDnoZ5PeMMkTqncscpUNGj0emKHgwOeEg1ltu4lC6IRf3dhDt
	 3VWEg0BRp+oUhMwRaj5hTfrqU1hpvrWG+N3HIkkLLWlSjL9oDIc4FcF5sJuU9pvTB1
	 rDu3zssv/uLWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B6A017E00AC;
	Fri, 24 Oct 2025 09:38:11 +0200 (CEST)
Message-ID: <8dbe85de-fc03-4b17-90ac-7b939a701a53@collabora.com>
Date: Fri, 24 Oct 2025 09:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/11] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
 <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>
 <CAAOTY_9o-hHv5Lrd+EKX_mN2PXDC+ifoxSsR6bf6oJdD=N=46A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAAOTY_9o-hHv5Lrd+EKX_mN2PXDC+ifoxSsR6bf6oJdD=N=46A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003814_880521_F1CF8A05 
X-CRM114-Status: GOOD (  22.25  )
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

Il 24/10/25 03:05, Chun-Kuang Hu ha scritto:
> Hi, Louis:
> 
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> 於 2025年10月23日
> 週四 上午10:32寫道：
>>
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Kconfig            |    7 +
>>   drivers/gpu/drm/mediatek/Makefile           |    2 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    4 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  395 ++++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 +++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1398 +++++++++++++++++++++++++++
>>   7 files changed, 2078 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>> index 994b48b82d447c47391122e6ff2d139edb223536..c89ae4ed2c96123684ecd357314fa2d2ba5a4433 100644
>> --- a/drivers/gpu/drm/mediatek/Kconfig
>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>> @@ -45,3 +45,10 @@ config DRM_MEDIATEK_HDMI
>>          select DRM_MEDIATEK_HDMI_COMMON
>>          help
>>            DRM/KMS HDMI driver for Mediatek SoCs
>> +
>> +config DRM_MEDIATEK_HDMI_V2
>> +       tristate "DRM HDMI v2 IP support for MediaTek SoCs"
>> +       depends on DRM_MEDIATEK
>> +       select DRM_MEDIATEK_HDMI_COMMON
>> +       help
>> +         DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP
>>
> 
> The checkpatch show this warning. Maybe other old description just has
> one line, I think it's better to have more information.
> Please provide more information and I would modify this patch when I apply it.
> 
> WARNING: please write a help paragraph that fully describes the config
> symbol with at least 4 lines
> #54: FILE: drivers/gpu/drm/mediatek/Kconfig:49:
> +config DRM_MEDIATEK_HDMI_V2
> +    tristate "DRM HDMI v2 IP support for MediaTek SoCs"
> +    depends on DRM_MEDIATEK
> +    select DRM_MEDIATEK_HDMI_COMMON
> +    help
> +      DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP
> 
> Regards,
> Chun-Kuang.

	help
	  Say yes here to enable support for the HDMIv2 IP and related
	  DDCv2 as found in the MediaTek MT8195, MT8188 SoCs and other
	  variants.

	  This driver can also be built as a module. If so, the HDMIv2
	  module will be called "mtk_hdmi_v2", and the DDCv2 module
	  will be called "mtk_hdmi_ddc_v2".

Cheers,
Angelo

