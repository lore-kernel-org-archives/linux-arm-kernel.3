Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803AFC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmppFljXRZvIHKczzxdAMuT4XhNPRgoX6GAn2af4BHo=; b=2Oa7s+ghXgkxYxZzRcfxwuVa88
	1t8uJMSmbh5/6BqkuL7Xs1JHI0p0LKnASVMvq+E73bLD5lKeycq1Ko5FEzji1VgZCLy6V4A12wW6i
	3vYutVjS3/TL5xnPwdEzvVmDeVUsPC5iAyXVzup+qjKvFcX+65O9on74kCe6nMKFo5Yh72BG0ALoh
	h/XEfG/dr/Cn0B9u2yqpkolSEBtXVhWga6DEtW5j3DlBHwJDakGQ7kDc6lN0kLdSKYEC3pN5j3huO
	SvB7NLz2d6lungVTpzkuvnYmMPxbBSO0bahG4hioQH5rUSIF2p/1xabaxNzSIe1/EtjD1u+VlUKsX
	WzmF2lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFp6Y-00000002dCz-1zZ4;
	Fri, 16 May 2025 07:03:38 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFp4O-00000002d0v-3YfW;
	Fri, 16 May 2025 07:01:27 +0000
Received: from localhost.localdomain (unknown [119.122.215.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15416c95d;
	Fri, 16 May 2025 15:01:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: kever.yang@rock-chips.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	finley.xiao@rock-chips.com,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Fri, 16 May 2025 15:01:06 +0800
Message-Id: <20250516070106.653870-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509102308.761424-5-kever.yang@rock-chips.com>
References: <20250509102308.761424-5-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR5NVh5KSh5DSkpOS09CTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJT09ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96d7e5a5d103a2kunm15416c95d
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRg6Pio5LTE9PjYhLzMYOgxL
	Tk5PChFVSlVKTE9MSExDQ0xPTUhIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUlPT1lXWQgBWUFJS0pJNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_000125_056103_C8ED663E 
X-CRM114-Status: UNSURE (   7.76  )
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

I posted to the wrong thread before, so I resent this.
Sorry for the noise.

> <snip>
> +		pcie2x1: pcie@ff500000 {
> +			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
> +			bus-range = <0x0 0xff>;
> <snip>
> +			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";

I noticed that the bsp 5.10 kernel said that pcie only has 8 MSI vectors,
[1][2] but in the bsp 6.1 kernel it changed to 32 MSI vectors [3].

The rockchip documentation also says there are only 8 MSI vectors:

[4] Page37 8.8 "RK3528/RK3562/RK3576可分配的MSI或者MSI-X总数是8个"
Translate into English: "The total number of MSI or MSI-X that
can be allocated by RK3528/RK3562/RK3576 is 8"

We noticed this when supporting rk3528, so which one is correct?

[1] https://github.com/rockchip-linux/kernel/commit/4f0c9ccc79c373aa97084b3b1ab0651ca4248227
[2] https://github.com/rockchip-linux/kernel/commit/afb85c759cfadc4051c42a9703860071a9877f2e
[3] https://github.com/coolpi-george/coolpi-kernel/commit/522b94122ec797760dcd466851250cbdfafff50f
[4] https://github.com/ArmSoM/rk3506-rkr4.2-sdk/blob/main/docs/cn/Common/PCIe/Rockchip_Developer_Guide_PCIe_CN.pdf

Thanks,
Chukun

--
2.25.1


