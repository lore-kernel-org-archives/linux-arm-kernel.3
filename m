Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03C7C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs4Fos6G4Lac0pmwn9hsltCdyR2yI1I/1l6/YH8nCK8=; b=2nbmbRSB9mPuE8fmDcDec0heZT
	NNPx4Xj82djzhOH/1k+tT9XNKUkWvnhBDj2Jc3BR/ercjZBfKsPxnYIqzv2fmKVGlZqFXVZypyl1o
	NRT52CkTPtoW/6vekjg/co6vx5145uTZj39uxakkzIxr+uk5s3vAxg0OY/zkhmDHrfY/BC6mxr6ff
	D6cfJVlA2Uwg0mVWLUW5F8M1EBseuJ0Tv4wd4BlHGStwkmzfIfp1uvXelv2IOxKym9zCKf6+oYW0M
	92Re6AAKn4jLAY+/CnDx2MZ+yvQ1e42Y6MJQbqb4R2j+SIV/ZIT0xYD9NIuycc9o03IIJO3lMP5IB
	glSMXR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLfE-00000007qNz-3cpg;
	Wed, 26 Mar 2025 07:59:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLcn-00000007q2W-1wST;
	Wed, 26 Mar 2025 07:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CA106112F;
	Wed, 26 Mar 2025 07:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90007C4CEE2;
	Wed, 26 Mar 2025 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742975792;
	bh=93M97Q5kVlONcYkIQD1oTLgBJrmsEdqoHZ4roV1qLOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atJQTBWaSaSbmkMwadDwCo4Hfkoqb5TImfMBBTK35qPENk6X8U/WCXyE/HKpiXmwG
	 o7g/Tfy6tsesiE5L2JKbHnB8Tw9tXZoFn9sLsPtgekTVx559DoTXQCVAFc6a35lLrp
	 4JfBdjXxmFSm0DiPAa+8woSlls3S6SutNrTv/GAQ+ngqtklHo9Via3liBfIehZyyNo
	 O0BXr1H29a26C9U9Cluz6PXekohLGCrRauJ37s92HgoeGwfhJC29yf50IxBuA6OEvE
	 pLB02aG1Eh7Uo5H2P4e2R8h+llNlXwi6+QuFINzBcY7pjB6k94B09v0DSqKdMX2y1g
	 0LLbw4peq9NKw==
Date: Wed, 26 Mar 2025 08:56:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Message-ID: <20250326-courageous-cobra-of-promise-2c839e@krzk-bin>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326063041.7126-2-crystal.guo@mediatek.com>
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

On Wed, Mar 26, 2025 at 02:30:31PM +0800, Crystal Guo wrote:
> A MediaTek DRAM controller interface to provide the current DDR
> data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  .../memory-controllers/mediatek,dramc.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

Where is the rest of the patchset in DT patchwork? Where is any
changelog? Cover letter? What changed here?

I receive dozen or hundreds of emails, so if you want to make
it difficult for me to review, I will just ignore the patch.

I mark it as changes requested.

Best regards,
Krzysztof


