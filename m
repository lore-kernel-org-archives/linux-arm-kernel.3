Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D474CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xezK6VSpCX5KzCsjYr+3cAxbBD71MEfscv32f7luUYI=; b=FPQC5D39zCNwAw2n5Q+BVdUDvA
	mPXD8LHP3Gg2enXZZdkdKU+u1yOkoxInMmJg6fZ8TnOJoI7FbnM6aZQ8u028kztGGvSx3efnF/WNl
	bHzzXrvStWqIPo+bLUBOM9kBO2ufBxtzefvJOsVY0bFlpEYs8H/1uPE2waiCXVLKVqcop6KmSSdKW
	wpolcmAN64KKH1EmgGzYsqPcJ36NkY4Ep7Do0g4GdgVqH4/5q9dAN8+MPfUMIbKuQAmTfI3GqmrE9
	/GqzwIt3ILR998UJ7hAPsb29FsvTqNWNIx+U8mVNAKQTvAHMUTEvO98FzYdaWyklmNoWrFks4C2Mx
	mb4S4Sdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwO-00000009Q1Q-3uRq;
	Thu, 17 Jul 2025 07:22:04 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIcB-00000009MJb-121a;
	Thu, 17 Jul 2025 07:01:14 +0000
Received: from localhost.localdomain (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c51d5e06;
	Thu, 17 Jul 2025 15:01:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: alchark@gmail.com,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Thu, 17 Jul 2025 15:00:06 +0800
Message-Id: <20250717070006.192765-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b6f8f705-f661-46cf-9dda-6f18f8658622@kwiboo.se>
References: <b6f8f705-f661-46cf-9dda-6f18f8658622@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSB4dVk5NSEodTkIdS0IfTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a98172fcc3d03a2kunm2d7d78618f0743
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Axw5IzE4EQMyDzVNPC4B
	LAMaCkNVSlVKTE5JTEhOTU1NTExMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUpDSllXWQgBWUFKTk9JNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000111_465274_D7208533 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Jonas,

> One possible difference here is that the actual CPU rate is controlled
> by a PVTPLL where TF-A will configure a osc ring-length based on the
> requested rate and Linux only configure the regulator voltage.
>
> I have no idea if the configuration made by TF-A will have any affect on
> power usage, but I suggest we keep all opp here because both TF-A and
> Linux is involved in configuring the CPU rate.
>
> The measured rate can typically be read from a PVTPLL status reg, it
> will be different depending on the ring-length, voltage and silicon
> quality for the rates >= 816 MHz.

Alexey suggested that we remove 408MHz, 600MHz and 816MHz from the
opp-table. Do you think it is acceptable to use 850mV for 1008MHz?

Thanks,
Chukun

--
2.25.1


