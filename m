Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97405C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTS5yMF3/g3by9O1vl1AOe+Er8Ggn5p2ezKBZJ6R1CM=; b=oTx+f19jYxBO0Y7hngyRYgqTz5
	a0OPko21OWrl5FOTiflxQzlQcJrZj8eSwR4Qbcv7WnGpDARuksEIeDSldLHymIOFDhgNAVK+2DQv5
	4QXHHPEuSexaMPUPpevGttkPs7v3N69YFlkNjkHUe6ucgQZ9d0Zb/uZCfn29krsqGUkJHRGGgvy3h
	UuImRvihuxpZcXTAviRCVlExhcdhGwCGi6p1W/X9RPSwNVSoOaIjwBkxIA/fnTnRRndzqL8fDBkcH
	939FAU8CadU7WornQ59F8bOrRHyTdVDd6nJD118jfvrOkb6pMJy9pApOB65kAtdWVoSaWot7Mky6f
	9ToZ066w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBVw-00000008gyZ-3d4B;
	Mon, 02 Jun 2025 20:12:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB12-00000008Y0O-1cEu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF39D49FE3;
	Mon,  2 Jun 2025 19:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85840C4CEEB;
	Mon,  2 Jun 2025 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748893211;
	bh=n19CmSXpjhdn/QBHrUweXIEz9WZjEQcw/ITqIU41JCc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Nghj/WVW5m2fhZWInJI+AZsbrYk5aIR2uWEzRc11ACV2TBUEIW+FOPO1l8gozcMEM
	 lZg2kxu+rA3e+/MONvG4OT6DnehGlE//RyONxeOyR993MYZVl+rKF/HL5lAIkFz+U5
	 QrRXy1CA87oNqO8FNJsE/ePiwGFAOk/ak7d5EY2BF1AXIgFQrsHjpW11KUNGrGy/sy
	 acn8bdenYZy0tUR81sIuCUpB7z7YZzDpB8iFwOUBsJcTSAkfA11lvadCSAsHWloMHE
	 Py+ywir/pA2bct6UZn6ly7BjJFaGfyVb5XgjSfHVSrQzz1M2TLdnND+K39M7GshCEH
	 Qul7oYlg577aA==
Date: Mon, 02 Jun 2025 14:40:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mmc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 wahrenst@gmx.net, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250602150147.947883-1-Frank.Li@nxp.com>
References: <20250602150147.947883-1-Frank.Li@nxp.com>
Message-Id: <174889320959.2722772.656313710897661883.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: mmc: mxs-mmc: change ref to
 mmc-controller-common.yaml from mmc-controller.yaml
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_124012_450186_14CDC7FE 
X-CRM114-Status: GOOD (  13.91  )
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


On Mon, 02 Jun 2025 11:01:47 -0400, Frank Li wrote:
> Change ref to mmc-controller-common.yaml from mmc-controller.yaml because
> imx23/imx28 use dual mode controller (spi and mmc). So default dts node
> name use spi instead of mmc. The legacy reason, it use difference
> compatible string to distringuish work mode (spi / mmc).
> 
> Fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dtb: spi@80010000 (fsl,imx23-mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
> 
> Additional add clocks property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add clocks to required
> - fix typo legancy in commit message
> ---
>  Documentation/devicetree/bindings/mmc/mxs-mmc.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/mxs-mmc.example.dtb: mmc@80010000 (fsl,imx28-mmc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250602150147.947883-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


