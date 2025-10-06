Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F42ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kX/VnGIUQI3uOmspwlv4PHEEOUXankYQ4Ft7GwSwRI=; b=qyjCTfmZJhtgobwYiQ9UTok/UA
	PtcFaSEiQ70Du3JsBU/0UcGQJ5K5lWdktveKTIfGkS0Ojn+nplxgdYKqA0XwUJJeCK/HidYU4k8vi
	2g2tz18ocTWxswN6E2tuo5mzF05c4zN4ynsn0jceavxZovrbKRWm2Olxm3enAm2bg0CLzaRKTnsKM
	pmTVcX8yTzIKpnOVAU3qxyNUhbwo9EDWhy0hoJIglHnz+0LWpedErDNRbJTlAt7ug/WUnb08BwWOD
	VbdVbsA7VKvv2FJE8SqA37ltkttn/kxRgDxNn364U61eIND/7FkWV2R7bWKTC6ZzMu+KnJq2JNFpR
	tNGtpjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hgJ-0000000HFvL-3YHo;
	Mon, 06 Oct 2025 09:38:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hgH-0000000HFtc-0K0y;
	Mon, 06 Oct 2025 09:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759743534;
	bh=hscnZUUxLtA7mtlzePy0AkMC7fr7x+NOSL1u/YrwjI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FfB/DOixx8HLns5gxS3GWfSeqUHQh9Zn+MOChQtuYcKtwwGAeKMu/J+xyBmVsS26U
	 BK2HVTT3DrrIQKYiRu0IOq+dILLssOqQNvJJfPeCmVNsbHbeBZUjF7hDHQ1Aab8NGk
	 PkRXUpJ1+nIQhApB038PH4umro2D+cD+stTvT1TgtIWga8vPkaYn2CBQ7sSgw5OYZZ
	 xD7v9KOhhBGQsC8xlRECre44Ljm4tTlLe3FHI0wK5v/JSyaMabVqrTY53Uv4ezwP2f
	 6vBguUeMMAm+XojFDoiOA8/oWP0Hh2UL3K8jQimxt4GGn8X1XghOolIyjjkuPSA4Zb
	 DvEmPozR5YjqQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 534CD17E0071;
	Mon,  6 Oct 2025 11:38:54 +0200 (CEST)
Message-ID: <1347051d-187c-4aa5-a4af-cfd8b275f066@collabora.com>
Date: Mon, 6 Oct 2025 11:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_023857_295254_51894F51 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 03/10/25 16:00, Louis-Alexis Eyraud ha scritto:
> The mt8196-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8196_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
> issues.
> So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
> ones.
> 
> Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



