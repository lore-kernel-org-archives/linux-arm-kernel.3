Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CDCC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 00:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uvymewojZryJCsLththt6b69bwDDih6ton1Gz+XXhM=; b=BuBb70Uh66d6zrI3DJ2kpc4c2V
	EkiSmERPVVYVjWdCdYXkV37spq9BxEmMB2KlIJ3hAGatOZz4sVtrjKUGWdbXq+APwdaYTpDnoW2B/
	jxBOz1imbxv3TXwRWkmFmcw1xqj6AiPKH9ZwBN/XJyQtSIm0l5bxvmltmvMUjrOGmmguIiGMudMgU
	Fhu+KtMp9yv+N9maVa1Vb3CLL5ZJ2gQt/XwCF3nDP9x9HeCuXC2GXQVC9rP8dHThhY7O0izB2Zo6P
	0Nja7IxweDnAgYpFQ2KZGye+uGMqU1zViESRVjigNyH6s/mwxebeUinzpX/34/8jHBbiX86ik5hf5
	rBIZ/y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguNc-0000000F3qK-3KBC;
	Sat, 17 Jan 2026 00:41:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguNa-0000000F3px-2ZUj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 00:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6uvymewojZryJCsLththt6b69bwDDih6ton1Gz+XXhM=; b=IVr8PxaPV0S8d/tCWJCIHIvCtL
	z4nImASU68m5coDgg52WNKzv2WpuM4+tjujlJ+4ucL0/fz1sHQHBFQOH4EYHfmBTDuSYk52ATY2MR
	MOFpt7YzNUGs/N2jWCfxHzBo9/6/zMCPkDkv+QnNOsUgPB7gfWn/S4JJbBKjH08zhDbs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vguNT-0038Gv-Gk; Sat, 17 Jan 2026 01:41:19 +0100
Date: Sat, 17 Jan 2026 01:41:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] spi: dt-bindings: xilinx: make interrupts optional
Message-ID: <0b4904fa-ae9f-44e0-96a8-f5f1ef57f36c@lunn.ch>
References: <20260116233535.260114-1-abdurrahman@nexthop.ai>
 <20260116233535.260114-3-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116233535.260114-3-abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_164126_653082_D0F28BB5 
X-CRM114-Status: GOOD (  15.06  )
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

On Fri, Jan 16, 2026 at 11:35:35PM +0000, Abdurrahman Hussain wrote:
> This makes the driver work on platforms where interrupts are either not
> provided or broken.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

To get a Reviewed-by: for this patch you will need to Cc:the device
tree Maintainers.

https://docs.kernel.org/devicetree/bindings/submitting-patches.html

This is also version 2 of the patch, so you should of marked this as v2.

https://docs.kernel.org/process/submitting-patches.html

> ---
>  Documentation/devicetree/bindings/spi/spi-xilinx.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
> index 4beb3af0416d..8296edde61b0 100644
> --- a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
> @@ -23,7 +23,7 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    maxItems: 1 # optional

I suspect the DT Maintainer won't link this comment. All properties
are optional unless they are listed in the required: section.

	Andrew

