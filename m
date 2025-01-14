Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4E9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vrqbAKA+99SMveJ6zmy7oG4QRCNFWkKIMlg/VHpdNI=; b=h4dyUauG2xf5nbpbme8nsm6oGB
	avhKgFed9TUALtMxZGFVpM+WEYMxOJHyG8RgJGB8AneH+8uDnIwXNle883tv7VYXBHTEQgKPCE9+x
	qmwLEZE8mPfq/MhwfA/SWVsWrx+5zlRI3kbZUcr6jgd8auUfvucA8J4XPIX7x59vrLOJ52CvKuzAS
	fC0CEZywp3enM7AhZph5aJO26juE7leFvXbAuySzq51MzTmDokwvi9LFfKNljJl2ws/pj8UY04oqg
	jBoEnN0KDRFghSlt/WkOHDVExIe0RA2qdOt4+Od2BKqotFBUJ7I9Z3YgKrnXS4Hni2yv1WQa0N8In
	YrWDjndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeEw-000000086vF-43HW;
	Tue, 14 Jan 2025 10:33:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeDh-000000086kz-2WUC;
	Tue, 14 Jan 2025 10:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850744;
	bh=gTTeMn+E3DCHVqMg0J3tutnrD2qfrPRaA0W7YuCj0IM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=piQEL5bUhPfSBzn3AY6sjpcce2ovZfwpw6ndr++u6Y7Leip4eFx9fyiOoBPXyCB2L
	 3w9xXgdsRkpMRzlqpVQA08rQN+kAYlhzW0qbvQqsPg0+ALqWqZs7BsrHP+yHmQRSx7
	 w0tvzuvyLWFIh/u738JruOHdafsSvUK4400HK6qOSP5xHR4fWqUEv+Fd8ASCciqT93
	 M3cexzcwr89PrseHWxdXtKnY+MIr4yuJ4BHZBTpJFxmsQDQRUJHqChKqpBM5aA1VW6
	 4B322pDxCug3415pZyO+BYusNF8RXhEUKKkwEqkhtamW1XA/JzunpnozN3oQGE3kBC
	 tlrQc17h3HC9Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67DF717E0DB7;
	Tue, 14 Jan 2025 11:32:23 +0100 (CET)
Message-ID: <c041b875-23a6-4e0a-a31a-40bee27b62b5@collabora.com>
Date: Tue, 14 Jan 2025 11:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: add device-tree for Genio 510
 EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
 <20250114-dts_mt8370-genio-510-v1-3-8517ee0fdbe8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250114-dts_mt8370-genio-510-v1-3-8517ee0fdbe8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023225_807722_69DF7477 
X-CRM114-Status: GOOD (  15.16  )
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

Il 14/01/25 08:38, Louis-Alexis Eyraud ha scritto:
> This commit adds a basic device-tree (mt8370-genio-510-evk.dts) in
> order to be able to boot the Genio 510 EVK board, based on MediaTek
> MT8370 SoC and very close to the Genio 700 EVK board. It also
> splits mt8390-genio-700-evk.dts file in two to create
> mt8390-genio-common.dtsi include file, containing common definitions
> for both boards.
> 

Please split this commit in two parts (and rename the suggested commit
titles as you wish):
  1. arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
     (in preparation for introducing support for genio 510 evk, blahblah)
  2. arm64: dts: mediatek: Add device-tree for Genio 510 EVK

This makes the patches a bit more readable and, if anything happens, whoever
looks at the commit history will be able to more immediately understand what's
actually going on :-)

Cheers,
Angelo

> The Genio 510 EVK has following features:
> - MT8370 SoC
> - MT6365 PMIC
> - MT6319 Buck IC
> - 4GB LPDDR4X
> - 64GB eMMC 5.1
> - 12V DC Jack
> - Micro SD card slot
> - Push Button x 4 (Power, Reset, Download and Home Key)
> - LED x 4 (Power, Reset, System on and Charging Status)
> - USB Device Port x 1 (Micro USB Connector)
> - USB Host Port x 1 (Type-C USB Connector)
> - 3.5mm Earphone Jack x 1 (with Microphone Input)
> - 3.5mm Line Out Audio Jack x 1
> - Analog Microphone x 1
> - Digital Microphone x 2
> - Gigabit Ethernet with RJ45 connector
> - HDMI 2.0 TX port with Type A HDMI connector
> - eDP port
> - 3x UART with serial-to-usb converters and micro USB connectors
> - M.2 Slot x 2
> - I2C Capacitive Touch Pad
> - 4-Lane DSI x 2
> - 4-Data Lane CSI x 2
> - I2S Pin header
> - 40-Pin 2.54mm Pin Header x 1
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>   .../boot/dts/mediatek/mt8370-genio-510-evk.dts     |   19 +
>   .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 1033 +------------------
>   .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 1040 ++++++++++++++++++++
>   4 files changed, 1061 insertions(+), 1032 deletions(-)
> 

