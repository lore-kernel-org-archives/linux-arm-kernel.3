Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B76E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05QWypxU2Bb5V1uzOv3IQBSkPFWbK3icAmMf2fZ/Xy8=; b=GyI5N2ttHaDIOO8f0U3zsrVaua
	CZqyo1ZS02v5DGm50X12ZBmekZghy82YvKvVqnhALKx4ZOcjvJjeBhQjwhHzbZ/M6pSixX613IsKI
	GDwIXHpiu0opgq6ZrVMX9smMccTyEnG9EtAKIP+w6ZW297GQXT0sM4A4IRe/j9WrdDKMckTnCDghI
	dulY42cXCVYQxEFncqjX2ksA8FUXgO7PTnfQRpCbVqRNzOJ9ZlCQ+xHpvGRRwi2Y5ZeTnovsV9dNg
	aojEx4TYcsks9rPmYJcGjyQO4copuvTklDSHuwHjTA2u0ta6QagxWormw5mHc2WO9pVKru0UV19w5
	8RNdKDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsiw-0000000AMfd-38Cl;
	Wed, 15 Jan 2025 02:01:38 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXshh-0000000AMWr-0JVh;
	Wed, 15 Jan 2025 02:00:22 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:1f0:6a66:664e:ef87:7f44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 8b43c33e;
	Wed, 15 Jan 2025 10:00:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	naoki@radxa.com
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on Radxa E25
Date: Wed, 15 Jan 2025 10:00:06 +0800
Message-Id: <20250115020006.10336-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d7b2e993-c6c8-4e60-bfe2-80857ca8a992@kwiboo.se>
References: <d7b2e993-c6c8-4e60-bfe2-80857ca8a992@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTE9CVhpIHh1ISEtDHk9MQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUodS0FNGk1NQU1NTx5BHh1DTEFMHU9PWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a9467b0878c03a2kunm8b43c33e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06TRw*LTIcF08sMQoDFz4C
	LitPCxVVSlVKTEhNQktNT0pLTkNDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSh1LQU0aTU1BTU1PHkEeHUNMQUwdT09ZV1kIAVlBTEpINwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180021_312782_C0BD09EC 
X-CRM114-Status: UNSURE (   7.96  )
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
> I would advise against using any sd-uhs- mode for sd-card on Rockchip
> RK356x boards because of a timing issue during boot between mmc,
> regulator and IO-domain drivers.

This problem seems to occur only on rk356x?

> Ideally this race condition should be solved instead of limiting use
> of UHS modes. However, use of sd-uhs-sdr50 is typically more forgiving
> and has been used on other boards.

It seems that sd-uhs-sdr50 does not need 1.8V IO voltage.
I tested the speed on a rk3528 board with sdio wifi:
(The IO voltage of sdio on this board is 3.3V)

highspeed: 170Mbps DL
sdr50:     290Mbps DL
sdr104:    290Mbps DL

So sdr50 should be safe.

Thanks,
Chukun

-- 
2.25.1


