Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B97D33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlGN/0+vFoLsYFatiqSvw4oQaHMdZl9X2oVOAIFRVZ4=; b=xd7I9+64BZwS60ZMkdG/MxKCS8
	HruwCnDR1fxhSpnWcWHj2+JHZtGcKATwwHECfv5t+pl/jKlVOKJX4/JiYnqUu8AxVFmN5KvKuu/Fz
	18v+1FcleCMV4OWwhUSRDMmtxwu24LE9jlMJEc7dcnCw/m9VoYsyFj3kScA1xB3EtYajjU8/MNw7m
	jEL8g6eCwa+YyCqPe9QZGxMjOo4we2IT+IQ0zcG7V7pouh+EzQio/agXM22LEMl2cf/VV/I2kyMU4
	eH8/fS0XEH09GwQX8/pT8o0frdURIlhzfrZ7dK6VptPkK2xzPvlBRcnkzTJkQx/NVm/n4KvdlZawv
	W53yFasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RqG-0000000BLJJ-33Pm;
	Mon, 28 Oct 2024 15:39:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RJX-0000000BFHU-3Kkv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDF915C0374;
	Mon, 28 Oct 2024 15:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91570C4CEC3;
	Mon, 28 Oct 2024 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730127950;
	bh=w2P/8ycnCHlajaF4QMUagcR3Ej160nBhPte8pHBd84Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONd+qB50vr1ew8g7rsXxyOjMM73ZIr2c1hX9o/Q+V4txnGtYdUnAeBE68uQUhojXy
	 pFUDehwU9m3iVAKEVdzcjPZq0VHMnL8HRQvmCSQjNesEE+zcpMVi7R5MmOdtBPNZTW
	 XWK/NxV3zaE69oyVa6q1mIjXDhrBuXxE22uSYDWeFUz722z9n1PQrUAyzNrliSuDd9
	 8GSO+s1e0dF1eqziJosvJiWsqUImCVZpDREoW2Ro5KZ3whi+YTWWlmNu/0YHkho42e
	 wJoQy0GLo1EQML2KKytz8YwjBEWUaVclSQS5sS04gF7AILCqyt0bHnDGvP04piW/+p
	 7glfqqAgUwhxg==
Date: Mon, 28 Oct 2024 15:05:45 +0000
From: Will Deacon <will@kernel.org>
To: huanglei814 <huanglei814@163.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, huanglei <huanglei@kylinos.cn>
Subject: Re: [PATCH] arm64/Kconfig: introduce GENERIC_ISA_DMA
Message-ID: <20241028150544.GA2445@willie-the-truck>
References: <20241025011641.4858-1-huanglei814@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025011641.4858-1-huanglei814@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080551_898597_D836859C 
X-CRM114-Status: GOOD (  14.99  )
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

On Fri, Oct 25, 2024 at 09:16:41AM +0800, huanglei814 wrote:
> From: huanglei <huanglei@kylinos.cn>
> 
> Enable GENERIC_ISA_DMA feature on arm64 platform,
> thus, request_dma and free_dma interface can be export.
> and driver modules can use the this interfaces on arm64
> platform.
> 
> Currently, many pcie parallel port drivers still use these
> interfaces when ported to arm64 platform.

Why has it taken so long for anybody to notice?

> Signed-off-by: huanglei <huanglei@kylinos.cn>
> ---
>  arch/arm64/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..986eb251f68f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -367,6 +367,9 @@ config GENERIC_CSUM
>  config GENERIC_CALIBRATE_DELAY
>  	def_bool y
>  
> +config GENERIC_ISA_DMA
> +	def_bool y
> +

Does this actually do anything without MAX_DMA_CHANNELS defined?

Will

