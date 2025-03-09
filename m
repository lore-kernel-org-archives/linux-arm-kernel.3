Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53301C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUj28GiLfWFSo2k9pXnAX03YNCfW+JMP3r1ToUJNDAc=; b=zLRLDVCU3wMdVA9pPlcR+XtUT9
	y3ASfxhzFnmpIdMqlhfmmDilCs7PS6Qat9CjPCCKRfKzj/2OogaJ9UC3/knNLnJC/xMidAAe/JGCh
	3ywsph1zip3sW5GxlB5nXcKBb/wHYAiaTXsab8kjGyCaA7Nct6Grt9s/Q9HzBZ4+xwvr5h/3ExW2I
	7i+8p092cEL0dPOGCdTvm5BcmbozlWnZ/Ofd60vBhXBljZVQDa6+0TGZAWZdH1BjeTvQ2mjpWExZo
	eFTkAu3WR5/oOiUxRAMu9tTOG7PKZ+Ju0h6ue/6J1lrMY1Aa3d9ENrTGByP8WLtYoJg2iLoG5B0Uz
	DijP7szA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trBc2-000000008Tm-0Ocx;
	Sun, 09 Mar 2025 08:02:18 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trBaO-000000008Jj-0rV4;
	Sun, 09 Mar 2025 08:00:37 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id da0595fb;
	Sun, 9 Mar 2025 16:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	andi.shyti@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Sun,  9 Mar 2025 16:00:25 +0800
Message-Id: <20250309080025.15825-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250309070603.35254-3-ziyao@disroot.org>
References: <20250309070603.35254-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR0aVh4eGEJKSk9DGEpMQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a9579eb7c2703a2kunmda0595fb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6Mzo4LjJPCC8fKSIoHjQc
	ARxPCixVSlVKTE9KTktMSUhKT09DVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU9OTTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_000036_417831_96F4DA0B 
X-CRM114-Status: UNSURE (   5.51  )
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

> +		i2c0: i2c@ffa50000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa50000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;

It would be better to add default pinctrl for all i2c nodes
using m0 group. (Only 1 group of pinctrl for i2c4 and i2c7)

Thanks,
Chukun

-- 
2.25.1


