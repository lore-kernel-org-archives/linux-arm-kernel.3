Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998A6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rg3RSVUuutX3ek0OiWxu70t1PM8djC1NeXVcAH0ru+g=; b=bl6Z8AX5eLitMxNtDUmagcGBKB
	MXzrFbq5GPb3YyfD68ZuFOcehgxOOPZ2e0UDuDk6nxvFrUXV5s3rzLy2jYkTKu6mtdz7ybTv4tMZR
	rQ5t6k3OsGBl6iAxJB2bgJB2+j/KuuixDvQyOfR32F1XDavRHlAnpWtwcPlhLuncEhyAZC0mJFcbB
	QMV4zhKps9sBB3WTXDSrKjLyTyxrkwyTbAb36jzqkRLei6n7BLNV01qa1zP7Tgk17WeMEMX6JAthl
	MasIDeWR5kjlLDYAT7g93w8mhZwpWQTVV05drw+s6c2+Z5oJqA8ef7/jptudd8VHmxT0Sv7HfhX36
	QUeMAEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNu3-00000002KXL-3AVI;
	Tue, 19 May 2026 17:06:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNu1-00000002KWM-13oV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 17:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1ED244317;
	Tue, 19 May 2026 17:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17BEC2BCB3;
	Tue, 19 May 2026 17:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779210404;
	bh=Mi5fefcgSQTvi9ChCan9hgaXY1JdITu+bouW9m7d4bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyRlrMBO1sL+WYVfkjgioWKMXBDN59ziCG91KC2k00Snafz1CgyOKwE35FBwT9J5O
	 xhchP6fmchvZjLokeJewszskcJ2fyyPZstJXWt7PlRdHIOrGsGwN0qfX8SxS7hmmSc
	 HXYddniIHpZdyUs6dOMSSFKHq+PnHs1zHqjkM2owzjNYGddKSzLrN9ClF9vvz/e1Ge
	 kxWNN2uAXyTT+04uowQYnaaycsVNeslCXJWz+lZt60XjY6yTmqIJ0DCk6FNvPUlukO
	 II+qsgaM0WAiqC8sOpSoSH932L+UBlTMSBwWRkr+HIzrZlOn4hL2xl3tlsDYd48DaG
	 ToQ1G8V72Z5RA==
Date: Tue, 19 May 2026 22:36:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com,
	gehariprasath@ti.com
Subject: Re: [PATCH v6 00/19] dmaengine: ti: Add support for BCDMA v2 and
 PKTDMA v2
Message-ID: <agyYoLc1yJyI9eDn@vaman>
References: <20260428085202.1724548-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428085202.1724548-1-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_100645_309841_A392063D 
X-CRM114-Status: GOOD (  12.32  )
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

On 28-04-26, 14:21, Sai Sree Kartheek Adivi wrote:
> This series adds support for the BCDMA_V2 and PKTDMA_V2 which is
> introduced in AM62L.
> 
> The key differences between the existing DMA and DMA V2 are:
> - Absence of TISCI: Instead of configuring via TISCI calls, direct
>   register writes are required.
> - Autopair: There is no longer a need for PSIL pair and instead AUTOPAIR
>   bit needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to PEER
>   registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.

Please check the commments from Sashiko https://sashiko.dev/#/patchset/20260428085202.1724548-1-s-adivi%40ti.com

-- 
~Vinod

