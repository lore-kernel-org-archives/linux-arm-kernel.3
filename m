Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F503CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tN6wzsAGq7RjiCCFfBG8fGelKCVJjjbUNe59LpMAIZM=; b=0f5N6BeC7MwZ1yCL0M+nXU7J/Z
	2JJAztdT1qmTdLhhBV/JOyw75ZUaeCqi2qCI7dAJ1PBtqs3DVR69syX51LowHRCm+G0y2dtq9nomy
	pcvAi03Hf1I7NLf1Ylqs2Qo+DRPnhFW7K/3DPYAkNNFyDlhtV6OTu8OVwr9uLjhDbsc88R/nWLnIe
	qDSNJkR1LuQz2UBXMRUCW5scjjfyRcBQgKXMXuv/Zcesm7x5pEYpK1TysHE2Gm1PNcPe6wVwBHa8i
	aNqVQUJ2Ouqbe6QlkIarOrgRjg28AR3YXB3mvt/99OJO95ixo9aa6GXPOiKDZs3ZczX3WM6HNY/xf
	jao/meww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9i8-00000009kzi-3hjx;
	Mon, 12 Oct 2026 06:40:36 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9i5-00000009kyG-25Qz;
	Mon, 12 Oct 2026 06:40:35 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50af51f8a;
	Mon, 12 Oct 2026 14:40:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: shawn.lin@rock-chips.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa E54C
Date: Mon, 12 Oct 2026 14:40:10 +0800
Message-Id: <20261012064010.1837103-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
References: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa12ed733ee03a2kunmf7c7b69346eed7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUsfVhpPTEJKHUpNSE0fGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_234033_710797_540D0B04 
X-CRM114-Status: UNSURE (   7.63  )
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

> I was checking all PCIe part of rockchip dts files and wondered why it's
> marked as an always-on regulator. But if it's actually not, it'd be 
> better to improve it later. That would make reset rootport mechanism
> work better.

Please refer to page 21 of the schematic[1]. The 3V3_PCIE regulator
is enabled by the PMIC and cannot be controlled by the kernel. So I
think it's correct to mark it as always-on.

[1] https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf

Thanks,
Chukun

