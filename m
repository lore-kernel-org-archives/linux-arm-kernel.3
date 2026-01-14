Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02994D3CC82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSOcdavoZFD3+9Io9+zkbQmRh6qWauZUx+7D4aAGCYM=; b=EHQjAtdM6NWY4tB1mMYJYjGGhA
	435JeuUYKL9NxZIo6GVx5+FT+x4zaLaJNNnKaLVNBDPhv7S5pBIJVZQfJYoRGyhx685dRuEchE6K9
	pStY9IQwUX7CW0chpuUkKtbAvtok+UoPRhq/wGA6MZJG7pc0GXuFS/iszTnfr3ZK0En36E/91m6bq
	vwc/gZLvq53FEN3EXan4p5dFW7dWcIReL+1lPCcsbqX/md/4eTounErzx2WRl6JRyCln6Fl9A0U0Q
	Mmzh68IB6b3PEJ02Oo2Ad88imbh95+JeEAio23hFlMk4PguM29DLBZ5HKrFY/dJaiamuAIQZ2BisO
	VU5fxyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8me-0000000Apjx-38an;
	Wed, 14 Jan 2026 21:52:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8mb-0000000Apj8-2xbt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1728437C2;
	Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B14CC4CEF7;
	Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768427524;
	bh=M1gJhCbLOU4I/BZFPxEOzvEA0Bnn9+kKwnxcwbbgbkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwWwxikyHO4uMF7uRfY8WsAKTfTOC5gGgvBeg80DGMtleeRKM40iWnh8pdsn4DKtp
	 q3Y+R51snbfadJlsqcQeacKH64t3GUoczhhBU38DtbP1sMw06HgZmdfHubYNXatH1f
	 Uj3y3WqXHdBr5rDXDrwOO6/BBE9pOxRD73krvnp661saWIQ3hjOh4GCHlOXMS1nLxV
	 AhBWXK1AHTENiCh5Usa0mwV6rXL6dAFEXxm4CxblQmzHW9SqxakDsS+IOsHhSFRFaF
	 PFUV/1ffmIP+0IHbpsi1UQ/iBwZbkUr5wD6CULCpPSQ/eFEiBcsJPSfEon0yr2gxHz
	 I1+eqycXqmEMA==
Date: Wed, 14 Jan 2026 15:52:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	devicetree@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA
 chaining properties
Message-ID: <176842752326.3259543.1333457446847101857.robh@kernel.org>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
 <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_135205_787075_D34ECD17 
X-CRM114-Status: GOOD (  10.46  )
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


On Tue, 06 Jan 2026 12:34:37 +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> Change in v2:
>   - correct typo (phandles -> phandle)
>   - remove explanation about generic binding sram.yaml
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


