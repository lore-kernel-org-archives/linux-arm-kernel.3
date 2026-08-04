Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95151C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ANnNwuiKBF/aUFgJD9FvGP3u4zzcHHdF0EpQ0x5UgY=; b=gt8AYifCCzg8q/91sGFZsDJQmf
	GHDYdQe8M+NC8kpi3RJ8gx4VBYq5YAxc4/Ef/kfbcPjTxJyXRI1053p6A3MJMgihjRrijWzLR10Vp
	fgk0+wZm98q19pq3GGVaFR83yASxhR6oNt8+Hs2suo3bbEygtHgg6EAcUg8Od+ZOU2beH7wOWe7DW
	lqaRTOJIEUX30k7Xx7IymBXwWT7VwiX/BWCLKey5hVavMDVbB9Mclpg6YF94ngBRxsFZCdML8H0WK
	QIv7snVXNtirOy/nUatTji8gsY3XTEyNV2hZ/+tmtk/Y2iEzvryxA5yp08fRXOWqMTePh8ZlsQvgQ
	5DjD2q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAeV-00000001MFA-1RzJ;
	Tue, 04 Aug 2026 08:37:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAeT-00000001MF1-37Ia
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:37:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AF6F60A7E;
	Tue,  4 Aug 2026 08:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C519D1F000E9;
	Tue,  4 Aug 2026 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832652;
	bh=/ANnNwuiKBF/aUFgJD9FvGP3u4zzcHHdF0EpQ0x5UgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gtt2kBIhV3IyXP1DQGKF2N6rh6iIS22g9uuMsXVt7URhuA5T+0CpX2lrV5HuMDKqj
	 Yxxj/tLJVdPywodJfjSp89XLs0ftGK4dnDH6Jo+kxPhvuLt7Oa8tdIYb2OxQA37TLx
	 452MnF2bSu854nnBVJY40Gm7QEEEzku0u5DTVcqYR9qNElthY/bJPzMvCjjmwVR4Uh
	 03bWlh70gQUHJ2nUTSKzoLlbYEQcbEgAHYgR993YYJ3RZ1yM9dLQwUKKgZzn+K7HUr
	 m9zGQjx1o2O4lecj6dRSik2sVF9OjwbPakxv4+qWlrP3q7vYRntg7715QHX2mxWuBY
	 zp5pNnlza8byA==
Date: Tue, 4 Aug 2026 10:37:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	dinguyen@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: Add
 snps,pagepool-tx-buf-quirk
Message-ID: <20260804-proficient-competent-wyvern-30ec60@quoll>
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803070513.4657-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Mon, Aug 03, 2026 at 12:05:11AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Add a DT flag to enable use of page pool buffers instead of streaming
> skb buffers for transmit. This avoids IOMMU invalidate wait time on
> platforms where that cost is high, with the trade-off of copying data
> from the skb into dma-mapped page pool buffers.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28..73045511446f 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -545,6 +545,14 @@ properties:
>        Enables the TSO feature otherwise it will be managed by MAC HW capability
>        register.
>  
> +  snps,pagepool-tx-buf-quirk:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

> +      Enable use of page pool buffers instead of streaming buffers for transmit.
> +      This avoids IOMMU invalidate wait time on platforms where that cost is
> +      high, with the trade-off of copying data from the skb into dma-mapped

Best regards,
Krzysztof


