Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55506C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vF3X/CedakQUj2jxmzUnDtZmyHB9OptetMXDAIyUFeE=; b=3yr0eJNLuOxlwyLR0TdF8PoWvx
	5UiZmpHu4hLWmChHvzE+Ox7tWw4+88VB/Bd7I54ZFWGUUaVhxCypDrHYwkA0TU2oHrT8i8j5l6dt/
	ccKqQ7xIcxSjkp3jSbh8YEOVq6vOAbxdKICpx0ZgkSZQFMt3pjH+FZCd0ktK5UJpXNykowPb/7QwD
	gNxa1IccZkSzGm4tO4UMEpyCsNMwIDcz34+nSbqNoK0m4+1uWdEzRT2DBOlSvGZep3kguk2Bh8ibq
	Lzsai7jphFO5Qt+EV4/yT3CFANyciqd27H7OdfTww6Nfs7VDRcvqe9jR366hRji/Cgn89kDWJ8YuF
	WTl4mCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCir-0000000BlfU-1Cji;
	Thu, 20 Mar 2025 10:01:57 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCh8-0000000BlGI-1FaY;
	Thu, 20 Mar 2025 10:00:12 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:27b0:1bde:abfc:3838:af13])
	by smtp.qiye.163.com (Hmail) with ESMTP id ef1b2939;
	Thu, 20 Mar 2025 18:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Thu, 20 Mar 2025 18:00:01 +0800
Message-Id: <20250320100002.332720-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh9JVhpPQkMeQk9OTh5DQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlMGUtBShkfHkEaGR0YQUhDSENBGh1KSFlXWRYaDx
	IVHRRZQVlPS0hVSktJQkNDTFVKS0tVS1kG
X-HM-Tid: 0a95b2feea1a03a2kunmef1b2939
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mww6UQw4GjJIMkIjTRYMMRgz
	MhYwCTpVSlVKTE9JT01PQ0tNTk1NVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSUwZS0FKGR8eQRoZHRhBSENIQ0EaHUpIWVdZCAFZQUlMQkg3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_030010_489731_98731DEC 
X-CRM114-Status: UNSURE (   8.58  )
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

This series depends on the pwm series:
https://lore.kernel.org/lkml/20250318120003.2340652-1-amadeus@jmu.edu.cn/

By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
voltage mapping to the device tree to enable dynamic scaling via cpufreq.

OPP values come from the downstream kernel, and voltage is chosen from
the one that makes the actual frequency close to the displayed frequency.

Here are the test results using mhz [1] on Radxa E20C:

------------------
display |  actual
 408MHz |  395MHz
 600MHz |  593MHz
 816MHz |  833MHz
1008MHz | 1089MHz
1200MHz | 1215MHz
1416MHz | 1428MHz
1608MHz | 1640MHz
1800MHz | 1804MHz
2016MHz | 1952MHz
------------------

If we want the actual frequency to reach 2016MHz, the voltage
needs to reach 1.13V (+0.03V), not sure if it is safe.
The maximum opp-table voltage of downstream kernel is 1.1V.

Jonas previously suggested using the maximum voltage of the
downstream opp-table due to differences in silicon quality.
However, this will make the actual frequency difference a
bit large. Here are his test results using maximum voltage:

--------
 4 boards (E20C, ROCK 2A, ROCK 2F)

 408000:  873mV   394MHz   394MHz   394MHz   394MHz
 600000:  873mV   592MHz   592MHz   592MHz   592MHz
 816000:  873mV   941MHz   977MHz   954MHz   953MHz
1008000:  873mV  1148MHz  1186MHz  1169MHz  1168MHz
1200000:  900mV  1368MHz  1380MHz  1366MHz  1360MHz
1416000:  964mV  1547MHz  1554MHz  1547MHz  1534MHz
1608000: 1014mV  1734MHz  1768MHz  1770MHz  1740MHz
1800000: 1064mV  1850MHz  1883MHz  1887MHz  1854MHz
2016000: 1100mV  1931MHz  1963MHz  1970MHz  1933MHz
--------

The downstream kernel reads the efuse value from otp to
select the voltage, usually using opp-microvolt-L3.

[1] https://github.com/wtarreau/mhz.git

Chukun Pan (1):
  arm64: dts: rockchip: rk3528: Add CPU frequency scaling support

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

-- 
2.25.1


