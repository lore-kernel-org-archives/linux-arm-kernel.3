Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32AEC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKXbEjyHyQaCZzNn06z8+/ERUuDuY6GmUlgxB6Zel4Y=; b=ijuNgSj9e4vD0BkRQ9VPbaeoMS
	u7OShpJhHRZdpAM6gSfv961c6ry8wGRp6Pfj4j25CFtNJqk6Wpn6LK90uR0dDc2ToZblbh6JmvKw2
	DVB7mOjIgdLwdvTjNi5yPhK9IXBj4uRD1oQj7bBbTDo21LqKVa04N8cLKeSjzPG2b0Xa4qtIHef0z
	uH2aZbi5Cs1ylMWCJpJE5SimDXY9ytYrW+XvrsP/wM3p8tzkyJ67zKqyeTyVcqTTz0nF2cwTZYB2F
	+U8G4CurMTD6s1hG1e50l+dvodiv2g5P/JW/TUOIVkUc34cmMK340CtPTl26h2WzEM2bVCzuRGYIL
	9PJY7m4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSCb-00000007l63-2Wnz;
	Mon, 11 Aug 2025 13:04:37 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulS9X-00000007kYj-3ZAj;
	Mon, 11 Aug 2025 13:01:29 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.215.209])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1eff292fb;
	Mon, 11 Aug 2025 21:01:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: disable display subsystem for Radxa E52C
Date: Mon, 11 Aug 2025 21:01:08 +0800
Message-Id: <20250811130108.462673-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3125650.687JKscXgg@diego>
References: <3125650.687JKscXgg@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9899388b3703a2kunm7ec5851e6449
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUodVk0eGkpPQ0MYHh5OH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJS0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_060128_071069_E56F0259 
X-CRM114-Status: UNSURE (   8.90  )
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

> What actual problem does this fix?
>
> For example we also enable on-soc iommus all the time, because they're
> on the soc and don't need board-level properties.
>
> The "display-subsystem" without users looks mostly in the same spot.
>
> So I do expect a description of what problem gets fixed that this needs
> to be disabled.

Disable the display-subsystem to remove this error log:
[    1.382440] rockchip-drm display-subsystem: [drm:0xffffa3985873555c] *ERROR* No available vop found for display-subsystem.

I will improve the commit message in v2. Do I need to remove the Fixes tag?

Thanks,
Chukun

--
2.25.1



