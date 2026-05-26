Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E54CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoEjUQJUKEZZer8pnQTtjiH7fT8Ky9khpbyt/znCLOU=; b=bs5O3e6hZgYUCj8nM6fkikTUCW
	6nBiL1VYBxxr1hvHG9xcPk1/MtHv2ezRefPeiTnu+SoxoLOf5a15qymhwluRHqpO8d766iKsOTttB
	Z0Tng8ebnm27KDjnlX7ndOqBmKSc622zCiVdcV3ZqSQopS9K8l3OJOwe6j+ZsgkCL0/glB6HqZeDJ
	3mn7VbjQoji3yyv7z1f0d7UiN6D6pp9FlWbx5H7pH7yBclyyhy940It0EveiqfdqtEfYVhMPSzf/h
	HIVwRGuF9ZBwEi+9hEI2SFUB/C1JBqCfpCaHEEVW7W3q88nJ8YDHjdwBHTwG7Li1UvdM29+0TsRq4
	AFPrJ/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuT9-00000002UUX-3Lek;
	Tue, 26 May 2026 16:17:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuT6-00000002UTh-3pU1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:17:26 +0000
Received: from killaraus.ideasonboard.com (unknown [146.0.28.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C3FD1176;
	Tue, 26 May 2026 18:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779812224;
	bh=B1fXvmrxn+xJ9dJrYlmoayWeTadZmztpSQlgKjR61xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mc3LCoEV01D+bMLgGQYxAEDMoYrGepDuJiX+BlMhJ2dqnEff7bVB3QpffALLttQCo
	 N3qLoojUVsJzoNvuPwBW+/xMAOmtljRiUiNuzEifLtsNAYhHHSHGV2eXFero9Yj9D2
	 BZtiPDyQCnZ+ZEkUeIcjwSDtX+7lPtbLfwPfXrMo=
Date: Tue, 26 May 2026 18:17:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v12 1/2] media: dt-bindings: nxp,imx8-isi: Drop
 fsl,blk-ctrl requirement for i.MX8ULP
Message-ID: <20260526161721.GF228394@killaraus.ideasonboard.com>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
 <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_091725_095387_2F759017 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Guoniu,

Thank you for the patch.

On Fri, Apr 24, 2026 at 02:49:50PM +0800, Guoniu Zhou wrote:
> The i.MX8ULP variant does not require the fsl,blk-ctrl property. Add
> fsl,imx8ulp-isi to the exception list alongside fsl,imx91-isi.
> 
> Fixes: 288517a3c6c9 ("dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v12:
> - New added in v12
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index b59c4ce30b8b..279c9cd3034a 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -117,7 +117,9 @@ allOf:
>          compatible:
>            not:
>              contains:
> -              const: fsl,imx91-isi
> +              enum:
> +                - fsl,imx8ulp-isi
> +                - fsl,imx91-isi
>      then:
>        required:
>          - fsl,blk-ctrl

-- 
Regards,

Laurent Pinchart

