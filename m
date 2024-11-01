Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141BFE6B243
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P80SD3m++pZfb179AERrePA5UE5HbIgT7oKc/XL09FQ=; b=JSVkGbLp1V6ntkcZeUc/s9+PLk
	yIKWKjM5oKz/LVQiHUv3i+VpjmFbEy/VGUs2k75hzi7LFs7eaQL8D94jnTfUe11dvUkzc3eNtrnzq
	WKqLt1ISAp69HqfPT083BaFZqVry6SZ3zOivvP4G0Uejv/sdqFZZiF5ESSf0gEukIZ7LHKR14hjBB
	Q4NaMM099pdEOYplwmUdLVJFVDNu7Pu0wf1/61NJcfV9LOTrJa4J0vGslrO06MCao7Y1AxNCyV4C7
	+0rlqUcd6ALBD+ZRQR0Nzir8MwPFJir58Vh2IB0A1jSmfsWpCOyKR+UVMZpGRmGsOtj04HuP77Wj/
	nbsk7NsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q6q-00000006nSo-0K9y;
	Fri, 01 Nov 2024 11:46:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q2p-00000006mVy-1MuQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4649A43694;
	Fri,  1 Nov 2024 11:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051DFC4CECF;
	Fri,  1 Nov 2024 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730461342;
	bh=bKQhNZTPEmk8K4/4hX6A5+BjPeSQ5IWyhVduxqcPwfA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JhzaQ5ybUYLB2oHf4/2Z/D9etOS/kDCGWPxBJ7k+t22HdJdIiSmHwl09CDWVd7quJ
	 EoovQtlAT0jsLOQFuEXQj2mtulvbI7kWeSqh2NR8/du0VDPLiBORcokeAHk2CI3WzV
	 n7fYFbrXUVNtH7vQL423Qmz90Sh4RY7iBqWR4No03B/CIVayMmKTZ7ffK2dGvHki4i
	 hENyC7yNFg7+lJama3ucfcnr6UlyDZ2NIfdG7tX0Cxyon4OBUwKuVlIgvvVp3Dcxdt
	 Q6vbNu0mP6oGMKv3Jbf4Hztxg6Lxnimg9G+K4A8m5D6o1JtkXo+wj/8ThlmMsCLdJv
	 brCrojhIFNT/Q==
Date: Fri, 01 Nov 2024 06:42:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, linux-clk@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com>
Message-Id: <173046133733.2741917.9488977607112926104.robh@kernel.org>
Subject: Re: [PATCH v2 09/11] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_044223_459207_511490FF 
X-CRM114-Status: GOOD (  11.47  )
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


On Fri, 01 Nov 2024 16:08:21 +0530, Taniya Das wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


