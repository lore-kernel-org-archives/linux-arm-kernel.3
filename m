Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD7D60CF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC5W63EVXbL3nFpbcC7MmYDZqzOQPctz3elXQ3wHYxQ=; b=J/ymn3WqQdcvlOb1KxTRB/nb9P
	G88Mfz3c8iD1TG55Nb/44w4LrDbbtc2ANmHfw1g2/pqiiH4y9NtYJup8/DCgYuHwGtxQc4OvmFeXU
	46FrDP3YuWsL7dCmpvUTYlpCVC071HrhnUDP8lW4ybdPjMevd0fw1rMqUcFPEBqWZM6Y4C+Z2Lp2V
	lwcp0+cDKa8XfGEzzA8h5ussjTtoM9P3TZyHGszi2LAS9WK2CESyjjDROddP1uQe27Bg0GWTk676e
	0hJ95oBeICgYSKdn8dw5gf/qZHH+BGYBqkJephVuyWsZwfdcjktzS0otEwkytqLM3wt0LWDL6qv4k
	3t6ZvWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAqj-0000000Apn2-2B0P;
	Mon, 18 Nov 2024 23:08:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDApn-0000000ApdO-1SfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 23:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 384B65C039E;
	Mon, 18 Nov 2024 23:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94574C4CECC;
	Mon, 18 Nov 2024 23:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731971226;
	bh=fh5vfCSCeb43TV7A2AsjLqNdJNOU6PnEihKyQ0nQZ/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEQ8vphvSV9M2xhI6pJFo+o1vvf60WfjuFvPo06MLXAoQWvNgLjQsZQv6s7hL7dG0
	 /iGDEI24WczNIPkOvUaTut/JsIddtlTRH5bZFKvAbo7rNNvIpNV7vGYzoDhxy24biS
	 8SdnWloKmuOQheu5jeJtBiYGiFGyS5YolagUrg6nULepY/zCecRROUIJHdC4IphWwZ
	 6j6y9G4fAr5d6FhpBiP2ZzY1rHIGF4QmpGCP0pTK+rjjUtctlcEfkh/IKg01pgJyfK
	 S07nUMpToQ+jdVF2fOF94bK/bCzj66k40aaLWWQNarkVYo+6573W4fpYOHaX6pq/Gj
	 68Sb9Cyti4UvA==
Date: Tue, 19 Nov 2024 00:07:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: i2c: mv64xxx: Add Allwinner A523
 compatible string
Message-ID: <vwwxve2juvplj7m6tvdmhmui32nrmjxslpxs26jyyb5r3mvspr@5xvvn5edr5bw>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150707_435337_FDE76651 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Andre,

On Mon, Nov 11, 2024 at 01:30:24AM +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner A523/T527 SoCs is
> compatible with the ones used in the other recent Allwinner SoCs.
> 
> Add the A523 specific compatible string to the list of existing names
> falling back to the allwinner,sun8i-v536-i2c string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Just this patch 5, pushed to i2c/i2c-host.

Thanks,
Andi

