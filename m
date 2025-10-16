Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D404ECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJWrEiDJfhn6YnkqChP2wurkjTOklKlkKuLOMg43mOk=; b=zWvpYDJ1Z5tBUbyspiG2S5GfF7
	CLMHfWIwmtdcjkUK3X3FHzB2G6Oex6oyR2JlmraMwhUebjip4+A8ApRvSa77Rz8KZ0HHXf3m8lGJJ
	P9GZeABvxoo4tKuUJQGRKDj9h/+tb/I4BOF1RyuCKPdGbwX63s0pxiVQQl6fYRekBb1wVHnfSllZw
	MLyYkkNqfT7dK7FJqvRm4Uojl4lrsfEs8AY04KRapj6g8fW6zAgFYYauURhKNUQXfok4XqEAzRen5
	zdFm1s3I8T5jbyJiHjbK+y3rvu697CtkHdo2Y6pPggWl8fzv5xgOOqY/J8yYHF14kEsbkO4Hr4/eL
	OPXj3TCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAG-00000004YQa-16FC;
	Thu, 16 Oct 2025 11:29:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAC-00000004YMl-3XYk;
	Thu, 16 Oct 2025 11:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760614134;
	bh=uvKbe11B8kQ6Ee0GKNfpxCLAco7lfj+y6SoI+zoc8AA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fche2fNudBfF4EiJNAIhzgxus/W7G1rXmy0ZISAzBlNqLXlkez8nEUVF4mFeLQq2B
	 0+qex3PNagHzhTv9mTl7nlmWg8DWOwDFaw/zkw9GhvuyK0uGN4yNBDaRdVZ+Q3HcRY
	 U+AihgPGf4FElZeklIWhqjk++yzvkfkX0GH8Uqf+JRB1PY45Y32XLw2XvZWINO0QsR
	 9Vzztu206IXhgfsfFIcREu55tzxE/FcUZT8IvzPImZxhicuaCstPcuM/gcD90GvPPz
	 KJP4ob0WqIdZeV4KST2Tb1b/XoXVf0d3Xiatko8wRWCM/EKpUcr5V4p75aqu+Lmoap
	 hO1GHvT6+h9aA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CCDB17E1060;
	Thu, 16 Oct 2025 13:28:53 +0200 (CEST)
Message-ID: <9bf32a56-b67f-488a-8719-3f97d85533d3@collabora.com>
Date: Thu, 16 Oct 2025 13:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] arm64: dts: mediatek: mt7981b: Add wifi memory
 region
To: Sjoerd Simons <sjoerd@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-13-de259719b6f2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016-openwrt-one-network-v1-13-de259719b6f2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_042857_053906_740F7BC8 
X-CRM114-Status: UNSURE (   7.48  )
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

Il 16/10/25 12:08, Sjoerd Simons ha scritto:
> Add required memory region for the builtin wifi block. Disable the block
> by default as it won't function properly without at least pin muxing.
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

You should split this commit in two:
  - Add wifi memory region
  - Disable wifi by default

Regarding the second commit, you have to re-enable the wifi node in all of
the currently supported MT7981b devices, including:
  - Xiaomi AX3000T
  - Cudy WR3000 V1

While I agree that without pin muxing the wifi may not properly work, it is
unclear whether the aforementioned devices are pre-setting the pinmux in the
bootloader before booting Linux.

In case those do, you'd be "breaking" WiFi on two routers here.

Cheers,
Angelo



