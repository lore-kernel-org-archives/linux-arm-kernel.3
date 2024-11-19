Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D992D6C281
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhOz5ZgJsJXLep2/QaArx+bOSFWfYpjcDt7ubS08xow=; b=sZPHYyaEISeZrNawS1lmoyF2DF
	x1niSMlUYeBkLZfOt9/eq3i9Hy2lPdpQgdjeM0CWzj57/Akbvm65YsynL6F/YhTSbOj93KVyOhoeG
	DGG53BVS9ieuQ3dzbLPhvxs5+KbfXUqtEoNoGQ49dGlM/kaAYES9Hem+4kJZQPLtwUMlacpswaTku
	d53q39WpZkGNDMOtag2ebamYkQO1hxrUZ+wM2MVAjpekNiKhld5DRvFiNWiDhYGbdeC3I8tN+MXYn
	jzcLyBsmcEMWePPIjoSjUy5I/T5FZ0AS2BMqUJF1XmnfSO9H1tVCqFodoSBbm4auRyenrF0LxRdPC
	BbP6sdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSp3-0000000DMhK-1Dtr;
	Tue, 19 Nov 2024 18:19:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSo6-0000000DMVI-2jME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D17CA42DD0;
	Tue, 19 Nov 2024 18:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E83EC4CECF;
	Tue, 19 Nov 2024 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732040313;
	bh=Wo4rlPhE92EUOyHR0Tl4T39RGOZr5gNuIEk4zdKuEZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwmhcXO/6k1UcIam0xMjM1Bj2G4s8Y6JCdeSx+YAWiqCkcXJrcEc5cSgLkNR6gkI7
	 eeL//YJ4Is8fMMrnmo9FjX4Ok/juwuu6/WTdREYITGLr4P3DZNHrtjKZlh8jucI7nS
	 jxDwm7oTzxVUBrEKYbxH6zAGr/JxLAq2XR4Tae0tdpZ5hYQpkUNRKgNprRa8HJmngY
	 13LDCxnEadBe7ID+0QWW32zivGv2fo5XJwVuUr7d5CcXS1OgOzvx6zUjjepz/1ebVI
	 pLh5gdB2rDfbpAxOVDIgghZLrgHWzT/mrsDObonlwGmi9EhbPDRo4DAUDBAyR1SOzi
	 0BxaSD++w77WQ==
Date: Tue, 19 Nov 2024 12:18:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next 1/3] dt-bindings: net: add support for AST2700
Message-ID: <20241119181831.GA1962443-robh@kernel.org>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
 <20241118104735.3741749-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118104735.3741749-2-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_101834_757507_2B4F2239 
X-CRM114-Status: GOOD (  16.69  )
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

On Mon, Nov 18, 2024 at 06:47:33PM +0800, Jacky Chou wrote:
> The AST2700 is the 7th generation SoC from Aspeed.
> Add compatible support for AST2700 in yaml.

"Add compatible..." is obvious from the diff. Add something about why 
the diff is how it is. For example, it is not compatible with AST2600 
because...

> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> index d6ef468495c5..6dadca099875 100644
> --- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> @@ -19,7 +19,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: aspeed,ast2600-mdio
> +    enum:
> +      - aspeed,ast2600-mdio
> +      - aspeed,ast2700-mdio
>  
>    reg:
>      maxItems: 1
> -- 
> 2.25.1
> 

