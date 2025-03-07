Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A176EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XCyUVjP4o4hXc1ONtkcYkP2Zpv7qQiAhhGtv2I11zwE=; b=sZzv21etEiVoAxOH9dv3L5q48f
	ADJqBFzPk+bh/B0lqdt6RdGbKh2lwqliBmmDcxsxnCfaR3rLvdIsSVxPf4rOsqje9qe1dvXdUFMvg
	RQ3cJme5iiGjwWoTcS/xw5SIqVN64gC9cvRQZFy9/kaiKemsWHLKIpSaeVMLo9mLLnhPFWlr8E9VK
	FOqpLy6Z1s+6iBti/2AtMrDUfeH91irz4MJtkhEyVBoYvqowMTcVJjO4u2uCz+ONqDSHrnTqz9Fc9
	8flRquq7+aLaYrtygdRt0052WXFjUCn+5+Pp79BZV35BCyd4FNIJDXg8oWwmPDMhB8oQPft57H/PS
	nD+k67gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWOo-0000000E7qS-2j5H;
	Fri, 07 Mar 2025 12:01:54 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWNB-0000000E7WK-0GKe;
	Fri, 07 Mar 2025 12:00:14 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d5c9f2d0;
	Fri, 7 Mar 2025 20:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Fri,  7 Mar 2025 20:00:02 +0800
Message-Id: <20250307120004.959980-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHh4ZVh5CGUkYGB8eQk0YHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a95707a26a903a2kunmd5c9f2d0
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NS46Qxw4QjJJNjU*SjNICEsh
	ISEaC0NVSlVKTE9KSE9DQ0tCSkxDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUpLTUo3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_040013_269391_199DD478 
X-CRM114-Status: UNSURE (   7.80  )
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

Add pwm nodes for RK3528. Most rk3528 boards use pwm-regulator to
supply to CPU, add node to enable them. The PWM core on RK3528 is
the same as RK3328, but the driver doesn't support interrupts yet.

Unlike other SoCs, pinctrl-names need to be in "active" state,
I'm not sure about this, but otherwise the pwm-regulator will
not work properly.

---
vdd_arm: regulator-vdd-arm {
	compatible = "pwm-regulator";
	pwms = <&pwm1 0 5000 1>;
	pwm-supply = <&vcc5v0_sys>;
	regulator-name = "vdd_arm";
	regulator-min-microvolt = <746000>;
	regulator-max-microvolt = <1201000>;
	regulator-always-on;
	regulator-boot-on;
	regulator-settling-time-up-us = <250>;
};

&cpu0 {
	cpu-supply = <&vdd_arm>;
};

&pwm1 {
	status = "okay";
};
---

Chukun Pan (2):
  dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
  arm64: dts: rockchip: Add pwm nodes for RK3528

 .../devicetree/bindings/pwm/pwm-rockchip.yaml |  1 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)

-- 
2.25.1


