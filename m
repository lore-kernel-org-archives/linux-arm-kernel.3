Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18FC106B504
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+63yE0jsNx6IKVNNW5DKonRp2PgYnoHL3h+p28yrSC8=; b=dq4XjsicSxT25VjF7fGCxPtn7N
	P3bo56a2Wk2Qlk/6qyL2YSr5Mn6pjcqnwyMcfxnjbbIZvuTjytZzFVwBobjJO1+qxi697rquvO8kS
	pKStFK8vDIAs/I/8d+klRvQAQ3xMDCgoM2d0WnlqJtlhthLaBGlaMCmC/RVNRNltXL/0hBJXo57vX
	zJBab+V3z1LPDEP7NMnGwQIUEfGp9MEtAnEbzL92mmfn7s8TE1ehhNqfQQR+nCuhG0YoLyadoDpZH
	5TBBCySeuq+FOiw1jGKt9FXaNpR8C1w+QABKxnAY01sN9q8wrtiuCkTdImBljWKEFu1gnQg0SnLrs
	ybg+445A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VR0-00000004Fb8-2gbl;
	Wed, 25 Mar 2026 21:06:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VQz-00000004Faq-1ja9;
	Wed, 25 Mar 2026 21:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6017760053;
	Wed, 25 Mar 2026 21:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D777EC4CEF7;
	Wed, 25 Mar 2026 21:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774472796;
	bh=EeIJxhoizL0VHrXFjuJlP/f+9rmJaR50OY4vHdMlwfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6SmtO8KL/h5db7q0w193Qa/XVr9Xpj0JoGt7cCKgxbkcjf5umxxhimQBcbhq2Ot9
	 c63j883PjdwCCLeUfd+Q1o5mS29QCsCYbWmOAp9lFKCNQEWs62JtUm/jrZziSkf0Eu
	 f+W/BMlTeL66FX/vtrxIUcAmQZjFUt0rcR22rU6AJW/tMiMUCaPEcpmhQ2wEtElwGa
	 /8QG9KCNoATgEYW0L0gPxL8qr/HZomFkBKHDz2v752E1yxfgLTaT5LLqoZ29S9Eyhh
	 C6/hG59ugrHWkys5FRFOLDJJLj7SejybMisJox93kt8LXfgklQXFXcRXxKi2Cfy8N7
	 2ifE6S3APHh0Q==
Date: Wed, 25 Mar 2026 16:06:34 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2:
 add rk3588 compatible
Message-ID: <20260325210634.GA3963190-robh@kernel.org>
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
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

On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> the RK3568.
> Introduce a list of compatible variants and add the RK3588 variant to
> it.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 4ac4a3b6f406..3d3b3cd78884 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -16,9 +16,13 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx93-mipi-csi2
> -      - rockchip,rk3568-mipi-csi2
> +    oneOf:
> +      - const: fsl,imx93-mipi-csi2
> +      - const: rockchip,rk3568-mipi-csi2

These 2 should be a single enum as they were before.

> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mipi-csi2
> +          - const: rockchip,rk3568-mipi-csi2
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.39.5
> 

