Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C20E6814D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aHNnCmHmEm8VGOc89bEcVc6S1LSe99d/u/k7RSJ+JI=; b=Jj5svTLvDDYoKRwxAauOmAqwHR
	ILfeWYOXftxhZgCigXAUnjkgC6aMoGUKbWKs6yuaHQwm4R68zfyazI0so6R0tZ/Wmh1g/CtiA2sSY
	F0xcyuDFNk6Rvx7HOdHhI+dEse8gV9KoB+QGmoK1OI/TVnYiHaoeFnxIwfCX5HPDjvvjT3g9Hm7wy
	ugwkYHxZg5/QufM0/J569oacXk8Z5eiLmMewhqRASwTyfSzqUCqg2Zzy3TT+ElbMqNS4RwcfuF4pi
	GNT7F8vH1JDciOodDU7G5eL0sMVhwCBGPL+u8RQR8XNLrCQokOmamadvraJMNk1RkOHeB2bRu0kQo
	8p2bFmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH0A-00000007tt2-3CdN;
	Tue, 17 Feb 2026 09:04:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH08-00000007ts3-26kR;
	Tue, 17 Feb 2026 09:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771319049;
	bh=vae++N3ldxpj2Z73jscqEQDSlh8brBYEzCGpMC1vzUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g7V7zRviG/A2FlbIgfMi/z1F+OVkYNcyBinkSsm88Vtm6HbMWL7G7StU6QMZ+yFQX
	 lgBJR85Ar5TRMiylroVdyTY75Wv+9ae9+5sHUWWoYcUeNXkqA5yelJCPPiR1rsKqzA
	 b4GamW5k/0ok4WvIsKG0QysP8vgN06+xKRhcshYWfzQiysPUe0S2vZHZbW3z1YCgWp
	 e62bFS1ZU+zpEJYotjAZohnPw/VcjYJUOdm1B3IcYxNrgUwc0OykBz6K0m5WWEAkBP
	 xaSQvdJ3bec5tfYNBb1ugNYsiXqD9TwNkp4GfJXnEQkNdRImZajDf9B+OpY0UMb9js
	 fV3M+NIYvyoLA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BD4617E0C21;
	Tue, 17 Feb 2026 10:04:08 +0100 (CET)
Message-ID: <22088c06-d412-452c-8d4c-c53e8f14fc59@collabora.com>
Date: Tue, 17 Feb 2026 10:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_010412_694122_250B1CA6 
X-CRM114-Status: UNSURE (   6.92  )
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

Il 16/02/26 17:22, Luca Leonardo Scorcia ha scritto:
> Add support for the MediaTek mt8167 SoC: the DSI PHY found
> in this chip is fully compatible with the one found in the mt2701 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



