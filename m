Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE12CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMTwWo2tpRt6tDLmvE1xF9OpcaykN/9Fdm0DYL6pKLw=; b=Jmpzp+YvVyzzGOYx3ReFdheKuj
	ALi2O1QhH5dviNCKosERHxKxAzCc9v6WkB7G1LlC33khYbzD9l1CRcUBFySuX1EmYdrDHjlN070Zj
	KAaQIiwkYmd5KYhq6m9ToM9AKXvHd5YEAnLnTBNLysqX6JMtuQTRwWtLU5JDqvvpqWUXaqa8Sqbwc
	U6Cl8ry19QczXV1Bsj6ejlnnxI/3F8tJoUHZ3wxJurEGfOIDchtrGMCRd+wt8xiJn8yORzsJxblEj
	IJ2rG7NjFl9KCsipaBQXo4CafVR9sCwJ4dN4b0Mz4cp0llAeAdVxz+xezN6+PEEFnN0ntc6daEzMS
	qQnki6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7OI-00000008icO-2AKg;
	Mon, 18 Aug 2025 21:27:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6Pd-00000008cU8-3D2C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B22D601FF;
	Mon, 18 Aug 2025 20:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8369DC4CEEB;
	Mon, 18 Aug 2025 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755548700;
	bh=DWORNPSoaH+MkjUCn75Qd2KiRx9On7Gotf+b7ngssYs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ic8tObN8DjU6IWxKiOeUkHXlkzm6Ho162M8Ov3UaeqzH7pN/YMUQuwGmAuFx47ius
	 MdA34L14QpFsZUs0iM3927gfqeD5/OwbmXbmADzTqvPTVUhqeniEQdqJkfBxHM+0yg
	 5e/+nxMtA8SxUGZ9YQwSyOk/r7QlfQTMtlQwRtxIXDCImfQ/GQq1LXZ/w/4ShPCFKQ
	 APvr+K1EZSLsflkmA4kop8gVAnr0ol6ed1pbWwh1JdxLppWSA6UZ/6fYBoKvBEYFOG
	 UJuwBDZqBqgBAwFk3VLgWTX+vIn8FA+oOmyNXxzmA6bca0NeuEWNjfTIi06cPAIwJP
	 qcpCS8jBN+WXA==
Date: Mon, 18 Aug 2025 15:24:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250818183427.3601986-1-Frank.Li@nxp.com>
References: <20250818183427.3601986-1-Frank.Li@nxp.com>
Message-Id: <175554869942.1999698.5388783109628696157.robh@kernel.org>
Subject: Re: [RESEND v2 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
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


On Mon, 18 Aug 2025 14:34:26 -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual call it as system reset controller(SRC), but it is not
> module as linux reset controller, which used to reset individual device.
> SRC work as reboot controller, which reboot whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml: $id: 'http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#' does not match 'http://devicetree.org/schemas(/[^/ ]+)+\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818183427.3601986-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


