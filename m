Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B14BF45A19
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUDS6HvKu9wf9yKpVvnB4WxHU1/2fQtjnY8ZHTnUMbE=; b=vh3nNKgvv9Zv3YFm7xwLHf8nI0
	bFu763xSpGSWqKhgNlKk4ML2Vx1Rw09+VBe/Awc9S6Zv0wWfxihBWx7XLaqaUyJi8kmrb9H4uR+PD
	QiwghFEUm0exWD6xfFultSEf9vSVyKbSkoYgABBIDn5T2fxFfiEtAzgmeGjN9enwjIYW/AOO+rNPX
	p3x9jXXxPob4pQDkz0udoM8c8/YwwymV2tL5VVWR9XCpT3ASucCQlRlpOoalreuatIvufP5TPnCqK
	sU26/BvcBCHL6iXZg3Vqc/JUwlY1C4CFHefu3EgrdlrGKbsWoP7f2PnX9XXmSYtIEoUxfg+eQowPG
	DweDqm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTxA-0000000DHcq-35CP;
	Sat, 11 Apr 2026 08:44:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTx8-0000000DHcX-1TqB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C6141B2C;
	Sat, 11 Apr 2026 08:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55440C4CEF7;
	Sat, 11 Apr 2026 08:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897069;
	bh=RntnNLUVeODVikBI+yOez3GfbM1NukCg0uXVTU/wpAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ev5bn4GRcJhvmrmPqreMk3g82DW5zQky9oGjim7Qz+7WNffQQSC/cxc3/qsYWE2gK
	 nX3dPkPLySBY13x0hJdFq9Jmf0gbRSnUW80kXyGlV1XtFBhWeVKvznQnH2nyuX55Zh
	 A221pmjk40FrnzL27EKvqBffsgK74qfUwGY/1OLOaI8PNEaUKP19ZMUtW7KeBuXsJa
	 CKjoWGYv2lTalIeKMYxK2BhllF++PLw7T/hCbA4iWtDyocUTRxpkjgU22jAW7rpnwG
	 f6OG7ii/CRIDHy1GqM5TnBKbh2HfQRK2GbmI7QbO4oXZswDXlqW6P/IY+QbwbbzBm0
	 u1Nx09cpUEq9g==
Date: Sat, 11 Apr 2026 10:44:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 7.1 - Part 2
Message-ID: <20260411-abiding-porcupine-of-feminism-d0c5c2@quoll>
References: <adPIgTlQxnVpYgH4@home.wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adPIgTlQxnVpYgH4@home.wens.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_014430_411028_4C2F5405 
X-CRM114-Status: UNSURE (   9.57  )
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

On Mon, Apr 06, 2026 at 10:51:45PM +0800, Chen-Yu Tsai wrote:
> The following changes since commit b912e48bee355b6b1faf86efc4a23191324ffecb:
> 
>   arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support (2026-03-14 15:27:04 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.1-2
> 
> for you to fetch changes up to c755e39836ec492b0bc210fd96c2b720b5b4a690:
> 
>   arm64: dts: allwinner: enable h616 timer support (2026-03-29 21:20:49 +0800)
> 
> ----------------------------------------------------------------
> Allwinner Device Tree Changes for 7.1 - Part 2
> 
> UART DMA channels added for A64 and H6. Standard resolution MMIO timer added
> for H616. This timer can be used as a broadcast timer for wakeup from idle
> states.
> 

Thanks, applied

Best regards,
Krzysztof


