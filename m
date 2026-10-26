Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMzg9l7r;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yg/cljWl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2H4QnyiBP1iPdtWwbpaQFD/CMUA6gFsOOMxlY9gaFc=; b=wMzg9l7r7Xxv7hNDhR0kBWH1BZ
	cwK6g+68qnj2pvQv8YzR6grCiemOJRDLKZ2F7V5DQG0SGGHGz6g7xgkcMDpAGudsoSMUQZJqC5a32
	bdaufS/V+h9D6HE+XJ5uHE29EsA7Seo4ed2Moq4RfUdPJ90yckQAJ+JcW75ywe4dYChrO7sRsYZfF
	o99X+hycUziF2QZ+sAVE+B5M4rEZO3ou6fp47XbsqwyP4nuLVT2DjxAkyCP44V3kq6ptqeAfQyQ9S
	rG6ktOkDbsp8UEUkj9PlnBfCYBau5eEX586acNFfDQLLl4yhAcJIxIytlkoo0tRz1ZJ5jNuFw+3Na
	DJRk72MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFq4-00000001vrB-0qDc;
	Mon, 26 Oct 2026 08:13:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFq2-00000001vr3-1nlA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:13:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B670601F9;
	Mon, 26 Oct 2026 08:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFEC1F01825;
	Mon, 26 Oct 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002429;
	bh=X2H4QnyiBP1iPdtWwbpaQFD/CMUA6gFsOOMxlY9gaFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yg/cljWlruKlO3PAR0wRkUDPKKBqJuUbWyvawAnpUlGrJdhNZOMymt1uk+twrU/R6
	 RLqOCLTN9VQtKJGzrz/GS8pcFzg3QljZuUADyW6ZMOpN8MCfDNtzkDsRTu+Q5Owc6i
	 xQCsAmhMbJ3UOUIl9S3BcdWooIj2bigZ+DWY+DzKaVvfIXsNYRTsdxrvwSZvFVzRyY
	 0volyFR3npJKtv+ESJOiY15LJ81XxNJoxpkvsM0JmFJIN73EBoyv4GjZS01Rd7d7TD
	 LMqnQHbrn/Z8wGfGbHb5BiWOI0IrEPp3W5Krl0Q7WZPguqH9J32wJ9MYQ/5LZqq6HA
	 xiDSIaa16EdJg==
Date: Mon, 26 Oct 2026 09:13:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, 
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: arm,dma-350: Document
 dma-channel-mask
Message-ID: <20261026-reasonable-durable-marmot-5f33e5@quoll>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-4-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023093045.3248630-4-Jelly.Jia@cixtech.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 05:30:43PM +0800, Jelly Jia wrote:
> Some DMA-350 integrations reserve channels for firmware or another
> processor. Allow the standard dma-channel-mask property so firmware can
> describe which channels Linux may use.
> 
> DMA-350 implements at most eight channels, so one 32-bit cell is enough;
> limit the property to a single cell.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


