Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8F9C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82l4MbG29GiEfxa4H5OGixhFpLrK6s/53Pmu1HgGTow=; b=BfoVyo85aDE8s+qGel4eGXl7f1
	aJ7xthuYAP9INc38f8GpuEneNc7cpRd1pZIA4Y3am7+z1svdt09/VbM6XLdTXwV/4b1bVEkqFf7an
	5xbnQi4oc/dUH3ARaBaJchp1MB6RC3LPDT4S3LDsZCNHps7cg7iPm8KHNsewHeDUzdMlxaAKWa4Rw
	+m2Akehv/AEEmcXsw4BIHWqUhhBIucE2Av6JCTWBTR1LgaOtvayTQRkPjQ2JgMmSPn4LeUl/+5ppU
	09l+rUBO5iXIFUBLliOVUnflK+VuSAvuOXRj2EXjyNsjpUFDHsbGw53t7zetXBUAOWc+ohZ1V9xRR
	VaKlPKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENCw-00000008aWb-0wAU;
	Mon, 12 May 2025 07:04:14 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN97-00000008a4E-0uL6;
	Mon, 12 May 2025 07:00:19 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c03:9b0:a65:40ce:ae50:9398])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14b61caf7;
	Mon, 12 May 2025 15:00:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: didi.debian@cknow.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Mon, 12 May 2025 15:00:09 +0800
Message-Id: <20250512070009.336989-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
References: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRkfVkJLHkJCGB4YHk0fH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtIQUIZS0EaTU5BT0sYHkEaHk5LQUJIQkNZV1kWGg8SFR
	0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0tZBg++
X-HM-Tid: 0a96c34b42d603a2kunm14b61caf7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6Tzo5IjJMCU8#OApPLBhL
	HykKCRBVSlVKTE9MS0hISUpJQ05PVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0hBQhlLQRpNTkFPSxgeQRoeTktBQkhCQ1lXWQgBWUFJSENJNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_000017_424091_DF0250BF 
X-CRM114-Status: UNSURE (   8.53  )
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

> > With this patch I get the following kernel warnings:
> >
> > pci 0001:10:00.0: Primary bus is hard wired to 0
> > pci 0002:20:00.0: Primary bus is hard wired to 0
> >
> > If I 'unapply' this patch, I don't see those warnings.

> I was pretty sure I had seen those messages before, but couldn't find
> them before. But now I have: on my rk3588-rock-5b.

Thanks for the reminder, I didn't notice this before.
The BSP kernel also has this warning.

Before this patch:
[    2.997725] pci_bus 0001:01: busn_res: can not insert [bus 01-ff] under [bus 00-0f] (conflicts with (null) [bus 00-0f])
[    3.009990] pci 0001:00:00.0: BAR 6: assigned [mem 0xf2200000-0xf220ffff pref]
[    3.018100] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
...
[    3.401416] pci_bus 0002:01: busn_res: can not insert [bus 01-ff] under [bus 00-0f] (conflicts with (null) [bus 00-0f])
...
[    3.545459] pci 0002:00:00.0: PCI bridge to [bus 01-ff]

After this patch:
[    3.037779] pci 0001:10:00.0: Primary bus is hard wired to 0
[    3.044120] pci 0001:10:00.0: bridge configuration invalid ([bus 01-ff]), reconfiguring
[    3.053362] pci_bus 0001:11: busn_res: [bus 11-1f] end is updated to 11
[    3.068920] pci 0001:10:00.0: PCI bridge to [bus 11]
...
[    3.451429] pci 0002:20:00.0: Primary bus is hard wired to 0
[    3.457793] pci 0002:20:00.0: bridge configuration invalid ([bus 01-ff]), reconfiguring
...
[    3.535794] pci_bus 0002:21: busn_res: [bus 21-2f] end is updated to 21
...
[    3.612893] pci 0002:20:00.0: PCI bridge to [bus 21]

Looks like a harmless warning.

Thanks,
Chukun

--
2.25.1


