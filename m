Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AB8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLZ9qMLPAyfmjeBnwm3Gg63X9f9+6Dcdi6lawUXPmo4=; b=b/EM/uRw5Gapn+GPiDHqOEpAkP
	hh7+flVtPG43ghPKjvF27enDs9ufZM+05xY3jX33g3p3ty8o2tM5sVrh9xu/046WmHuNc4lutBVwR
	i3ul1r7HON/3LVbRu1wjUCBICdcKvXEk5I4Gkov9z0ffwzDck+U4llKmy0DVWazOPjmtmrrnGzfwV
	AuU7iW2vocjRfTI2ED4ZwYyD6Ww6ecdpU0/LV34v8e98qVlynaNG8ka8B3p0Dtumo066TgLdRTErD
	JEja62L4Q4RfCugwQPDoG4qdbk3kcX6xM8JXHdvOzvDKsoUu1+Mos9PqhZVCdVxCsHz0N721p5QJf
	vECL1fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8iIZ-00000002HXE-1yDx;
	Sat, 26 Apr 2025 16:22:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8h7H-00000002CpT-1mgY;
	Sat, 26 Apr 2025 15:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 908C961138;
	Sat, 26 Apr 2025 15:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99A4C4CEE2;
	Sat, 26 Apr 2025 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745680014;
	bh=ldltt6Txk7jsfPZAR7Ijlb8uPp+jNfir4K8QBlkQzkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbxTovUF6JPsV4EAqGEuw1RmjADnKA4zydRGySU/qn2Z1cXvDHPKY7T50PJmpLTJP
	 5zNsSzqeqr/kUHy2/xORoIMr8rRMpRtX7bPDyYpAf++CcoSAaIkdX6/3WHszYBSo7A
	 j+ivJ0XF5AtBZ0MZ5BOSueBGi0Od72CgDNxKG05WcTPHNTISotWMxbZ2AeSbnvxLxK
	 q6YogLKhtcTPloClGq1mCZQ9YAXomgreIlxNMRlfXSR1piipkuEkKDdtpUelOb5Kfw
	 PJcHJJk6hfNRQm3qw/6qBS50v5+pShpf8EO+IZW6RhsWt2o8L35jjjO7AUUVltPRp6
	 kDAvLcDympExg==
Received: by pali.im (Postfix)
	id A3E6198A; Sat, 26 Apr 2025 17:06:50 +0200 (CEST)
Date: Sat, 26 Apr 2025 17:06:50 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, thomas.petazzoni@bootlin.com,
	manivannan.sadhasivam@linaro.org, yue.wang@Amlogic.com,
	neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
Message-ID: <20250426150650.c63x62ugtnwx5nzy@pali>
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com>
 <20250425181345.bybgcht5tweyg43k@pali>
 <5e2844cc-8359-4b87-a8ce-eb5ebb85f8ff@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e2844cc-8359-4b87-a8ce-eb5ebb85f8ff@163.com>
User-Agent: NeoMutt/20180716
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

On Saturday 26 April 2025 23:02:08 Hans Zhang wrote:
> On 2025/4/26 02:13, Pali Rohár wrote:
> > On Friday 25 April 2025 17:57:08 Hans Zhang wrote:
> > > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> > > index a29796cce420..d8852892994a 100644
> > > --- a/drivers/pci/controller/pci-aardvark.c
> > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
> > >   	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > >   	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
> > >   	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> > > -	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > >   	reg &= ~PCI_EXP_DEVCTL_READRQ;
> > > -	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
> > >   	reg |= PCI_EXP_DEVCTL_READRQ_512B;
> > >   	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > -- 
> > > 2.25.1
> > > 
> > 
> > Please do not remove this code. It is required part of the
> > initialization of the aardvark PCI controller at the specific phase,
> > as defined in the Armada 3700 Functional Specification.
> 
> Hi Pali,
> 
> This series of patches is discussing the initialization of DevCtl.MPS by the
> Root Port. Please look at the first patch I submitted. If there is a
> reasonable method in the end, DevCtl.MPS will also be configured
> successfully.

This does not matter what would be configured in DevCtl.MPS at the end.

> The PCIe maintainer will give the review opinions. Please rest
> assured that it will not affect the functions of the aardvark PCI
> controller.

This patch is modifying initialization of the aardvark PCIe controller
and is removing the mandatory step of the controller configuration as
required and defined in the Armada 3700 Functional Specification.
It says exactly in which order and which values to which registers has
to be written.

> Rockchip's RK3588 also has the same problem.
> 
> 
> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
> 
> Best regards,
> Hans
> 

