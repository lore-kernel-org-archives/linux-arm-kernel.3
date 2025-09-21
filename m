Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFFECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PTad7OMHIed/Tvkrk1FCHhngYVwqvmJrToxhsfWbqE=; b=RdtuBnm3few3TyBNEF4Y8Ntx4J
	7dvEZVxnDGGTK6HBRNrXvadVlJG0oqFsxhZbx6Jd2lASX3Ouwakixcik350vXjj//7GJv9CB/oWo1
	wDBofTkt+inCH1+rekK0Gf5gpFRPa83S8sRG9bu2xIvAegSt23adAjrXmwuV7z2AUJX+YEu2fNz/c
	F0bRv85QuXb+/n/Pcj2nI+sMWepL84MNX1wu5V+s37evAOYL4CQ/6myDxDux4oFA2z9LPnQl7bWf0
	fNVOEy/prGoJhcErlm8oTpNrrDlRITS40fi/pso9kNUN+neOtqTpNEcz9bjSz+mt1+H/nqfY4T6IC
	2rQOvqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0O67-00000007xLP-25hr;
	Sun, 21 Sep 2025 17:43:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0O67-00000007xLJ-0SrX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E12E9600AE;
	Sun, 21 Sep 2025 17:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C86C4CEE7;
	Sun, 21 Sep 2025 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758476616;
	bh=7PTad7OMHIed/Tvkrk1FCHhngYVwqvmJrToxhsfWbqE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ML5teVJgkR9ZPb42Dv74OpPB5L6BTBJ735F2Q4+5pK73DI4TCu2KGiK5naS4a4Gaf
	 pKsIk6x09XRUI2Agy9f0vXJ5dBf38+zsBIdcZAZ/OygthO5MSQIKOHMKj3Nre1JiCM
	 +HIatdkBQXPrH19hiWeuB1VC4FneQDe6LTLpvaQ3EQipFLjqRHj0KbeaBjMft3MPIV
	 dPpW8B0FeX8y+aMApr3OZtQfdPTGfg34yy7WaXXExhaHuwznZrBzxs1CpZNjY1HGRd
	 F+laUFCb9gKl4OIoqDvT1Z7P0SACMqFEOPbhbKUhvZh61Y2aiRpj2Bh1fPEzXhrupL
	 DRSgHTK0TPvsA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org> <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: samsung,s2mps11: add s2mpg10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Sun, 21 Sep 2025 10:43:34 -0700
Message-ID: <175847661488.4354.3014976375536307738@lazor>
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

Quoting Andr=C3=A9 Draszik (2025-07-30 02:31:34)
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Applied to clk-next

