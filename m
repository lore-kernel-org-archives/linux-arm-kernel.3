Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F0FF512E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfBttNz1NvFY2dM1i3T9MslnHQbytk9v4vLwlXpZBJU=; b=Gq+wVFRpS+4a5ifORyGLaXyBHA
	D2SGctM/U3pLBisqeaoT5UJ9JRVieuqBHr9gYYtw8GSbMFNaArD/93wjhXp6QWLlvV5DqwCuCdWBJ
	tBw7biajMJ9VOWjDJyCiXRXP/6HJ1LHrvsXDsMvfM8yidNV1DgxdEhU0xMpK0+5PPVTJqORCoy1Ea
	rUY2hvIqSni1AkwPgzrl+CbCDdcLp9vWUX/iUO0baa0FTiS+J5nt4D9cehdmw1xUdgQx8hObna6UR
	XgSjkh60OrfHilMyAyKSkavuwn9eSbdNUDzfCxeyiVYTxmHV29GakC80mzaa8rY6CAf+wqssnhz7P
	9UOHsIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABMD-000000075Ir-3r2u;
	Tue, 07 Apr 2026 18:41:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABMB-000000075HI-1oZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 18:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A57BA43A7F;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA0BC116C6;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587257;
	bh=ctBJBNAL2sZVwDJhXMphkJ4Ne0SfUaEL20su6jHmPpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sI/mLUzrYB0p0h7F+qggqo+B7Iixi3QUIFCsUfYOUxnIZWiwOZgq7ZpCn339TFSkK
	 /Bh2Vxl6Ng5B8rBSa7tzwXMlVhRi7hjYXswf7R7EHaz2nIvV0fNuEvc/AbusGP/y5Z
	 9c3TZdbLIIDHjOYNTGyTt4Rx6zte92EOWG+3mssFLmsgbzu7+UhULF/innTCtcaPkX
	 OznSjTzMz2iwVcW5IICmamnUgnIMPjy87/mqyizz+/U7eoWymD5sbqpL8dMZBNbDYh
	 zFpClBRqO00vxOHRu2DZyvpCjlwNyxQWuLHoeEhS1p4r1EmCZeFwUri8Ixtmza/hrn
	 6NnjaEZ03aDRg==
Date: Tue, 7 Apr 2026 13:40:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ
 banks number
Message-ID: <177558725508.3367275.431498004414263153.robh@kernel.org>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327113006.3135663-3-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_114059_518974_FE05B451 
X-CRM114-Status: GOOD (  14.93  )
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


On Fri, 27 Mar 2026 11:30:05 +0000, Andre Przywara wrote:
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 11,
> to be able to assign the correct interrupt number for each bank.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


