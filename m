Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9F2E6814D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeuyjR3Sfg0HdG8Q20S6pfDa9CduBvStQE7e70hM6Ag=; b=R21cuF8Cnzg/k6HRTTnYnzr/2y
	hlnf/LKE3E5GWakQU/CtLsolzDiaSW9JJFag6W9DS9Fb/3wMhxRlWWnu6UISvECMKZA6+t6VXF1/8
	RfLvJL3FNp8ws6TF5z6HF8h/+pB/ftUjUtN/j6BcLmRNeCuL5cIbcg0xssAhS/dXo0BySk//LrZm0
	716oWEG2YKGuakSUrm7YP6h1+wlfhvd9VYbopLsBG5oxyq8D6syO9rsPX2U+gFqG4PsZ1s2WlQffr
	V2AL4v8fCv6EGX5J279q2jyCmeyiUePq7U7hdWpCcKrB01BigxWZkM/x+Of4loSzGktqjwM4KSzg1
	D7CeiRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGzq-00000007tni-3sPj;
	Tue, 17 Feb 2026 09:03:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGzo-00000007tml-0RYI;
	Tue, 17 Feb 2026 09:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771319028;
	bh=qnopI2z5k9lPpXvkwHmEJnULnub8VaeVUtQYFgxCcxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HKGl60dDflSj0P8oU3Ahy2sjllUGkVMN98tvXZOljsqRluKpq2UuBCsa2Nnu46v0w
	 plNHpfzU3oL4aWIUiZU14OvIFV2wgu2yTQ3zkZ5Us4ErpBRa3i7+s7+lT8SD7lSto1
	 CaYYEgKV8pEhmEvgmcwEO8bLjJZG9nRzcLUM7+3DtA8DSGN9uI06gDjx4hMYo7LyxU
	 EsJqMIDpaJnAY9/FfDelZBgIEUs8X7VH3BxSTtHFa6AOReo2shXAdBO/BxXm8qZ3Hh
	 GtPI1H1k7hI/SU/rVDTpUgiNCHYCXtUwTbZhbbyKcT3Zyjoc9vDF1Anuz4hZuuEe4R
	 lWoKTnW91imaA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48C4017E0071;
	Tue, 17 Feb 2026 10:03:47 +0100 (CET)
Message-ID: <45c20bf4-c955-4c1f-b1e8-344c2742644e@collabora.com>
Date: Tue, 17 Feb 2026 10:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: display: mediatek: Add compatibles
 for MediaTek mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
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
 <8f86f229e564723b424b4d621244cfbe158c0f08.1771258407.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8f86f229e564723b424b4d621244cfbe158c0f08.1771258407.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_010352_298246_916068B9 
X-CRM114-Status: UNSURE (   5.59  )
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
> Add compatibles for various display-related blocks of MediaTek mt8167.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



