Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF32F3D604
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4Ynn8vM79Dn9kOY8VnRnAyRtPmHa/7q6U0+qMWX9NI=; b=zhOYrJdQtw/KJCFuVUC8DtU245
	hZP3rGFm3svw5p1BFai9AeK/ELTpcvdfwzTyiQDr4i9Tk12Ifuw0UxTwAe97tEm3XVX2OZBtSJ+1u
	NgtnaA1C+0l3Rr7aeC01hT1ZpLNhEUmM7qcckU084mqZ5KwHvEWr7rgT27HISCiKWprLqWLSdjV2v
	QwFDvtk40ENXioHP00a9fzlO0kGNPZNEpmp/5d1bgYQ8k1K81nn/IwIOfFnuv+/wjsQvW0QOj77Hk
	B8vqyEipG0u1SaXnUMWhTbeFH4oV3YYvCwR/fNLky9/mJsevigj000mR0SlC9uSFN+L9D2qQPBTX+
	pu0n1rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6q6N-00000009ygW-16tW;
	Sun, 29 Mar 2026 13:22:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6q6M-00000009ygP-10td
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93923600AE;
	Sun, 29 Mar 2026 13:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E51C116C6;
	Sun, 29 Mar 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774790569;
	bh=BoDuH3kwc9HtdZAeOJWHQn5qzdnPMryGq5rPy9i2YGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PAtJFWNGvuUNWYYK67pOu1ueKBBJMkcJrDnhO9KdzSZrOZPP19aIdrhgTxnkopXnt
	 aUoLTmXKyCB4DVIRoh2eKKTfPoRSTgV/76YZc6KrVWXf5ayRwinbdgyofrmn5XgbQ8
	 Dh8rWeISDsMvnbREPqvnQzPyr8pq8XhjArloiRN0LmJEdlcbSG0/go0WQiDyPgEBfq
	 LZyn8tVx2WD41A6p+oprE5RwA2bTkQjMbBhXYhdhiHdgU9Q9jKVLW1tCgzoAD4Xj73
	 chBJZxCdRdYlkGnzs6LMfQwjaYSAZFUlxWACjHcfKp0UsyOYhKiBJVdCsaS4PG9TT/
	 bdoImMPace2Vw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA
 channels
Message-Id: <177479056775.84952.18274647332056749333.b4-ty@kernel.org>
Date: Sun, 29 Mar 2026 21:22:47 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Wed, 25 Mar 2026 00:19:28 +0800, Chen-Yu Tsai wrote:
> All the UARTs support DMA and are hooked up to the DMA controller.
> 
> Add the DMA channels for the UARTs
> 
> 

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
      commit: 1e80a0367bca7ffe3dfff41948474fe3c3ad3587
[2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
      commit: 2e4858d2f027080827c5fc557306a06fbfcecd0a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


