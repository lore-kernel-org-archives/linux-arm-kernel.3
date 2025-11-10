Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F4ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 01:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N1Fln+ZzUmnuCG5GEKUY06rkBtDsxkkiB2b54jJez0=; b=kfQUorgXoR1UTJLwBBvX8N7Kki
	p6o8zJ/LwQNjPH2BnIUG4VXU1w+RB4XIMIrndoyCXsn0S7VZWgB63ItKW8QETK4hXoaiSPMc43smQ
	DbOZuSSnROF8wbxSb8HDqdNGq/hzXpdEdtkuH2w+YCXfSIpHQkSNkjKcAqCB4Gs7lJ6IYiXbG245k
	gxUIwDWBrU5c8aXzIXJS4UZqCqDqEu2FRfJeNk7cQnzySCBuUtIR2sqhS9TRJHt+307HdYZ1OfodU
	PGgPZkJyMZp3oll+EMpy3lckieHf6ynwk2n89+dch8hpwlosmtT93dmppIjQbsp/7l2W6TDMmdWEL
	WzItaRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGL9-00000004ZMR-2JZC;
	Mon, 10 Nov 2025 01:05:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGL8-00000004ZME-3ACj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 01:05:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCA7360053;
	Mon, 10 Nov 2025 01:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C90C19425;
	Mon, 10 Nov 2025 01:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762736701;
	bh=R+V0Hzfys57c/aQcKhl9q24jMrKAlHVuduRLA5/ZiLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0N9pJjZ/8zU6/P8tjKKBuajJf66vBAcxWFkn9koV7rQ5sKBvcmlApWCng0YiO9p5
	 AmWae1thEFPP86hhlLmPptwWeg37FqRJShgWPW7JijzH+bSEbLDQ9KUBXEwgI9CkrP
	 JVuSuXH7WGrmr+4fRQqBPt8d/vLR3RoE5PRALHLuB+BQxVQt+hMy6XLXHpgx0EniRG
	 6Dtg9nCSFrAJfRphcPKwqnA7P/2cJP8E7LpXE/6W7hqmKocGwbA2RMgeDhCYjIfRKz
	 kCaE+ySbbZ4Kp9wgNzs4kFaiCW2k9gre5jtNZw0/pa4/A5uuWwMI1mZil/I3KiUB74
	 SnhSxlO32qdOQ==
Date: Sun, 9 Nov 2025 19:04:59 -0600
From: Rob Herring <robh@kernel.org>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, marex@denx.de,
	Markus.Niebel@tq-group.com, y.moog@phytec.de,
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Message-ID: <20251110010459.GA2481668-robh@kernel.org>
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109214515.121742-1-rpimentel.silva@gmail.com>
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

On Sun, Nov 09, 2025 at 04:45:14PM -0500, Rogerio Pimentel wrote:
> Add device tree compatible string for the i.MX8MP FRDM board.
> 
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> ---
> 
> No changes in v4

Missing Conor's ack.

> 
> No changes in v3
> 
> No changes in v2
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 21b7168d61f5..f46cf6d1f502 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1099,6 +1099,7 @@ properties:
>                - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
>                - fsl,imx8mp-evk            # i.MX8MP EVK Board
>                - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
> +              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
>                - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
> -- 
> 2.25.1
> 

