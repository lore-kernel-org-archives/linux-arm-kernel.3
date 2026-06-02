Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AA3CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9+6BaKxCtZ2oRdla2ck1apQ7Hfje/TDxTyYeJJkXPM=; b=smpqn5aR6rKUxlmFC1atGe0wnA
	3h6hOEM0V3plI0e/07SWpbHrHbioYLklBUpCY/GsA7cVFcKHbvfivRLSPdzdQj63dnScuna5K5BFC
	fq6HLtZ99kHGHCkGQEfHQ3xt44WcL9OBmMWp5DQcbVuJ8fm8/Hk5EycE2WFxwix6vSIYnLOlK2NG+
	EpBihjs7pviqtscjs385frc2YPcWvPhzEwEf7X1+DrSpAjpP7yRmaFUEDTjjYeVV5f7Yldduvdu0w
	12hvBc6tAU79gbTcwah/4pZTSU9S++HsS9GxPaWBxBdFOh58lT0MzFyFDJ/q8OHTdTsuiFF1UtQ3A
	b9EFOLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPRL-0000000D8IC-1SRL;
	Tue, 02 Jun 2026 13:45:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPRK-0000000D8Hu-0dj1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:45:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 370176008A;
	Tue,  2 Jun 2026 13:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24AE1F00893;
	Tue,  2 Jun 2026 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407952;
	bh=M9+6BaKxCtZ2oRdla2ck1apQ7Hfje/TDxTyYeJJkXPM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=B98OVdpJWUZAnFL1XvRYfwcafAsY8Qj0f7Suj/5iVWCuVw8xd59E+1gcLe/h2RJJO
	 r/PYoiWBfSmNDftOOJ0Y0B2n3RBwMrt58D34mIPQosd/3h3wOvsu/eUUzZ5TSSQe12
	 8QFAX4Yhzjt5aOHRTS8F5Z0I48MLo9jUjAikSnP5c/2ttsX7sAgVbFYAw2+y4eh2pr
	 DRGkB8gDqMu56oW20Oi+vzJcVnvZSMsRiovmHk0Keg+LxYamuHL36YfdPBSDSxSYOL
	 57HWDb3FHotn1jXRUpvoRnUT8wd9Qy9XCyhAGsyNnKXMdCbdPf7X9kqx6aWHlAJZDR
	 KIWb+xj137gOw==
Date: Tue, 02 Jun 2026 08:45:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Kevin Xie <kevin.xie@starfivetech.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-tegra@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-pci@vger.kernel.org, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Aksh Garg <a-garg7@ti.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260602-tegra264-pcie-v6-1-edbcfa7a78fe@nvidia.com>
References: <20260602-tegra264-pcie-v6-0-edbcfa7a78fe@nvidia.com>
 <20260602-tegra264-pcie-v6-1-edbcfa7a78fe@nvidia.com>
Message-Id: <178040795218.231197.636617303245801505.robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: pci: Strictly distinguish C0 from
 C1-C5
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


On Tue, 02 Jun 2026 13:33:23 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of using the ECAM registers as the first entry, strictly make a
> distinction between C0 and C1-C5. This is needed because otherwise the
> unit address doesn't match the first "reg" entry. We also cannot change
> the ordering of these nodes to follow the ECAM addresses because that
> would put them outside of their "control bus" hierarchy since the ECAM
> address space is a global one outside of any of the control busses.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v6:
> - add maxItems as suggested by Sashiko
> 
> Changes in v5:
> - rebase on top of v7.1-rc1, make it into a fix
> 
> Changes in v4:
> - ECAM is outside of the controller's region, so it cannot be the first
>   reg entry, otherwise we get warnings because it doesn't match the
>   unit-address, so revert back to oneOf construct
> 
> Changes in v2:
> - move ECAM region first and unify C0 vs. C1-C5
> - move unevaluatedProperties to right before the examples
> - add description to clarify the two types of controllers
> - add examples for C0 and C1-C5
> ---
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 79 +++++++++++++++-------
>  1 file changed, 54 insertions(+), 25 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:0:properties:reg-names: {'maxItems': 4, 'items': [{'const': 'xal'}, {'const': 'xtl'}, {'const': 'xtl-pri'}, {'const': 'ecam'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:0:properties:reg: {'maxItems': 4, 'items': [{'description': 'application layer registers'}, {'description': 'transaction layer registers'}, {'description': 'privileged transaction layer registers'}, {'description': 'ECAM compatible configuration space'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:1:properties:reg-names: {'maxItems': 5, 'items': [{'const': 'xal'}, {'const': 'xtl'}, {'const': 'xtl-pri'}, {'const': 'xpl'}, {'const': 'ecam'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:1:properties:reg: {'maxItems': 5, 'items': [{'description': 'application layer registers'}, {'description': 'transaction layer registers'}, {'description': 'privileged transaction layer registers'}, {'description': 'data link/physical layer registers'}, {'description': 'ECAM compatible configuration space'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260602-tegra264-pcie-v6-1-edbcfa7a78fe@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


