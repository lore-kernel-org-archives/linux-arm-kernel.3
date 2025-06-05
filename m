Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19814C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfzmbYzUXTGaNo5IrDqiZiIUH2v9DhEzRmPouciIP/I=; b=y2s1KunTczElX8lRJ4RWFAYaZo
	vaK1M+xlc9loZpjn98PomDbVYMjcEiJgySgL3/wnMMGjqHbz1KkLFbT6OaKMbSfMARFm7JTu/JfGo
	eTVV1PjPDVIFvAJ8ByQYUC36K7FkchZOtdALAuCRAAM7mbj5QoR6i5apOY17CnZWeD8KA7ARh/3If
	wovGfJrCtUhAz1NWuZCGgES4vRbJdQXB4b23DUQbpQJo0kZbxHeO/tTQ0IOIiXyjSg8ltFze3hFYa
	IvfiuRhG4sx9wBUZEmRJyq1uPewpEZ8AMm77tr44erAsIScpR48njAJ5AbSBzf4+G/SJA/ECn0v/I
	knWNwPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBdg-0000000Fn2C-0OJG;
	Thu, 05 Jun 2025 14:32:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBad-0000000FmPz-2ETz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 14:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F338E5C57AD;
	Thu,  5 Jun 2025 14:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A88C4CEE7;
	Thu,  5 Jun 2025 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749133746;
	bh=SAK1eCG6q30aTdJmw9lTFOqLAVILbrbvQ+z1shYGO1I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nZe/8R3AcLEvnjMDtpcPxvHPl9htAqqxUfWnCfPeVtEALXURX+X1eClc/1kxSL/t3
	 NRjS70aAIVd1HT7OY8CQpCz7SUdsExAatXnNB7ZMw3AEljwwKzLP2WpTbFaOy/hxQ1
	 BzDi2pF+eiO8CV47eTDm5heAYVVTjA4+Eqrrrvffyfwgd5daxBP9lzUVEmbFDt1kKZ
	 6z2MlnTwVMPQUt7up3R2VKF8ru8O1rJZ7S1+l258aXwYlPkhSQioz/WAhYplUay7wC
	 m5ZXUn7HgxyqAP6DtwIuXblxH3uKBGPV8B2bUBcov9tqrHDOt6sZRpULu/60SYe8Gp
	 l2cKYrev88IWw==
Date: Thu, 05 Jun 2025 09:29:04 -0500
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.li@nxp.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 =?utf-8?q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, imx@lists.linux.dev, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 Gaurav Jain <gaurav.jain@nxp.com>, "David S . Miller" <davem@davemloft.net>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-crypto@vger.kernel.org
To: John Ernberg <john.ernberg@actia.se>
In-Reply-To: <20250605132754.1771368-4-john.ernberg@actia.se>
References: <20250605132754.1771368-1-john.ernberg@actia.se>
 <20250605132754.1771368-4-john.ernberg@actia.se>
Message-Id: <174913374447.2520926.5612887459467477896.robh@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_072907_651225_6C02A0A7 
X-CRM114-Status: GOOD (  13.36  )
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


On Thu, 05 Jun 2025 13:28:02 +0000, John Ernberg wrote:
> NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> resource management.
> 
> Add compatible strings for these SoCs (QXP and DXP gets to share as their
> only difference is a core-count, Q=Quad core and D=Dual core), and allow
> power-domains for them only. Keep the old restriction for others.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> v4:
>  - Reword commit message (Frank Li)
>  - Add explicit imx8qxp compatible (Frank Li)
>  - Move the job-ring constraints back to the job-ring section under an
>    'allOf:' to avoid the warning from v2 (Rob Herring)
> 
> v3:
>  - Fix warnings discovered by Rob Herring's bot
>  - Declare the compatibles correctly (Krzysztof Kozlowski)
> 
> v2:
>  - Adjust commit message (Frank Li)
>  - Only allow power-domains when compatible with imx8qm (Frank Li)
> ---
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 41 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml:115:17: [warning] wrong indentation: expected 18 but found 16 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250605132754.1771368-4-john.ernberg@actia.se

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


