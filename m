Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288CEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS7qIawT7BLaK5uG/0KurP4U2L9A5tf8t+yDnaWlrwY=; b=2cuJr9i9b8CPfk/02QE/tOle75
	KUCUljRlvsonovzamQVfD1iHxoU9skgrsmKPV+j3mp5zb9B9Zubba2zfK5kpNMj6uCPuVx+NNR2yV
	QCq+YW3cfP0uyo/R7fqqgan8L+jPzC40zqs+dm7OekAyS0jZS7jmnVrWZqW7n+P+jrdqFqfCfiWpn
	942teqSj4W9xri2VWy9kGCsdS2d/3ifiGeXmS1TZyShah9ls34l/Xx0Z17s7jW7WnhhBhX/oBwhai
	fG47HmBFU+VxwWAa1wHNQ8Z2PAPdfjhX4uG831CCg/kqTGSoYRhIiP1FQR1DF23DSAoalR3kgt3lJ
	P3J91TtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPAh-0000000D6MF-3K10;
	Fri, 07 Mar 2025 04:18:51 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOUX-0000000D03V-1Hrc;
	Fri, 07 Mar 2025 03:35:19 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:bb12:a0a3:40d:e82f])
	by smtp.qiye.163.com (Hmail) with ESMTP id d41b6403;
	Fri, 7 Mar 2025 11:35:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
Date: Fri,  7 Mar 2025 11:35:08 +0800
Message-Id: <20250307033508.656479-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305194638.47187-1-ziyao@disroot.org>
References: <20250305194638.47187-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHk5NVh0eSh9ITk0YGhpLS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBGRlKSUEaSxpIQU9LH0EeQ0kdWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a956eabdd2903a2kunmd41b6403
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTI6TBw4VjJLPjBJHAg0E0gJ
	SDgaCypVSlVKTE9KSEpDTkpJQ0xCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0EZGUpJQRpLGkhBT0sfQR5DSR1ZV1kIAVlBSkxMQjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193517_506103_DA6B1F1C 
X-CRM114-Status: UNSURE (   4.32  )
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

> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	no-sdio;

With 'no-sdio' property:
[  129.608986] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
[  130.711168] mmc1: Card stuck being busy! __mmc_poll_for_busy
[  130.725536] mmc_host mmc1: Bus speed (slot 0) = 300000Hz (slot req 300000Hz, actual 300000HZ div = 0)
[  131.751240] mmc1: Card stuck being busy! __mmc_poll_for_busy
[  131.765608] mmc_host mmc1: Bus speed (slot 0) = 200000Hz (slot req 200000Hz, actual 200000HZ div = 0)
[  132.825083] mmc1: Card stuck being busy! __mmc_poll_for_busy
[  132.839413] mmc_host mmc1: Bus speed (slot 0) = 187500Hz (slot req 187500Hz, actual 187500HZ div = 0)
[  133.960141] mmc1: Card stuck being busy! __mmc_poll_for_busy

Without 'no-sdio' property:
[  105.224019] mmc1: error -22 whilst initialising SDIO card
[  106.290838] mmc1: Card stuck being busy! __mmc_poll_for_busy
[  106.801931] dwmmc_rockchip ffc30000.mmc: Busy; trying anyway
[  107.385835] mmc_host mmc1: Timeou sending command (cmd 0x202000 arg 0x0 status 0x80202000)
[  107.400425] mmc_host mmc1: Bus speed (slot 0) = 300000Hz (slot req 300000Hz, actual 300000HZ div = 0)
[  107.431561] mmc_host mmc1: Bus speed (slot 0) = 49800000Hz (slot req 50000000Hz, actual 49800000HZ div = 0)
[  107.433107] mmc1: new high speed SDIO card at address 0001

# cat /sys/kernel/debug/mmc1/ios
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    2 (sd high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)

Thanks,
Chukun

-- 
2.25.1


