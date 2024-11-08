Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F759D5E133
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPco+uuRS1VgGH8NxzS3z86tw9MW0An2/6XfsKdqZVQ=; b=3Nz2icNJL+oT2qTuc0bMwOXapy
	sed9dKeHGpHc/RvuKnY+yzHL6xgsq/XUXP5bXb6VtoWjRAurN+AMqSJ8o6Ya/igKhGQQnwzm1O5vh
	fjzUSPKQoq4BWRQ+ng9uVfVu1gwDIEDj7Btg2BYvdcYvWKpMU5SwrejBDsPxyIkKkqWUn8TcdPiok
	CBJlwvzj9IgfwudAJdpYqHPn0Eo9VVjLxEM+jrkXO7Q9vOVN1fry8f78ecZjxZQS1AbWhPFb6sj25
	fxVc+S8clECtSttYU/LJJs8afaYE3pdWFs5szha1VMun+WfV+QSFDTR7LXQaMx7eUnHst/uaCWOC4
	2ZY97ZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Hsj-00000009QXM-0pze;
	Fri, 08 Nov 2024 05:50:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HpG-00000009Psj-18HD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE383A44FE8;
	Fri,  8 Nov 2024 05:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1AAC4CECF;
	Fri,  8 Nov 2024 05:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731044789;
	bh=6u7zYbrAlLcUu4TPaRAQYC6BKeTYc8sRV0Uk7+kUYTc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YOnLHEz81UGzTfJHQIJ1is5tTfsf31A2+VNwMVNjQonhRzZdM2801VuBR6QfrP1/n
	 dqBen7B50wz2LECTYoKIZSPip5SApTzzziOQLCyz2hbSFc3phBv2Wkl2MN3uHdZAM4
	 +O0+R5LORMT4ZhuaBqNO6vLIMWOtLow1oqb5f6+H6muVt3SvuhRj/G6xeDHpMKCnep
	 niKLy4bid+JdGGtCQLHwdb9CjUvAdr5zwdnYOwH21+htSQwMY9WhMn54Ndi7LA9hbg
	 IDjVipBA+ZgZJBHDLseD3BY8AK6vXZuGxlm+sBBqvKjip+VnOnTJ0EEAqbKJcclJ8a
	 GbDqQQ+a+NbIA==
Date: Thu, 07 Nov 2024 23:46:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 linux-clk@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
Message-Id: <173104478542.565094.6615829686201582887.robh@kernel.org>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_214630_394236_C82BBCF3 
X-CRM114-Status: GOOD (  10.22  )
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


On Fri, 08 Nov 2024 09:39:24 +0530, Taniya Das wrote:
> Add DT bindings for the Graphics clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
>  2 files changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


