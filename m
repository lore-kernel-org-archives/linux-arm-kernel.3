Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA3AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud2D32OpYFAxLXnumGhiF5g0NIsy+W+RnWVIQCIbFzQ=; b=0E+86XmP+o+yTlPknAL9zB/WtV
	zkkpV96tXXlRSd5mXVLbkX23IO+ZRLBcY7wCxhXp0vLdepVZVtDyTr83G/sUqqnlFX4mPEWcd9lvC
	jZDvVf3nvyQ6d3yTwOYGVN+iXYN++/eKZg9BNIQ6/2V8XvEDbRVBJ/M82IjZfSRrYzF4NsPt8/6QV
	+917RN5sjNK4KcGho4jJnfs4qgAYmC4aN8uFPCjK08kX1Y3BbXkLiqNaqFxm5ydc46ClyJdQ7wXII
	TYG/J1mF2P7TkKUTqfjO/83Ee/CPiubyufkB9tSKom7NMfvQij8YPLOAFAx+EOTn87zT05LtPjeQH
	NhJ2GodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkSk-00000003bgc-3o1i;
	Mon, 24 Mar 2025 16:15:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkO0-00000003b2f-2CWX;
	Mon, 24 Mar 2025 16:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742832646;
	bh=Yt3UrsjkedkYE/1CYuEeJN8oJ93eMzK1Z86WS4MGAaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T51an9kgoMO6xmet3WCYCP90WzglJReKQMheqUVoZqg8TNXEMJ2jFJpSmTIYXpkM2
	 X2jhcU2liEBJg/VIBV09cNURdA7RtvOd28g0J4cO99sPAddfQRyRVbtXMLte07EROQ
	 bb1LFjHLuTiEuGPgaHdKcim+NIgVvDoPPzrvaZBBRHpA+IHBHLQsleOfpX4F1Y5q6d
	 rRJqK3440KK9fKG0z3t6a6INUKR+QxdrNpXz01Y58uDNBntrXuQT+WVvq0jIDXK3kl
	 YPy0NVBF+Nu65/E9awClszeYx2QF5s41CDOU0tbxwctRBvapbTAscchGorGM4dwWPp
	 Ex5BDM3J6GGzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB64417E0A62;
	Mon, 24 Mar 2025 17:10:44 +0100 (CET)
Message-ID: <334d0492-1707-4299-99c0-feacb5954de1@collabora.com>
Date: Mon, 24 Mar 2025 17:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yong.mao@mediatek.com, Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com,
 Wenbin.Mei@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_091048_711150_2D1BE82A 
X-CRM114-Status: UNSURE (   5.72  )
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

Il 21/03/25 09:39, Cathy Xu ha scritto:
> Add the pinctrl header file on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



