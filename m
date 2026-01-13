Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DD4D30CC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xii1JcNycV+hInTVG6Egk8vtKvGdk/jIKvkiv7cL4wU=; b=rW+dcmQIUWF4NNM9UnKEN6O2IG
	/I7JsrPzGEHiuxAfAsj3IbdacelaUr7uzpvlT2q2wsYb6KuP40TvV2OGDaOvQOnqCLdNa53OxC+is
	Aixz5bPyZMvroGAXTrSYnv++9Q+ZpGOcGYlgFQuCGYjdkwn+bndqFvM56k/2ZFt/NYpgVLcTQVDCl
	RCw7i3qiXOeYZqoYmK9YcbT/ZJBbxYDMjeC+pVg9ShTNe/stxTDmuCoVj0DwFUp/dQrUEG4g5cvJw
	8VN7cJZvXqWyR66so6mcHVHb1Zvb3h6uq34XVGhIJntd3+y+hR9762bnKVdbUftBTCxLk1j91Zvsu
	0rjKp7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm3U-00000007l2U-1R8I;
	Tue, 13 Jan 2026 21:36:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm3R-00000007l1k-2VKD;
	Tue, 13 Jan 2026 21:35:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36DBD4405B;
	Tue, 13 Jan 2026 21:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0369C116C6;
	Tue, 13 Jan 2026 21:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340157;
	bh=OS4rK1JpIL2tCKHvZYkTq7ert1jUWu/mrzJ2UfQFEoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEfwqBsivmfsVpYNPb4w9WcETiTFSM8PtivcaexoMCZxPCIHO41iEy8WqxeI3RoWB
	 eUiuEHvKrxBFgN8pJ2IB6JcmN+5UnIX+NPh5xapopDD6l8lt5LY/EJjCBfNcpqwnDQ
	 Ur/nVNRinCeRmVK6Qihoa2wTp6NPglxH2xnaofXUXjpjtyH4hZbfPP572xHDT+bP3r
	 Z8757qv5xILqVg6d1siuFQOp+IrzxKH6vBHctU/gkKqJlPuoqS5PHwPrlaW6/gl/fJ
	 cn91Jop/ClGjidwmcXScn7kIuidUvVmV98XZE0dllHlxsOrNiPHQcetgIg8m/QB2aC
	 e5Et9gOzwT2dA==
Date: Tue, 13 Jan 2026 15:35:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: macpaul.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
	broonie@kernel.org, lgirdwood@gmail.com, kernel@collabora.com,
	sean.wang@mediatek.com, krzk+dt@kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	sen.chu@mediatek.com, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	conor+dt@kernel.org, lee@kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add missing
 MT6331 regulator compat
Message-ID: <176834015357.196719.2715657328472319678.robh@kernel.org>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
 <20260113110000.36953-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110000.36953-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_133557_653096_87376E7C 
X-CRM114-Status: UNSURE (   8.27  )
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


On Tue, 13 Jan 2026 11:59:56 +0100, AngeloGioacchino Del Regno wrote:
> Add the missing mediatek,mt6331-regulator in the compatible string
> list for the regulators subnode.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


