Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67203C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NlWyM1CYHwm12UC+jLz8mArD+pXzuy4hifFMgbVEg3o=; b=I0D1wcNQF2Xqnb/YH0K+vY6PoZ
	Ohoe7YukOJNkaY0tN1kDD03V1NMqBe02DIHqKGN8L8K+dGkI7gWR4r1DhdbQjbvFlmRy6mop0gVFB
	DtprHUQ6bExc/IuDqP8FtoXD7RD1tfV0Z6NxjHFN4MNUR9E2x0okIK39q3YX+RDzVilZ372+gjp0G
	w0s8hH1RWDGLPhfKhMGR1wU9tW2dbqbTpw15irN+1m3aDKqChqlmqyKQwWYKLUY27eA+4HIbGIdey
	fNa2oCi7DHco1DLj2H64yf0LbNgrpdn0VGZ2XHWE7JTfsuqixRn/n/pWDwHmkfc0ND5ngwYsG4Dtx
	IguNsyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJT-0000000Fc3d-3ybk;
	Fri, 20 Jun 2025 12:57:47 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYXj-0000000FHcK-2tdm;
	Fri, 20 Jun 2025 10:00:22 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:2eb0:2d06:fb3f:ec9:50ac])
	by smtp.qiye.163.com (Hmail) with ESMTP id 195ff8215;
	Fri, 20 Jun 2025 18:00:14 +0800 (GMT+08:00)
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
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Fri, 20 Jun 2025 18:00:09 +0800
Message-Id: <20250620100010.1291658-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTU5NVhodHUlOTBpMGE5PHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUkeGUtBSR9LTUEdGUgdQR4YQkFOSxoYWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a978cc81ec403a2kunm2902750c11af60
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6Igw*IzE*TyotFzAaCz4#
	VlEwChFVSlVKTE5LT0pITUpOTU1MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSR4ZS0FJH0tNQR0ZSB1BHhhCQU5LGhhZV1kIAVlBSUhOTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_030019_904916_D3E8DF85 
X-CRM114-Status: UNSURE (   8.01  )
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

By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
voltage mapping to the device tree to enable dynamic scaling via cpufreq.

The OPP values come from downstream 5.10 kernel. Both 408MHz and 600MHz
frequencies use the normal PLL, so use the corresponding highest voltage.

The voltage used for other frequencies can't be less than above (875mV).
Therefore, 816MHz to 1200MHz also uses the corresponding highest voltage.

The remaining 1416MHz to 2016MHz use a voltage close to actual frequency.

If we want the actual frequency to reach 2016MHz, the voltage
needs to reach 1.13V (+0.03V), not sure if it is safe.
The maximum opp-table voltage of downstream kernel is 1.1V.

Here are the test results using mhz [1] on Radxa E20C:

--------------------------------------
display frequency |  actual frequency
      408MHz      |       395MHz
      600MHz      |       593MHz
      816MHz      |       956MHz
     1008MHz      |      1152MHz
     1200MHz      |      1366MHz
     1416MHz      |      1430MHz
     1608MHz      |      1640MHz
     1800MHz      |      1802MHz
     2016MHz      |      1946MHz
--------------------------------------

[1] https://github.com/wtarreau/mhz.git

Chukun Pan (1):
  arm64: dts: rockchip: rk3528: Add CPU frequency scaling support

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

Changed from v2:
  Rename label opp-table-0 to opp-table-cpu
  Adjust the voltage used for 408MHz to 1200MHz

-- 
2.25.1


