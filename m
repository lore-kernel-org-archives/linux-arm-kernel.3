Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3490FCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEvFdXxmiBBOQnGv/bJzw1AJCNWoYVHX2U47VS0pVAo=; b=qoPQE4k7P6oQ51ZesyliHC4UwQ
	dAwUXGFq9DgYKO2/oSwaDucX6Rm3t9Q8sunrl/VGer9ZXA+1ajtxbfRKz9pCK6cZxTVUxE7a4RG69
	g1eWZa/PJDQZsXVpvcyFI66M8sLCSEIB8z9Py+4AbW3W1BlEiUtA/mO/U6Czr+LqMW/xL6lBD+9az
	Emw4QOZK0KNntdSauIeyT/neFSyEAd0spRVlohh3E3N6/d1YsE5v0G7ckdM8LdAkDEiyrAjkTJhtk
	2QK17XD9qJK7LWIPycMdMhf9IvbBHPv/yi1tm/KApmebWmqNxAbWyraQbWEBBUrdid/PoSNn/5gpS
	pUMBzSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTWj-00000002r7K-3yb1;
	Tue, 29 Sep 2026 08:49:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTWT-00000002qwD-25Fx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:49:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BDE060210;
	Tue, 29 Sep 2026 08:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E111F000FF;
	Tue, 29 Sep 2026 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671752;
	bh=OEvFdXxmiBBOQnGv/bJzw1AJCNWoYVHX2U47VS0pVAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uotl77A9faR8cxDMalABDPuVUSxa4nXqz5VdvUeq20CLbJ6gGG3pajwP7UASCNfrf
	 xM9yiJAlYiyQUcexXENjt/0nvf8XPlnxKN13hqYHJnmuEkayhJKIrmwJDw1JR9z1mM
	 lzM5yVL5mfQym4eZUUv0D0SQvzlzlIKNFEX2/P/X3uvtn4rkXqyeWOQK6OF2FpCTWe
	 Tg1xmnoYoFwvC6UttwThBW5xtSB98hkzDIzyGNLz+NxN11CletfA46GN5nhLLTl3GV
	 uQgOZ2d/BWw92s0irFQcLG7E1KkSc0nmPIcSEOCjz2d2pgj0deVjGR0p4FVmcg+MFa
	 NRLIBLFJsmg5g==
Date: Tue, 29 Sep 2026 10:49:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>, 
	Josua Mayer <josua@solid-run.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <20260929-logical-fanatic-quail-2ff20b@quoll>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
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

On Sun, Sep 27, 2026 at 02:46:16PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Document the existing VAR-SOM-6UL Concerto compatibles and the new

Which are existing? Don't mix up different issues.

> VAR-SOM-6UL and DART-6UL board variants based on i.MX6UL, i.MX6ULL
> and i.MX6ULZ.
> 
> Add specific compatibles for the storage, wireless, audio and
> carrier combinations while retaining the legacy Concerto strings.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  .../devicetree/bindings/arm/fsl.yaml          | 148 ++++++++++++++++--
>  1 file changed, 138 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 36e28e0e4ad9..726d563d1482 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -688,11 +688,51 @@ properties:
>            - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
>            - const: fsl,imx6ul
>  
> -      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
> -        items:
> -          - const: variscite,mx6ulconcerto
> -          - const: variscite,var-som-imx6ul
> -          - const: fsl,imx6ul
> +      - description: i.MX6UL Variscite VAR-SOM-6UL and DART-6UL Boards
> +        oneOf:

Please do not introduce own style.

> +          - items:
> +              - enum:
> +                  - variscite,mx6ulconcerto
> +                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto-board

"board" is redundant

Also, look at other examples here, like Toradex. The actual variant
should be the last.

Best regards,
Krzysztof


