Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCBFE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSXrG9xttNpPnTPixtXLrS+ulAo+g6huuvRwK/d+lac=; b=M9HeMv8iw+JnQRHPtpe7n3zvKQ
	A0Ny/OOuWQ7xLSal5rjMCZZlLdfndirMkpZNJX6O9VExITFWYkG1rZ2CT5E+Mxi/re82ldhBuZEVC
	/yE3mY/s/vYMcSFXjDAQKbY3oxHhPZq0cZFUAPEQmTZ/wCNsB8hpNsx2rxSa3POQ+zvJEb82fJ05u
	Y9jnTgU7cbQmYbRwC2T0asqjJNp52cdJZazgyTyIRwd+O0vqMVJNCa4qcUJ/0HlxWUW2FMXgmD4pu
	Ncm4Erc+vDOF0Lk4OVPsoogLy5e3wwN9N2TkF9aseKTR0rUuyPd+CahDUc7wRQTbJhxGKgavXFZf+
	fy+zehAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXL59-0000000CXUG-1v8G;
	Sun, 21 Dec 2025 15:10:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXL56-0000000CXTg-2Isq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 15:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32F6D40C11;
	Sun, 21 Dec 2025 15:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814F4C4CEFB;
	Sun, 21 Dec 2025 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766329848;
	bh=wqazjEUfhNgRi4xDXNm830yr+KxJQkTCkXxzr4Piqy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+U+PK0oznX66bMrSrirIwA2bNDNTWhEx3AjQ9eOpUwquC6fFMr9bLy0JXYII+aeB
	 zgDJJ59bjJpKg11XxsWaPmtBDDwXhkOQmGyURkJUxUhHuvaZEmd1rJ3wfbDY0sMU6G
	 5037UhP86ccwFU6hAqV9SKMPA1Y8kdxOcAL7SQhUVrknWrBgwDLsyJvv85s/3dM1k6
	 UP0WqDrhFMsoCqZZ2+vioKhy/rNz+cFeYW+mfaZoaVZP5SyPQB45mlGmHEG3hmSuWv
	 KSJ+BKuHJR+epfuZ5pokz798brKVABpph//Fx6wyarz67c1xunRE3bROBxdiUEccJp
	 ETXaEs8cFB2ug==
Date: Sun, 21 Dec 2025 16:10:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] spi: dt-bindings: sun6i: Add compatibles for A523's
 SPI controllers
Message-ID: <20251221-tunneling-intelligent-dogfish-d44a01@quoll>
References: <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251221110513.1850535-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_071048_606970_F14C68A7 
X-CRM114-Status: GOOD (  15.47  )
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

On Sun, Dec 21, 2025 at 07:05:08PM +0800, Chen-Yu Tsai wrote:
> The A523 has four SPI controllers. One of them supports MIPI DBI mode
> in addition to standard SPI.
> 
> Compared to older generations, this newer controller now has a combined
> counter for the RX FIFO ad buffer levels. In older generations, the
> RX buffer level was a separate bitfield in the FIFO status register.
> 
> In practice this difference is negligible. The buffer is mostly
> invisible to the implementation. If programmed I/O transfers are limited
> to the FIFO size, then the contents of the buffer seem to always be
> flushed over to the FIFO. For DMA, the DRQ trigger levels are only tied
> to the FIFO levels. In all other aspects, the controller is the same as
> the one in the R329.
> 
> Add new compatible strings for the new controllers.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


