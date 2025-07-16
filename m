Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993D3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBBJOOJQAkKxqQu/HK1yEFouftDahuSZhBNcvDUyMi8=; b=KWXfC+cud0RdR+4O0gJejuNEQc
	S6PuD/7X6LFTViCicTjmP1Uh21rm6Vi6s8St0UXuKAvnktIChcKg4mo25awRwecsA9Mz0kaJj/+OA
	1gW0AkITXxtwnZMWPlMlR6Qyb/JC0/9A8x67PGhq10C0YP0+CMsz+a3poTeLGl0u2aCoxG5T79dNj
	I3uwTF9MKvXCl45Ndf4lnc4PZ/aUz+ru/ewRCHkZ/KJxCBReEww9m0NtHKgsO9Op9kGMUeI9Qeqs2
	EtAZSh9DHEgBIMc5ZLYba4N4tg4Et7W6BcIQIKHNxccX5qNoI3ZOwjLRNMNEkY8S/jNbIyPPfohCr
	i25lxZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwM1-00000006yxr-2R4m;
	Wed, 16 Jul 2025 07:15:01 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwCy-00000006xkb-2Yl0;
	Wed, 16 Jul 2025 07:05:42 +0000
Received: from localhost.localdomain (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c2e61632;
	Wed, 16 Jul 2025 15:00:32 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v3 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
Date: Wed, 16 Jul 2025 15:00:25 +0800
Message-Id: <20250716070025.236160-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9050b4fe-ce69-4f93-9093-5461a6aa052f@kwiboo.se>
References: <9050b4fe-ce69-4f93-9093-5461a6aa052f@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGRhJVh0aHRlPS0lOTR5MGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVU
	tZBg++
X-HM-Tid: 0a981208f05503a2kunmaae0551a86f5ff
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6TRw5CDE6Sg8tLUJLS0lJ
	ORkKCzZVSlVKTE5JTU9CSUhPT09LVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUpDSllXWQgBWUFKS09DNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_000540_802393_CEE4B3F9 
X-CRM114-Status: UNSURE (   6.74  )
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

> It mention 'not used in combination with eMMC or SDIO', yet I see
> multiple boards where disable-wp is currently used with eMMC and SDIO.

This seems to be a DT bug introduced from the bsp kernel.

> Do you have anything else to remark before I send a v4 with this prop
> removed?

No further questions, thanks for your work.

Thanks,
Chukun

--
2.25.1


