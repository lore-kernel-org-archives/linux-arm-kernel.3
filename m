Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE38C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmuINJdXDEDTHhnmdbjOCrQJdWB/HStrd+tBDYfRqEc=; b=YE+G1TnL1/ck4KZV0p465+GtLt
	eDB2oypgkpLTC51sHXH0M918SrvF+XczGS5qUQsTUd4FiX7Q9FU5jmIrHpv2mHqNVO5x9Ddb9DUPF
	DNCvYdVynk+RCknLPYRnGBDNk8bznAEY7jqbDrDoJnlcnpUxSadSDRscSjX94F2khGkReq2Gs3uwx
	zLv2pRk+QdoJoaIDAfjkeXpmNT9AoboJMijaWznUSYkix6acLXYIr1Mk7EA3bR0WS+O9J9mE/peog
	Rgz0IdHuIe/tSFQk9/aBnbPYtTxfSa7wEQP3Bn1mTyasytXzsfsehTOoDFpQF1RXZYfss8jjcR41k
	ajeFDfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjOW-00000002CKh-1stT;
	Mon, 07 Jul 2025 10:48:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYipm-000000026le-2jtA;
	Mon, 07 Jul 2025 10:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751883145;
	bh=r0u0KcLgNzqStPxSo8tNTI+lkrR1NVJwDZIEcjacuXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n9KLjXG54zD5nFCXqGHYJz1ZCGMjNx4MjrSwYaLCagMT0d5jOA7Ql42QP/jyVKxOl
	 WyH/nVjMD6yR8Zw3Ut4FLF2g1tZ351hEXfY9ltZmvSZKEEES8iuZqdIfZF+LDll/v0
	 4Ouk3jZ5v5wN7zL6x2ZhEMNqav1VVZMP1lqs9Z67ZxMv79/JpWjsFjzH9vg9+Z+++q
	 wiXgYhxW43HUKJBV32Ms6HV+Bdqhj5mThE6+z6h3ZN8PcbndePIEjjJ7+MPJB1EBmy
	 hkutms8W7aKyUu0a6cRL9NtzFritm3VP7iTrlUZ07NkUJVoyGvcjgK0LBuZrjK7n2T
	 8+zlzF7Gj5ueQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6C9A17E0523;
	Mon,  7 Jul 2025 12:12:23 +0200 (CEST)
Message-ID: <f4d046ea-f599-4b4b-a50b-bae00f9f3996@collabora.com>
Date: Mon, 7 Jul 2025 12:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/16] dt-bindings: net: mediatek,net: add sram
 property
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250706132213.20412-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_031226_840935_F00573AF 
X-CRM114-Status: UNSURE (   8.99  )
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

Il 06/07/25 15:21, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Meditak Filogic SoCs (MT798x) have dedicated MMIO-SRAM for dma operations.
> 
> MT7981 and MT7986 currently use static offset to ethernet MAC register
> which will be changed in separate patch once this way is accepted.
> 
> Add "sram" property to map ethernet controller to dedicated mmio-sram node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Honestly, I was more comfortable adding the sram to the reg list instead,
but I know that you got a negative review for that. Oh well.

Please disallow the sram property on SoCs that don't have the SRAM (sram: false),
after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


