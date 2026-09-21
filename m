Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F71C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avKVIYYtrZzYp1WGBNsCxOfiIbxk3sSWmj3SP4kCc1k=; b=KS2F9lfHnvxJLYL3jdHukpIqCc
	k7vdfj+SCAqVwPQXgC0ARyJ3hai4C0v1DsQG6bUXLEYkhzy4UY2GEjjDRScpA6R/cDIbm7IKj4cQc
	vtRudSnKDUlExTCp3SYD6jhr4P8ToX97hOEgmzhWgDtB4+qfAM4ixrdvhXuEradVdZyrEPRsk6abw
	P7EU4XJSwzUm23j6881Y1m9y3v9e5+wz0BFTa6B8v9wfci9ElOAu/WNibFouvMEHhkeK20qXbl1oA
	LNCZFZEGFADb7UQU6gAw/cGp0QuO7P10G7edbTRuNDg9nGbukwe/GMnNN5Xl79B//GVq+kg8EkGmh
	P+t5BUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b7y-00000001fRT-1uv7;
	Mon, 21 Sep 2026 10:20:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b7w-00000001fQ3-08fr;
	Mon, 21 Sep 2026 10:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985998;
	bh=iS/knqCb5qCJLfWIIYfNisaIOoGLDLd7LFU6cnd1ZJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KTFBxGRPPKQOqKIZaaFL7HZLsZv+EWKe23gjJaJoRWTPJ+gdYswvz9m+xNM5qtOiU
	 fxXDrHUu3uFRo5C3XCIioO2Dgxid71zp++xl5lRoVYu/f4jkw37jOgWpw/7cEH7McY
	 zT8TVulAd4Dg8QeS0yMAYQY1SswruKkNKR3vvYrZfHoYNYoZl362he/1iLM+4aMP72
	 /J1cfQkqyEDEkYrVzcfWwvnUs/sYrvaZNTU/yZmU7p4FqLiws7t+VC//t+nNyPud4W
	 IjuSqEDwEjyaOqLrQAyLU8lc794uT6sUIJaHxtpYOswbsZn5LK2kqFX99wlVpaz2Y5
	 wBQ8QaP0OS2Tg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6666117E0104;
	Mon, 21 Sep 2026 12:19:57 +0200 (CEST)
Message-ID: <e1ee74fc-6cbe-4b72-93ba-3da830ee62f5@collabora.com>
Date: Mon, 21 Sep 2026 12:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for the mt8167 display pipeline
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260918175736.355305-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032000_230953_9EE0D645 
X-CRM114-Status: GOOD (  21.05  )
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

On 9/18/26 19:55, Luca Leonardo Scorcia wrote:
> This series adds support for (almost) all display blocks of mt8167.
> This SoC supports a DSI or DPI display and has HDMI output via a second
> DPI block wired to the HDMI phy.
> 
> All the hard work was already upstreamed in the past, now all that's left
> is some glue. In the first two patches we add support for the DPI output
> blocks. In the third one we describe all the possible combinations of the
> SoC display pipeline and in the last one we add the required nodes to the
> SoC dtsi.
> 
> The final outputs of the display pipeline in the SoC dtsi are
> intentionally left not connected to allow board dts to specify their
> own output node.
> 
> I said almost all display blocks because HDMI output is not included in
> this patch. I have it tested and working at all supported resolutions, but
> since it needs some fixes in clocks and a new phy driver, I will send it
> in a separate series.
> 
> The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
> Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
> Unfortunately I couldn't find an actual device using a DPI display, but

I don't think that it even exists with your SoC. It's fine though, because
you're anyway testing the DPI interface in one way or another.

> since DPI1-HDMI works, I feel confident saying that the clocks divisors
> are correct.

While series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Luca Leonardo Scorcia (4):
>    dt-bindings: display: mediatek: dpi: Add compatible for mt8167
>    drm/mediatek: Add support for mt8167 Digital Parallel Interface
>    soc: mediatek: mt8167-mmsys: add routes for all display paths
>    arm64: dts: mediatek: mt8167: Add DRM nodes
> 
>   .../display/mediatek/mediatek,dpi.yaml        |   1 +
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
>   drivers/soc/mediatek/mt8167-mmsys.h           | 183 ++++++++-
>   5 files changed, 569 insertions(+), 9 deletions(-)
> 



