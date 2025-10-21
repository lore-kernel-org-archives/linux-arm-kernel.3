Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC01BCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x91IOqizOSo8pet+zWfpdTr9hKgeL8B/ySoSXY3XAFY=; b=MQ3u1DZmaSlW9l2Tv+ps408qd5
	C04PImevRJLCN7IvmkJRPjM9G9214FZiL9YZihuz0ZDPbzaHGj1ZY+3AuKch2+fCGV4TJD3jQQ866
	4hVhSwakpKv6gGFBAYwIjnvaOO5e/Gd878RbEJZgPrUqRzmLQUHHDphcPsCwL4d2h+q0J1NAaiHcT
	iaC0TeZ+zJbaxP8GWksgja/zXWcH4TTeQVsrRqOjxQdGXNejgwCgXrels5kxz6dgxmp30Byouagqw
	8CUE7vIzvUJ8v81aEX8PdaBNDOzpZNjKknvSdd4awrl+tFS6H9MnxDIbCdM9x5GK/yassIueU+6fn
	hIpYV6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7Lc-0000000GDFm-1Nt7;
	Tue, 21 Oct 2025 08:04:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7LZ-0000000GDCC-1qi6;
	Tue, 21 Oct 2025 08:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761033833;
	bh=uRJHPyETDsTCj2+OQ1mRFlr8Bbks2lxPY6twkMXsU2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QROdFjdgod/ROylJgy2Guz/ooeoHdSBvVBAh5Je/NIPZVw8Id9oRiFxWXCVHFjshj
	 rsRD6xnfsiXOoIPMpzKWa6gwzqBRxnJMMUIlnqUbKP4ybKE7I6R4GhedPFsJ3ZE0cn
	 Fyat/tvas5N+DYhHCkOokWzRItq5v/Zd0JQSmtES+G9vqj1rpn4RTI4NNADxdS9hrh
	 LXFtS0yZsdBIuIYbxVdQSQpkvqS3ytSXDQfTh0SgTgTNByE7O342gjxdPj5kPaOuN7
	 H4/zTP9IVJTZUkHvAUNgPFqiZR4fy2QKTfr5H1t2/iaoHCAlUctjMHye0LLH0p2Rjt
	 4/RNQDNBGf7PA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08DC317E081A;
	Tue, 21 Oct 2025 10:03:52 +0200 (CEST)
Message-ID: <0e5ca992-730d-42c5-b5b8-5ad04116b8d4@collabora.com>
Date: Tue, 21 Oct 2025 10:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add Mali GPU support for Mediatek MT8365 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010357_633900_2E4E729C 
X-CRM114-Status: GOOD (  18.14  )
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

Il 21/10/25 09:30, Louis-Alexis Eyraud ha scritto:
> This patchset adds the support of the ARM Mali G52 MC1 GPU (Bifrost),
> integrated to the Mediatek MT8365 SoC, and its enablement to the
> Mediatek Genio 350-EVK board.
> 
> I've tested this patchset on a Mediatek Genio 350-EVK board,
> with a kernel based on linux-next (tag: next-20251021).
> 

Thanks for this one! This series is ready to be merged.

However, in order to take the DT patches I need someone to pick the binding first.

Cheers,
Angelo

> The panfrost driver probed with the following messages:
> ```
> panfrost 13040000.gpu: clock rate = 450000031
> panfrost 13040000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status
>    0x0
> panfrost 13040000.gpu: features: 00000000,00000df7, issues: 00000000,
>    00000400
> panfrost 13040000.gpu: Features: L2:0x07110206 Shader:0x00000003
>   Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
> panfrost 13040000.gpu: shader_present=0x1 l2_present=0x1
> [drm] Initialized panfrost 1.5.0 for 13040000.gpu on minor 0
> ```
> 
> Running glmark2-es2-drm with MESA 25.2 is also OK:
> ```
> =======================================================
>      glmark2 2023.01
> =======================================================
>      OpenGL Information
>      GL_VENDOR:      Mesa
>      GL_RENDERER:    Mali-G52 r1 (Panfrost)
>      GL_VERSION:     OpenGL ES 3.1 Mesa 25.2.5-1
>      Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
>      Surface Size:   1200x1920 fullscreen
> =======================================================
> [build] use-vbo=false: FPS: 513 FrameTime: 1.952 ms
> [build] use-vbo=true: FPS: 514 FrameTime: 1.947 ms
> [texture] texture-filter=nearest: FPS: 489 FrameTime: 2.046 ms
> [texture] texture-filter=linear: FPS: 486 FrameTime: 2.061 ms
> [texture] texture-filter=mipmap: FPS: 476 FrameTime: 2.101 ms
> [shading] shading=gouraud: FPS: 436 FrameTime: 2.296 ms
> [shading] shading=blinn-phong-inf: FPS: 387 FrameTime: 2.585 ms
> [shading] shading=phong: FPS: 253 FrameTime: 3.955 ms
> [shading] shading=cel: FPS: 232 FrameTime: 4.328 ms
> [bump] bump-render=high-poly: FPS: 266 FrameTime: 3.765 ms
> [bump] bump-render=normals: FPS: 421 FrameTime: 2.376 ms
> [bump] bump-render=height: FPS: 343 FrameTime: 2.922 ms
> [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 133 FrameTime: 7.521 ms
> [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 46 FrameTime:
>    21.990 ms
> [pulsar] light=false:quads=5:texture=false: FPS: 379 FrameTime: 2.645 ms
> [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4:
>    FPS: 57 FrameTime: 17.735 ms
> [desktop] effect=shadow:windows=4: FPS: 249 FrameTime: 4.018 ms
> [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
>    =0.5:update-method=map: FPS: 81 FrameTime: 12.447 ms
> [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
>    =0.5:update-method=subdata: FPS: 81 FrameTime: 12.388 ms
> [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction
>    =0.5:update-method=map: FPS: 99 FrameTime: 10.127 ms
> [ideas] speed=duration: FPS: 287 FrameTime: 3.492 ms
> [jellyfish] <default>: FPS: 114 FrameTime: 8.842 ms
> [terrain] <default>: FPS: 14 FrameTime: 76.911 ms
> [shadow] <default>: FPS: 156 FrameTime: 6.432 ms
> [refract] <default>: FPS: 29 FrameTime: 34.791 ms
> [conditionals] fragment-steps=0:vertex-steps=0: FPS: 529 FrameTime: 1.890 ms
> [conditionals] fragment-steps=5:vertex-steps=0: FPS: 326 FrameTime: 3.076 ms
> [conditionals] fragment-steps=0:vertex-steps=5: FPS: 532 FrameTime: 1.880 ms
> [function] fragment-complexity=low:fragment-steps=5: FPS: 475 FrameTime:
>    2.106 ms
> [function] fragment-complexity=medium:fragment-steps=5: FPS: 227
>    FrameTime: 4.417 ms
> [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 475
>    FrameTime: 2.108 ms
> [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 474
>    FrameTime: 2.110 ms
> [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 226
>    FrameTime: 4.428 ms
> =======================================================
>                                    glmark2 Score: 296
> =======================================================
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Changes in v2:
> - Rebased on next-20251021 tag
> - Fixed missing blank lines in 'arm64: dts: mediatek: mt8365: Add GPU
>    support' patch
> - Added reviewed-by and acked-by trailers
> - Updated cover letter
> - Link to v1: https://lore.kernel.org/r/20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com
> 
> ---
> Louis-Alexis Eyraud (3):
>        dt-bindings: gpu: mali-bifrost: Add compatible for MT8365 SoC
>        arm64: dts: mediatek: mt8365: Add GPU support
>        arm64: dts: mediatek: mt8365-evk: Enable GPU support
> 
>   .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  1 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |  9 +++++
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 43 +++++++++++++++++++++-
>   3 files changed, 52 insertions(+), 1 deletion(-)
> ---
> base-commit: 853c202e4aec8006c2c1367b052c9f8949db019a
> change-id: 20250812-mt8365-enable-gpu-a39835dca7fc
> 
> Best regards,



