Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3288ACA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhuW5HPQOXh55D64cGAdN1o8EdNe5zOV7bT3cbcEEwU=; b=3oONYSLtJe4a4ksppM/d+8H6e+
	+QKjld4ge97CllS10N3WQhSvVIwqCZ711ZzKXmqnqyZRSHagNTZkB1ldlMVHsPix85EGEFZRTkk2V
	9u1OxuAomHLWMIVW3mSjXym+dkBC1V/X6yZqciejVwcJmLfzBqnJvvR4UfoFCJuf0xn6t9gyKFaq1
	80ynQDzMM26FiLUNEGMPy/aPMorbaVAwZQLh3FKSthQUU/OGdgPXmvapUlYtBYpPVCDUntW/4OCIS
	XFZu22nbSxr3JoLaLKQukLemWExL//a9YWlMhacaoiAuboYMxADzanwKlrQT59U1B16RgOBzAtEng
	hv8yqixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0n97-0000000BSB5-15hm;
	Mon, 22 Sep 2025 20:28:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0n96-0000000BSAU-0iPc;
	Mon, 22 Sep 2025 20:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9342160243;
	Mon, 22 Sep 2025 20:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE159C4CEF0;
	Mon, 22 Sep 2025 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758572903;
	bh=Aa9Zejc4i8sog0iYwcjJT4xP56rN2qZlLPTRblqZAaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBSC9QF6pqsF2+zLfwkVCsjWpG9lrQ+2r7K9dhgeW/Oz+a66ouHDvYJQYo9UbYFNi
	 iC8Qr7RqS/KWNqi/S/JTu+eSHT4+jxF2wOnUlKKEeLt8LJ6TEH1URHf9aA9P/QDoMR
	 YQICxbkZtfWfFN1oLx4lvP7y6WJL5eqc+k50FcM/qYfhuizowaos2Tde2vS4CyVgCS
	 UDYY3HK2tC2lGyzBvaOSpXTn0IJ6wJtw/wapQUQ57f8fo9rln2M9AM/78zuWfTbEMT
	 /Td5RZCgDGe80DoZSETUywfRnsoPNnzMsk12XPPCmaEFHzo3ZD1cN55be1seiNTR1L
	 zwf4fNDHbF68Q==
Date: Mon, 22 Sep 2025 15:28:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 09/10] dt-bindings: arm: mediatek: Add MT6582 yarisxl
Message-ID: <175857289696.1276760.5254518096401967149.robh@kernel.org>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
 <20250920-mt6582-v1-9-b887720f577d@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-mt6582-v1-9-b887720f577d@protonmail.com>
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


On Sat, 20 Sep 2025 20:23:34 +0200, Cristian Cozzolino wrote:
> Add an entry for Alcatel Pop C7 (OT-7041D) smartphone board, named
> yarisxl, based on MT6582 SoC.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


