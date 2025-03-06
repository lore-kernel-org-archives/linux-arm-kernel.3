Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB9EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ua5DCZ5PQyqexIEi4F/VXlc4Zbzv9VUHqW8QK+b0sM=; b=y11DgXJChPZre+8TUnzkA2zmOl
	WDrGhKl7Rr5o5gSJLaxObQF4MIlb3iTWSbfFkx8NXfJlo3MWZTDXD9x/6FP6XVNctzdVwx7rEuNdD
	3MP2K0j2dG1feNu0pTVZ/NPuhaS7PnoX7q1JsVDB1GOS22H7RAAOI9rlgQhMZsvEoxJOuEZWd3j+J
	VpRG4balHdNPn7ErF/bSDgik/mqUUwn4l4I+eLk4TpeAd8MKeu0YflIUDeqpKgutYjjlu8mw9q+Tr
	R3cpJ0F0eRKdUZpXrJGu2nks4PMTSgvNU50/t67sKXrQuYQ513S2qv66McXIIoYl2hWrtPJANowK8
	d0PW6hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBJN-0000000B3ro-2ZZR;
	Thu, 06 Mar 2025 13:30:53 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAzb-0000000B0bz-27aj;
	Thu, 06 Mar 2025 13:10:29 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2ca2cef;
	Thu, 6 Mar 2025 21:10:24 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu,  6 Mar 2025 21:10:15 +0800
Message-Id: <20250306131016.281290-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUoeVk0YSksZTk1JGUJIHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a956b941f9d03a2kunmd2ca2cef
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQw6EAw5KTJWTTMWTkI6Di8x
	PBMwCTxVSlVKTE9KSU1NTUlOS09KVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUxISjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_051027_705948_E3DA8A8B 
X-CRM114-Status: UNSURE (   4.15  )
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

Same as RK3568, RK3528 uses SCMI clk instead of standard ARMCLK.
Add SCMI clk for CPU, GPU and RNG will also use it.

dmesg:
[    0.061333] scmi_core: SCMI protocol bus registered
[    0.125780] scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
[    0.126628] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    0.127233] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0

CPU frequency: ~# mhz
count=611657 us50=19994 us250=99945 diff=79951 cpu_MHz=1530.080

Chukun Pan (1):
  arm64: dts: rockchip: enable SCMI clk for RK3528 SoC

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.25.1


