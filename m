Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD4C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1KGzAbRgk4VMbw+m6iAA8j3vWloWVW9hBVbSyX+YGA=; b=hxHeGZ9NEMSKpV5vUa+At2622X
	ccvZXHr+IYCJU3uurEFCe+JFcTj1hqZkN0I7+PMPChl7tkaoN49j0/VGgYON1M2yrDGj8ixQC7H1G
	kYDFasgaDQPX98VJ5935sfhRkHKBCRZJ1VzquelcYdIUhYnkifhuNmXG4qaHasS0UF3tQSj4eU83A
	VBwM20kjjbiWLqfY7IVoi6Ltj3KPpWM5RePK9mL87iFEqhyBYHBr99fD9/oMTsK6I0L6Wgb+OX3ce
	/89sQIrLT4QQSbZ4aOArhF/i4Yxq88npR/ozKtfH0Hb7RyQpgfmmmg9KydX3+hzlR5qlI3jewU0eo
	XQtqJqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIIS-0000000GENn-3UfA;
	Wed, 14 May 2025 20:01:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIGR-0000000GEER-2Uqv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8305B5C48B8;
	Wed, 14 May 2025 19:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F253CC4CEED;
	Wed, 14 May 2025 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747252778;
	bh=qW5rFOZIUMIBxccZW3o6GhkmgWY42f309svVpKLhFmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dJ5EplJJPn6Tz9O3+AZuZXh4X+8zgKjmalug+lEd66Vad5lxOacniJp6hmODD01TM
	 Osq9ifdXaEYW+x4jYXSK338ObxTf7SQMmlhEySuRcaByx88caBfm02Z7GGHw6pHpPR
	 gqfL5mOlMSKJoMuya+QV0YRpEuc3jQxhN6IY9HIRNkvGB2DqM2J7eSTU4SpKu0rUnQ
	 FXpNuqO/4i6ZlU/2vhh/bBiKwhYPSz+HSjrXeZSnDETm7cEmqlW9FDsPabO2+K45Rw
	 SmZ4+HfqrDDrRT1Np7xc7Z9EMX63iFm4MmJEm+CCTvPHaDaLflRgkqG34Q7SOtRl5h
	 P8J5MNzz9FIPw==
Date: Wed, 14 May 2025 14:59:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: bhelgaas@google.com, p.zabel@pengutronix.de,
	manivannan.sadhasivam@linaro.org, kw@linux.com,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	krzk+dt@kernel.org, johan+linaro@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, cassel@kernel.org,
	thippeswamy.havalige@amd.com, shradha.t@samsung.com,
	devicetree@vger.kernel.org, lpieralisi@kernel.org,
	mcoquelin.stm32@gmail.com, quic_schintav@quicinc.com,
	linux-arm-kernel@lists.infradead.org, alexandre.torgue@foss.st.com
Subject: Re: [PATCH v10 3/9] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint
 bindings
Message-ID: <174725276905.2927216.8851775897003421959.robh@kernel.org>
References: <20250514144428.3340709-1-christian.bruel@foss.st.com>
 <20250514144428.3340709-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514144428.3340709-4-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_125939_672009_053FD108 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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


On Wed, 14 May 2025 16:44:22 +0200, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


