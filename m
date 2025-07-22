Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6923C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x52s11nY1DVkz63DLBpauJD93Zk8cinNv0MiW4607lw=; b=lBlSJOvtvJYR6V06c4Vw88VgII
	UuXQY4poBpHG5mlKhmdyul//pcgATu3gHdQNjgjmsbFAxH/JwkMAl2JTjfsQOnndmOEtdQ3RnWPsO
	+vLn+3qkB3vdO7U/Oayl40oogAiXUrKJ2UW9ASn1axpnQO/BMRp9Z+Bob/a1SaOKHGl4tWQBFcAOZ
	DCkH6brLF3yucDxiK5c6BzXLMn0UXI23fz8QXDhwRqbiEInMdby+aF1r5YDOBUi4elIJ4OVESDzDS
	mnYZLA9u2R511URFOkgw4lhI6mNdJe/gakFMSD5wJkSZrhP/I8QdM31yRDIuQs8LJ+ZX1dmzphRrD
	DuoNT0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEUe-00000002npp-3ull;
	Tue, 22 Jul 2025 15:01:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDe5-00000002df9-398c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:07:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA639152B;
	Tue, 22 Jul 2025 07:06:56 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC11E3F5A1;
	Tue, 22 Jul 2025 07:07:01 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:06:59 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yingchao Deng <quic_yingdeng@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Message-ID: <20250722140659.GI3137075@e132581.arm.com>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
 <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com>
 <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070705_825224_82868C13 
X-CRM114-Status: GOOD (  19.94  )
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

On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:

[...]

> For a change of this magnitude to a CS component, that the ID
> registers will also have to change. This is a requirement of the
> Visible Component Architecture in the CoreSight specification.
> External tools cannot see the device tree.
> 
> This is effectively no longer an ARM designed component, so the
> CoreSight specification requires that the DEVARCH register change to
> show qualcomm as the designer, and the architecture value change to
> represent this component.
> DEVID should be used to allow the driver to pick up parameters such as
> number of triggers as per the existing CTI component.
> 
> If this component is Coresight compliant then the driver can use the
> ID registers to configure to the extended trigger architecture.
> 
> With complete remapping of most of the registers, and the dropping of
> claim tag compatibility - which appears to be a breach of the
> CoreSight specification - it may be better to have a completely
> separate driver for this component.

Good point. I'd like to confirm with the Qualcomm team: apart from the
differences in register offsets and claim bits, does this CTI module
have exactly the same bit layout and usage as CTI standard
implementation?

If yes, then from a maintenance perspective, we probably don't want to
have two CTI drivers with identical register settings. It seems plausible
to encapsulate register access and claim logic into several functions.

  void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
  u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
  int cti_claim_device(struct cti_drvdata *drvdata);
  int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);

Thanks,
Leo

