Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B59CC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klzxBRfFaH2Orv00iYSc6JCYl253Y4N1ldcNWsa5AeI=; b=UUcmPpUk4V50K7LUrXOnXkLc/y
	zFnNrksLJ0eZLXcrmgmXqIfKE5hPJq1kw3rKjxJKh72dJ4Wt6x6UgyCDhX9BwJz98nsixeIgDENoI
	2XL2s5FnKZHKrEsp/l5fwHz2uWhoro50rUAuSwOhAc9/qlzqmEBIcUBJxKCNtnYx1hu43G6oTHU4U
	rgYBdmwBo+LzpadbiFor0vFXde1kwIfp6tfDmFP7XVtkgChhiWj0cNMXux4j2bGSSmZrMNC7/uNwu
	VB4H0qiRkrNkbTkzh8yMO3nuhQaAzTxXD1tjEpli7T3cH4hrDvZTFyS/pldp7wt8P3SaOHZuDXrXK
	pzVkoBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gQK-00000002knm-3QIC;
	Mon, 21 Sep 2026 15:59:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gQJ-00000002knJ-1uDE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83730601F0;
	Mon, 21 Sep 2026 15:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4D01F000FF;
	Mon, 21 Sep 2026 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006358;
	bh=klzxBRfFaH2Orv00iYSc6JCYl253Y4N1ldcNWsa5AeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JMW1VHxxbBR3oKgf5kY02ig/704uboevycy7KXHZVfPZrEIypMza35U66lQKFA39z
	 kZMjxZ1BE0PTrGXD8NI8kZyr2AT/h1U1n62si08YgQMRlfzQzswPdn3MPQ5t7Bv22x
	 wNw4ct0tYxKLxq12AD1iIXDh3N+T9yIYT1k9euye2JQDq7VY4d+gT5WULumwBwQlG8
	 ZJKvo3xx1AFvpDtduJ1CPHtrrSZHoyNCU6k4zSwjGVs+OAsC5pDQ9nGGs2mWOnxaJC
	 bc+zinY3TaWdKSyDi1GEfMAwVw5Hd1OOARigdX2easKgT/u+5PKO3e5N1MJyHVeIXV
	 unmwAYQpnOnqQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
Subject: Re: [PATCH 0/3] dts: allwinner: Add Teclast P80 tablet support
Message-Id: <179000635627.4032064.5273125584221459369.b4-ty@kernel.org>
Date: Mon, 21 Sep 2026 23:59:16 +0800
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

On Mon, 14 Sep 2026 23:01:12 +0200, Andre Przywara wrote:
> The Teclast P80 tablet is an entry-level tablet with an 8inch screen
> and an Allwinner A133 quad-A53 SoC. There are other tablets using
> the P80 name, this here is about the "G4" version from 2020.
> 
> Contains the typical triad of DT support patches: vendor prefix, machine
> compatible binding, board .dts file.
> 
> [...]

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[1/3] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
      https://git.kernel.org/sunxi/linux/c/cb81a22504f4
[2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
      https://git.kernel.org/sunxi/linux/c/87d5ec9b808f
[3/3] arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet
      https://git.kernel.org/sunxi/linux/c/60b064eb82e6

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


