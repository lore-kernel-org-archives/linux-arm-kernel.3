Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA15C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c715KVqgADIZH45tdWxO0q72wg5Cnc0LhXeMGI+0lgM=; b=Dk0+avn81UukwCzOIIECnNEl78
	OPrbZLhGAjUBtwQEG8o9UMyxJ3475+uc9bBxN76l4tHuZH3buiF/GPb+d/9W5jaTM8RWHpyKZoRi+
	+L3azPxzZ4xNiQnnSlu0CBPZKkgXOefS0xql7V7sX3VTGBmLZnIA0MLqVltuh0RB5r2I87nXeNZcy
	5bSl4B0uZtArYBcTZstAt3V6JiQD2TmKvu7xmqTLixM2G0aDqeyn7BnsisUeeVYO68X29gYjtbaX0
	Hx/VQL8cG5vu6WGjBWBtHYdvGQIqXFaQTisV6ChjI8fGsk/d3fQsEVuMOd/vDT3D0l0fgpg67cGaO
	ccmwG2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRY3-0000000H7tG-0M3y;
	Mon, 10 Feb 2025 11:01:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRP1-0000000H5ej-0Q4y;
	Mon, 10 Feb 2025 10:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739184752;
	bh=+ERl9kEBufIqPZbxt5b8EpdlICT5V6kGi6RjzSJytjM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BPoRnHoqhxjCaf9kNNWoiz5gLry2Y+uXoaNX6kMI0uYEe6bkaBubpcjlZueMgkfEP
	 dRP/gXRa0smDDUBpyJjD06d7IT5w7LRBu0LiqGlO3hk2OHhZ8rI4RHsS4yodBdMVrE
	 ks48gmZmh2QADXrXQZ3O/99poFv0qS1Atg69vQJxN/JyXXB6AsGAe0Emxmg9fiKv++
	 nS/hS4KdEQnhixYpkJKyIsgEjlDC5LHCrC7QbUP13A2RXdkAD20CNQdosFxjpJzQa6
	 VBq/JxpRSddJ8FGPfO+xkM5NZHnkyDhhZeOd8A1lRSE2Ss8C+KqzWX0D0wcjwhFe2D
	 fFsu2gZV2gPmg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7E7A17E0EA4;
	Mon, 10 Feb 2025 11:52:31 +0100 (CET)
Message-ID: <30580863-0110-4375-8e99-3265a608d4d1@collabora.com>
Date: Mon, 10 Feb 2025 11:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025235_298576_164CAB52 
X-CRM114-Status: UNSURE (   9.58  )
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

Il 07/02/25 16:18, Louis-Alexis Eyraud ha scritto:
> Add a new gpu node in mt8370.dtsi to enable support for the
> ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
> Panfrost driver.
> 
> On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
> following message:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>     80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>     Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


