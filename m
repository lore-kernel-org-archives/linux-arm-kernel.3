Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31E5106F317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tj1CCf7feg6izfr5xpJ0Jj8MSJWfnwKEpwqghyP9Vj8=; b=uVZXSrTNVkPXL4ysV2asciGiQm
	+zHAVUPLPps98iCZvTBI1oQ4rc+u2B4dvMZrFVp/PZK7emIsl65Ypipk9Y7v0hB+xcQiJ+HiNQnme
	nrY2bgcEaaqDEd5h/zUMp9kEGZDJXkevIzZ+hdNHEu5mX29+9reX4HRXikMv3UF6hXhTL57ENTLOB
	sPiDrNjEbyxebKhX/HsJV9WQ5G59hp8JiQU4yF2rHpTkUJk/XjB93b7WbbwAzofwE6SWhZgWBMa1F
	7h7JuYS3lUxjlwlL01oGR7PfPRmbO2/K0Y3NAqJyVPJ5V4U7NFn5/if7KzaXlhKD7J3ByQ7MAh9C+
	d8QIYZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5i1g-00000005Gtz-0Y9A;
	Thu, 26 Mar 2026 10:33:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5i1e-00000005Gts-258P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91B4460130;
	Thu, 26 Mar 2026 10:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2844EC116C6;
	Thu, 26 Mar 2026 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774521197;
	bh=NyCZxhrmAGFbyrL6h2c2w6JZvW0gffjIb4o1sEXE/4g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C94S+xEBpyEIESagZYsh6vWRmPxqlxpYq8f+4SuY2THKpf/FdX9VBeOUuEJPAGuZ6
	 MLZcIml1C3R7WhiYcNN+yxjDjmz9nAa5NOJPXrj0yqlwtf/A6x2iiR4ObLgs3u0V8m
	 vnj3MS00gVVjTevcNP8QFZd15DSzbPUJctmh7fFGchJyI23Cer2OtY7vzM2kp2GXIL
	 TNazfChQquXqpy+AoWcU0awhaRUYN1pGGxGLLTvDu422fZi1zC9E6A9u/57jyrd/vD
	 U9lTVqHtQJwSxklSTcMvF5bwwZO14Esba62N4mrK9vjEJQYLyg53uuzzfu4hFjNXaN
	 BG45J7/0eW1eQ==
Date: Thu, 26 Mar 2026 05:33:15 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mark.rutland@arm.com, will@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org
To: Geetha sowjanya <gakula@marvell.com>
In-Reply-To: <20260326090645.22590-2-gakula@marvell.com>
References: <20260326090645.22590-1-gakula@marvell.com>
 <20260326090645.22590-2-gakula@marvell.com>
Message-Id: <177452119218.1921575.14174289122061565308.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: perf: marvell: Document CN20K DDR PMU
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


On Thu, 26 Mar 2026 14:36:44 +0530, Geetha sowjanya wrote:
> Add a devicetree binding for the Marvell CN20K DDR performance
> monitor block, including the marvell,cn20k-ddr-pmu compatible
> string and the required MMIO reg region.
> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
>  .../bindings/perf/marvell-cn20k-ddr.yaml      | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.example.dts:22.21-25.15: Warning (unit_address_vs_reg): /example-0/bus/ddrcpmu: node has a reg or ranges property, but no unit name

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260326090645.22590-2-gakula@marvell.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


