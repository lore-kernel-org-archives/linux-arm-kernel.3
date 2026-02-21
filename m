Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88543C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dopCXToWZ2/xwrjXzTF4ClkzlvVAZFIbQREfj3SDAzI=; b=np2vuKzjOyGpvH
	avWK4/OE07mUGJek1Pxzh/7/+OjUrPluE//VnW0c2dWjbGmFc5XxQm9AqyRzLZrglEi6VGDtkNoOX
	FYRJxX9N6p62Q7KagwzSjugz3FgGcR+RjVxsgjO31/q7C07cfqV5178Zq/zfjHjeWfLl34KEWZ2tG
	jOqwWwPSj5QoftPqyXghN/18GQOjJHxx660t4eaunloWZHEjdWJQxhoiYjyw9vQuoiu2anFD0Ma8d
	hSwH5TJnjgN4d/NSofVcJtBeNQaer/exNpaXSMbm8CTgMngLzgqOgobR6wuk6XA3WKH0kjhgl57A7
	xptCB0q5JdmjfQKEmVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrVw-0000000GEU0-3xcW;
	Sat, 21 Feb 2026 18:15:36 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrVu-0000000GET5-2aZ6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771697730; bh=jtCfrr13o4B/392SWdb5ghKU04pq1d/ZsNEtXEu0AAQ=;
	h=From:Subject:Date:To:Cc;
	b=IZydHVLhRFVP2zi9KCfvZVBmBfo/FfJt5BgfxLWRthoK7kQHO46NLrn2OLF46jpjO
	 DjUpkZWDwbHD3Dp2YwJ8jxLkTUXgiq5exdxqxl17LJk1TOImxpy6u+tdKPwOjC0mFW
	 mXXDy/i5SwSNfCr173N1CO7Sa5sxKpQ/1c+PMeBUp68mycPADBxyjYL6dkLeCEYrWe
	 2oTjFuKaFLtk9auEkDK/ZJ1Vu/6ShmkU1CcLsvgu/Aq8tAVAgYoEDkr/k6bTQxL8k5
	 mZ/4WNfGWOd/Dp+MYY+Tl/a0PcmM0Ba8hL1e0YbY9rBzu3KcXi53UbqCQ7plvRj49d
	 5k/70D1cDerPg==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id 475311F511;
	Sat, 21 Feb 2026 10:15:28 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: [PATCH v2 0/2] arm64: dts: imx8mq-librem5: PMIC voltage changes
Date: Sat, 21 Feb 2026 19:15:17 +0100
Message-Id: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr2K6dpQ2CMSV9zAshnaASaCQDjQaw
 t0trF2+5P/3NiUUmEQ9L5sKFFl48gnM9aJsj74jYJdYmcwUmTEahgfEaViwI4GW8rJwuW1Jlyo
 95kAtf07bu07coBA0Ab3tD8fAfpX7iLJQOOY9yzKF79mO+jj9z0QNGTjEComcrQr7mtfANxlVv
 e/7D2z9HcvDAAAA
X-Change-ID: 20260221-l5-voltages-fe476d4cfe17
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=jtCfrr13o4B/392SWdb5ghKU04pq1d/ZsNEtXEu0AAQ=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmfY/8yEmf5Wf0qh+LHo4HeWrFbUViB3Jovo3V
 OiUzjmeJ++JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZn2PwAKCRDo8jXPO9vD
 /yXtEADAkK6+RnxOxYe9hmOYcuw0c+HNRmhZTY7Yv90YDSS/26q0J04W5k3V24OJVjnVm2VUKD8
 1j0rKLVfvKTcPX2uocgGFQ+4aFzkqb5NH+IeOzj1ovUXcpw1dx77gGP9yaTWo2o26vsQ/T2mRfx
 qhwsh3iRHmg2gyae2YuPZ0syU7kQm1++o8xGWgPvtxGh5/XboQzV/lJlWfRbRHzGX9USh2Wlckt
 RJWVd0AoDA08nZScxzA7ce7qqXSV0hc8Qwe8LIz2eZdYitRh5TVOAbeMhl+NDYjo/wsVOcZzwXj
 1dn2cY33kUMIUAqGvRKtxcMYos/kap/+A/OZBvcBhrfkcXPhBLEAEiKJHLUKAzYDYdQzCZGBQyd
 MgNn5r11uTVxYNdh3bzRzFZjXv+OiKeh4+4k7IxWjHKiRwyzc0Ar9RREcZsuOx8JKmSwjhYpgVv
 zAfJ1QzU5xACJw611D21LnLYlhnh1TYpU+R86Xcdq+Y2LSt/vX578m7UdtCdh+DzGWk9f5jhqRv
 L/YsDk74xVh6OkVVHRPHRH6RFBIn4KolkED26ryC8tblOuFSpudH6GLUop8MPYg8679hO3n6kje
 c2WuIoBLxDUJfcuxXOYpFgK3MpLDkE6UiAyAcaJRWe/zpLD5NqwPe1DLIT4/N689Ij/b8kw/RNv
 1QxqaTOIrZb+hrQ==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_101534_818996_27418EE3 
X-CRM114-Status: UNSURE (   6.66  )
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

Simple changes to bump the voltages up to their nominal values to ensure
stable operation across all units.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Changes in v2:
- added Fixes and Cc: stable tags
- Link to v1: https://lore.kernel.org/r/20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm

---
Sebastian Krzyszkowiak (2):
      Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 24 +++++++---------------
 2 files changed, 8 insertions(+), 18 deletions(-)
---
base-commit: d79526b89571ae447c1a5cfd3d627efa07098348
change-id: 20260221-l5-voltages-fe476d4cfe17

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


