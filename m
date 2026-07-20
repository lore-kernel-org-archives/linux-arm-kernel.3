Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D3BC4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHakvw+cq0FvSh0mcTv/5djlh0p78EMHWetYuji+QdU=; b=x2Vkbm/fz/81TW/bcT//YUIh5Q
	oLAhUCiRMdI30HWIZLBCbxpXVatztjfmFWVx92MtH+Z1UmOp3J/dGxNekHb24TJZbQzQr8tY9i1tn
	s2cfIl2znQZ9Axq4554h62nzWV7xkOosmCYZRZkKqhO42IGORCi7ONt5km+rmCvrCgPh1qQRuisFl
	2aHvrOrI2h6/Rs5rfIXQzV13g+YMtnBVbzF4p2avxCK19JYlajLusR49eB2G1BXqMq8rCpytg4VwJ
	NQxQarU/97CrlCqq/FtBP96lUk6LbZ8MyF3KYig4WoH0YgWtCE8mQR5wnaBJO+ymrsr0EHCO3iul7
	I1sPleeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnUz-00000006k0o-47CK;
	Mon, 20 Jul 2026 12:53:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnUz-00000006k0a-0UwD;
	Mon, 20 Jul 2026 12:53:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD3A440AEE;
	Mon, 20 Jul 2026 12:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085B91F000E9;
	Mon, 20 Jul 2026 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784552012;
	bh=UHakvw+cq0FvSh0mcTv/5djlh0p78EMHWetYuji+QdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rt3DI0FPJzv9T7eyZMiTb199zFGMKp82CFz/QaWeeA/eUQzd+HrvS6R8qdPnDjLj2
	 9GbsxwPvf1MZ4B/Atcpbja823x+dCwbAMe+25SI849UCnYeIiUdRnFNUgb2f+UNep/
	 kDSJFzXO9xH0Zj7ULfL6VGTUxX373GFrRM8JV11V8udzOr3A4GRdghyvOa45jFL7WR
	 TUVUBz0gt3hyIhE1oiai0SBUpqId9x3Dqjhy6IB6A86TN8cXeMIFvVBU8k3FX/F5bK
	 Rjp3qYNaWcAoNX8HdqiSVDdDJ3LxDFWEpbolaXBE3lrvWEhHo+ts3BwO3VFz6Iupx7
	 PoBdBxeL3YzQA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20260720092116.1823562-1-wenst@chromium.org>
References: <20260720092116.1823562-1-wenst@chromium.org>
Subject: Re: [PATCH RESEND] dt-bindings: PCI: mediatek-gen3: Allow
 memory-region for restricted DMA buffer
Message-Id: <178455200859.22551.15072267007886622364.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:53:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Mon, 20 Jul 2026 17:21:15 +0800, Chen-Yu Tsai wrote:
> On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> controller memory access could be limited to a small region by the
> firmware configuring a memory protection unit. This memory region
> must be assigned to the PCIe controller so that the OS knows to
> use that region. Otherwise PCIe devices would not work properly.
> 
> Allow the memory-region property with one item pointing to a
> restricted DMA buffer.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted DMA buffer
      commit: 7e38b7b0e0e582024e97289a3b63c201f226124d

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



