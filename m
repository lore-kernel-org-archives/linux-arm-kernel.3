Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44085D6C285
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsDjHGWgXn8+Qejkkkz91XL7Qc6C+S3k4I/UjMbsnvU=; b=efmuqFaZcnxpbxuJA80tHWHsnI
	E4XUtKP1F1sioU/zRvaz1ELyg6c4LUXLhpLc/kZE/uy19XLrLC4l6QUEC91wToZU/XkDK871UHkJR
	5/Ez2GwJ/gyKqvHzHw7vkXhagVjk9+FxZFZeCWmCIhsBE7bTdSpKo+8DSSWI/NJgcEVYNL6+whIXk
	4GOpzC++QVV3aXdTXj8IXb6r33F6aESqCHubX+hPSIJEEYOBnWNpwI6/3i1NokLknRR9Ci+OSzWMj
	+Oaty8NR03vo+90b1O1WjbOvF5T0nV3gs18H1Elfa1CRrt6F7g/LIipZmJQlmohus46y3fqLpoE42
	Mda8keQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSr9-0000000DMzq-01X7;
	Tue, 19 Nov 2024 18:21:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSqC-0000000DMro-3DJW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 515ADA42DC8;
	Tue, 19 Nov 2024 18:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE00C4CECF;
	Tue, 19 Nov 2024 18:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732040443;
	bh=c+7h9hMMGMohgWVCuK5JjLU4dDG65LxAL3SOLXCksaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVokfRufVjDiWMFrIV55YKvPnfOCikKXfcvMiewwhF33add4VLpqtW2Vw73JsSO6U
	 lG0gVdZtQPV2hEd++iZVLkGGH2ybiE8tTGlQLa3B0Cf5PXekrVqWM4e3HI3D0ISO8k
	 B5dNVHpg6C5CKEDtmFmKP19CRhwsCx4U4f63Q75/WUejr+WA5MrtUjxzotiK3IYDuR
	 EsaZGNjbNghgBAncGOvTEbS7vB0UtIRAN+LJ952CDPNaoLPxDsdEVgpPnyIs02NbL2
	 yZjidGgpE7dl5XTFe9VPst0RAyKogAIP3Xwp9Z00HQmes+vrFF2X6CyJRuxfTWgL7x
	 iBu44xmlHpqFw==
Date: Tue, 19 Nov 2024 12:20:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next 2/3] net: mdio: aspeed: Add support for AST2700
Message-ID: <20241119182041.GB1962443-robh@kernel.org>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
 <20241118104735.3741749-3-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118104735.3741749-3-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_102044_867301_65516B49 
X-CRM114-Status: GOOD (  17.25  )
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

On Mon, Nov 18, 2024 at 06:47:34PM +0800, Jacky Chou wrote:
> The Aspeed 7th generation SoC features three Aspeed MDIO.
> The design of AST2700 MDIO controller is the same as AST2600.
> Therefore, just add AST2700 compatible here.

If they are "the same", you don't need to add the compatible here. You 
still need to add it to the binding, but make ast2600 a fallback 
compatible.

> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/net/mdio/mdio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
> index e55be6dc9ae7..4d5a115baf85 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -188,6 +188,7 @@ static void aspeed_mdio_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id aspeed_mdio_of_match[] = {
>  	{ .compatible = "aspeed,ast2600-mdio", },
> +	{ .compatible = "aspeed,ast2700-mdio", },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_mdio_of_match);
> -- 
> 2.25.1
> 

