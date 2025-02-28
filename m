Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AC3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrt/FrlCcgc/f5r9Hfqe+W/5jTY3GSGqCfK3oDR06Uw=; b=MKFRNLMQiHOIq8Ow4hoCNQCHf2
	DZ5BrDtLETXPf9KNEiflfUerWjgrf/84eJsXm3biNqlJgrO1Zmxf0lB4aQvkc9aNJERhKPVDE7SDv
	u6enWgb0Tc94pI7pf/JHBzl+hjqh5SE5YBZ5yL7Ou43SQUBZREdX9E1hsDjgfq4dedaCvoepDBtn3
	RGLqwUrhiMfGPbcFiFF4QTSGdh1JGDBT006Txi1f9C/fgVc0ZsRatGNWZ7MBUB3ivVTKjQUZZk34j
	UiBSNn8V0qEbcvOyqPfwT5c9+TYSXWnR/cf9nOFukvSO15jbEWsQCD3ZhzKSHhs7MY2tvTEQ3IMdp
	Kpn+HaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Yz-0000000CGaR-0CuC;
	Fri, 28 Feb 2025 18:58:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Hn-0000000CC5d-3aEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26D7F5C6921;
	Fri, 28 Feb 2025 18:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857ABC4CED6;
	Fri, 28 Feb 2025 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740768034;
	bh=UN+C1dvi8NPDnm7e95Fw0RuFjAgd/7yIbPdqu6pQdes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlsyN0GduLxPitvaKl2R/lusE3nA7HIeKsZ5KfQ/NawT9RhyOuIgrEqTU9gJWbHxW
	 dUcQllQrSgJjWU3jH0drIt48Lq6O/m+kAnBI69Wzna91Xi2sPuL2IeQyBDadUYj2/2
	 YWxzrPMyRnhJP7DAsBA9wWBiqM5pSTzZgnzXLWbe+XcxTEfL9JOp1qmNyk1KuZ9H05
	 ims/Mdeqd9B5fTURzVBSQGjj4jMPTIC0yco3GwzhCtTRlu/sP0PX2SMp5iKrUIO6F/
	 ssSB8eIt6Fo8r8aqLF52N9EEONUcD86u3VzafS/3U7AuqkXJEZQfVowky8G1kjvWbU
	 eWf0j2Fea1Zvg==
Date: Fri, 28 Feb 2025 12:40:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: Add Arm DMA-350
Message-ID: <174076803222.3434143.1291834928584726380.robh@kernel.org>
References: <cover.1740762136.git.robin.murphy@arm.com>
 <2918c3b4403f78b89f46e32f7572eace9f50ab93.1740762136.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2918c3b4403f78b89f46e32f7572eace9f50ab93.1740762136.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_104035_945069_B4BD4FCF 
X-CRM114-Status: UNSURE (   9.09  )
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


On Fri, 28 Feb 2025 17:26:32 +0000, Robin Murphy wrote:
> Arm CoreLink DMA-350 is a pleasantly straightforward DMA controller
> which, although highly configurable, lends itself to a simple binding
> thanks to plenty of self-describing ID registers.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


