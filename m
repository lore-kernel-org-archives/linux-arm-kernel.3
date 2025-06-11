Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D907C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrM5gDypfjWh3FMraCL0UyjhbG3mPmdKK05aefBmOH8=; b=AdUw8x+uEAWg50PT9ao9nVrUU2
	egzYLWkVQRUKJk+1IcEgKV8T91SoTP93XMX8F0hNmZNxRBvdbIzKYPBNtmy9gVvaUQUFYQq3362iN
	Ni/gsVzNF3Yqb3fDGgUrDUvst4uY4s8mod6PjVW+ZnzN8kqiDB4h0yHHyZoCFZphzQJtJZAyxNyFR
	s71Ucke2hx8npE76NIBm0tHrvy99EEnv6w5N243Ps9aKe1xUPgVxMf0MZaRZRiucsk5Cxbs5cn2g8
	oFDlaoNmk83YAL73mF4+nr5aqKPvfwtsX+QW4W+dvQ+U27Ev6IPq/33U+y1MoBUBSJ/TtbZLuB4HQ
	ifcQJ/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI0E-00000009W7b-2jZF;
	Wed, 11 Jun 2025 09:44:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq7-00000009U9U-09Jm;
	Wed, 11 Jun 2025 09:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YrM5gDypfjWh3FMraCL0UyjhbG3mPmdKK05aefBmOH8=; b=Z4HHS7o151oUAb5XgzqnubbDPQ
	uv0vHxdzSGXdj4qU60Bk7gK5I6N2wy0CTFh9zA4QDJzS0xgZlOaTAo4o0Rq+6OyIcsrZXq6Kdvj8h
	a+JfnfkU5lyg0hEcS/Lfl/A8BI31GamkVqZGIV224LPBr7qfLUK5txkIAirZbHtNopkDUApJ6rpsn
	RV7k2i9F/Q1F4wk7LRjhyaLqTjXDeo7J4rgQlYRNjlIwXLEYoD9lDUCuj8cx5aHrOy1IbotrBGcc9
	AwQ651ACCr4KCzFe18/GQBLboHCwmD8+6VGUugLfQQbltTfHaTv45VlLskDQZhsoztCBNaPx2bPe1
	13YcqV6Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq4-00000002EY9-1qEk;
	Wed, 11 Jun 2025 09:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634422;
	bh=34m+rAyPyibqJfcT7OFlHLh8GE8mK4kGKtxYmJ2ytc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OR7Ccm7c3ax4tuKRbAp81y0hcQ+3ZxXFk5XZj+eBT4QchyCoZO86EcMYfp994k2V1
	 gje+tgrGZkFOInv7MQCFimbMgf26iAfWcvODLUzqtHLiy2fY306uGzH4P6SfCCrF6q
	 RaviSGrsFldE1v20sn6YPF0mBGD375tUyIptIGnhr/WrDzGiXhPmb5UVfZAXY2EMZB
	 rTLgCXPGc75Fle7udyYeiiBmjccGlcqX4mc5ehRavfCct1uvHIYOVLLL0GMJ7s6ZCY
	 +omlL2cH3iVrHMzPvn/22aUY7VXOFMhIXDC62J8B2ACULR8Peri/E3X7Phm4DaGlYF
	 nyPk+ak70EecQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65F8E17E1045;
	Wed, 11 Jun 2025 11:33:40 +0200 (CEST)
Message-ID: <85fc43ec-5d2a-4976-8343-ab348835145c@collabora.com>
Date: Wed, 11 Jun 2025 11:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] arm64: dts: mediatek: mt7988a-bpi-r4: add aliase
 for ethernet
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-12-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-12-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103344_688163_69A300F4 
X-CRM114-Status: UNSURE (   6.24  )
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

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add aliase for gmacs to allow bootloader setting mac-adresses.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

s/aliase/aliases/g

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



