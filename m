Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419CCCEB2CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh3ThtU0In/1NmkwGk0zE8aNY2It+42+Y4j6fcAopj8=; b=RFyftnWrOEMWyPpdeJddCAY9vo
	yZ5L7MBnTNuRNZx6AU9uYAsit5xffTBmv4RWV2xxOeL5+ZT7AFkmABc+XKUBPSLq6g/in7WQ8odm6
	0CDvtB5opeYufA2OeFICFmVRyNM3YJaHmHRrl+48ykDqPWUF9sU/wZtiC/zvVJi48KgfPdjWqnQTJ
	J1QVJSXWWRe+QKE7RURuLyr4uPdlNdbmxdW54bY+5OMK/PR+l1enyxoF+8fSNNQ1kd0oHO8836BZb
	x3cmGtG2zomzPVCzlFqeGNjoiHZnApGzC3DNd4PixSbYwgdUdC4hkFvGonwhy8GXpCCvpl0clbAzX
	XtFS+btQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKEqR-0000000DkeP-1uBn;
	Sat, 15 Nov 2025 11:53:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKEqO-0000000Dkdy-2jre
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 11:53:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3CB944147;
	Sat, 15 Nov 2025 11:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F69C113D0;
	Sat, 15 Nov 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763207606;
	bh=D3IZQ41ljbOFBJR+0W2Ew4JgT55JZ3FTpbKG4ou+aYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvrNxn6Qpy0xKwoi/njFVhX6Stcy5YSXfgVxKasMFqqTquUDSBb01L6MVWBgV5idE
	 2UME7pZsFhH8loRYLEgySoF512XrFF6o9PUzYMiDiATwXIQ/RsGoWWwtsvww+Tqczp
	 bjyOL0Ol5gTlZiyKqx6uZ+9AtFXFhajfpTTpPGOKsBhs184Wihi3isW/c+ciyssJ2p
	 S5qf9OdoRiXGrjyxwD8Pt5PiRVZUvqFsT6DuM3tVleeOMjRZ0gBHe6Oh3KdRxSMHuf
	 q68e2Ckb1vF/jkUTzFNYy9TshLiTAzTEvRMhkHcoRt244oyxkC+d0VzgM+XpQuLQPR
	 dJOm64VufQraA==
Date: Sat, 15 Nov 2025 12:53:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
Message-ID: <20251115-liberal-lori-of-youth-a9c3fd@kuoka>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
 <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_035328_736021_4F885E91 
X-CRM114-Status: GOOD (  16.52  )
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

On Fri, Nov 14, 2025 at 03:11:49PM +0100, Maud Spierings wrote:
> The compatibles should include the SoM compatible, this board is based
> on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
> the board compatible.
> 
> This is a breaking change, but it is early enough that it can be
> corrected without causing any issues.
> 
> Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 21b7168d61f5..8949a98acd87 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1105,7 +1105,6 @@ properties:
>                - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
> -              - gocontroll,moduline-display # GOcontroll Moduline Display controller
>                - prt,prt8ml             # Protonic PRT8ML
>                - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
>                - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
> @@ -1163,6 +1162,12 @@ properties:
>            - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
>            - const: fsl,imx8mp
>  
> +      - description: Ka-Ro TX8P-ML81 SoM based boards
> +        items:
> +          - const: gocontroll,moduline-display-106

You need old compatible here as well, you cannot drop it.

I don't understand why you need board revision - commit msg should
explain that.

> +          - const: karo,tx8p-ml81
> +          - const: fsl,imx8mp

Best regards,
Krzysztof


