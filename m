Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23056CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1VwtKEC2ucVYZQDTrMUe+OtzpvSytfrEX3m17OWJr0=; b=mL5E8aBQ25c/8WVjc8eQGT5HpV
	ibRqFy2j8jIc34ykX3GODEQtAs39Buy3J+RCcvys6fWQRppGSaZKsZW8i6hcFDaFo4oOA0SCFCzsN
	lCsyflJDPO29hFD9Kt2Ein6+Lp0InQ1gZPMCKEDdiwrVCLvrPiZyvPJz/pgKW+y/b3gljflY6msm8
	LajOZFuujeLsVLHQhbGfo4CP1fXKQbRdTFOM48Rs5Tcwz8eJrJNlZwPEG0kO9Wo2GDwlcq/fulFac
	jW+OV3PkjKEhO17gasxm19Wi90GpgLaqzGr40532t7z3NVnt0SsCrhkbJ0LnsXGfsdcEleYGEmnbp
	4c3f5MJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6d0-00000003j6P-2ASl;
	Mon, 15 Sep 2025 10:40:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cx-00000003j3o-1VCJ;
	Mon, 15 Sep 2025 10:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e1VwtKEC2ucVYZQDTrMUe+OtzpvSytfrEX3m17OWJr0=; b=qsu4opfh2hqvsEfC9i1qfdfke8
	psPbeK//8s5mr75ib1EiBio260IfktgAD6J/v5vc3KoDnwuChAGFXF2J/7aNTDEO4Rr3JwioFnG4u
	J67js9opFuUqRyDsWUWYBQGE9mvyYG9YMP5L7Tekx5Euox/I9sVzAtpslS8m6tJ07pBTNZTCSNvk+
	PuGibM09mI+xoUH5SBz62LVckWPxr165EMJgXXo+tJWU86qtLOcRV49qoEeLDi3eQn7nN0sB08eXA
	/9DNRnpeBQlrs5RMD/P9e7yWPZDvYL9Xe7pQlCR1Dz7k1Jw8PdDmi8Lkvbpuu5/JCThpUuDb4acll
	fplYu/rw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cu-00000006w17-2ZRn;
	Mon, 15 Sep 2025 10:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932802;
	bh=G6EVvvNEzreTlsg/p16Kyhu0f2y/0NPsX+/zSolT7uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k/zjAc72mAxKepfc3Mr5oy2O21Hmv9B0aglKIwhA+tcvE4b0cC75+N6BzHCIYA3XS
	 dN5d0fVaE19xF2Mm+spmoE7zHtg0fLt1mh3dQ0uMk5478v6MsPV8zu3bCz8tqPm6mg
	 pkwn6pqplc7CosKkjqAe9xeIIDa024Dh8PzC+cmf6UAQDgUcFx10w669UZ2VM4GNmi
	 8XTJeECxzrNmNmHb10PEjPmC3zrYstGlqoj0jFW4vvHdlu26K3vnV1pCWlJfQu9uXb
	 xmdeiBmAvtvfmmsPUJb5FlWcyp7Xto9tIPZPagE4DgtJopyvFnmNm0gLuecT/Ld8o6
	 Rzss4TO5hOWrg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB6DB17E1091;
	Mon, 15 Sep 2025 12:40:01 +0200 (CEST)
Message-ID: <29861f71-82ab-4fe9-947c-45d9b6e4b1d8@collabora.com>
Date: Mon, 15 Sep 2025 12:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-8-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_114004_838250_7AEB4424 
X-CRM114-Status: UNSURE (   8.55  )
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

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> Add MT8189 encoder compatible string to distinguish former ICs
> MTK's. Compared with MT8196, the maximum resolution of MT8189
> encoder is only 4K, and the fps is only 30, which cannot reach
> the highest parameter of MT8196: level6.2, 8K@60fps.
> Compared with MT8188, the level can only support 5.1, which is less
> than 5.2 of MT8188. But the maximum bitrate is 100Mbps, which is twice
> that of MT8188. And MT8189 could support NBM mode.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



