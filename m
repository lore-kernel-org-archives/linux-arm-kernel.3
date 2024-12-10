Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPGaUJKFD2REvWkerefGt5s8cs2gFufO0Iu+4nB8Xz0=; b=cfaYXOVQAx3FLHy3LCLNoPM9MU
	I68+jvVzfnifqkF6vVh68jUWfJsxaXed+WYRxhCTlcjJYUr501eaEhsq5I9WogpgEJaVUgWJcQ6sG
	1RkczsYZXapmvqcW7An+tVsfgIEKXKQYZnEw6herL2zszDXWxN3Pn2aHtGTOkgZTZ2QWwDXm39G6c
	+ZU5hQFDWXFTs3bvNtLEpUdHDNE9eZld7bpwagWR+sOZTbPMKTEVSk9JZTdJGyHMNxkLoMYbZDzrS
	H4C+RcFv4KzkNMs+cmttbcvQYjLulMsSd8UWMw2X0fpW9x5fkud/Zyh4y16uKXXwAZ3HNcxFoSKbU
	RnkZu3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvfd-0000000Aimy-2t7C;
	Tue, 10 Dec 2024 08:32:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbV-0000000Ahpc-1MiR;
	Tue, 10 Dec 2024 08:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819303;
	bh=Sey2FwuqS83CGVYRMIQ83C7Iy3pco/IgbX55pT70R24=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RKwizwo6UtMLl0xa7ufRLRuOg5pKrVA6bv4wqSTAquy+BoYe3X9bH0uisFRIhxYQl
	 Mc1hinJArarNrb46J9TEX+KCqazkhlEP8MqUFCKLsucprhZCpaAlPEzzYXWISRIecc
	 pUK28TqsVETz7wD0bLuNdXdx6m39WMPECXAKGKq5y6Ok8Flsmkbuk7jHaeO+Qh+YJi
	 H1al+Tq6aHEkAuv2qxmcN330ARI74YTb0DJIe1dZkjA3qkpDTcK0mxWfm5XAX7B01X
	 68ZUYw9DueStYuqTgTSK6ZHhlE4xbcerSvCygF6zq2RZEozWuesX3p72wDghGb4Zx4
	 90I/13hwXWtkA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F404E17E1541;
	Tue, 10 Dec 2024 09:28:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Wojciech Macek <wmacek@chromium.org>
In-Reply-To: <20241129055720.3328681-1-wmacek@chromium.org>
References: <20241129055720.3328681-1-wmacek@chromium.org>
Subject: Re: [PATCH v4 0/2] Add support for Starmie Chromebooks
Message-Id: <173381930291.18469.3166957495661734495.b4-ty@collabora.com>
Date: Tue, 10 Dec 2024 09:28:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002825_515471_98444284 
X-CRM114-Status: UNSURE (   7.70  )
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

On Fri, 29 Nov 2024 05:57:18 +0000, Wojciech Macek wrote:
> Add an entry for the MT8186 based Starmie Chromebooks, also known as the
> ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> a tablet style chromebook.
> 
> Wojciech Macek (2):
>   dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
>   arm64: dts: mediatek: mt8186: Add Starmie device
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
      commit: c31f6c2f25586557bc586a9b3713bd7473e0cac3
[2/2] arm64: dts: mediatek: mt8186: Add Starmie device
      commit: d926d78bc93b1bfe18bc1cf80e66e1a0e38297ce

Cheers,
Angelo



