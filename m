Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85C4C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+3ZqpMWqx3e/e9Nv8K/cOXfzepluHD1reRjIjM6an0=; b=KiYmrii8BjbMYDY5kHxSE75yqZ
	x9B9UJbFafpjzd2M4No7j+brmBnp2Z2I4ecXoBp5LMCw4VHiYRJeFwJBZROPrjxaCmylj09gBVTas
	Udb09kllQhoXT0np+1nkLCnexx7rj0jsWzYCWx9HCDl2qggsH/5m8jJyM1WWhJzOVEh5FKTEVAt2C
	JbAfjpPCLgTm8LvHaIzG+nMALjKPBbvrn8BSShwMc9nSBKG7LJ1eMReef65KvrqeVswLVd7JkXnnj
	TTN9jPfx5MtLavzN1IuyoeI0CuFX4uEfQMVEglUBRUVrNOuQ8nlD+YD0j20DzPxTAC/4UzDd4/EeT
	PyNyZI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NNK-00000000Tt3-3mum;
	Fri, 25 Apr 2025 18:02:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MQg-00000000K2x-3RYG;
	Fri, 25 Apr 2025 17:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C3D4438EB;
	Fri, 25 Apr 2025 17:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC89C4CEE4;
	Fri, 25 Apr 2025 17:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745600494;
	bh=o3dYBhxjf0WGilAR1KMtBP5RFjQHYJBqcJpRGhG0CVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbiXFYKOzN7mlN1gSyn9qXy4MBmsQ4sDFnhN7qsW/VyeDOv1ctdB1KAs9HbqkZ7qC
	 EXUGatJ7OnDSik+/ddiNxxBmhty5rsHzhb5Fs7pVivhUbbZLut31x32qYWaFQNkrOP
	 HAnY+J8jEnNzCaiMY1PjvHJ6qrw+F7wQP56eVz/Y6pU/N+CWxWUarvt5hLU49rfO6a
	 SfJJpuYMRJk2JPb87TlxDPuRkqkCSPacMQCKZ9+h7NLOHkr10sH3kgl275/SPGRhfg
	 MnT2hpv3+kNw9SUCsiUCbKsbEdN6cInN8lVQLVfov4sAJPV7U3/44Hl1rxPoNUNi7l
	 fLvru7aB61soQ==
Date: Fri, 25 Apr 2025 19:01:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity
 1200 MT6893
Message-ID: <xbskx5w4f7nxtsugmnp26hpm5bneo7cheurvf6wfpfdrt6rxqw@4524hwf5w4gy>
References: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_100134_879615_0D739328 
X-CRM114-Status: UNSURE (   8.05  )
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

Hi Angelo,

On Wed, Apr 16, 2025 at 02:03:03PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Dimensity 1200 (MT6893) SoC; this
> chip's multiple I2C controller instances are fully compatible
> with the ones found in the MT8192 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

merged to i2c/i2c-host.

Thanks,
Andi

