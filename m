Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4D5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55OhSfVdRnoqozwDNpIsZh+Xs6Y47EwzqxfCHs4QIFk=; b=ODgR6mrq3KttfMDZejpjF9+2ZN
	ZUjbadf1RV3CSXOSx/1Jd6Nu3YEIoyTDr9JW99AdqnH+ph9SSAINzg+9nzMYpyotpLu9nJtqgULKr
	IGqPGZAeMGtEe+sKDfe3n9thLP5lhU62AaqtbZYvH9cV4go13+p7QOXCYqJtNRyhKmjs+3/gyfArm
	FRLFHsyHjAwNNaz7cTVV2vx6i8isIYfFccXJzAk+QxveGPbIA715lWtVJ9v2Jfgce2WaE6c/bXn25
	Fq0cqayloqJE/w6JX60Xt9Y65xRh9bHqzF45Erot7u2X8hgWyx506/xqHe4jl6wYiXFhXzB74Ab+Q
	zNIphgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8jZ-0000000Cr06-3a62;
	Fri, 28 Feb 2025 22:21:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8i3-0000000CqqJ-1h2M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 22:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DE726115C;
	Fri, 28 Feb 2025 22:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2E6C4CED6;
	Fri, 28 Feb 2025 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740781194;
	bh=Is6EeypzsIr/GF6ox/TafGl7L+nMb7erAmt/bL5FM1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8y2kzuV8D87XwUZ2YJvDIXbHwWYckrI5sK8ggl9au6Qxm2XDhTSaG9J8IkqkcEnI
	 h1UycieE7vZL+YLs3Fz2sejd5HMdPjZfAojQ/NyCHI4Muow8bB6wM9kTWGZNfTReMO
	 Ts8T66ca5cNjzs4dnZ8snorkdwPytsSSEj/7klyt9X9bO+Kd7JxSGfwPxDPzU+yHvV
	 1qeJB178Xxub7nCmXQvz5FG/ETLZMhemUl/WI9NJwUcVRk54vTnnNuPCS5LwNY5Y5T
	 BoKd3E/l7MgcQl7nQFiehQBHSoIhtX/W+LDcTHadE1d8TIBtM7WRbDP8D9S6basBXq
	 JDXP8EA59ocQg==
Date: Fri, 28 Feb 2025 16:19:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: dma: fsl-edma: increase maxItems of
 interrupts and interrupt-names
Message-ID: <174078119105.3778835.11301085997308334922.robh@kernel.org>
References: <20250228-edma_err-v1-0-d1869fe4163e@nxp.com>
 <20250228-edma_err-v1-1-d1869fe4163e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-edma_err-v1-1-d1869fe4163e@nxp.com>
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


On Fri, 28 Feb 2025 12:42:03 -0500, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> The edma controller support optional error interrupt, so update interrupts
> and interrupt-names's maxItems.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


