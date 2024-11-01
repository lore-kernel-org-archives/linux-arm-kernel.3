Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261B9E6B243
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+x/k8P250a+Af11rBxi9Pl62CRAx3QR1ZjKKFpGZBwE=; b=AO+2VXcgnX8WlueGyWPvvSZ2E6
	8wZevUjIv+ozBoDeeeMzJ5vvlhjJG/t4DPk7DO1uOZIw96sClPppxHxUl3YFy+LrWMnvAbMRyl9u7
	gb6jqbsFqxLz02k/4JU1R17Z2f00a/6HUicLr2OyKI/XNRMnTDK/Z5Ee3x9/3P9NupVQJ2NJ4F064
	NmPvctwizelkFN8VdAXnpKVYTllIIoFR9VPQELgGt534qF98b6MkB326CHxq5IUA0dF+EvvFuk8gL
	Hq7WDVls0GH3CrXc+qDslp1Cs2n0uT3hcsCzjRXOSk2Je1jzjzhU/d1Ezmq5v5ZZANHGt7GnExiA2
	OFi5n9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q5D-00000006nFG-43YV;
	Fri, 01 Nov 2024 11:44:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q2m-00000006mUd-1VWd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE088A4359C;
	Fri,  1 Nov 2024 11:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FE8C4CECD;
	Fri,  1 Nov 2024 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730461339;
	bh=6xrGD7oKWlZ6XOU+8wWyQpg+NtkqgDu0wWDFBNCgLS4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eMFJ9PM7hZnTN7+y6+MUNOnYAo9owzrlKfKHsVzt5++CJ4kCCAl3RRIBpSvwlPPQs
	 ill/6w/7zibQCyPz/in3wgbgH9Twni9Eydc7LrPUOp93ebcCQe3Z78Sl0qsJy+FJQX
	 db2eWi95HC5rIdDU8IFaNp9L/QRqWsQdaafUZCA4pjFzQ5O4PzaAXoVea1yfpy/xoe
	 MDeQVNeRotYoVc8IkXfht5kCz/STxKxSGMKuhfmhNqFXLjFKxKs4OceiUn20dxoaEh
	 5fBCMd9p6xUhDTtlq8NaxvepKM0Y/eyWFyXtgXVtZk5ydBRzBzAa0MjNu8Gx4oTy0t
	 WMzWMoUIOjmVw==
Date: Fri, 01 Nov 2024 06:42:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Abhishek Sahu <absahu@codeaurora.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Imran Shaik <quic_imrashai@quicinc.com>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-5-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-5-d1a4870a4aed@quicinc.com>
Message-Id: <173046133538.2741746.9760905670245295955.robh@kernel.org>
Subject: Re: [PATCH v2 05/11] dt-bindings: clock: Add Qualcomm QCS615
 Display clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_044220_537419_502C5406 
X-CRM114-Status: GOOD (  11.79  )
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


On Fri, 01 Nov 2024 16:08:17 +0530, Taniya Das wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241101-qcs615-mm-clockcontroller-v2-5-d1a4870a4aed@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


