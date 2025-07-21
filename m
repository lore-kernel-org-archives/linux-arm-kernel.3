Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FCEC87FC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XjTvaaIQBfcTC1bFQF5CN2GqUwPleoMdB1Joaei7eo=; b=Ex6obLAZZRp2SUIyJ6+LtxITw7
	B3J5fV38JPYKApw+9+BuIWc6NqTT2OIpSfCJWCz1q0mrtwYX7ouOPMBtSlsBfbz0BgzJNZHJdtcHn
	sWIs4GjC8M55to3INg/8LbK2NF6q4n6R8plIYk0T2lYp5sbQanVp5V0lK2XbtMglxeGwIFqena/Ai
	TUI8C9XnB20FEVSGPqbp2iLADBMIaYRaR2KwuSbGfKvjd20QCKbXg7Dt0Sy2raa0RqG01pTEBAoa6
	9MKkg6oSIYYLL9ua1xYuK46KwospvOLriLJ5HuFTFbnGSNTJcvc3sbZ6CSNS78Hb3EOqDJPcxK+YG
	ixkK39wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb0-00000000BpM-0Uuq;
	Mon, 21 Jul 2025 16:42:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udr4I-0000000HS2A-3zeG;
	Mon, 21 Jul 2025 14:00:40 +0000
Received: from localhost.localdomain (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1cbe85dcb;
	Mon, 21 Jul 2025 22:00:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: knaerzche@gmail.com
Cc: amadeus@jmu.edu.cn,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2
Date: Mon, 21 Jul 2025 22:00:16 +0800
Message-Id: <20250721140016.308800-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3c83e8cc-9ef0-4560-b6d7-127abab50541@gmail.com>
References: <3c83e8cc-9ef0-4560-b6d7-127abab50541@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a982d491b8e03a2kunm89436e991815c0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0IaVkseGRgYTksZTU8ZTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_070039_184481_139D6AE3 
X-CRM114-Status: GOOD (  11.23  )
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

> I'm not sure where you are getting your information from, but as I told
> before I actually *own* this board in the non-development version and it
> has an RK3528 SoC/silkscreen - I just was too lazy to photograph it my own
> but I did now [0]

I have the MangoPi M28S, M28K and M28C boards.
The M28K board does have a silkscreen of RK3528A. [2]
Regardless of whether the silkscreen is RK3528 or RK3528A,
U-Boot reports that the SoC on these boards is RK3528A. (via OTP [1])
So one possibility is that Rockchip forgot to update the silkscreen.

Comparison chip block diagram:
1. Earlier version: https://docs.armsom.org/img/sige/rk3528.png
2. Final   version: https://docs.radxa.com/img/e/e20c/radxa-e20c-chip-diagram.webp

The difference seems to be that RK3528 uses I2S while RK3528A uses SAI.
But from the updated diagram here [3], RK3528 also uses the SAI interface.

Rockchip BSP does not make any distinction between RK3528 and RK3528A,
so it is meaningless to continue to worry about non-A versions.

[1] https://github.com/u-boot/u-boot/blob/master/arch/arm/mach-rockchip/rk3528/rk3528.c#L131
[2] https://x.com/mangopi_sbc/status/1847851624804602316?t=5hwScxgwCAAid0eCJgrP5w&s=19
[3] https://x.com/mangopi_sbc/status/1785115827437760769?t=H5PXRDwbjOfBYa7QotjIZw&s=19

--
2.25.1


