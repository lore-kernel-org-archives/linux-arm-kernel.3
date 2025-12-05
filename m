Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB88DD2CE0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhWEInQ6nU2hvpQNaonR4w10+IkA3HE85uftR97Xs/A=; b=AJrr4fMHz/Cw6CiMQ5KjVMwRDX
	NRGsLcDJOMX3rkb924OPxzZIS2JE8xAoOqBd27vpARzFvHGmnsEEFpUYb78tRFpj+CnBHBqKR1NAG
	xZeURs7+TCzCI6jnKHcWK/YXJm+X/65EGLoMAHRGm3MyaFOOZH2ZWtiLbxTK5ZA3f6Ygs0jrPZRzM
	gBcHUIDsYWxhrXhUNiUbwrDw1ZssJypo4bz3b4y2bmmYm9LjWsfbFb/ijB9vB/7tQfbgrIoE2j2Yz
	bPBeSjqNFr8MOn53K12/8CVZ9qzKD+mrzgX0GxHeYWQwVep0BiyN6x3ckhJe+rhHtVNBKPcO9li7j
	AIlZkHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRhS-00000009Ffi-3Rzf;
	Fri, 05 Dec 2025 09:02:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRhP-00000009FfI-1sYk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEE8540719;
	Fri,  5 Dec 2025 09:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181ABC113D0;
	Fri,  5 Dec 2025 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764925318;
	bh=1tNBZQtY3oCs5M0ltVoHhKs1cSn4IkbJYPNY1Q0/F2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeHTx1nfGok3GKapofmisslKWGkE4kDJzlJ0mq9SxLuktKDWaEDCG55iGLELlQ1wQ
	 dIMb6XK1k8D207aPXt5gIZ29CEi1/RfrR3GE9v14U0Vf38j5D1Z0gEzL5Yj17b3zrk
	 H8FmaM9gmvOwMXrFxPwxL/hwGe6kyT0G2hQmKZnlSg69QC/WSQIhqbSmHm6/AnanQr
	 cLcm5iOf46dWdLMydLbaFIFYZWGy5eVIDjYHSIEYXwRJYIDt3IQc6S83L4uz++5kV+
	 yixtbdsm+bQ2z2651RZcOanIZpXIWjUJywRFVP2yA19B4gNpsAE7yb4JNNAW6HPpkJ
	 dSAJ6o1KB42og==
Date: Fri, 5 Dec 2025 10:01:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
Message-ID: <20251205-futuristic-hysterical-salamander-dce94c@quoll>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
 <20251201-disp_fix-v2-1-9b03026311b6@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201-disp_fix-v2-1-9b03026311b6@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_010159_988592_8D4A47E5 
X-CRM114-Status: GOOD (  14.32  )
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

On Mon, Dec 01, 2025 at 12:56:50PM +0100, Maud Spierings wrote:
> The compatibles should include the SoM compatible, this board is based
> on the Ka-Ro TX8P-ML81 SoM, so add it to allow using shared code in the
> bootloader which uses upstream Linux devicetrees as a base.
> 
> Also add the hardware revision to the board compatible to handle
> revision specific quirks in the bootloader/userspace.
> 
> This is a breaking change, but it is early enough that it can be
> corrected without causing any issues.
> 
> Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


