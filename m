Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D2FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysVTqtWCT9AzDtvYmXzNif8x2LyA7Yjg6q5OgTQ+FDE=; b=UChxyHik5VTT16XYl9BViNp8Nx
	cWQUdobnCj4MkSB8P+IROel30yDZMAdTjL8RcJOEtJPLu8FvKgIQc/XnxSHBijiCg2Q2nSeQIE4K7
	SHBGwLw/DDZmnNQXX56e+n/2liDnhbNsiPSKyewQ9Y0c37rIAUmQhjJ65pQsUVIPChOOVCHepaK+H
	CBCZnfALNTQbfW+bsHfpGEcUuHbHd+t7YKF5/Euw5TskcEPi8wTJ1nt0bHtLka9ChrnwIhqshsouU
	6I8KZua5AT/Df9b5dd8ECEfsWV1VRiFsJ5d+Rgbx632AN2XE5xsjHPX6uxeK5k51DMkX7mky3/FWD
	o9mQYJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNuo4-0000000GoHk-1Uz5;
	Wed, 18 Dec 2024 14:13:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNumx-0000000Go9d-3HpT;
	Wed, 18 Dec 2024 14:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734531153;
	bh=2pMdp5vfl6grQPYfJtfZtmDs7fBVN1MuzePWFk8sH2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lc4RB1dNylhjmtAckKIHPhIklnjaJ27hejlFd4sF0YodB3ZtDuQFKrM4QwgGg8PQs
	 ZC/1kvCr0Lj3dvWROhrqsJUMcnpTbWi3wwuDlU+rmALa4P1P1QXkiM5WFfbowoJ4XM
	 VYrMMEb9d1Wqra6pRneAaZObwa72hmlwpfANA33eUcy15Buh3Et1EkTNlzDrp4lMNS
	 3qLrOelKpsf8CMl1fmV8IxHBPRkBAbyzZUjFUzOHJtOy0RHK35ToLDRRuwwINy3qvt
	 7f/sGbTuMtw7NKaf9QRP5EDplFs+XOBNSYkoiKm2qF+68s4ad9qD2DMzN/nTrvsXuk
	 jWFQlUIrvJb5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC1FB17E3770;
	Wed, 18 Dec 2024 15:12:32 +0100 (CET)
Message-ID: <e1b8084d-cfc2-4541-8264-91be777a8783@collabora.com>
Date: Wed, 18 Dec 2024 15:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add pinctrl support for mt7988
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241217085435.9586-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_061235_972300_3A3D5C72 
X-CRM114-Status: GOOD (  17.99  )
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

Il 17/12/24 09:54, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
> 
> changes in v7:
> - add const for pins and mtk_pin_soc as suggested by Christophe JAILLET in v5
> - left angelos RB because of minor change (hope this is right)

It's fine, I re-reviewed it and it's good (actually, better!) :-)

Cheers,
Angelo

> 
> changes in v6:
> - some fixes to binding
> - changed title and fixed typo in bpi-r4 patch
> - added RB's
> 
> changes in v5:
> - rebased to 6.13-rc1
> - moved dt nodes with mutliple options to BPI-R4 board
> - changes suggested by angelo in v4
> - changed example in binding and dt node to not using const MTK_DRIVE_8mA
> 
> changes in v4:
> - fixed fixed string binding error
> 
> changes in v3:
> - rebase on rafals dts patches
> - update binding to have mux subnode as fixed string and conf with optional suffix
> 
> changes in v2:
>    binding:
>    - drop gpio-cells description
>    - move ref in mux subnode up
>    - order uart-functions alphanumeric and fix typo
>    dts:
>    - fix indentation of reg-values
> 
> Daniel Golle (2):
>    pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
>    pinctrl: mediatek: add MT7988 pinctrl driver
> 
> Frank Wunderlich (3):
>    dt-bindings: pinctrl: add binding for MT7988 SoC
>    arm64: dts: mediatek: mt7988: Add pinctrl support
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4
> 
>   .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  575 ++++++
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  189 ++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   54 +
>   drivers/pinctrl/mediatek/Kconfig              |    7 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1556 +++++++++++++++++
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   73 +-
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
>   8 files changed, 2445 insertions(+), 11 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c
> 



