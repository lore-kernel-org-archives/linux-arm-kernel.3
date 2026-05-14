Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691C1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2ehrxf7QRsw17Z09qG0sjQw3UivEx9IlEo452jvYDc=; b=pZh1Flo5B1RY8A2di5w+UYSn5S
	3MsKgR47TZPEEQHugftcQGLRP2j4YMV78N8GwVlLR5NvIhuvJ6oih/OJplo1OHam8h/kXTDkzz1Vf
	uP/QznrtgPpneifJ8qfdxNBLN4tWT0eNFU8n/PVkchoyvPwLrBOkzwahWm2O5ih0/fN1qHnYjKWvN
	SpMDZVSnco6n62SydvnAYcoK9x+vA66vuBfhXnyRg5NGkvVCOMlMWOozX/WTxuWjwTvTD0Rv1XxBt
	BlEXCxKDalev0IEX1Cstm1JU6U5T9T7apOJMZXzfjsWXejd5zM138JqKJUFRzHIzxMxVb2iBvCpjx
	rHioO/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYIb-00000005wG9-0Pi3;
	Thu, 14 May 2026 15:48:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYIZ-00000005wFZ-0o03;
	Thu, 14 May 2026 15:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F4A243A6B;
	Thu, 14 May 2026 15:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C2C2BCB3;
	Thu, 14 May 2026 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778773710;
	bh=99/YmHRV/Y82fkZD0R48lVXiAZc/PRWolZfuIGwP27I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7X1VVsXS2LJ35c20vQm++re5sDMpfP21kid1EyL9bEGyj0dLJzGrqd3PPfbd2mZm
	 RXdnIsp/nSkGZl4NOEcevRk8foA4t4sSmY/dDN6uClkzyceduknHASc1ZyuyGd+JdW
	 8O0OiFhPZ/zXzczSC5BMSM2NclDxXdJdDuF5R9lPAl1R+AkCokRr1ODgo2w1//eQfb
	 Rr6Fy1wIf5ORqVpSkOHt1mMuANSTd7eX8JVUyeEUfNMxPRihOpPmY6ZS4TzlERZDl8
	 WqpxfZQ1lSNPdECtDQrjYSaQ3ktVPXKC4DQ74+TWXxZIWh2n6vOU3AX0GScDnmO8iF
	 3fdxdOJ+MH+MA==
Date: Thu, 14 May 2026 10:48:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Zhang Rui <rui.zhang@intel.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ben Grisdale <bengris32@protonmail.ch>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 04/16] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC thermal
Message-ID: <177877369030.795769.7510562882994447015.robh@kernel.org>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-4-3efcba579e88@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-mt6323-v2-4-3efcba579e88@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_084831_247526_DD138EB4 
X-CRM114-Status: UNSURE (   9.44  )
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


On Tue, 12 May 2026 08:18:18 +0300, Roman Vivchar wrote:
> The MediaTek mt6323 PMIC temperature can be read using AUXADC channel.
> 
> Add the devicetree binding documentation for the MediaTek mt6323 thermal.
> 
> While mt6323 exposes only a single thermal sensor, newer PMICs like
> mt6358 provide more than one sensor. Therefore define #thermal-sensor-cells
> as 1 to avoid breaking devicetree ABI in the future.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


