Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5386C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOnuc6V7iZj1VHst/LjUygWq87lYaT/N7rhOGEcupU8=; b=GukAI0GEbF3as7OE2n81HjNsl9
	wjlqR40JlzAygVWlmdBLy+HNQUFp8vV8hitfAtPQY6hzWuKpOH/7iocjGj1qe6Il4wEkI+HZtUEVu
	eb3/7FtiBXWL+i2qXLlUTeSTB5gCDi7B3tPjgvdAePieWvrIfy8hTMrKhXpdCISAnCOUIxDRD9G5u
	5m8VxVq8OQy2UdN/sH5vxclHRHqkJAceDt4923jTwfMM5fsUAWCGD2CdNx4u/Cx60U98qCscF8nzC
	fN3h6RllRHSiqWwAHtkBcEPDLB/3NsJmD9+2dleI/ZlayLFXuYBKIHjwuSK8VFkR6BMGUikH4B9QQ
	SESzAvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpfU-00000004SY0-136u;
	Tue, 11 Mar 2025 02:48:32 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpdH-00000004SHP-1bsc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HOnuc6V7iZj1VHst/LjUygWq87lYaT/N7rhOGEcupU8=;
	b=RMCb81w28Z95GMpjzit9coBp5ZegdbVkG1EVgach9vpYzvBpRGVMgsMA8bORSm
	tVDKkMtP0t5q4tbhb+QnW+z/J0Xx0DtfqcBydniCVqEc4m93HeXjXYsQ1g87Gpdf
	JQk2FYnhnJ6CaLJhpsas+dMsHTvRbiIUhtCs+qtM8D3SY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3xq+Xo89n92ivAA--.43267S3;
	Tue, 11 Mar 2025 10:44:41 +0800 (CST)
Date: Tue, 11 Mar 2025 10:44:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 0/3] imx8qxp: PCIe fixes
Message-ID: <Z8+jl+QWCwStEitG@dragon>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgA3xq+Xo89n92ivAA--.43267S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV75rUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh4NZWfPWknoJAAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_194615_729197_84EA1F26 
X-CRM114-Status: UNSURE (   6.07  )
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

On Tue, Feb 25, 2025 at 11:27:20AM +0100, Alexander Stein wrote:
> Alexander Stein (3):
>   dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA interrupt
>   arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
>   arm64: dts: mba8xx: Remove invalid propert

s/propert/property as Bjorn suggested, then applied both DTS changes.

Shawn


