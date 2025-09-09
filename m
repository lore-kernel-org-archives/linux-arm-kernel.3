Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E5BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQm5ahltNyRxK0CQ9L9cIy9TmsccEdaFOUvHJtzqAHY=; b=Pb2lP6i1EuUAGjqEh7fcbcKAoi
	uMdf5bv5+KLuquQ1IuwPqAb+yp4wEfZyE5W0gkTrZIHd+pE0ZuLkWS+RDunW1OGY6isz+3I9fVZzO
	g9HkI/M76dfEsiNjQJAhJyoenQMTxILvQ+SZ2+i3H6TNdADtoD2dppCPtq4VbBt4X/YYHIhBYCJZv
	vGW4l7ArKhBU8RjO6UfnrMcnFYYaeOvdjv4GSb1tjFU3hVNVQjpxrnF9J3FH/gpS+NoBqvlTF2ncp
	lsOSBSqizOW9he3deDCcVbuK6PAcFkfoxUi79rzCqGo8jIkLCj2aVmHor4KrH00Vtb7GL0ukV/O5K
	eoqQoJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yT-00000008rmb-0DX5;
	Tue, 09 Sep 2025 17:17:45 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxo4-00000007Bqm-03BY;
	Tue, 09 Sep 2025 12:50:46 +0000
Received: from localhost.localdomain (unknown [119.122.213.41])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2236a7561;
	Tue, 9 Sep 2025 20:50:32 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
Date: Tue,  9 Sep 2025 20:50:29 +0800
Message-Id: <20250909125029.2553286-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250906135246.19398-3-ziyao@disroot.org>
References: <20250906135246.19398-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a992e87231103a2kunm3ac1fea6a7ee9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEoYVhkYSx1DTkhJQ05JSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVPSllXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1
	kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_055044_214625_906EC71E 
X-CRM114-Status: UNSURE (   4.36  )
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

Hi,

> +			reg = <0x1 0x40000000 0x0 0x400000>,
> +			      <0x0 0xfe4f0000 0x0 0x10000>,
> +			      <0x0 0xfc000000 0x0 0x100000>;

Aligning the address for reg and ranges will look better:

		reg = <0x1 0x40000000 0x0 0x400000>,
		      <0x0 0xfe4f0000 0x0 0x010000>,
		      <0x0 0xfc000000 0x0 0x100000>;

BTW do we possibly need this?
https://github.com/rockchip-linux/kernel/commit/e9397245c4b1bd62ef929d221e20225d58467dc7

> +			clocks = <&cru ACLK_PCIE>, <&cru HCLK_PCIE_SLV>,
> +				 <&cru HCLK_PCIE_DBI>, <&cru PCLK_PCIE>,
> +				 <&cru CLK_PCIE_AUX>, <&cru PCLK_PCIE_PHY>;

<&cru PCLK_PCIE_PHY> has already been defined in the combphy node,
is it repeated here?

Thanks,
Chukun

