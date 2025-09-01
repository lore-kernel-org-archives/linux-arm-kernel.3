Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21547CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSez17Rtm4X1yOoWBhpqLG2T8D025QZO2FrqcLRkLz8=; b=vRKftl6JO02q7COPskcZofX6FS
	xGRJ+Iw8idZfwe9YsTNcD+Wy52dwlOF7qHUVHkCL9PBC8BxzwcWWZr+sh+jE3t8iK3WMJRY+OQn3w
	aFIFEdJSTzW6rSX9IHv81Dl9r4CLavNwD0L2U3LSiI6fs1BXDkghPd8dPkNZms8uUpBNWqdxZ8Oj6
	YTDCK5Yjrv+r5G2ItYhr4gapjiLodJAnJhHSslusMZM3s/daUG/TqKCG36eBQ2IgBf+q40OlFGZFS
	8KGZ5YdGDwsXhbEvfC1in+V0cHyp8uEbXEOtQFeGaFYZrcYqadcEtsKwA6iHd8rD0d8zkHqbnoQ8j
	wSmSlHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHC-0000000EZzZ-1zHx;
	Tue, 02 Sep 2025 00:53:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC98-0000000DzQ4-2TjP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E1E34063D;
	Mon,  1 Sep 2025 21:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6264C4CEF0;
	Mon,  1 Sep 2025 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762382;
	bh=/mIouZW3eukRsCBlCEfrv5lA4/NnpjfEvBd3Y1zXg1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF3k2jGCGKtYMmpW+BfplhnUEjcgeJc/QBjueCTInMmnaYkLovRGpztSPG4hgXidS
	 2yoQrDwQwm4eQZp2ij4SqD0E6SmkeIDVodXsdL1sQt6JRRVq+PbrYfhbb2itW2eKPa
	 q7Jm8LgYNdo+sztySd7y8KAkLSpzZGEHWpK41eZSA2v18dNaAs8w72a+vB5OrLfkGO
	 ePi8tyfAfE9TrsN6Y1oG5jt6Y4modQi98ePJZwKstOJ8zrMAs/EW+J2pvQHT6HM/1M
	 QHwtQt75mB4t1ZXGDaQo4Xa0NLosXQxTZBmLRvICWEjgpBEKA7YVd4O6Le0PEXtwI3
	 UoWxCFEL8TVYA==
Date: Mon, 1 Sep 2025 16:33:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock
 ID for HSI0 block
Message-ID: <175676238020.380265.9436129584616218710.robh@kernel.org>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
 <20250831-usb-v2-1-00b9c0559733@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831-usb-v2-1-00b9c0559733@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_143302_646191_F4F22506 
X-CRM114-Status: GOOD (  10.90  )
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


On Sun, 31 Aug 2025 12:13:14 +0000, Denzeel Oliva wrote:
> Add the missing LHS_ACEL clock ID for the HSI0 block. This clock is
> required for proper USB operation, as without it, USB connections fail
> with errors like device descriptor read timeouts and address response
> issues.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  include/dt-bindings/clock/samsung,exynos990.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


