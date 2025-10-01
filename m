Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1940CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o5ZeL3extV8vKEl0nNxFvrUJOwZGGz3DeNZbCwCUJo=; b=Mn/KzM0V9z6ml2tLJgLU9yrQJj
	AR7A6iFu0K7fHHV1oWMn1PbXZ14FM6IceHnfLsjHImUMc/5x355WptSPaHknzibsG6bwlG3otKT+u
	gqt8Dw1I+QGKyd6l5l3ect6X5xjgWfvamWJHGIwmjBMPPXAgmiZ9ZoeR1n/XEBdclotekM20L30ty
	9TfeA/2n02grmESPI9YmWpISsPfVoZDyXljyn6Dn+vWdJ11uTkE7HLfb6SSOzRVlqTymt4Gom1KCy
	rwhzqJCILWoE0hCg4myQ6Z3fEwFOagaS310XGA9pvMVKHpA6TTxBzodcSPnkxPaxUZXcBr1ERIaBx
	2yBXVw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z46-00000008Rla-2p9h;
	Wed, 01 Oct 2025 15:48:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z44-00000008Rko-1EPS;
	Wed, 01 Oct 2025 15:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9B4E48A8C;
	Wed,  1 Oct 2025 15:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33C5C4CEF1;
	Wed,  1 Oct 2025 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759333703;
	bh=+Tl05Ou3PJQ7OylAUPCNuIRKgh9v2tHXm+1qfVH7mdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLYrPWJ4gVUC8wMMTXfBcJ/gJuTs6d9ttXNA29wMkZdhaFN8Gl8ZlCCt35k7CqZQP
	 MeiUkgrldCdgz4kvu59bgE9FspeeNUlY8IqhfWE9UzGe3G9Xjf7zTndMEC+BKM3cGf
	 ErjOzEW+MsygoauqmWXRrB3mP02Hl1F+A8AZnp9CtijPINrAKuHduAslgcb4nflCER
	 W4OaNYWQlDvOzIJJUirzoThPgO+9iVCPDxSkJY/s/coNJPWzDlAB6LUEZLWBvAxYLP
	 UylgrU5SOCKUaRnKMjWtCM2TfUzRrFhTOFqy2uKkGvekavvPscmcC71mS3+1aMzPHY
	 HDNEZiin68XKg==
Date: Wed, 1 Oct 2025 10:48:06 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 3/9] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
Message-ID: <20251001154806.GB1833526-robh@kernel.org>
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
 <20251001111316.31828-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001111316.31828-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_084824_347945_68E965DB 
X-CRM114-Status: GOOD (  10.36  )
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

On Wed, Oct 01, 2025 at 01:13:10PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6373 PMICs.
> 
> Link: https://lore.kernel.org/r/20250715140224.206329-4-angelogioacchino.delregno@collabora.com

Drop the link

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6363-regulator.yaml  | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

