Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C490C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8h+tmgB6rVgdt/cCVrNadUvWy7R6X+6/AIyd+uHzCA=; b=MZyp5wvOcbYLAqnA04oZ+IY1Px
	AiAiBIj7JJEbgc/taoZeQSqPWz7UwGgb8hUWRgLlsagRGtqlNC1e+1dRa4a93M8zz8925Fdb0pghV
	68n36DBcghd85WXYlhgEBTJ+/pK5aPpKNOHPOUhUC4klri84MgdSVLzfXJ0w0fmUI8uIDajFr7BPB
	cQse4VW2JMff54W6/U/M0UEQ3psOvjDDbOYlcPkfES2hkUTKr5BXTYCH8fM+7c7n7x1mYQxw6f6Hy
	ebRDkO5ETemyxHSeyxcj8bShSF23YWaq4s8ZTJrGmSPtA876zIB5pCCrGbfI/foSgIx+t9UssAFsv
	6VWyOmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqQO-00000003yZc-1DtH;
	Tue, 11 Feb 2025 13:35:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqJx-00000003wvX-3gS6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9D605C177A;
	Tue, 11 Feb 2025 13:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72D0C4CEDD;
	Tue, 11 Feb 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280541;
	bh=dqNsW3cC15v27jSPs0dEzsu7+QJx12fycZgZDdvv0Qg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Xn1brrTa8PUgjgKYSe42q6OvxHapJBaUC0V8AEU9gN1aVq/eY/Wb2zw1xQi8VzW6y
	 P6PzOx/iI6tFYe4J3CJRP/HdDUhooB3sq4yKPQxSZEkN4cncd/4hheMqrAz+GL/Uer
	 /V1LC6PRjuvkRdYyq76nJOaz66a8fJyTaieJPIatsRe2OgJZC97yljYGvQGUQJV9Ia
	 tp0lTyM3cqPl9LKEdEbfvdU2i2Yz3ijAkNhnTQ8LGXakpSimRfmmhgwl/ED5Y05/Pe
	 xxUTwsNUNpWtPQC4F/DwOy8+Q0LRwVL3gVsh3V7RGsPeYof6fnM/JNRGVIGCUuHzY8
	 KJM7Ux7ykkrcA==
Date: Tue, 11 Feb 2025 07:28:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, iommu@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
Message-Id: <173928051052.2596191.5953179871612881836.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] Add support for GPU SMMU on QCS8300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_052902_003279_9442796D 
X-CRM114-Status: GOOD (  19.97  )
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


On Tue, 11 Feb 2025 10:15:52 +0530, Pratyush Brahma wrote:
> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
> Changes since v4:
> - Corrected the clocks list to be inline with clock-names
> - Removed stray whitespaces
> - Added r-by tag from Krzysztof on the bindings patch
> - Link to v4: https://lore.kernel.org/r/20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com
> 
> Changes since v3:
> - Modified the order of clock voting and properties as suggested by Konrad
> - Removed dependency on clocks in commit text as change is merged in
>   linux-next before current base commit
> 
> Link to v3:
> https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/
> 
> Changes since v2:
> Corrected typo in cover letter to include QCS8300
> Link to
> v2:https://lore.kernel.org/all/20241227104651.4531-1-quic_pbrahma@quicinc.com/
> 
> Changes since v1:
> Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
> Link to v1:
> https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/
> 
> To: Will Deacon <will@kernel.org>
> To: Robin Murphy <robin.murphy@arm.com>
> To: Joerg Roedel <joro@8bytes.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> Pratyush Brahma (2):
>       dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
>       arm64: dts: qcom: qcs8300: Add device node for  gfx_smmu
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |  3 +-
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 39 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
> ---
> base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
> change-id: 20250131-b4-branch-gfx-smmu-b03261963064
> 
> Best regards,
> --
> Pratyush Brahma <quic_pbrahma@quicinc.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:0: 'gcc_gpu_memnoc_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:1: 'gcc_gpu_snoc_dvm_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:2: 'gpu_cc_ahb_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:3: 'gpu_cc_hlos1_vote_gpu_smmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:4: 'gpu_cc_cx_gmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:5: 'gpu_cc_hub_cx_int_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#






