Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533C4C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxRJ9p1mlFYrQ6+yXbut89g3zV0RIhaqMuOAO1vovLM=; b=jli6q9SBnWaiZbRan1Fyjuesyz
	vLIGJyx92vjeV2upN5HYsnOogYswyeo7tTXnNTYgjPWOrsTV4UbbSBJtLMsJrzlDEeJl+Nef3bJOW
	IcKmn2k0DsgZ/hyB9txIZ4b8O3gtDaw4KklzC4ZUIOTHQbqROphnApgLVw7JfBGq1q3KpU0A+XogP
	qrV/Qk/+1jjeSHQLT3Oib6Z10elkXUinVUnSxU1GXpxAot8bf5vmzVQqVZccVIIJ6wM2aZlUkAI4C
	LJkqxg+Ig9sLHiaY2LmQ6W3UXqHPAPml9dYoHpaPKP551lBu7sdZWLiJh2tJRptP4SPIvP3Ewd1tf
	N23xtLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYfI-00000006bVh-24Is;
	Thu, 27 Feb 2025 07:50:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYcv-00000006agW-1z6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 07:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6DD75C3A54;
	Thu, 27 Feb 2025 07:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AA4C4CEDD;
	Thu, 27 Feb 2025 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740642492;
	bh=3hYVLitfg1qAcrjHx6qDFufWzXOiu0Ripju1RMLtR4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDmlBXMUlUCBgfDT40Vh9WUJ2lpVkLiPbhKDT/LtOLeZsCQ2XRCIAKEvHcvqUytPV
	 N0jrvy2OxtNVi6YaHfPtoGHN9rrAQyb1e54yTqA+uaMpfkz5HRROeMgWL1d4ygAvF0
	 un7MgXCKiTB1Zw8DH9n+5V5pKtVvAvi0rEkbN4m5wkBhZae2XGVf49nltcvdkidCJq
	 dICFV8ItGfly8F5j9wzrEQ22cej24JZfD3XEKNdv8fXVatvDXOqT4DX6oPJuXLF4v0
	 9GTGrTK2hZYIslM4q0imGxmLiBm2b1Yy438eE6ECD6MyoUujnWW7/pa+PVLUr4qU+Z
	 6JLhnE495nZQQ==
Date: Thu, 27 Feb 2025 08:48:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>, Stephen Boyd <sboyd@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Adam Ford <aford173@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: imx8mp: add axi clock
Message-ID: <20250227-ubiquitous-hopeful-beluga-effd3a@krzk-bin>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <20250226164513.33822-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226164513.33822-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_234813_553758_3F48CA15 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, Feb 26, 2025 at 11:45:10AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Some components of AUDIOMIX (i.e: DSP, OCRAM_A) are clocked by
> AUDIO_AXI_CLK_ROOT. Since the AUDIOMIX block control manages the clock
> gates for those components, include their root clock in the list of clocks
> consumed by the IP.
> 
> Fixes: 95a0aa7bb10e ("dt-bindings: clock: imx8mp: Add audiomix block control")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


