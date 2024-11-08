Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571F5D5E133
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWYjmXwwwuu//DbdBJ3/axExxYeXuvLOJrdMuKQA8Eo=; b=bVjOtrA/fqVwv7IkgpYsXrbDuO
	l7gLFJ78lhMexFeYDyndNXilciU8oO+WK2UjaywI5R6KnU0SyFW+7eP1zpsoANS+KOEK6cxjiqS8x
	Xibv2D+xXt35Ee1AvKArCvMasIcJk8Ao0PIkET1urWIwjOYvmin9K8oY0A85FKIWAXTPh0RM9w1Jn
	5vj8AQMbpnJod9Di7CLCKKnnrebHYb7caoDnGvBuVaq6OD1VZGQQx4HjOyRHMTVp0etuqDIfHXp3Y
	tz2Cvn+SoFBJKZ+JRQTbhcsUFfQ1slUGSmLiz7grE8O/9IMRMpYEHY49ca4tT8nEAtKDYa0o4k0wa
	OaQxNNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HuR-00000009Qmd-2JxU;
	Fri, 08 Nov 2024 05:51:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HpH-00000009Pt5-3RdT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 335C4A45007;
	Fri,  8 Nov 2024 05:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88754C4CECF;
	Fri,  8 Nov 2024 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731044790;
	bh=88Rz3TmeWEqiX7bRX/GRaK1b2B87LDj6hFkEPHVeLAY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FfL29KILvKvH/AIxvs6KGu3fX6ZxStnK5Zj8YZcjjnYBL6xVywzAjTTTt3tcnRGHq
	 QgI723lr9PV2mlUQ1DkynMm/a8xk42JXSKLKIDOxafyLsC6u5wl+IO88JNaVWPklxF
	 FCcL+s7/ly20DqQSB4vr2aknc+WwDFPo59xWLQbtE5VdHLfh/QgqcoQdylmmBTLcx+
	 eU8NEDBpOP6hznI33ebd0ftZFHB0xoic1TafjC3UJB+rLNHNnGbQR/akc9+WNM3cs3
	 cggJ11iq0qtkenTTmt6xGexWlNzu0A/EyM6KvIQ0cs0jXfEAK5lD45L5/ljT5SPZmI
	 20rDW/jj3U4qg==
Date: Thu, 07 Nov 2024 23:46:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-9-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-9-7d3b2d235fdf@quicinc.com>
Message-Id: <173104478624.565139.12495883590932168763.robh@kernel.org>
Subject: Re: [PATCH v3 09/11] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_214631_953184_C9A2DA48 
X-CRM114-Status: GOOD (  11.35  )
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


On Fri, 08 Nov 2024 09:39:26 +0530, Taniya Das wrote:
> Add DT bindings for the Video clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
>  2 files changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-9-7d3b2d235fdf@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


