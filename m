Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E4DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiMooCG5tE/fbsw3nbitcaDuFp2EYrGu8Ltb2Png0X0=; b=GB5EdJ+QOuI0qemLFSTUHk/m3w
	WgYPEyQ2Er/cpeIh572JKzWuO1aB2eodRzeLnkb0BsqHqanixh11FPJ48aFcPDbOW3Fd0wDZFnK8R
	3xYetN16WJZkD+ELLcq4HPuNtvVg9D4WX1kGZkwfexCCs7qnshBuvfswxKl5qx5z3zAUY3xvMxCwy
	W77/EJXsyxYqcI8fRyclCZfOwQd22DLRCtw3VciiqQ3M8xopj9c/oNmU2p2NeFdAG3qKhj+3FFkuX
	G0cJd2bQrR9hGO0wo4pHN/FsH/WOZByvxDtYMnJxGL2aFKRkdRfEKjSsjODHDtS0ydV7ghJRgP6SX
	I8BHaIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS8F-00000004lDP-1at1;
	Tue, 04 Mar 2025 13:16:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS5E-00000004kZQ-3Bid
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C5175C5753;
	Tue,  4 Mar 2025 13:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F921C4CEE5;
	Tue,  4 Mar 2025 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741093995;
	bh=fsADMD9lYuaMAbx3BxcPQB8mdRwc2qg5M7LaXTLNEIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwuXRMFdGMXNPXdwKt7wTcT8iGPI3teyjyZPw5JUrgaJIWLPRiE4vnvito3yH450J
	 sRHo6hrvgyNC6pRI/3HkSx3rXbI3C6AbTLAntHRvVfHe5AtnbqXgh5p3aiVBjVmPLZ
	 OVhSI3aqUaFODNa3BN82v4d9V3rmfVu5weIkNTyFssFebcp3n8SxNl9TDvIr856VGQ
	 8YEzCFm8qUh9EN2z0eZ+tovSXtxPZ4StMHPPS5C7SHeKIVvjlJYRuuxte5/dlGyybG
	 VBf7M3oLZjWbHsk0i9etptjzEdoFedY+SXk8rYonRtt8ObkRrttO+bnsPeP7RED+Dd
	 PHGkL14s5D5dQ==
Date: Tue, 4 Mar 2025 07:13:14 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Message-ID: <20250304131314.GA2441686-robh@kernel.org>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304093127.1954549-2-ping.bai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_051316_847475_74596B98 
X-CRM114-Status: GOOD (  13.89  )
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

On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
> Add interrupts-extended property for edma that has multiple interrupt
> controllers used.

Did you try using interrupts-extended? No. Because either is supported 
by the tools already.

> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - newly added entry
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index d54140f18d34..549afb8611a9 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -38,6 +38,10 @@ properties:
>      minItems: 1
>      maxItems: 64
>  
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 65

Doesn't match the size for interrupt-names:

> +
>    interrupt-names:
>      minItems: 1
>      maxItems: 64

