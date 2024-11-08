Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9555DD5E132
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OP+7nrc9Qecx6C7TQMCDbuRa2VxP3QHB0swcT42bSqI=; b=GeseUFwteNgg8kfcN/8MHDJ0zE
	03bSfTcK5NyRP5X/ctQCm3/aydCJZk4z9q0phprzWLC97S60vsx3AqAzBrrxqLgtFAdA4Z3HtaUE/
	imNGCE7myvmeiA8pfPo2BNhNusSfG3jo2zxQq7ky+8h8J7MdCiec3byf83GC5FZ9/0dqZdyrnXoXy
	5kNgy8GlxA6yCFe4Zh7vqlDx2B3zkSGXjQ/M+QQeH3lnmufJWRJWEXxqj4ak2W6EDpZC09biUWg8o
	Xd9efSXcfZ04I+d9FnsGiwlPLdHvV65Rg5qyBsab0RVfRIf2Q2Cg6IUeTBfQeDOUY5pbjvWb9sHo8
	NIlClD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Hr0-00000009QBU-39Ni;
	Fri, 08 Nov 2024 05:48:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HpF-00000009PsS-0EG7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C74CA44FF4;
	Fri,  8 Nov 2024 05:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB31C4CECE;
	Fri,  8 Nov 2024 05:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731044788;
	bh=fYe34Z8q8HFUItI2/1zT7AhtmmSHkN+atBW4Rs8k2Do=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=T6yluCEGTpyaw75OItqW6JATdsXDp+WVy9JrdtECN16JUXJF8RiI3p1G4yljBlamJ
	 kUCdux0Fpw0D6AzV7cwJ4w3eLmiI1vIi3uJzyDVsqzZHFul1k/eSBeRbZM6LuDz0cr
	 MheZix/OIunz+bwZd0uPWwsHbpDBDpj3U8o/x3hsUpJYET+AQRf9fgN6akAd1cyMhX
	 +NaN4OSxFiLLA/xTcpB7YekkOQR/qUXRJOF0SZIVhms+qEQlLG21On49z8rswAjssd
	 g+/yiHBJiU7JQz5wOsNkXlcqTNaZzFOqwcER/MgAhECmRAulSbwL2o0R960pK5GSrr
	 lLbsYB2flBzQA==
Date: Thu, 07 Nov 2024 23:46:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
Message-Id: <173104478441.565041.9851772057058427001.robh@kernel.org>
Subject: Re: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615
 Display clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_214629_185970_65284259 
X-CRM114-Status: GOOD (  11.86  )
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


On Fri, 08 Nov 2024 09:39:22 +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>  2 files changed, 125 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


