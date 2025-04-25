Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92453C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7kqIp3MP/24W1fG470MVrUTqk7OynlrlSs6nEIYljg=; b=dednXshSPmuSpp+Lr3CYnkkMlk
	AFGqt/GzjuRuaGqZ8XkbyIK1xBfBkBr4FlUO+BVbnonqgrmP4rzj3cGZbfqkutjx4Ovo9k5H1t1LG
	esnpTSJhniaBTL8BN6lxYtFeoI9BiRRFP9n6IkarTJaydqCAkGjs/UmmN549nzQEa4zCYRgw5LPqm
	82h6aiy5NcK86ysBCu+FuRjMNNm6aRW0lDGjlrjLz/nn7WMomYq0fFw5MboH2m+5BJZe+Sbibo5TO
	BEBc+uJ/2XpXLjrepZuw0r50TLVJST/9sDTIMQJrJLdzQSM7Mr5d6teUGK2yVXPahJ95Yyp++/D70
	a4+SpSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Oed-00000000drm-0bPH;
	Fri, 25 Apr 2025 19:24:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ocm-00000000dcy-2LYv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4559A61136;
	Fri, 25 Apr 2025 19:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D60FC4CEE4;
	Fri, 25 Apr 2025 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608931;
	bh=Usf2G1h8hpF9rzR/da+RSah9tvDonSHdGdQC9xKTH/A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZCe/XvGXWMUZHkWQevSYxQop9cUEEguMOyhDx5sTtqL5P0GT4CetGe8EHdbpMUHTF
	 eqs453T6V4TBEQCrnsl+5FPGN2Vo0taSg0du+iAh5BR3sZsmipv0Aqx2z0eF65VAsu
	 C5HTST2Bjc1fEPuinUdHDR/wiPZEei3D6Z765WRmwuVOJ95dH0P6xkQ7n7RhguHRQ9
	 90PeTlSOGSIrQ9VbpFQSym2oRDLSR2eR+UQ0LSXw4tzdzL2xIk+fdrGFLdlNKpJRH/
	 pNTGGDkV/i1u6tlM34Mb/En0nSR6z41hlMXfUo0nMy/FlOoPGAv6YXddd3moU1EaM7
	 TuIFngV2JCjgw==
Date: Fri, 25 Apr 2025 14:22:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: willmcvicker@google.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org
To: Peter Griffin <peter.griffin@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
 <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org>
Message-Id: <174560892936.2854543.3393907207242393219.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: google: Add
 gs101-pmu-intr-gen binding documentation
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


On Fri, 25 Apr 2025 17:25:05 +0100, Peter Griffin wrote:
> Add bindings documentation for the Power Management Unit (PMU) interrupt
> generator.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu-intr-gen.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


