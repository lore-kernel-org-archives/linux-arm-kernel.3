Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AA1F3D616
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 17:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jjPaDJM5soQyQnFNjlcrQxI055bwpSyYILGkgzen/M=; b=yjRSF0c7FCfXre5zeD3Zmj8hyd
	pdqgDaCUkNSHJ0lbGmz/FpRnkgcCxwWio2ulhPtTxqHApHi2sZklGd094t85Te3kcOthMGVpIM0K+
	aeNs68TJfEiSN/Qqusv96uxNci3WoJ3fWEc0Q3hDoOvDMfbYH+UAcDkbcxLTtzUzaXhzjyhYHoPgH
	kSKWbapEWXQg1w08/Gj3WpvuNRHMYYQVgXwOcB4Pj9CK2N1zmc1sZrSstqk7XFOjpylhPLADCg84P
	+lNbxzyRupRD4yLdb4ltl+yfa8xH7xCSf8oD8TfXojF3TTMyxMDsTrvX/4TgYvIMht7uoVcFJDmt9
	nTGzvYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6tzB-0000000ACct-2L4F;
	Sun, 29 Mar 2026 17:31:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6tz9-0000000ACcl-1iTT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 17:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54124600AE;
	Sun, 29 Mar 2026 17:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAB1C116C6;
	Sun, 29 Mar 2026 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774805497;
	bh=0spV8j4F14bXIHH7uNOOGSi0WTG/8MloA5eb3snxq8A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AMIqyvEAaaYvnkgKoFjiuyxVirybKSG326qn++OCzA+RUMaHqHilt+VnDUOKzvWa/
	 1kqJnzd5LAJv4wjVP0a4NLPfEtGXUF70DmiDnUZkogjQs4BBTk5/CzAd7zCMgtZAhd
	 n6I+dDw3sev2swgL4zXrTcj+akxz1OgwC9HVn3YJAo6gyiofEpRQt5udGsGLw3DMuB
	 q5fjVi0eF6cHylcnewzu6rNOTG5z9/WvKtuIK+WTf8dieQ9IUuOdluYTplZR7pswM1
	 yYmGcpHNdDauU+y8C2rocCbmAUjK8Ld8d0tVQYF/foD5iFqAYahDID+FuREAXKcJ2+
	 0WnRyw0fAXjjA==
Date: Sun, 29 Mar 2026 12:31:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: etienne.carriere@st.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 d-gole@ti.com, linux-fsdevel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-doc@vger.kernel.org, 
 f.fainelli@gmail.com, vincent.guittot@linaro.org, philip.radford@arm.com, 
 souvik.chakravarty@arm.com, peng.fan@oss.nxp.com, dan.carpenter@linaro.org, 
 lukasz.luba@arm.com, arm-scmi@vger.kernel.org, sudeep.holla@kernel.org, 
 michal.simek@amd.com, linux-kernel@vger.kernel.org, 
 jonathan.cameron@huawei.com, elif.topuz@arm.com, 
 linux-arm-kernel@lists.infradead.org, james.quinlan@broadcom.com, 
 devicetree@vger.kernel.org, brauner@kernel.org
To: Cristian Marussi <cristian.marussi@arm.com>
In-Reply-To: <20260329163337.637393-7-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
 <20260329163337.637393-7-cristian.marussi@arm.com>
Message-Id: <177480549380.3925363.5137815678176793743.robh@kernel.org>
Subject: Re: [PATCH v3 06/24] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
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


On Sun, 29 Mar 2026 17:33:17 +0100, Cristian Marussi wrote:
> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/arm,scmi.example.dtb: scmi (arm,scmi): protocol@19: Unevaluated properties are not allowed ('i2c2-pins', 'keys-pins', 'mdio-pins' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260329163337.637393-7-cristian.marussi@arm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


