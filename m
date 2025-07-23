Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68496C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXXAEUdvNOqBWGTa7nBhJhU0MosdIdKLftOPFSZwZ8I=; b=OkwjJm0SaXzSPF3pBXcX8UBkMd
	XV+f5CP40muWrcEqfRgL/u+kFbTNAkrYS58k1whYbA3rIwxDerw3Rf+kofTvvGHcY9rt3jy5jt9A+
	gCyNa9M5+rJ9GqQyB26tLX0M7cseSXzAtHymrKkd1pTTxoA6cWlBsE+38DXhhDF7eDZSUKn2tX7JS
	RXAlikEnqg9UXt2CYqgM71jcpUc4j/MDDEBUzmRaVMVFL28VwaPZGwP3lJBSC8Wh0P6pjLXvnkcMZ
	K46raPrC3EXUrHRD2w2uvhT7vJfO4zpU0WYgm/XuEyLsOAdtwHKL9MHSbiaDwNRgDzApsWjlVzjQs
	XCXmNpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUIQ-00000004IZQ-3R9C;
	Wed, 23 Jul 2025 07:53:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU8J-00000004GqN-220g;
	Wed, 23 Jul 2025 07:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BBEF5C480F;
	Wed, 23 Jul 2025 07:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C630C4CEF4;
	Wed, 23 Jul 2025 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753256602;
	bh=PDQlgTK2hEukkn2nVLrwDLz5l5fS7ZJLaim0Bz1akh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqhPa9TlVJ7mzGdkyU5ifzQFCfywY/+v5unKHua3ht6MFkPDOuFVtS3H00jZtbdm7
	 UATjZK2F3vsjF82M1KudsAlNU8TIlbWsPxPizMu6xdurZWcbqTqUA4YJXOGTdzD2iZ
	 k1qAxcG+oti3ucJlL5J44zwAuvf+ls/kqGEd87OX8oD6JS+tluTpr5Bl9sD02wOMwr
	 mZHX7fQZ5mSqzk6mmn3qCRLqTSBE6akWkmz0mPYJYOQUxNjtxknpkjhYTxWwOP8Q29
	 xPDzajThmQFW+Ocw+jmG9tTyzv4GALQtDvVe3g6FvSd7K7qYY5wOHYOSS7sJpOBfMX
	 t299niR2HzypA==
Date: Wed, 23 Jul 2025 09:43:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm64: mediatek: add mt8395-evk-ufs
 board
Message-ID: <20250723-fancy-elegant-mastiff-1c65cc@kuoka>
References: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_004323_562031_8F7C3C58 
X-CRM114-Status: GOOD (  12.28  )
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

On Tue, Jul 22, 2025 at 04:58:08PM +0800, Macpaul Lin wrote:
> Add a compatible string for the MediaTek mt8395-evk-ufs board.
> This board is the origin Genio 1200 EVK already mounted two main storages,
> one is eMMC, and the other is UFS. The system automatically prioritizes
> between eMMC and UFS via BROM detection, so user could not use both storage
> types simultaneously. As a result, mt8395-evk-ufs must be treated as a
> separate board.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> Changes for v2:
>  - No change.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


