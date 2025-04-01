Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B4C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqD1BgMgdxnM6BxuGneeOM6Uv+5tjT25o1PSp/GLud8=; b=Fwcl2sUcjGG57XPScrSauHZxLU
	S2OWzsfdh+nSAxNpJ6tZaWB6lmG3A/mojg1Y4Puycjau1ApHLfnwQO/WGSmYVNIxMiD4wdItHNwE9
	MQ0nVBvW3UBc3mCHKGdjPJ5erfMMLx4AkqtcMEQaeZR8BDbrzxCljNv79EXYbbPWKhur+PY125TVd
	XwWXWNco7lm44m7hyu5k+cfcZGkq0Kp3dSIB/m2FFUD99ZsVXHLNYZkIcILaTWKwTjZbeRT+3Q2zS
	GdbstQnmgm/MhrGP0wGIyLJvOZnpW2/1cGq45ld6EgOAqt9WWpPGY9zAwqXxLghIUDz3Khm3yrFa9
	3J92KBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ3E-00000002etu-2RGl;
	Tue, 01 Apr 2025 10:41:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYeN-00000002bEd-3BJM;
	Tue, 01 Apr 2025 10:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502518;
	bh=YNKYSoFFfw8mSjMXUIZ9YbaKgm4LIAPrCqBt23vx3+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ClBtXlKmMWL5rsjXFYSoLJ8MMFrcdKAO5qcWS0V8q8JSaE65NUYufu1p2PhVW3maA
	 MMA993qbIFlpwHTYxyNp0ouZSwl8wGBqhEAVqyB4uW9zueNYAgkANqDn2YlOVg+LEI
	 EH2Fo5u9kVzQl6YjMJROAX9+Cf31lhfwCzb1pVzND+0St3tN9kI9rIth/spBQp9K5w
	 M8oBmrrOlY0n5mCvoPAabSr0qYces6c0B8vxyAyjiE/sePXxsxzo8FE1ViVLbXGSEN
	 /WOMMlQeh1rMqD73k9H7qiPXMMn90rA4hdYT+ILg2Yq4/efF1NGfHl6ZixNvxDYcWd
	 jslTdDrOgIr+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 405DD17E0FAF;
	Tue,  1 Apr 2025 12:15:17 +0200 (CEST)
Message-ID: <afbc0fec-186e-4faa-9cb8-8673811ff9a6@collabora.com>
Date: Tue, 1 Apr 2025 12:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_031520_213150_C1A4354A 
X-CRM114-Status: UNSURE (   6.40  )
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

Il 01/04/25 07:48, Cathy Xu ha scritto:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


