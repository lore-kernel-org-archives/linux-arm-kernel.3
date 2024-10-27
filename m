Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6BAD13589
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbXnzwClL2JMg2Ycyyz93wJtgJH8m6Q3AYakCjKQa68=; b=k/ikGyXWJDW0g+0xTmC5dJQG2e
	Im1mxd+W9vu/kqyZnPCyd7Gn7YOp5OvNRgJLtOvJ/+LDvZeg4VNVr/IVE6YowCTQPrNiseeI5p+4Q
	NhgEC8u6vtKcep47+70f97sysvGc7S2GPuxg3NMS91nTFZRAJVAHDZftz09fao28+/XjULMj0q7E1
	TkmT5L2tQRvSQlsamXSLPeW53MrOMeurU60ZXRP5BoUUAt+U+2Q/BityhCIuQ8nTvJbzLF8nF7rV6
	r7dRLEOk513NTdXeSwbxNXJ0wzZo7ZB/AH3H7O9NGdxKFD9pj9BwpNueM7j9SpQJLGB8FVJAPbqms
	hD71l/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5B5v-00000008xww-3hFD;
	Sun, 27 Oct 2024 21:46:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5B4K-00000008xkt-3mqG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 21:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F6505C3CBE;
	Sun, 27 Oct 2024 21:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03F1C4CEC3;
	Sun, 27 Oct 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730065503;
	bh=fpgRds/230eeLCWo6ivzWCh6GpfyCQNYz3OOzSF1NfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A35g/3Bjfv2TPIBKnRQShXi6sCop4TH3vC58pAjfd4BVuVqlyOmkPndAb8lJCH2YK
	 VXkqsmvECFsjyjHQW8AUjjgfxNAYtXXhSPUmENfSujwaNiuHgHgwVc0Vl9cKhPn/Bs
	 ucDnkqTOnSI+BCdGTue1sZ9NfnqGceWvkaA7WKPfz6cfo0Ualcrk6+Zsack8csIfVO
	 F5bJnoRHUi5sRk7paGy+vAeXJLFNMW3FA3ATtEPFQlKjIZ60f1Y+C+lsPGnyc1T42Q
	 Ttr489FrBcyC9+TXl3kMjeqWckGBEJeC/e12e+CXOAKOvH8mRmAjvLofDH7yGjzTlb
	 q5qRB3f5hLmEA==
Date: Sun, 27 Oct 2024 16:45:02 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: soc: imx: fsl,imx-anatop: Add
 additional regulators
Message-ID: <20241027214502.GA121756-robh@kernel.org>
References: <20241025004159.1571782-1-festevam@gmail.com>
 <20241025004159.1571782-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025004159.1571782-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_144505_043166_BFBC715D 
X-CRM114-Status: GOOD (  14.91  )
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

On Thu, Oct 24, 2024 at 09:41:59PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX7 has the following anatop regulators: vdd1p0d and vdd1p2.
> 
> i.MX6SX has the following anatop regulators: vddpcie.
> 
> Add them to the allowed patternProperties.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> index ae708a658d52..f40c157908aa 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> @@ -44,7 +44,7 @@ properties:
>      $ref: /schemas/thermal/imx-thermal.yaml
>  
>  patternProperties:
> -  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
> +  "regulator-((1p1)|(2p5)|(3p0)|(vdd1p0d)|(vdd1p2)|(vddcore)|(vddpcie)|(vddpu)|(vddsoc))$":

Perhaps to shorten a bit: (vdd(1p0d|1p2|core|pcie|pu|soc))

Either way,

Acked-by: Rob Herring (Arm) <robh@kernel.org>

