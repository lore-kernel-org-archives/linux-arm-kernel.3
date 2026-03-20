Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315D1093192
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMl5w8vDs9O73w4bR1jK6rXratIbYs3HE/9japIDWUc=; b=0PMYkHw4AqhKPbxR9sG3+nDA60
	wl++YZIF8W0rr+eRHGjjr2nmFsVYobsyGXW4Uk6G4EhWdyRAuR4iOcFv6IPaCbUOSdCYWzOKQndMu
	jd0Pp0Zz7u4jYrGfBLbERgqQqlvbhVxJ/IBhPCbAW+waeGewYU4X0fOvTcX7Izbk8r5Y8apng0JYq
	jnUS1WZyQJDTiY7p1MXNSR2XbFgXNAea1wa1BENEKjO1Eu9u4A18X6395VjVhzZdbjvqpMubXnG2r
	yVwEAA4W8twwqnBhu4tvR5x1jNX8b+8jBOaS+AgtGSBxebz5O48nCkGBxCE51AHsDeIFWAGzxxqIf
	AhaS2B/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VvZ-0000000CRdE-16BP;
	Fri, 20 Mar 2026 09:13:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VvX-0000000CRcp-0jkb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7535540A80;
	Fri, 20 Mar 2026 09:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBB3C4CEF7;
	Fri, 20 Mar 2026 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998034;
	bh=tztxCWk/azlp9/3WAu9AIUNeDnzKJBRVMxT9Iapv/mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8CaJ8cz56Cn82Cp0dF240cxHxY0ifL+XnrllMgIfAUtfnIZ9FDm1CWa0kf6fjutm
	 NWTsdd8vEqKnwstWereLzRYx1SYxB768AXRync8tKLT5BC6IGEJnXIICFbdivoDyrd
	 +OPSkB/KkTO3HYFJWcfFEOLpiL5/rlTXcjZxt+0dQR3mYXX+H8kGEF3FEfjzM8IByb
	 9595AMSm6qR9XNTyumLe5x1HftBn64qy+VhRSBRUGdLCU1KoXIOh7ZYQJdqZYOcEb+
	 mfToFo/pemoKmGCdVoYJ/kpB/NxGvGFDL+bZ0tW0s31J3j37g2coQgPKtE+YcXzOXx
	 NchlYO+CKDq9Q==
Date: Fri, 20 Mar 2026 10:13:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: cix: add DT nodes for DMA
Message-ID: <20260320-attentive-turtle-of-perfection-c38ed3@quoll>
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-4-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260319101723.246539-4-jun.guo@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021355_229187_10149CA8 
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

On Thu, Mar 19, 2026 at 06:17:23PM +0800, Jun Guo wrote:
> Add the device tree node for the dma controller of the CIX SKY1 SoC.
> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> Link: https://lore.kernel.org/r/20251216123026.3519923-4-jun.guo@cixtech.com

How useful is this link? It points to exactly same code, so what does it
tell?

Drop all Links from your patches and read the docs how they are used.

Best regards,
Krzysztof


