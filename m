Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705C0E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzNCVvCp2eNy+ALp54zLIKWrdD6YjWWBo3NIeyA2BfY=; b=a3qCAqi+iyhfHdCL9sR1x6eJYZ
	9jo+h/hAvwTjt7jsrDe3lZ6Wy2riDTC3ndeCTOKGoOU4NDWV7Ki46IW/ZDzFgdl6JderhHIF2uBiT
	X39NBytus3qeZIRRqnAxCVzlCa2BebfUn4UERMCaJMNk3MUKEwSr07I2ctjLZG1L9XhcUL5PT1rC1
	T2oLsrlSbPR1V2r+segS9lFD9eouU+4+ffOkQMNnOA9eZjxv4qY6K6Rym/3bPIQNnFsOPUEEMAMEy
	bVUT9qPAWyASRtz++hK03uWBNDwU22k+0S0tqE2X5mzSThY/vcDy02Z8/Ab+5xok2cvfpduZbpZ6H
	z/5taDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqTD-0000000Bfeb-43OQ;
	Thu, 09 Jan 2025 11:12:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqMf-0000000Be9e-2tho;
	Thu, 09 Jan 2025 11:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736420771;
	bh=E45GLpk8zksDScKdK3oLdV64rwa0TmpfqdEorcPKJb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5KC+4xviIMPss9mxz+YcOCZCw0elqToOm1NDSspyQH/u56olBue/2pkpEE/U3Hug
	 6w+z/w33fyCv+w1Tf2ni99hxtub2RoATT2OeoImVZyaMN36M3YK8SyupLjSRAcYTEh
	 y5Qli6PiuDp/bDSdcPaUFrqgHWKsx8C1e8qFrkWA1BQkOitJzbVR6WrK3T0WaPrORY
	 i5Npg75GQNO/kZ7eS94Kv01n1Wbg19FtDp2QZWX0kli6Uf7E0lBGQ65NFLNLQznLvv
	 6GvMfBBr/Qs954P6KTN5rEAvYyhjLFcN74SqpUb+VL/VEWtsUIBWJQLDfQWiW8Zmvv
	 5ppoiLdEqWdQA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E58F17E156A;
	Thu,  9 Jan 2025 12:06:10 +0100 (CET)
Message-ID: <5be6790e-ba40-44c6-a171-03edebd60a20@collabora.com>
Date: Thu, 9 Jan 2025 12:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: defconfig: enable display support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_030613_877366_5BA7F757 
X-CRM114-Status: GOOD (  10.69  )
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

Il 09/01/25 11:37, Alexandre Mergnat ha scritto:
> Enable the DRM HDMI connector support.
> Enable the MIPI-DSI display Startek KD070FHFID015 panel.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..1e2963a13500 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>   CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> +CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>   CONFIG_DRM_FSL_LDB=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
>   CONFIG_DRM_LONTIUM_LT9611=m
>   CONFIG_DRM_LONTIUM_LT9611UXC=m
> 



