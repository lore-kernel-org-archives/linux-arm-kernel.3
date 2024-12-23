Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC4AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obss0LAWOaERf0PuSJx7g7dC5dVtBZkqWnI8FFHI4y4=; b=3VknKcMByTBsFBdsr6y1GAY9NX
	hTxFOEiNIperbppi1+8uF0B9cC8mb+glPS4o5KvwNwlzz1vyYDPOPta+RsBf6QkpEVHBGD1pvcYg5
	OUp+yP6pspGKTJtCuYwd/pUU75yiJimAsVM6TJ7uwmMFjTA1GCck9qX1mRGjWqZy2MRLHUzd3N/xk
	hipOZlS7nrVU0wdAFOKJ/ZWTqDQ4Qp39ANF+m9h5dnbZ0KS777lAVMcxKv45bLvjLF6kQzvuYpgrJ
	aR+kdjWe0SoQBfvrqvEzRhZmzeunLfbz4spgAunnouXoGh9ulAfY95gdR443woNOz4vTE16P2UP+6
	NDX24yRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk3B-0000000AG3P-1Llz;
	Mon, 23 Dec 2024 15:08:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk19-0000000AFnF-2ChN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BCE55C5685;
	Mon, 23 Dec 2024 15:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FD8C4CED4;
	Mon, 23 Dec 2024 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966406;
	bh=gkto7QS9LdR/GtBNVxViKH+qvPII1SzIpBgCHoMbph0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDhfQCeq3nB0Ax3J8VoywUU9YTkgTAltQ5mzmjp+X6GheNrZIxObQUslcfQJi3YLF
	 YrhJzATvmcBHd4FTqS9NfcXfxGHlxrJ69Vl5VQrBlGrkot2bN2Ir+ZZZBcxaeXRoYf
	 AD1WJkR88TftMaycZuzngqFpuvWDCzoQLAWtAR9cz0Ew0wwcM2VkQw/0yniiN3E1rV
	 sCqnbPSP6qteqTNCamWf7RB9QZ0r75y8TDmZAWBU1fxIGzw2GhT2t7GyYui7YsXmAR
	 oaRfozW+g+4JC5wP1K5YH/6REV4b/z8GGMErHnJi2LAyOBn8oJA9gkPnC9lkVNptTH
	 WE+xqLNm1UOmw==
Date: Mon, 23 Dec 2024 16:06:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Message-ID: <ftlezlv6cjgtj7qigebbkqhfsdhrxbde7x7vnemvuag5cs74v3@ww3t3zgs7c7y>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-13-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-13-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_070647_608634_C0D6FCEE 
X-CRM114-Status: UNSURE (   9.08  )
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

On Sun, Dec 22, 2024 at 06:04:27PM +0100, Dario Binacchi wrote:
> Though adding the PLLs to clocks and clock-names properties will break
> the ABI, it is required to accurately describe the hardware. Indeed,
> the Clock Control Module (CCM) receives clocks from the PLLs and
> oscillators and generates clocks for on-chip peripherals.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v6:
> - New

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


