Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DECECEB2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNnrZR0zI4lJMA+fv0lDsJcoCn1Kwm1I2wOTJ0jEJ2Q=; b=xQfWYd/kbiBEiKV0ryh9+gsZLF
	liM9Inrt1PdscFP0eFLuvenFPz3ZP79bNE4I0E0GYbbXHRLE2V73T0RJ6tQYtklYzA3pMy6c99/XE
	DOfDJwEr6CtSUyESmOVEqRLdYh8QaGplALz2oID76S7elXBQHM/BFP//QaL35Rq1p6U9BwCJFTdnv
	Xh8lOdbALkUZwXmJWpVte5I8uAiCsqCSgF4f8v/g60YHT6DZnXT61L268FYZu6O15m297gCYPsxQo
	fRGaV4PxUfl/uMjlNNndawVHpsK/XwDWv4/MF6Ii7CTfOnxVRP7UaZZbfxcu4K6IuoTu/oAdvaNWK
	5Us47Dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHqJ-0000000Ds7h-2Bda;
	Sat, 15 Nov 2025 15:05:35 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHqE-0000000Ds78-43Cq;
	Sat, 15 Nov 2025 15:05:33 +0000
Received: from localhost.localdomain (unknown [116.25.95.231])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29b1c85f7;
	Sat, 15 Nov 2025 23:00:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: (subset) [PATCH 1/6] arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
Date: Sat, 15 Nov 2025 23:00:10 +0800
Message-Id: <20251115150010.1052575-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <176307502906.495066.9339764118786240746.b4-ty@sntech.de>
References: <176307502906.495066.9339764118786240746.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8808101203a2kunmc099134524c7f0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGkMZVkIfQx4aHksZSh0YSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUhKWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_070531_229374_8ADBB01C 
X-CRM114-Status: UNSURE (   4.92  )
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

> Applied, thanks!

> [4/6] arm64: dts: rockchip: fixes supply for 100ASK DshanPi A1
>       commit: 621bb09a76fa12a9e61c9d745ae524db86abf781

Sorry, I don't know if this is a problem:

The commit message started with an extra ">".

>From the schematic, the supply of ES8388 chip and the vmmc-supply
of SD card both originate from the VCC3V3_S0 regulator, fix it.

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=621bb09a76fa12a9e61c9d745ae524db86abf781

Thanks,
Chukun

