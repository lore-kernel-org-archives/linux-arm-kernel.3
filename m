Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6CD30CC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei5CmILwK6Jc9clxDxz25INLgf0c91QGBDLukWNRrS0=; b=R/mUuQ5GS9loA2aQzf7c+6mfsq
	FLF7UYiakBO1kJPhuYFw+NszGp56oN6P1ORRvztk7mAl/7KASH2VAfFAMkWOGRUzyj6/LUY/tOJOZ
	zgK31jy3xI8uM1jt0Zo/RptqFdkiH6gElux5VWvUjNPBYAGvk7lsNSt4MrGMyxWs9Ub/iC3HL09Z4
	lvRgu0YVjHRbO6DCjws3/ah6Gg32D8+Z1nsvXnXeqGL0sSBGDiHsGpHC9y8jeHIE2vjriysLsxIc1
	XlXgZxZm0grJYxvFX6kJSN4kTdmA742MFlv0pKOmvpPXXpTPVnhXIAzvV6kQ97WmuOfETXnMYevRj
	K/FgPaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm38-00000007kvX-1x51;
	Tue, 13 Jan 2026 21:35:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm33-00000007kuJ-3yyC;
	Tue, 13 Jan 2026 21:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4064D4420D;
	Tue, 13 Jan 2026 21:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A8DC116C6;
	Tue, 13 Jan 2026 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340133;
	bh=Dbm8u1nxv0SFdoJYYafBE70biE2TqlrwQCv2IgpJL9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNsMCwgPNrJ7I1l70NhY9QVgqFHw7VX3Tq9I3nM+/mQCY7dwHqSGLHvZ/d4vE8iu0
	 S+AvEbWZjH1rXJc4FrHOhe+mkiR8hHINWtScgYY0kpMdPj5ci4IkIJQ0FVxt+2Dg7q
	 8k97e1dU726l+JifhX4aH+jFid171BZDURhOT80//HhTegiaGCov5RjtXfCTRNlxmW
	 Pry3S8Yqw+MclexkUTpFw9C/st/n22/l57nzezevBCRBPpch4yVVGx0QvtJyqQKNK0
	 9p7hB4bmQJAr9Pd3pLKSKzpZ9I8yi2oO1uVuIxws5/sx2yxeKGi2AL6BN55JmkQ95h
	 FuTYpWLk3/5qA==
Date: Tue, 13 Jan 2026 15:35:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, sean.wang@mediatek.com, broonie@kernel.org,
	sen.chu@mediatek.com, lee@kernel.org, macpaul.lin@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com
Subject: Re: [PATCH 1/6] dt-bindings: mfd: mediatek,mt8195-scpsys: Add
 mediatek,mt6795-scpsys
Message-ID: <176834012975.196178.18344573393379510251.robh@kernel.org>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
 <20260113110000.36953-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110000.36953-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_133534_003908_F366196F 
X-CRM114-Status: UNSURE (   8.16  )
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


On Tue, 13 Jan 2026 11:59:55 +0100, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the SCPSYS IP block found in the MT6795
> Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


