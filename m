Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F285BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/UE/Imcow6hncj9KlKJdN6WlXjOLvIGlTyR0jRKeyI=; b=Cumjf8DGI+L4/MDg7uu+kQCcKN
	+LyNeY6cGfmlFZn+/3qOfs1y8Pmk1ivSWe9I6YJ1rsYDthhp//azvsWSLBNNwTvtIE0LRtT6GZsp9
	WB8xFNQCWTDhTZoiJvuZxKGBiGuVNZZk1h9pRZ+7Biel74AK87oLCRT9I606/i9bc7F99Y6YJLUyc
	DRNQWTd8TX11X8FWTJy3q0g0JxeRg9GqChlnRGTvQZCoVkv00M+nyU7c6Ab7/reDH3KKQlQBVAaEw
	jMsmhXwbRZ+M9PPDC+9liADIlZ6itZfi1Uklzpwu0o32DyNXh963YG+Rg9O0AjiOmyclWmy/sHeyD
	BQGMavwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnzY-0000000D3Or-03q8;
	Mon, 20 Oct 2025 11:23:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnzU-0000000D3Md-2nfH;
	Mon, 20 Oct 2025 11:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760959428;
	bh=QOHxraMMUDUqY8P1wrbdeEWqc7uw2P8s5b/XHtGwd8w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KsUyhwSrBs2+uTcq53JLnq14VjXCk23QSbKX/UY6x2PTfp+a0K1yNJszUSeEU0f0Z
	 ocWiWKumJ92kT9oYpcEgkmtrxmCya+jD1OH3p0Z9OpWFUFcyOE03Rn6eeC4j7Ekefu
	 MNgCveLRuu3unT2HHUo5iuoqmbCwnuZaPA/mPE7YYrx7MpWggOIJWi1skRh2HoWGgY
	 0ry+/90alDjcDCd9iPL7LEg+HXaauKflRWaV24kE9BkUw8jZjPhsuWvhmpLSz9y3LR
	 ghOnjtYo8wk+8LeKuABUcZUwebm8bgcYEHAm/irD2kF5BROrhLYEPN7NT/CcX6HWfZ
	 fFm50HTx8Avdg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B483C17E0C54;
	Mon, 20 Oct 2025 13:23:47 +0200 (CEST)
Message-ID: <a1f62af5-b755-4fc6-a3d0-983dbf53dd30@collabora.com>
Date: Mon, 20 Oct 2025 13:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] PCI: mediatek: Use generic MACRO for TPVPERL delay
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 upstream@airoha.com
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
 <20251020111121.31779-5-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020111121.31779-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_042352_854827_8F8B5146 
X-CRM114-Status: UNSURE (   6.42  )
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

Il 20/10/25 13:11, Christian Marangi ha scritto:
> Use the generic PCIe MACRO for TPVPERL delay to wait for clock and power
> stabilization after PERST# Signal instead of the raw value of 100 ms.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


