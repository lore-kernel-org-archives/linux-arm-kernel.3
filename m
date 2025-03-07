Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09253C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RLRanI6ziv/xyKtMlhVGxzVGDrOURWtA7k8cznIXCo=; b=iPgsIe4iM9yHIwZcveLDetl6YS
	FyONfDCduWr0Ogz/4dxj38sv5EbyBQn+hxmRa6G8+NtTlxvztjnitJrl9EaJdlanWD606GsCTGOcE
	HkuyPx4rJ+7Vn4yEcwYbCHSao3n7Zs8lFtZmi37gxZXYZfUNvBIoQQRJC1u/ojiKgT1ayF/q6xMpW
	vjbiAabskzv13LfGXAQ+Cd9wcuCljqdxjMkGiQr87WUBLIlQ6n3Qx3nh7pRwy57kcHLbZVVsKRa18
	Bk6qsua1kSTJkHbk1hw31XBSzFu6pA6Y0hE6NRftY5vk0oWV0yswKmByVj61Gb+BhXbVANNSZ9Unb
	Tsead1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRYx-0000000DMa0-3lJa;
	Fri, 07 Mar 2025 06:52:03 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRXL-0000000DMOz-08tk;
	Fri, 07 Mar 2025 06:50:24 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:bb12:a0a3:40d:e82f])
	by smtp.qiye.163.com (Hmail) with ESMTP id d4e0a9b3;
	Fri, 7 Mar 2025 14:50:17 +0800 (GMT+08:00)
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
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Fri,  7 Mar 2025 14:50:15 +0800
Message-Id: <20250307065015.697377-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <281b8025-8288-4274-b863-f091c05cbabe@kwiboo.se>
References: <281b8025-8288-4274-b863-f091c05cbabe@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHh1OVhpMTk9CSklCHk1PS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBGRlKSUEaSxpIQU9LH0EeQ0kdWVdZFhoPEh
	UdFFlBWU9LSFVKS0lIQktDVUpLS1VKQlkG
X-HM-Tid: 0a956f5e7a9803a2kunmd4e0a9b3
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Vhw4NDJWNjdCVh4tT0IO
	GDxPCRFVSlVKTE9KSEhLSUpDTkhNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0EZGUpJQRpLGkhBT0sfQR5DSR1ZV1kIAVlBT01PNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_225023_247615_A65F0492 
X-CRM114-Status: UNSURE (   4.72  )
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

> This is new compared to v1, please add operating-points instead.
> cpu_pvtpll is already initialized to 1.2 GHz by firmware, see e.g. [1].
> 
> [1] https://lore.kernel.org/u-boot/20250123224844.3104592-5-jonas@kwiboo.se/

Thanks for this information, I will remove assigned-clocks.
However, due to unknown reasons, the cpu opp-table does not
match the actual frequency at all.
e.g. set 2016MHz, actual 1610MHz

Thanks,
Chukun

-- 
2.25.1


