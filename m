Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD16C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkwUbEszkHOBEK2wcGSJLn69QX+/oSTxVt8BVr7zbYY=; b=hpaR+k/+/KdEndEJvCyO/SJOw6
	EJDympRAQBfvbUKR7KEp28M1N8lNpAsMsuK+W8fhH6bYlvOCPtmuU45x3xOZBRuzifTRUSK68xi5F
	bY1C04oMW5H0CqozNMNS/RSu41nNa5Ukc7w3Npl0ggc5NF3ZjKV7EMGEdtMsJOoHioFaMgd9/oYxy
	xX+GqvgOUtwo6zhyggMdJeY1oRl6sZxpFE6+RghvUNVUiekG4Z812+xp8DDKd+22KhvneSItrEH5n
	Pmig5k2JpGhr+garIbEj5BLYNfa2jaUGZhWE8OI8FNswHEsAGTsSHvUT6Q7c3gJgqLnQdEMojyUpO
	fNAt6t7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FAy-00000007cl6-45FA;
	Tue, 22 Apr 2025 15:04:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dh9-00000007Iu9-1v0Y;
	Tue, 22 Apr 2025 13:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328589;
	bh=PS9A2so4Ht/r0sk6C7KPxy+lOlrbJ9bDV6SgknfZNy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IvYnRjFWbSZamcdfKDfe1bpuO1ZOxCPLlQu1QNggSf2YBfYRvA4xgyl1IOTF104Pq
	 w/9lGvG8Dr214i+diVRHUuAkif3NeDHkW8IEx+qn1fxAPW1xLpbwhf64P5GfrahQvC
	 i+w484vblnIJYfIPSGcJ0VQGfVGyyWqVI3Z58EtVjkhgg2g6iU4m0vamPmSiw9Ptqd
	 4PKOpySmYTH0S7FR9KuOWONk1pgL32WY5W+3ntdhfFnfOVQ7oRf7ioG6o91Lv51/ct
	 E6QvUxNp+C5KXgHUJEaiVNYQeDID0IaixsrU1pn1bnW5zpnwSYfyzO0UCAr6DbsUiD
	 /OYX/TgNmfrdA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBA9D17E0B9D;
	Tue, 22 Apr 2025 15:29:48 +0200 (CEST)
Message-ID: <e086c8aa-944d-42db-b163-023571dcc740@collabora.com>
Date: Tue, 22 Apr 2025 15:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062951_685115_552D6A71 
X-CRM114-Status: UNSURE (   7.08  )
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

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Sinovoip has released other variants of Bananapi-R4 board.
> The known changes affecting only the LAN SFP+ slot which is replaced
> by a 2.5G phy with optional PoE.
> 
> Just move the common parts to a new dtsi and keep differences (only
> i2c for lan-sfp) in dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>


