Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFB6D4114E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVUsZsVQIt/ffP+zwu1mU7qEzMMcOlNyGAOFNlMilfs=; b=FROVIaxDzcKn++4T5owXmFR/5b
	jsrMG1IcR84GLQ2DKZ+i9jXuKsZTLcdvUBKZgFBy7AZ3uA7Xt1nKOzOWOy8MlvT4wUbWC+A9GhQqL
	9p6veLBoh36WrGDRpTLCmemG9+MTAEIIvP1MxfCuzPekmNndpZ3B32Cd8CuztF8JJH5lW8p/tPgFn
	OFiCByF1asqREacmiRZcSHh0KeA32XBJdgW2NWoyR5J4riMPSaHruge9TtDO5pujQaDA/2yR1yWx7
	OrTbak70oG/aGIoXvQtgFVPrvUkXZp7L19doEcXdI8VNEJNfN01gc02UZBBm3ivfFYH3B/+PNK21u
	zNTwgE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJp9-0000000C5To-0kO5;
	Thu, 15 Jan 2026 09:39:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJp5-0000000C5TF-0CeE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A404241710;
	Thu, 15 Jan 2026 09:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E5CC116D0;
	Thu, 15 Jan 2026 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469962;
	bh=mBx+fIz49RnYEGumbLcy300xsMIP1MaxNQOI4ctMKv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXgAS7WSEZWb8uBcsXbcLyta62IWCfXW3oyaPnXnNkmhIvEXMuw+FHiacgJLyidLD
	 i8aFCvrAa2k9K5NEOFk+bo9pDbqf/fImM0gXkULtVq8F5MQhr932V9RL0AbVQqfQLX
	 FG6D7avy/PwL8K5/uE+rdG3pS8/L7F35LO7Slr9gIm1eRRdMaqhp/th6DtGTNPsvNI
	 vxCrBQhE/VgxzNmwEXG69XurVA8aw/69I7IIy3Ag9oZdiInkUwdbHzhqCFdBPVS8Zp
	 CMfw04vpjMTmvaBjv0JeOCwEGhVIhTpGtOPpXZuKdADo9R73iIQKXOdj2psSK3dixQ
	 tZLXjNUBs70rg==
Date: Thu, 15 Jan 2026 10:39:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: nxp,imx94-xspi: add nxp,imx952-xspi
Message-ID: <20260115-imaginary-banana-beaver-7b45ea@quoll>
References: <20260114-xspi-imx952-v1-0-acc60a5a2a9d@nxp.com>
 <20260114-xspi-imx952-v1-1-acc60a5a2a9d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-xspi-imx952-v1-1-acc60a5a2a9d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013923_271796_793114CF 
X-CRM114-Status: GOOD (  13.49  )
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

On Wed, Jan 14, 2026 at 02:49:45PM +0800, Haibo Chen wrote:
> Document i.MX952 XSPI compatible, which is derived from
> i.MX94 XSPI.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml b/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> index a0f4b162c85855c55d06c6ea1a2417af5121fab2..16a0598c6d033554ce5a42a13a3265315a16992e 100644
> --- a/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> @@ -15,6 +15,10 @@ properties:
>      oneOf:
>        - enum:
>            - nxp,imx94-xspi
> +      - items:
> +          - enum:
> +              - nxp,imx952-xspi
> +          - const: nxp,imx94-xspi

You never checked your DTS and broke all existing users. And existing
tools would clearly tell you that if you tried.

Use tools instead of reviewers. Reviewers time is more important, so if
you just disregard it I find it quite disrespectful.

Best regards,
Krzysztof


