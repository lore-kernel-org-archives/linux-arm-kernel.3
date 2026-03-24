Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961EEE9A755
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNADjjxsZ0ZdPMjc8i40JffmEXFK1sCwtk0V+zz4sy8=; b=n8h1F/B/snnKX5SA/S30sw7AyM
	i6hTNXePjKCFf6+aVlZavpP5YXbnwKCHnRvb+FQDlwkH3ZojesGDM6gWuyfhe2xVSZ2y7fZxIIyj3
	i0Am8buATY2sMi7z494xipx+mxeHMWmBVBOrBVDc9RO3sSDam9lZ/tLTiJ+DWgWrgcFhDmIqNkXG9
	5Q1z1yUX+H0MkrplxryxWqx1ORRkLC9/8KawzgXuii/BSwp8dBPAQK5vnvzPM2XbfotaKa/qhMW/D
	bC/Bj2XdE4CH5H/1FLvDmAX3bDHodwT/9a2Aoa4cg/DkdRySHio0BVJxBojAEkcczpjE3hMEAjzwa
	sRcQV4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yTM-000000019BP-17Xu;
	Tue, 24 Mar 2026 09:54:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yTK-000000019B3-2NqR;
	Tue, 24 Mar 2026 09:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A158E60103;
	Tue, 24 Mar 2026 09:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E61C2BCB1;
	Tue, 24 Mar 2026 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774346089;
	bh=XaFzr+YEjUMzzdze01fC+C0a/ccH9sqXCsUIJsqKR50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBXX2HTw/oCXSQFIgYluZ+o0MmrV7W3Fl5DKQ3DHsDdp1LhgYAngpJHutHkAbYBjt
	 7eCxSYZAbJb9V5/OQfYViaSPN18RWvIqWfagT6pyxTYC3IHhYpSH8wjB+96DmdjPK5
	 eeuqmuYOU23p99DyYy6aRN0sDVA8yBQ7bl+y1oIvdoAx72Ai/NFEC02kA6dGIMa4C3
	 lDZcrCerNd2yAybV0oxvr6qpiS5Fzli4PBVj+FYv097XaGDormfxq00TRqUYtmNSJK
	 oik0QoJqfbMDNEkQTE/WmDoc32cr6niN7kKNBZxRhnURp1W0Ej/p5uotyjCP/HYA1f
	 syyZdXf2trV3w==
Date: Tue, 24 Mar 2026 10:54:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bayi Cheng <bayi.cheng@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: spi: Fix clock-names definition
Message-ID: <20260324-magic-camouflaged-albatross-6fdeb1@quoll>
References: <20260324032624.1708029-1-ot_meiker.gao@mediatek.com>
 <20260324032624.1708029-2-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324032624.1708029-2-ot_meiker.gao@mediatek.com>
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

On Tue, Mar 24, 2026 at 11:26:17AM +0800, Meiker Gao wrote:
> Update the device tree binding for the Mediatek
> MT8196 NOR controller to require that the 'clock-names'
> property contains exactly six entries, in the strict order:
> "spi", "sf", "axi", "axi_s", "bclk", "27m".
> 
> Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
> Change-Id: I0542d6d726f1af34ef76c1a58ba4e4b02ec45fe6

Please do not send patches which were never checked with tools. Run
checkpatch.

Best regards,
Krzysztof


