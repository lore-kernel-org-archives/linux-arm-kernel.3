Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B9C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQNLb2VdeLymYHoIB35Mr/oeulXdUxcFGm3o+sGKWKo=; b=nwhjbwlPOWKLpsq/64KjlXYQxa
	A5YNvRPxNXg8TQ/7MaKSAyX2GCVio9bvA2MEvGv7lAQXpH6ZpEZ/6ZR5FMhpvDOkBO+D08PBsYDfD
	kk3uNPSDq/i9B3oF+EiNx02u++PxGNB+39k221A007xB5vb1UqdSW5989h0Ci55QDxQO7uqM/aspm
	WVbBOyqTcyrMOmM42SFifX0QFnyLeCvX93plc1bh0+8BS9/06EfaKk37EM/ZHl3jcXsHjMCbxHnHi
	JpHZ+OpZvxORpZV5CbPtCLlnpeYSvNxXIkWVqv6UjPzsWw9LhTjYJl+Wz6avAp8O6pCCIgUbmIzD4
	upsDxGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwGi-000000003x1-468u;
	Thu, 08 May 2025 08:06:12 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwDr-000000003i1-2J5b;
	Thu, 08 May 2025 08:03:17 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.215.106])
	by smtp.qiye.163.com (Hmail) with ESMTP id 145c271ec;
	Thu, 8 May 2025 16:03:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: lkp@intel.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Thu,  8 May 2025 16:02:00 +0800
Message-Id: <20250508080200.13940-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202503221203.7E0Oa0zG-lkp@intel.com>
References: <202503221203.7E0Oa0zG-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh8eVk8ZH0lCQx1NSh1JH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVKS01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpMTElVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96aeeb71cc03a2kunm145c271ec
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORg6IRw5GTIDAQ9ONBRIASIQ
	A04KCypVSlVKTE9NTUJKSENDTE9JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUpLTVlXWQgBWUFKSUNJNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_010315_743468_06CA73E7 
X-CRM114-Status: UNSURE (   6.69  )
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

> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on linus/master v6.14-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

commit f15be3d4a0a5 ("arm64: dts: rockchip: rk356x: Add MSI controller node")
is already included in rockchip/for-next. Do I need to resend this patch?

Thanks,
Chukun

--
2.25.1


