Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C42D262BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 03:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3J3oQEO/xh+SVbukC6XlbGUfah97ZWP5SbeXmw4NSIQ=; b=veqGqHaO5U4k50u8TRXqWT25/r
	3fKAgfYI0bSvCCD9tVjXzsWH3kGUF0aUEe1tPIK+Rvs4mn06jZf/qNjhCycr6OdvcBNZQ8vvFbyJn
	Gf9EXPRBsEinK21oCVldqUTP+mD9FRh2zcI+gRoyMGf8LAvKbNjOYzTJJ4AH7A5Pz0V382zt+3QAc
	1/TFe2aXmOneABdKWllbdLRNDWZ64CY5rB6HJn3vc5t4FNiKqURtMRCPYE70hR8NltLK/6YktqNex
	H6DlQABH+1AgWlUcInj01eQI/bYY61FpL0Xl16RJOtZE1gloeh9VGEmY/kTG+IhCD304dAm7ZLS9u
	Dv8hJ/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOiK-00000004p0X-10i8;
	Wed, 21 Jan 2026 03:17:00 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOiG-00000004ozp-2Uwz;
	Wed, 21 Jan 2026 03:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768965361;
	bh=3J3oQEO/xh+SVbukC6XlbGUfah97ZWP5SbeXmw4NSIQ=;
	h=From:To:Subject:Date:Message-Id;
	b=qJZg4z57UofC7yQ44zfLIRxsvBcL+Et8F889+M/5qScmjHJHPiUvGRUQlyV4oJXWD
	 YJUIUMC0lLa89DD1IlQ7/0MaDS2ST5axPGFUk6qeoVoyGzlx3o6rHoFx/1F2gaQoZl
	 dBemLhXmDray6gTkCq/anpeMInqgt3dVkTeCNDSo=
X-QQ-mid: esmtpgz12t1768965359tba34f95e
X-QQ-Originating-IP: 3MPUnYZ1/su2m2LgqRvqsJ9H2ai/1j9AvtHseSL1brA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Jan 2026 11:15:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4757405007957753980
EX-QQ-RecipientCnt: 17
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Stephen Chen <stephen@radxa.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: rockchip: Change gmac phy-mode to rgmii-id for rk3576 board
Date: Wed, 21 Jan 2026 11:15:45 +0800
Message-Id: <20260121031548.402-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mv9X8DgfILpCDVHvpmKx8qVZRoB/A11vLnwOGvo6pDtMUsP5M6Ea3o+i
	fR8PsWQgyAQeLLGJEL8RIjoZYvEP/hcTY5MqakiuB3hy6ahMJTHh5uYmXO8frRL83yRLDDH
	K2lLQsnEHY5tsXeYiVKjw8gypkWgBWf1AMapLAM7ajEHqUwjPnvWI6hEjCIyDJ5ppJuI7EM
	Ky5rgUYzt7I/ltIegzjYrqCU66QGkTCOZNMaeikn+gl5uVGm7uGW5YWrwRLgRySdtoLZnES
	Xef5BScAbAcM9q49nblngrcEVI/KA4fx+0Dm5hcAwvDx89jZCer/2uf+kSU3wvjf0kfuFVw
	wRthktvTy8yN9mMX3KRiGBJy0y3LnQhDZNdavENA/AJRf2VLWSyDk7MmA63PsJhvSb3xd/j
	b/d28BtCb0rx3fEAOBsNKz0gbF1DW76wAGVUbhtwKAkvTDH5Pl3KWhfqtF5ZL/Il2/Dm/Wh
	CVtGWTFrOC02zDFsa92/MDNOU9plTS3KliESCNPbVbDacz/0oCEeV9s9MdbQ8U3iI1XIJ2X
	as7JvRrM0sThyka8KcxZewvElh2Dir6rIsfiEKNUmumGkSYjSPsjnhVwRBlXXk/zQCleS9i
	uB5STZ6O7Vv1iUOEyyTNPSlfuGqdDJx6uyWz5KV1xL8U96WhEkVtG5agzmW63j4xiyt6+fR
	F3jd75WvJMpRS10E5DE+YIb0KafeukpIEkiE/KygpJcA8Gd2n0hXL86wOhx3bh2uS6RPLUA
	bLgy7qmOvaX8gVFCll/BHo3oRVYCLspYo5m0X25EOlW8dqI/lH11uoH8uu2ojk/X/yPRxDz
	dpl81mWxByCfw+ukXHP9mlv4SwCPkivkDepjZFbkrB5uxAe1WFAvIiY5KG5vjcA7IIjIusS
	wehUmxMzPqzgKY8inD0qUNqOV7Sx7DwhDZZNdqtxgsEep60+D9pzl5KiwtcsfbjxT0JN7qG
	Tk2SLWPCE75F8fWzpoGMk1rYLzh7kvXd7+JYWsky0lnaQK3X63LST7s3Qtor39wIf9p27sl
	2IuB2j/9UvW+7G7SNDUhEcR1rYJfpsGkFaL4lERHNf1jnSJ5lZHEQhPVGpUMLYutRmSN5D6
	93cxvfLT1+h62WkZnwNtik=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_191656_918318_F4B14AA5 
X-CRM114-Status: GOOD (  10.17  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

According to the description in the net documentation, PHY modes
"rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
to be delayed on the PCB.

The Rockchip platform has long used the above mentioned PHY modes and
private delay prop to describe the internal IO delay settings of the
chip, which is inconsistent with what is described in the documentation.

Some background, for RK3576, you can assume that:

        tx_delay_time(ns) = 0.0579 * delay_line_count + 0.105

For example, tx_delay = <0x20> means:

        time = 0.0579 * 0x20 + 0.105 ns = 1.9578 ns

Recently, Andrew has often mentioned the problem of phy mode in board
level configuration. So let's start with the RK3576 to modify this.

Please test this series of patches, thanks.

Chaoyi Chen (3):
  arm64: dts: rockchip: Change gmac phy-mode to rgmii-id for rk3576 evb1
  arm64: dts: rockchip: Change gmac phy-mode to rgmii-id for
    roc-rk3576-pc
  arm64: dts: rockchip: Change gmac phy-mode to rgmii-id for ROCK 4D

 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 8 ++++----
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts   | 5 ++---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts  | 5 ++---
 3 files changed, 8 insertions(+), 10 deletions(-)

-- 
2.51.1


