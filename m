Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwrPwl6Oj1k3Cn3wvEkmF0MDOtCdNCt87UzV7tXM7uk=; b=qsjjUWjxRT6YCvl5PiAp6DdmSn
	BWpxDuPlNDt/+jLq/3ehSj3JIkW6LzsjtapOcSbWkp+d1fahoTu10A3yeZ6yY2DKK+VHWXy16lgAM
	UT5W+NkEitB70IF8ajHugQBiR3Nqyr1Ag1BYEVknCAs1yWg5hCZ8ShINOGRIis6JlxzeZyfYhDZPE
	8ewBHkg0Ca4Lq2c26BfMbj4ijE7yhhID1sbAunEjte3LfLbyNi3B/gTI/bYxWsAnv6LwQ5BjW94dT
	2mMAcCn7hWDiaqqYq4GkCbxgEGyHRIZyR3NNLxAD6j30p3Kh5aMZb1xWfthqUGkmUgfcDUgxI/zZ5
	WvM6aK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tir8V-0000000E8fk-2bDD;
	Fri, 14 Feb 2025 08:33:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir5R-0000000E82d-0c0P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2871DA41650;
	Fri, 14 Feb 2025 08:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0DFC4CED1;
	Fri, 14 Feb 2025 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521812;
	bh=9vpw9wqF0isVUCw/cCYZQrnEEAuV0YY5bi00g2AerzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gl8eQtgHTOlrpuTggu5UgcbLRTiadF/OLxB8aK6YmTElWRvYKxCWDNQabIQ6UBP3M
	 uMESjnjVa7CiPqqL5yRfEQLftzJ4wrHe0oMl10kLPpBDF5sW6r8sDWli5WR5yCuo7b
	 w/5cvnWhOtyCFTbfIlZWSGr0mzULCVaDLKaO1I3dyEx38V+MLNyBR/QfuU/shxvsg4
	 UMxvgCb08tbRUj2Rrx9EX5sYEP3mvrOlQ3VGS5A5t+UwrpR57NcLHsKGjtsWrQoqFz
	 aPUek39qgWeoX3kV0ddSogfiH3nO+mACpVe15CaMQgQ+aLjrRCQMGvAKkJWq++ZgDY
	 2SBhruRCgP7cA==
Date: Fri, 14 Feb 2025 09:30:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: clocks: atmel,at91rm9200-pmc: add
 missing compatibles
Message-ID: <20250214-helpful-modest-poodle-29fad1@krzk-bin>
References: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_003013_247906_C5B7064F 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 13, 2025 at 10:26:34AM +0100, Wolfram Sang wrote:
> The driver support more SoCs. Add the missing ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


