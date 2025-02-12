Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7491C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hICn6iQr4RTRQbEF00NQouXJgoo3oXDoUoBKtFTMUvI=; b=ySpVFW/bZWN37H4Bqy+Ghk6hrB
	M0e54uR3YrXMza5rI63K/nIEPr0Jx4Wo9AsGh2XHZm/tbKOGr4gi5MFwQ73tbNtocrEANb4xVLtp1
	yBb3mVzIOTdJ8gQUFT1D9ZlU4pJ8b8hFc7cKIhG4GwJLQjDPOwKuG9k2t9sOHWDpqObtUf4/shGAT
	d6GkjtCnBmglAYzRHUXHZjXDdaJ08CCYI0nJEsdCmxjI7xBVYNSi7h2zAn0yAimuxsH8iWlyZeQ7K
	cFngLsgHlCtaVqMawWgKeC2VkP00vPym5Tq8le68zvrHgPS7+7cSvKkXl8v4NUrsBnJvfa2BsaT+5
	e9J940Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAeY-000000077RF-2vwb;
	Wed, 12 Feb 2025 11:11:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAc5-000000076yN-3LpO;
	Wed, 12 Feb 2025 11:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739358544;
	bh=0WMcpkgL+kzI3wuew8Ndfo8EQnxAuf57HxbK5IfZrRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQ294yJNqb53NHibL46kTJCyFUsetkdQa7DtxTTTHDVuGx0/4KZsSMzsk99kedW5n
	 m4eMWwwVGDraz6U+Qi/7/oOqSbweyl3dHK70ClKIByimu/QHsfZfSqxk7XSOC824wt
	 Pppf0NTU5tnO8UFI207x3XF6TywPbJ6FaKhuNf3bPKE1QASHJrCbiOFtS/leBB1gJb
	 KQrviYKDPTMo7revohw/yudk54gWnPaXiLtWqT1pQEf3L76HzYgav/kzFrhbYqfVz1
	 5p+h7nY03xDZWEh0k22GXhm/NV3PTLUe7+ehX6nOt4ODo9NG7Ickcaz34n3XzOHHFs
	 6eYmuA40vR0xQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAFF717E0FBA;
	Wed, 12 Feb 2025 12:09:02 +0100 (CET)
Message-ID: <70436de1-7ad0-41f0-a101-7373662aa008@collabora.com>
Date: Wed, 12 Feb 2025 12:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
To: chunkuang.hu@kernel.org, mchehab@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_030905_996735_9A1F0723 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Il 18/12/24 11:53, AngeloGioacchino Del Regno ha scritto:
> This series adds the necessary bindings and devicetree nodes to enable
> the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
> MT8188 SoC.
> 
> This was tested on a MediaTek Genio 700 EVK board.
> 
> AngeloGioacchino Del Regno (3):
>    dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>    dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3

CK, Mauro,

If it's okay for you, I'd like to take the display and media bindings
patches in the MediaTek trees, so that I can also safely take the DT patch
without immutable branching, etc.

It's a very old series, yes, but it's still applicable.

Can you please ack the display and media bindings so that I can safely pick?

For display: 20241218105320.38980-2-angelogioacchino.delregno@collabora.com
For media:   20241218105320.38980-3-angelogioacchino.delregno@collabora.com

Thanks!
Angelo

>    arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
>   .../display/mediatek/mediatek,aal.yaml        |   4 +
>   .../display/mediatek/mediatek,color.yaml      |   4 +
>   .../display/mediatek/mediatek,merge.yaml      |   4 +
>   .../display/mediatek/mediatek,padding.yaml    |  10 +-
>   .../bindings/media/mediatek,mdp3-fg.yaml      |   8 +-
>   .../bindings/media/mediatek,mdp3-hdr.yaml     |   8 +-
>   .../bindings/media/mediatek,mdp3-rsz.yaml     |   1 +
>   .../bindings/media/mediatek,mdp3-stitch.yaml  |   8 +-
>   .../bindings/media/mediatek,mdp3-tcc.yaml     |   8 +-
>   .../bindings/media/mediatek,mdp3-tdshp.yaml   |   8 +-
>   .../bindings/media/mediatek,mdp3-wrot.yaml    |   1 +
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 313 ++++++++++++++++++
>   12 files changed, 364 insertions(+), 13 deletions(-)
> 



