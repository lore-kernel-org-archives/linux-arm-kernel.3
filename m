Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70080C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=30umyP37NeLhSn8ZTtm48y6TWVKqYsO/xrum14blLwA=; b=0zHuKf7OwF5VvNz2GLvqJ/WmEl
	D+86xwS4nSC1VEmwTf4NYLkci3cKRhw+x11vYsQYPFLVVLcuWjnsTd97OETdDqKlQcCF5fhBPI4Ru
	cwWAplgQvxwJtXd+OyK2hvCKFpPU4l5Ts446kiZl8sYCtR4Kb3nd5ANIf0GD82nAsu+ctBchkbgTk
	FokUS9V2QTOovdn0rWj6R2k8Yqp15v21rSliDjeo9PjWOM4vppWdMlXHMNQiP440REcmNNOFGDajo
	/5OGkbBPkQvV8OCKotlx+SeJQ7ow+zw5IDlkCLyvqv87H2L2979zQxFkvGcNx/XrCkDnG1ezevU+4
	VdvGrdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVjH-00000005pp3-1uF0;
	Tue, 18 Mar 2025 12:07:31 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVcD-00000005o9U-1HSG;
	Tue, 18 Mar 2025 12:00:16 +0000
Received: from amadeus-Vostro-3710.lan (unknown [116.25.94.202])
	by smtp.qiye.163.com (Hmail) with ESMTP id eaf1c5cf;
	Tue, 18 Mar 2025 20:00:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Tue, 18 Mar 2025 20:00:01 +0800
Message-Id: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHxlIVkNOGRlNTENITk5LSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUtJWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a95a920143d03a2kunmeaf1c5cf
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Myo6FDo6FDJNPksQMVEWKx1D
	Iz8wCQlVSlVKTE9JSUJCSUtMTk5IVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VJS0lZV1kIAVlBQ09KNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_050013_510647_4F665550 
X-CRM114-Status: UNSURE (   6.82  )
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

Note that pwm regulator needs to be initialized in U-Boot:
```
&vdd_arm {
	regulator-init-microvolt = <953000>;
};

&vdd_logic {
	regulator-init-microvolt = <900000>;
};
```

Changes in v2:
  Remove merged bindings patch
  Remove pwm pinctrl in rk3528.dtsi
  Enable pwm regulator for Radxa E20C

Chukun Pan (2):
  arm64: dts: rockchip: Add pwm nodes for RK3528
  arm64: dts: rockchip: Enable regulators for Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 72 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 80 +++++++++++++++++++
 2 files changed, 152 insertions(+)

-- 
2.25.1


