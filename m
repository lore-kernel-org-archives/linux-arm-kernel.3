Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49346C02190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6/OtAc43vefPhLHoVL9uPrhcW3nJ7SVqZWl3XKABGw=; b=iG2s0MaGvHtb13cOGx/yzyg5jx
	JE580TAc3FVdsfQ0Gh77V0AyYyT13xp4EoCFFwRqYvcV55HCKB8B+bBhVP7z86i7UpM2vjYIB2vOc
	cV7Mh8FsLntx3GTJuemRzYPbqQZpDrxuibErHGBlAQW3ynxWpneKg3wQhrLffPUmHkKSclDR2+dJB
	zfjhCCuO9JVF6cZ8RLcpoAMa9Nnur4nfra79WsHOmOJX1uT3HQ73UH+yQ0WjSKLvOCB8HYicBCP+l
	63BVSEFXfqpmxK7rcX2w1Etad2XJsfl9tVIdHsK2kX1ojKQR5zs5eHvhZytMVf6aOEjqsYXl9sBnA
	cZhAVUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAGP-00000007Iyr-1gcp;
	Wed, 29 Jan 2025 15:46:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAF4-00000007ImE-2jQo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52EB85C5DE2;
	Wed, 29 Jan 2025 15:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986BEC4CED1;
	Wed, 29 Jan 2025 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165477;
	bh=1VUif8Q56cdMe1cHovQowDVeYxK9USFWvRbdMuxlrJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAoSCGWx1Xjlffqp3lezZGmNfTX8wU8bPQbfRsMb+1OL0l+DUeANYFwtaMBZbBeHk
	 NjMLIomxBAPH19nYTYoeJFQvXUwwV8J8QOmKsXXNfk8KnEQVQ+k7U+2ITUoe5GZdGt
	 XEvPFSMIzG1uKZeaL2Lga3vpSGcejUwrzcTQQA7OwXe2vzDL+H/HMGgzRgtqyMJRDf
	 Vgk3gS/jijLBxPGL3XDQkqxfh6jwtjv14sdAUOlkSxjvCfMuRPJqMNOK+ew6HrV694
	 IpL+wpDMhCqR6Zj/2ofBS+AtAvHN+f8r2TZZuFIbX+mP1Yap3ptZ80y5qwROVC/Abt
	 ZcAc+4+FGDiOg==
Date: Wed, 29 Jan 2025 09:44:35 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jingoohan1@gmail.com,
	p.zabel@pengutronix.de, johan+linaro@kernel.org,
	quic_schintav@quicinc.com, cassel@kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v4 01/10] dt-bindings: PCI: Add STM32MP25 PCIe Root
 Complex bindings
Message-ID: <20250129154435.GA2145727-robh@kernel.org>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
 <20250128120745.334377-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128120745.334377-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074438_787316_4622F625 
X-CRM114-Status: GOOD (  12.22  )
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

On Tue, Jan 28, 2025 at 01:07:36PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode with one root port.
> 
> Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.
> 
> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports WAKE# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-common.yaml    |  33 +++++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 116 ++++++++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

