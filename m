Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C94C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ywfDh8I8YVsJs0tRtE91fnf8md5NBH7EdsdYv+mR14=; b=DZrOWQtQaJUBzbpjrxdIR16B2u
	Edc91mi6m7fOpjQKRx6o6LWNWk6h1+BasTOJnqkPJNL3G0mUAjp0LW9M/v13Nnc4m5UuOrv3uDk0u
	KHHLbIIdhI1mR9PhHAG4h7962YfoClcLYePR/4xD8IN78U+SVRGX3sjph4lUcxhFfroHokUaFIlVs
	NfV8QRlJ3KEB5zRhWWY8cpeZlXqH2ijahb/Dcf2BfekldZMjmoBLaFD88ut7aLVtwtjiziVf1gY5B
	CKIjS73KTIDt8UEytluT8G/SkBObuX0mT+3cOkK7NigPuYeHqXa0yKVbtxaQwpxiOqnMNu7uvFNZ3
	6GNx/cQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFf9-00000006cZt-2i1e;
	Tue, 08 Jul 2025 21:15:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEWI-00000006S7w-1dj9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 20:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 950BBA542F9;
	Tue,  8 Jul 2025 20:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07804C4CEED;
	Tue,  8 Jul 2025 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752004945;
	bh=CwVILos/EFGVl/HPlWBYtRO23IjPE9Xo1PtpRcBZodM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOJePljD4+t0xDpG6/Nzl7obj7K68l/6m+/EBsX0vxIb+RhCGGQMv9edn+KtAeLJn
	 KjqyXFgo59givxvTHyc3iSF1J8p8HIU9izQyZLr2DRR0WnmnWPPSHyI1zHnnvuuFXN
	 qXKOPsy/qrQnozOjdp4bhfzhdUQQu4IGYN7QX4E8Mn58pnh2jbdD5l/QFgsRB3N1c8
	 6B9F/yHKc+uDM29CB0mhnZxMqzT92Ez94eKpXOZ1TYUdhCH1Y/M2qPYm9qlqlW+aXX
	 L1ZuXhYgQ4E012X/oKHsen6mqJdMf2VBE9n/iBvkVa3Jb9L/v0ABmqoseKW2XgTDSu
	 Aw2nLGOuXAHNw==
Date: Tue, 8 Jul 2025 15:02:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
	krzk+dt@kernel.org, dinguyen@kernel.org, devicetree@vger.kernel.org,
	mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org,
	andrew+netdev@lunn.ch, pabeni@redhat.com,
	alexandre.torgue@foss.st.com, edumazet@google.com,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	kuba@kernel.org
Subject: Re: [PATCH] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems
 to iommus
Message-ID: <175200494323.868123.7054361203778123218.robh@kernel.org>
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707154409.15527-1-matthew.gerlach@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_130226_492040_15533A37 
X-CRM114-Status: UNSURE (   9.43  )
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


On Mon, 07 Jul 2025 08:44:09 -0700, Matthew Gerlach wrote:
> Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
> implementation of the Synopsys DWMAC.
> 
> Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


