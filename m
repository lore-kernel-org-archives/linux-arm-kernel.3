Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D65C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJrv4KjLU3Q7fn65cZGazyKyep2/Q6pDWn9+rs6pi7I=; b=fZuNGivaR92gMbbUa40VtKUiWB
	gQtDL+TqtmGeUTWxh3LJsAdziEO/Ttpfh4Pi2iP7ihE5dMynQqgjalVeCR3FXfz6yCThNXclVGqve
	16cFI7BoFq4Gs0ZTiNQ53cjjkDd8Z2snKyJ6vdCU7FOQyfpltTPnI+YYt8t/I64jUq7zt2+F1m0aX
	hKQkhLUEvG0ZdNaLPuFNF0bcPgQKQIqFTt7btXgb30qAKtMHMZlDy+cRK9+5EoX3YwXtNF6/hOAJN
	znlYjZPDtTThK2Hsypjo1AyjpT/mJcsrUvAirhLRoUXaA+EQzLUECycGKWHs0eAOREvWSd5TjBpRZ
	OFwLUgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXc4v-00000007nF6-0SXJ;
	Tue, 14 Jan 2025 08:15:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXc3g-00000007n58-0QFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 08:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 977325C4237;
	Tue, 14 Jan 2025 08:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEBAC4CEDD;
	Tue, 14 Jan 2025 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736842435;
	bh=4ClXcc+yoIv8fGvL3au1hEk5msyMnUJUrObGjjguQyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vm5YCZZ3GcIBaHzz/mEOWIW+kNpnIeg8Uh4vSPeihqA5xYxDV45GbSMuPBIGwyLE/
	 aZWbY+yaeYsCgfCrV4HZehUiD/X4mBuFTAjBkAeRwG38b1gOq2FXWrZJDuAsqG/Dal
	 DFyeDWROKY9hGDcjLLKB2naxnNY6laUqXxCee9Tathv4TVXNTL/1+SWBTYlWj9BLf5
	 6WSCWAbfplB/NnxPK6GcYshPqtoYYKpHLBy6oTojCZ33WsUN24EDKUGoTpfqfZQ6el
	 Dl3Z2q79kT553ZzbNvhaojIPdWBeDqqcyniBma8AdDGxlbV93Q+3HIgLs+Zyrv8eq5
	 eWiC4Pxo0qIKg==
Date: Tue, 14 Jan 2025 09:13:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <v6bm2wnlsdbfvcvpo7p5azbe7rqrssjz6kehd2aex47mldot7k@45k622hphi7n>
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
 <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_001356_193423_B4D34CDF 
X-CRM114-Status: UNSURE (   8.91  )
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

On Mon, Jan 13, 2025 at 02:42:51PM +0100, Ahmad Fatoum wrote:
>  
> +  fsl,operating-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The operating mode of the SoC. This affects the maximum clock rates that
> +      can safely be configured by the clock controller.
> +    oneOf:
> +      - enum:

Just enum, no need for oneOf.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


