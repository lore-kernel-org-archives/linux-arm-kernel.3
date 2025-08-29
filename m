Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67032C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcAxLDkxYXIgFnTk1GzehiK4pZHzK4UnKuvJ+0x3xgg=; b=NxVBayihibzRuOnbmiaX1ewHcS
	Ibb1rU4WqZ8mKN7H+Tbjqo0MrnYM9re/Z3DGX7LhsIKT9svlsLbqmRHre42fyVERnaSYlHxU6ehHJ
	QK4pHmXCzebijichqmHrWOJKg13pye/DVkvyOfKC6DGFHEepzpcS4V80WNk4hObVQyGn1BKqU37BK
	7awgc/N5hVWwfcjubu0hDdG6En/W7hTl+TLKTmJPZtSFwyvCjVu/Xm9BWWkXQWlQ/DPKTxsraSTKI
	bRht3ZnFdwPyHQzS2CGxhwsDFQAlgX9f1BOYHq6g+Vkwb4yKOT+8KChtIfQss0EaPZOREgGTgVvxM
	zJHLq+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urske-00000004fFV-17le;
	Fri, 29 Aug 2025 06:38:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urshq-00000004erS-1zeB;
	Fri, 29 Aug 2025 06:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 201204535C;
	Fri, 29 Aug 2025 06:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AACDC4CEF5;
	Fri, 29 Aug 2025 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756449326;
	bh=0NgMjqXnvtRxxln19R3tS9pI1H20Mq7W/lHIuqdY+uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUS4NeEQDHp4RpXIEfmuZNrr7scAypuu9Ptx8sJ0yCP1XNllD61+L5wEEx9ld2LEB
	 IKZ8NbSez9ZALLcZTsa2OTkyVVitVJs4listetsc4sgMlzbfcOo+NQ/i10dA4OGiJV
	 3ypKzqdmOYZWb3FOdXhkzi+F/V959omeAx0IGhpWxCotcvditbNQSMaIyAWjBxbLGL
	 ehOepos0hy2v1fN/9Xx35Nhm+9qoq/NFA2yoic7goQ9zq4YIlODN5rtI/pvCN7LSuF
	 YQ3ja/kZA9aWCCGInZ+/PpGYpePQHhkMO5PozkkNwawFZY/k721wgzp/EBR5bhA4sF
	 U3e5wycRVi74w==
Date: Fri, 29 Aug 2025 08:35:23 +0200
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
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Message-ID: <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_233526_532191_81B36EDE 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, Aug 28, 2025 at 04:06:58PM +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++


Your changelog says NOTHING changed here and this fails tests, so does it
mean you received that warnings before but you keep sending same broken
code?

Last two weeks of contributions from mediatek are absolutely terrible.
Very poor code, basic in-house reviews not done, basic testing not done.

I talked about this at OSSE 25 with some friends and got reasons why
your setup is broken. Well, it's on you.

I was already raising this with Mediatek, but we are now back to square
one.

NAK, because this patch WAS NEVER tested.

Best regards,
Krzysztof


