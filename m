Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA759C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjJ8cQsc5cUjtskpN21HcGzIH9Dn63Zj3Z/xIOp/ooM=; b=fqdSDJaCLjMae6meaiS7rM0aqL
	ehok5EYHpJhrtN44sP4RPnraeIMMtNdCWaEjp17moMYKksFz5vC9fniG+D4rWu3D0rj+uMIfr3D3r
	rZKEZ8jtUBGKfV4r/9IpSqI4MAOoMckyJBRYIvXvSyONwSeUS98F8hW30eMqnKS+s6fwogaynOLac
	Groz1EIqXrYhtmUMXdz8PmA3E2/cIH/ZHOnzESaEO+xBKaS6qVL+P3Rq40KtDKA6tAegllFj1ceSj
	HwgTn3mQCRYNLcwOEUP5nnZU2HpGpOp01/G2VMnIVWEu2CzDbo5+2jnnfyE/DDwW4vAUffT5h9VLj
	A8ziFpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglRM-0000000EJsp-3o6A;
	Fri, 16 Jan 2026 15:08:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglRK-0000000EJrt-1sOM;
	Fri, 16 Jan 2026 15:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A93FC4342E;
	Fri, 16 Jan 2026 15:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60600C116C6;
	Fri, 16 Jan 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576121;
	bh=GsDoofD9Db2+ABthdz0H2fcd39DOVi6IJIg7YdoRj8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVy8+kY7ZWBm2uJM1aPcj6Se4PHtz7GAXz4wHdMyGVhlhemIZzP9df1+u1DnzKyds
	 ksyaEv0+Bq5NpSZIvTBFguO/zUpvHpZzl9EFrLjQRH4VbY1T1dWk+K2gub43Awo052
	 1qCUQMmvRmhvZT37qXm5NREEYSGMTEwgAto0d81wJIil7TMVuslj4lFh38sgmVPrRP
	 hbxWJHYTAjrnXlWg5zrL8vivybNTm9fP7DGDkSO4V0vi/dOYERuucSUXATODdfhwsH
	 xLfVKus6wrbYIDbIBetj6BOSpHUofKtyqhUdz30yJMWPWfdrevgJ7nQYR7cIFVylgr
	 4yTinFtN6iMrQ==
Date: Fri, 16 Jan 2026 09:08:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, julien.massot@collabora.com,
	linux-sound@vger.kernel.org, pratyush@kernel.org,
	tudor.ambarus@linaro.org, devicetree@vger.kernel.org,
	shane.chien@mediatek.com, richard@nod.at, krzk+dt@kernel.org,
	lgirdwood@gmail.com, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, jiaxin.yu@mediatek.com,
	broonie@kernel.org, vigneshr@ti.com, matthias.bgg@gmail.com,
	eugen.hristev@linaro.org, linux-arm-kernel@lists.infradead.org,
	miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
	mwalle@kernel.org, kernel@collabora.com
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
Message-ID: <176857611991.1604366.11152222679883744313.robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_070842_505385_409EDAF6 
X-CRM114-Status: UNSURE (   8.39  )
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


On Thu, 15 Jan 2026 13:56:23 +0100, AngeloGioacchino Del Regno wrote:
> Add support for the mediatek,mt8192-audsys compatible, which uses
> a different audio controller (mt8192-afe-pcm) compared to mt8183
> and mt2701.
> 
> This resolves a dtbs_check warning on all MT8192 devicetrees.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


