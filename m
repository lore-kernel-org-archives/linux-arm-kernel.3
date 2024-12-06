Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2C9E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tyQRP3/Qkevdnd5xVHP7lzCOvoAgO/jM4Qf5/s5bwc=; b=okcFauwQVRAbF443d3nvSE67wY
	wXKSA1oHtelU1KRFwyQuuyf7gXLryG8CyFK8UL2XGhFzk11ySowU37EnC/J+AKMWeo0e4z8hECZ2N
	SErFpH5+ZRpBic15+x87B+Vwjmzt8En4HgZZZ3Nphd0ZKXTiCq4QyFfGrpuyScl/wmLaXiuOykLyr
	AiRwsD6sa5raSAIxEZFLRbhx9y4XoVixUCewhGeak+2GHbHB7gXZ1qF1qcPVxBcyhsL3SAL2hJQrI
	AsPKM38jbMsCouqbVkfMGoUFXXzwxaJPZE8OE5ZHB5v/fzKv9eDYtqsaN/syol+8ExFPVB9Wk2oRf
	rJgO62Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXtl-00000001eWQ-1o9l;
	Fri, 06 Dec 2024 12:57:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXsk-00000001e8b-3E6d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 12:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DD0A5C6796;
	Fri,  6 Dec 2024 12:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D9AC4CED1;
	Fri,  6 Dec 2024 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733489790;
	bh=CcvGwj3nX/cJL1PK353IPE4b9ZUoSfd2vgCJQVxEO60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWszWwZ+HkTEZCTr5MgjLWvfnHiAllNkXcFZAWTxxeoGEO8/pNdIiAUXZ4Surj0Ns
	 5eQopZu6arlr0rUCaCYGfuWVaPwMQ+NNMLo/DtH9opaUI66OMWxn7imQEKM/zYdeV7
	 gduhLq/UgTZU+VbmiV/Z0d3cXWfKk8RVdfuoisXRDyYFWiFjo9sdu35EsjLl+hf0fL
	 gdwwKtEXApQfv+f2nvV70UtDXoL72NGXyTW8oxAb50lK/tQLuSktRv197wqNSi5LDX
	 +b3dINQlpqtV7+kuh/s+7mRogj1tdMucOx1IKydrkM734Uf4C1Ucej9JGu9Zr/GaSb
	 +aQ0TWgPnJo+Q==
Date: Fri, 6 Dec 2024 13:56:26 +0100
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
Subject: Re: [PATCH v5 01/20] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Message-ID: <cnacul23vrat2vmoxmi626awgmodp5zvb7rf5pu2g6cwysmlzh@oqcopgp7tzlm>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205111939.1796244-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_045630_848865_1E94C99F 
X-CRM114-Status: GOOD (  10.57  )
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

On Thu, Dec 05, 2024 at 12:17:36PM +0100, Dario Binacchi wrote:
> Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
> name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
> definitions to be consistent with the RM and avoid misunderstandings.
> 
> The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
> backward compatibility of the patch.
> 
> No functional changes intended.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v5:
> - New

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


