Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4374AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+zrXcLiKWo9n6nY9lEQJMwv9BX5LAeu/9hpwNJIHjc=; b=TCKMu4s4sqlxh4+ytPVdee6Gy0
	+WTdvfNMc5uxHifqPXxSyZ/o5aQJTF8T2oBDLRXpC9Yq2uwIjO8tozv78516JMy8Wd/oWpFvNAJuT
	mYCYcI52snhmx84iDdvpfoo3TmNDHZPaSVT/0Kjx7H2k6cgETvRSS4byxlNwMe3ReTcanTWFc9dRz
	NKDeXP9MeJ1J3fXAv7EAqH/jf+MO4eXrQXla+c6H8lnHScqpKW7TSqrCWZCZ3pB9xV83aHIsW/hTE
	afmwzghJk76MuB/L1JaETnpKQ0mop+OUH/YXnYB5f3hEZiKgEogydRFIczw/mfH+qKZCjlTiNT9ji
	pqve9cbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u639X-000000010gL-2huE;
	Sat, 19 Apr 2025 08:02:19 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u637c-000000010XQ-1vxs;
	Sat, 19 Apr 2025 08:00:22 +0000
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 126b5e5d2;
	Sat, 19 Apr 2025 16:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Sat, 19 Apr 2025 16:00:01 +0800
Message-Id: <20250419080001.16514-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bcedff66-26e4-4630-88cd-6ab9fbcf5598@kwiboo.se>
References: <bcedff66-26e4-4630-88cd-6ab9fbcf5598@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQklMVhpJGB9OGkMeSxkZTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSktLVU
	pCWQY+
X-HM-Tid: 0a964d0fd4e803a2kunm126b5e5d2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OD46Eyo6IjIMKA8PEzYdSiEO
	VjYKCxhVSlVKTE9OS09CTUtNSkhKVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFJSU1NNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_010020_722648_2E0D6979 
X-CRM114-Status: GOOD (  12.88  )
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

> There is only one cpu cluster on this SoC, I suggest we name this node
> opp-table-cpu with a cpu_opp_table label.

Sorry for the late reply, I was sick a while ago.
Will do in PATCH v2.

> Both 408 and 600 MHz freq will use a normal PLL and based on the vendor
> opp-table there are chip variants that presumably require 875000
> microvolt.
>
> Because of this 875000 is the lowest microvolt we should use in the
> entire table, to ensure all chip variants can run stable.

Running at 408 to 1008 MHz frequency under bsp kernel, one
of my boards voltages is 850mV and the other is 875mV.
I will use 875mV here instead.

> For remaining freq TF-A will use PVTPLL and configure an osc ring length,
> then the voltage supplied in opp and chip quality will determine/limit
> the real cpu clock speed.
>
> This means that the voltage used is less important when it comes to
> stability. However, we should keep 875000 as the lowest microvolt for
> all opp above.

According to your suggestion, I will use 875mV for 1008/1200 MHz.
Maybe it would be more appropriate to use 900mV for 1200 MHz.

> The voltage for remaining opp does not matter, historically mainline
> picks the highest voltage from vendor tree to ensure stability. With the
> use of PVTPLL that should not really be an issue, and we could pick
> voltages that will give closest speed for majority of users.

Thanks for your suggestion, I will keep this part (> 1200 MHz) unchanged.

Thanks,
Chukun

--
2.25.1


