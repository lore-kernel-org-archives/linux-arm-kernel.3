Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90208C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F80QXlHLgC6fJ8kRyY41e3CuuRo+PZU4lPERICkhlI=; b=dCsROY5JZYc1uU6Ft8eZI5zgnw
	6aqq83jiut0aSTU8NYlKKZJAtTMfxeVsuXPKpuCzY+D0Bz1hs46ICk5WqIsdY0MweBLtTSpzIfYM0
	4oFgmsEMVmmF8GtuZA1NFj4x/wmdwz5z6l1pRMoILThwgoQggaOGeZJE94LF3QVzfITnU3hZHa8mY
	uHFXCXwaG++MZh+EbkrRxFN+L0vHpEXnf5dcz+XdsDJ7FuvIyhgo4dK+p2cFBgLi8lQSBInsRqhRF
	RBx2g2loaW+TEno+zI99xv/KKDLL+wZUkkyfmLyN9wL4nFbKvUcPC32+M7pwf6yAkNjqJKoM//02z
	Ac2b4NLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IBZ-0000000EWbv-1HT5;
	Fri, 11 Apr 2025 17:29:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I8O-0000000EVwa-45Ad;
	Fri, 11 Apr 2025 17:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF272A4ACAB;
	Fri, 11 Apr 2025 17:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A93C4CEE7;
	Fri, 11 Apr 2025 17:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392343;
	bh=PhGA/PQRX8o20BNQzD1+8NpC24hiX8vnUQGbJ76M/qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGGHDk574nv3ggpHYgRFSGLnGML2SsK64FsA0AnH3svGUa+R2gw447BPw9YB3NEXm
	 kWv+YOEwLjMvVw5TBxnh3PoFiQMOp4E+bt+gmli1Tz3SxEHxu4dQKvmtnyg3fhSx6f
	 MdSiBM3YWeKsnP7vdR7tNXQiWHDbPgWRXbwXhprnOTuX5wGNBFPt0C7dWf9NbbMrPK
	 hzQN13bhaTGVmQpSyw/UIywWblC5Nlkl1QYdRRItCIXoIUp3z6TsWLbLwIKQq9I78P
	 IMTQyBjKBxAyzQnxrfc7pL9cHjyZi7xKjcblImmwNs5PenDU/T084xIbeteTl5uJXg
	 TF7QbMXcpISUQ==
Date: Fri, 11 Apr 2025 12:25:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	yong.wu@mediatek.com, kernel@collabora.com,
	linux-kernel@vger.kernel.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: memory: mtk-smi: Add support for
 MT6893
Message-ID: <174439234231.3571303.15777518966184683751.robh@kernel.org>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
 <20250410143958.475846-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410143958.475846-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102545_077005_0160A6BF 
X-CRM114-Status: UNSURE (   8.37  )
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


On Thu, 10 Apr 2025 16:39:57 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the Smart Multimedia Interface's Common and Local
> Arbiter HW as found in the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


