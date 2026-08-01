Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3106C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 04:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+G1Afgfgm4VomeHyuZtbW2kKbV8N7tbkp7LK+TL/0q0=; b=s+ciBiaINiRVs06l+vLTLvGqMB
	agxE/hNjdvVGCkjmW55IqlZPIdSW46b2UVDwaqZNaaCRsQcRbyvC6I3ONPHG856M4e+1PCJlkNrUN
	ttkPcP9jfwQ16att7chlhb6TZhgoEoYPd0voierT3xez+66iASxjsrgciMaP+lbJvHdrM0Bw0vobv
	0tNVDrHJ5XkCob28UVz4MtR4VXOsRyC8J2iRrtj9cOXRvRJ3wbgn2MQ797oCgytxj94BTczigsvRG
	2xrhiXh/ReRxYoWlj0YqY1XDY6lU7dDuHfFhNqMZmOfsJ5gvIcCNvuA3VysIffLyKhY6EujaGHSzh
	96YW+Pfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq1gM-0000000Dtcn-2Ef9;
	Sat, 01 Aug 2026 04:50:46 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq1gJ-0000000DtcG-1xIF;
	Sat, 01 Aug 2026 04:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785559833; bh=+G1Afgfgm4VomeHyuZtbW2kKbV8N7tbkp7LK+TL/0q0=;
	h=From:To:Cc:Subject:Date;
	b=VLDdCeQWVNy70A7P4y5sWt3bGgpQR9GBKWgGBsg8vn3X3/2yUlkaInUK4bMsnZTvP
	 eR4qxgqDG/tS+JNUZ2gkNGr3CPu6asvPx9N8b62R5e3V4BQ02QIITWTL0fOQIUY2MR
	 xTGZRctN7bnhLW0W9hpaeJ0mBvbcCF+lxcmgOfhI=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C9E2EA5C; Sat, 01 Aug 2026 12:50:30 +0800
X-QQ-mid: xmsmtpt1785559830tqo0hg88f
Message-ID: <tencent_4141B315242524F71B028860294CB1315E08@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2VA5qCdx/+vljb5DbZnndH2i5LtgxlE30kG+zEmdKivg1PTXAy8
	 JKQgc11w1/7Z2dhUVYCIfsnsZNBpvCFRq9v2VurKgW2qIDYY+odxFv9TW9qY7almkKgpkhP2b9sa
	 BeGOIcRqd1TEVNqZQhr6EytbcyfyO2l+Z/SFFq/jy9QSDHsX5K9KVbItCwrJzz73Jy9NnXSL5kKr
	 WDxmZzHC254RppXLNDqFt1l+FpqRcm/uqymxLY4qq1FULEkoSAaHK5O20ZdLB3DzWvNnH0mZ6Ob4
	 yud3iCg6VK5f7gn0IOEj4heeYISYCdnPWn7wwtMMECNhseQN3/KBLeirtyt6WBz/vOzna98vrDjp
	 2z45ed2Gi5lZ9r/8LTtvcHLXa9pAtCV9h6jZEgIKiR0iuyXgGByQt6MWOuq+zoSlK3q8k4Z0JkZZ
	 ZNULeHkEaYFnGS2OTaa0WOpG3Gg+9yNwMerOFK77bjx5T9tuCQeIOYm4It6pQII2H9Owl6ves7HS
	 IJUy26c+FrTR1boQvCnNk9ObAPOZ1pLu1tLukdGyvRZrYvYj0mOfZVghm1lo4/g9TJT1KVUYUJp0
	 vOs1YSz9Fo5evod6GDUrccrRoKGY/WRbWRSrzTjQh57tL6pkNgPAfOY5Ina/DZF08YDB9vkPYTNw
	 VK5a8o/t0PEaQtH9CEpT4kdVbzNv4/mw7zKbd8zJPSBk/PYu+eB2UcO5iTehqZbcEkl5jE/XROwA
	 aKHGy2DwsFkoV9oK8EmNM5T0nUCWRhXunTq74Zu7t324veLL9R18tsvlA3/eRzUH9r04f3vMK3G7
	 VvXdiC9uM15ZNpKEn1oDvtNfkO+Sd4Sin1AcCnDg2pC0dTBUiq5GE74Kjk6TpptMENuEcOa+7c31
	 HAkYGrYVxOmB7S7Pw6P5mlVMPdKEaXCrT1L7z8ioJqBOGLNw/J30ORiQfmGTDkkZ/XsRI0dgmR6W
	 lLG9siP3hH4hNjeptr5FILpCykcW7Z4UxCIamYo8QtaVgREvGxb1G/Kgj2BmmojevZUZ2z+Jrdj+
	 tviK1psbq+awt87VaUULamWEcEb3JzP+HsTv+lAJBqM2IrrbxN+wfEd+nOwdE=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: Fix fan speed control on LubanCat 4
Date: Sat,  1 Aug 2026 12:50:22 +0800
X-OQ-MSGID: <20260801045025.67512-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_215043_848002_A23A19AF 
X-CRM114-Status: GOOD (  10.13  )
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

The EmbedFire LubanCat 4 drives a 2-wire fan by chopping its 5V supply
through a MOSFET with pwm0. Two problems prevent the thermal framework
from controlling the fan speed:

1) The PWM period of 5000 ns (200 kHz) is far too fast for the fan's
   internal bulk capacitance to discharge during the off-time, so the
   fan sees effectively continuous 5V and runs at full speed for any
   non-zero duty cycle.

2) No cooling maps bind the fan to a thermal zone, so the pwm-fan
   driver falls back to the highest cooling level at probe time.

Patch 1 fixes the period: measurements on hardware show that 10 ms
(100 Hz) is the lowest frequency that gives proportional control
without audible coil whine.  At this period the rotor inertia averages
the switched supply into smooth speed regulation.

Patch 2 adds four active trips at the vendor kernel's original
temperature thresholds (42/55/60/65 °C) and binds them to the fan's
cooling levels.

Tested on rev 20241026 hardware:
  - idle 36 °C → cur_state=0, fan stopped (PWM disabled)
  - stress-ng --cpu 8 → temp reaches 48 °C within seconds,
    cur_state jumps to 1, PWM duty = 3921569/10000000 ns (39%),
    fan audibly slower than the previous constant full speed
  - all four cooling levels distinguishable by ear when driven
    manually through the sysfs interface

Based on Heiko's rockchip tree (v7.3-armsoc/dts64), on top of commit
6d9430d58714 ("arm64: dts: rockchip: Add EmbedFire LubanCat 4 board").

Pufan Jin (2):
  arm64: dts: rockchip: Fix fan PWM period on LubanCat 4
  arm64: dts: rockchip: Add fan cooling maps for LubanCat 4

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 55 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

-- 
2.55.0


