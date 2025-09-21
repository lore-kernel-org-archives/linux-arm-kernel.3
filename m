Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC1FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNCuIkFLlg7Zhk9/3GF9Znm4JqW+TxU/QNyqHxbMO2E=; b=aARq7nghu4vO9MASWVbdAN2qww
	Ws+4ZsenuyN3qoGwKIFcQbN+jsFMD3AqMcvWbE4VJBOtV7YWQzD69kOal6+mgjxGpiOqGwiS3OCaU
	NqUn4udz9O3KgcjwVPZkBGaE/OJGsoBwELorI+a1R1e/A+cE2BMsZ/7cjxUJmuWfJwZ3omwBAHGy3
	pVUSeco7OKgG9JveMxI52K2A3Sf/9vVges2CqiUQnLTERwVIUe49j2iEILBaG7OaW4lftnr09epi4
	XQpBN3K7svk3VaVfdn2WmnCpGzmfAEtattbabF6SsKdvP4NvO8rHPGXYl+VX7o+b35g/LRLiV4UF9
	0CZbP4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0O6T-00000007xQg-3Nm8;
	Sun, 21 Sep 2025 17:44:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0O6S-00000007xQK-1TLj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:44:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3AC1600AE;
	Sun, 21 Sep 2025 17:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2F7C4CEE7;
	Sun, 21 Sep 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758476639;
	bh=HNCuIkFLlg7Zhk9/3GF9Znm4JqW+TxU/QNyqHxbMO2E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gOEkMpRYvVlgcY4nNw9GoslJjP/3D6/qNd27SQs8TOiivwQSWwiSHBVChoKWHZEeP
	 axRjEkxhXreGBBNtWKHnSxzdGUUPVz/c+nEuHh0RJCCx4j5W5iga/lraC+RU/yTtRD
	 /vCoiGUOAtDBB3RcE1AJswrwL2Bixu1cfMGds5Q6/zJ4x/8wxXRkJ5w6QjVok+ctZb
	 6aQ7v5caRz/bAbN1TCkKTrMhWxM7J+8O7YcracYCcsIeufbsOs2YEmNFVO2FwVAbkr
	 prXKog3Ff3AP2vMl1u7iR0s94uoOHUk6SoQw8qxgPpnTrcDBwhsq7PHksGGOmsE4dg
	 keSXWTgboO5Cg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org> <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
Subject: Re: [PATCH v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Sun, 21 Sep 2025 10:43:58 -0700
Message-ID: <175847663814.4354.1879115669724877566@lazor>
User-Agent: alot/0.11
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

Quoting Andr=C3=A9 Draszik (2025-07-30 02:31:35)
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Applied to clk-next

