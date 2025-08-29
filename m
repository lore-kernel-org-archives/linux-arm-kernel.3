Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8C7C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZzAvToNc5C7Qmk/HhJFYqcIJyoBPbpHC+15DNoKpHM=; b=B0tzCSqdvEzprnECpLtmwOjTrA
	ig0Kgpr3pa6ruOKxj+SV4aOTe3TtxciAMsd9+7ldnlHc1ONj1Ekc+pbrw2n4Z1xlEhzuKdk2TFQKd
	RIDYlQzf3AA7GRUwuFVSZ9IOcWXRv2oGs4onBL/f+kYRYPSpAbDVYIZa+UYK/29JPyMm49No7xnFd
	Q+5MSn0osSsG48JwM93qJjeZAXZjEtGEorYhasHVmvic4W0KdGUqXI5qncYHaSl0Cb+Ju7h14f1e2
	4V2rh9+3mCiZ2jYcufFuJFwwYnf4D4bwMshB6vbOuSJ1sux6ym7hAjXFqdQjimWY2p+uEZvVrJbRJ
	BytZAm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urshc-00000004ekM-1bDe;
	Fri, 29 Aug 2025 06:35:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urser-00000004eMG-3DkS;
	Fri, 29 Aug 2025 06:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F6B64170E;
	Fri, 29 Aug 2025 06:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D48C4CEF0;
	Fri, 29 Aug 2025 06:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756449141;
	bh=lZ0QTag0VjlOQOxSce3jMyppu0ATtFUwrlYgNcJo/x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ead6Kr+0+piLg9YfVifMhyiEpWCpjYQwKm5BrNkbVVEhEtUxHhdAY3TZdPVPMcPho
	 X3MQDNIkatnzRTNeLcZGs0m8ip2ORZAsk+iB5f9gNgs9Q3Kr7pXUqAwlL/fhzdjlf0
	 5JpoRNg74ZvzDfAj19KNjv+NyjqWhN2ttfNmJN6aGpaRinfwpW0CW1TFc2bOvqAeiZ
	 x+X3MEjEruyfBzhwk9aOZJcYANhUWu4Atdkg3VSVbMKA73GlPZulTS1m8pd/XuZZFO
	 L6mqlEbt2gJG/NF5ilq0yfdbTjGFrpREaByt43g///9jPr93TLluHDTMvEZDCtOu8k
	 Fz+dHR4x+QKQQ==
Date: Fri, 29 Aug 2025 08:32:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com, 
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 00/19] Add MediaTek SoC DRM support for MT8196
Message-ID: <20250829-curious-indigo-worm-b7e7ad@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_233221_827983_63497758 
X-CRM114-Status: GOOD (  11.50  )
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

On Thu, Aug 28, 2025 at 04:06:55PM +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Changes in v4:
> - [PATCH v4 11/19]
>   Add New commit to refactor the naming of OVL Fornat.
> - [PATCH v4 12/19]
>   Refactor ovl_blend_mode fucntion
> - [PATCH v4 13/19]
>   Move mtk_ovl_get_blend_mode to this commit to align with driver.
> - [PATCH v4 14/19]
>   Remove the unused paramter cmdq
>   Remove the reapet of pitch setting
> - [PATCH v4 15/19]
>   Remove the unused paramter cmdq
>   Remove the useless parametrt of func():mtk_disp_blender_config
> - [PATCH v4 16/19] 
>   Simplified the driiver code to improve readability 
> - [PATCH v4 17/19]
>   Refine mtk_ovlsys_adaptor_layer_config's layer config checking. 
>   Refine mtk_ovlsys_adaptor_config's logic
>   Fix func()'s mtk_ovlsys_adaptor_stop settting
>   Refine mtk_ovlsys_adaptor_clk_enbale to repaet NULL checking
> - [PATCH v4 18/19]
>   Fix the system report's syntext error


Where are lore links to previous versions?

Why aren't you using b4?

Best regards,
Krzysztof


