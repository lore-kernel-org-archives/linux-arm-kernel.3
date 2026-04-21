Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE39F327B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdDHjRyOkXPGfNekn30ZfIoxoPPv0IKTl3BrzS1mFlU=; b=lEc19UI1PBpdxdUSDllj7kaChQ
	q0XoI/1dJujAuZ3Ol/pL8tihX9x5QEy6y5lF289gc7sL7FmtToHdns/B7diNTdHDc6tX+kOWg95Ms
	imFdM5uRy5WC+O9iszJi/wpfkHUGunYbeEXKyvtC9apMXXce8cyqaDMp1glMRTUFSPkUpFo9JOS+H
	d2sFAWI4rMTINJwYfViGOUs60ZtRVucb04tg9o2pLSf+8ioqcVUvZAFcz2vzNyHq5C4NDyEBJJwk/
	BuRiSpr1MwnLZFJKmuoYO7bao2dYB3xRIWpWTarqMoJkln1L4d4RG3OIAYWxpCs3keSBAnP8RAPQg
	fQwG7Rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF639-00000008Dhm-1nl0;
	Tue, 21 Apr 2026 08:01:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF632-00000008DhH-3K0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 140E0443BE;
	Tue, 21 Apr 2026 08:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60075C2BCB0;
	Tue, 21 Apr 2026 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776758491;
	bh=Bh5LRx81nbqhJwYjgRVmUhWRtZK8Afq26DLHliNqUQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onxTJEfFcyepC+3QmTMGPLzrFKWFrQIHJhWvIUp0H6bL59wPSK7h8qqZJSdzr+TO4
	 Ttk1WlQ6WyS8AD+jnDTKypCv3WVoPNu+6uRJs0ficKNS9OGY1yec1zlMdN1iWk1del
	 x5kiJfIrBj638U7mXv5wPiYSmZyZ7pxHkBOii9cADCKB0qXo7GUt6dUPpBbxkhJMn+
	 KClavwfNMF8Fzuji9qwiPV6U+bpGsY2xuOYMl+mSq9udqwMS7TtFwvu5tuslnH9vdG
	 vYVwzxK2jSa4osaBoTrnbupnZ7LHMdgHN94OduGIwiola9lZe/cgDuKSZNT84C7JsL
	 VMwfmxHLFewMg==
Date: Tue, 21 Apr 2026 10:01:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
Message-ID: <20260421-attentive-cockle-of-finesse-e5bfb1@quoll>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_010132_873177_F33E2E23 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, Apr 16, 2026 at 01:31:38AM +0200, Marek Vasut wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

This might affect ABI, because you are basically requiring DTS to have
additional two clocks.  Probably it does not affect anyone, but
technically is an ABI change, so should be explained in commit msg WHY
you are doing it and what is the impact, instead of saying WHAT you did.

If there is going to be a new version, please fix it and please keep the
feedback for future commits.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


