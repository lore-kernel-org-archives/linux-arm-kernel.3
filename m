Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B612C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R644bVMJpbI5wr8azKmQH+phgfEYQY/Mpi+UsoV/eo0=; b=ix3FzJb5Pyra6I5OMS62opHKW8
	9fdCAZJbAjJZaUaV6wdzdiaw84h5d4T3IjGUz+kq+6x1bOmfpiedVLAKLdnd4DeqFgfPUM/61iU/8
	CPG6Li/xjOpe8m58K7uhRW36TBz1hddywsyCScQ6a57p3HbIRzHLkTgZ7HVuC3lJMKLLQWpx058oy
	mLAsqO2dfJTU0CxFTW8DfUuI2IjhhpRMpqygXlaxN0jxSHMwRgJxk8j/ozErZZ0j6beH8VUGE8dD+
	1+L/P9RBaBawdYpMy/+bmYV9vZgtZVbE4xGSIEndyOi67lPWjDOc3GsX6tFqMp8j3WzfebmyWwpFV
	iDiGu0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaki-0000000CT4e-05cH;
	Wed, 22 Jul 2026 17:29:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmakh-0000000CT4C-2cq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:29:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA6DA600AB;
	Wed, 22 Jul 2026 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E101F000E9;
	Wed, 22 Jul 2026 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741342;
	bh=R644bVMJpbI5wr8azKmQH+phgfEYQY/Mpi+UsoV/eo0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HenOrNzBlkGjNT2ZGgzTj9JkaN/Pg+ClQJYBrhh5tFYzSTNHJhzz9i2tElewFjnaM
	 VWIrU+KEoZDUzP93ZSRJwpFW9cXSX5UZCxPe1Z7uOjyLrDVrmeQNK3U7TMYxjM2r+g
	 TLRQBNeimdXHkmHgb5jS3RbnxaSYKV+xJ+/zuWM5nQh4tw3TxwDEc4hcGHiO52FM4r
	 vQ9x6eFir53ZzIfMOFPxYaiGCqx8MjGoYz65Baq/+URqcl2SWjc9NQ48EO01rV7mHg
	 liJw8iXTDYpIo3dpd1D65QjTDLmHYk0eoGbg/tigQCPj013DeYWDimv6AnVLUW0iKi
	 ba0ev+D7hXj+w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260720215128.5761-1-andre.przywara@arm.com>
References: <20260720215128.5761-1-andre.przywara@arm.com>
Subject: Re: [PATCH] ARM: dts: allwinner: a10: Fix PMU interrupt
Message-Id: <178474134045.3407214.16203991079219097416.b4-ty@kernel.org>
Date: Thu, 23 Jul 2026 01:29:00 +0800
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

On Mon, 20 Jul 2026 23:51:28 +0200, Andre Przywara wrote:
> The Performance Monitoring Unit of the Cortex-A8 cores in the Allwinner
> A10 SoC is connected to interrupt line 66, not 3. This is shown in the
> manual (where interrupt 3 is assigned to UART2, also in our .dtsi), but
> has also been confirmed by triggering an PMU overflow interrupt and
> inspecting the IRQ controller status registers (from U-Boot).
> Please note that "perf stat" does not use interrupts, this might explain
> why this evaded the initial testing.
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/1] ARM: dts: allwinner: a10: Fix PMU interrupt
      https://git.kernel.org/sunxi/linux/c/eb7051f75646

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


