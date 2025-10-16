Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789D9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbFOk2cdyi0DFdFAD4VNDGnbkRBw/S/kooYogmTnHPw=; b=o6aoN9TiCUJwch0DpGwVCthtXj
	ul6+zmeaWwFpZEA/3dNnHte7eG+myEgcLBg1NcRolFSvtViMgctQV2++J/QIEdEuas0hnQM08PyOl
	JUDYMy8BtsYDtr4rPFsiwPZDvUPk/nGafUoZ/JhbAaQxlTEu7h2wAFMU/pWLynvKCEuyMM52qmZlF
	HD1uDhiYuXa1wGShMu2JeVFbg//nUnSjR+g9XjXztFDEAozLCpA9RtTamx+6LHlgITCsHc2AVgmww
	dnR6nD8NDNpUNBCsP0Ger8PsB9XOOpTpT3Smczk/cKjXW6mj5xioYwwHYCa//aiRWzu1H8t3Rbv65
	oD7K5zmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAF-00000004YPB-1z9B;
	Thu, 16 Oct 2025 11:28:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAB-00000004YMV-1VMO;
	Thu, 16 Oct 2025 11:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760614132;
	bh=Ly+GqD50EQby60wKFpjz5BdLWtcrRKYoyDEb5wk9upA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ciTFAcdwTMcoM9IMD3uzqeIM16hWrwQqKAh6NVXx2gLsw/y0wpQOWmMYdaYNrH4LE
	 35rJDXHyl/VaV/NdwjPuhwCfVEyGTwbrlSZn8Kmj0xQ3IOamihQKxL4cXhUN45/EHt
	 9X21t6yJJzrhfViqYjmOY4o4870+X4q9Ys0Bnkssv/UUNyu5HROI/OcjSLdkvMdla9
	 Y9YxsJoYFkxGRq++7paJ9zgPqvlVyl7WPz+vedtxF59ZJXbefaY2A52fh75LBZDHuc
	 7Raso927eozklnf0Uk6bNieeCreoDZBrOVElVNqHGYj+LRTfWmGmy/LfhEhRhUfhiJ
	 HA47jH7KwcI6Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB9D817E0FC2;
	Thu, 16 Oct 2025 13:28:51 +0200 (CEST)
Message-ID: <1e600905-894f-4428-adfd-1337cb6d4794@collabora.com>
Date: Thu, 16 Oct 2025 13:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 wifi
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
 <20251016-openwrt-one-network-v1-14-de259719b6f2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016-openwrt-one-network-v1-14-de259719b6f2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_042855_578824_28CEBB46 
X-CRM114-Status: UNSURE (   5.37  )
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
> Enable Dual-band WiFI 6 functionality on the Openwrt One
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



