Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6021C98335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xg3JgcKDn/lXcp00bR1jvBD4bGWyabzmAYp613hBx1U=; b=iA7tFBIoxDhTY+cNNGloQFSMv4
	Ozbh03hHnYts7R0dk4QXvDohgR/5RhV5pB0uQATPcQN+sJieiYi5y07NSQ5cqoJwCkV527tFT/CDm
	dWCaKPT9eRMzdeZJD+QKcpqiZwD0UWyDCU7RVsOAW81cbcJgxhevqGOG9QqtOENYLScMXWIOXduFO
	EhfYn6uA8GitMET7pS/Cl7cL3DHSJwAB2OrGQSRDHzr19RhqkJpG1CcDTO+/TzL9nJ+OP2aozDnnW
	k6C3yNydtjujeEhr/+dqYr5QMfGDd3oq5oP89bEHTm0Uh4+3YItTow+YsdUGzPm9YPP5E4WG2diqq
	tfYtTODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrMz-0000000C3ZQ-2ZMy;
	Mon, 05 Jan 2026 20:40:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrMx-0000000C3Y5-3Uzi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C19C60010;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5445C16AAE;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645602;
	bh=h1l9P7NkAKNJ+XD9BctiE5OChOQI9lTMcTs+NJRvzLI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JBX0p6xgpHjvAu/bkawjO6M3bSa4C3jBn9DZJHGgFA+85IcY2VHWczxR2Pr1/rkUV
	 BzyXr/7G8+hKhROw7BxHiMjt6qMzWigYrXntPy7auIXCnYkli1oI610kKH4kulUkza
	 3KDbWctRjlCQKq04iqmfXjPfCoGdA8oKZA7VVIs8wt48VQqGRYvmYVi2VSQU8dWap0
	 zIObg0itpNPua6RdnPxBEylzfLLf8h7a4hCpsODD5LPrlAuBBPHNYalZocdwXo8K5y
	 ZCRQyPM9Ewd6KPlS7H7KpR0LKW4pa3uSDKytVGQ53WHqKt040eXaXhxO+iCYS3D+HY
	 hVK8ochJgXB5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CF6C98333;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Subject: [PATCH 0/6] arm64: dts: imx8mq-librem5: Various improvements for
 Librem 5
Date: Mon, 05 Jan 2026 21:39:37 +0100
Message-Id: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkhXGkC/x3MQQrCQAyF4auUrA2mhVbGq4iLzDTaQB0laUUov
 bvR5cfjfxu4mIrDudnA5K2uzxpoDw2UietdUMcwdNQN1FKPc4/jkvGmH3EsnAbJKRGVE0TyMvk
 PUVyu4cwumI1rmX4ns9bVjw/2RQz2/Qsz70gwfQAAAA==
X-Change-ID: 20260105-l5-dtb-fixes-ca96eb9900c7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Denis Sergeevich <galilley@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=h1l9P7NkAKNJ+XD9BctiE5OChOQI9lTMcTs+NJRvzLI=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGgxphxkK6Aiw/QlxhgE83NF6pMFn9DuKqeI
 qoUnWOJCjCJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoAAKCRDo8jXPO9vD
 /+P/D/0Yw7W5ptdqIAPyLsNULtdCV2DUmIpYdm5blfamHr1H20WTIoNAsFalOpCfyXZcpnMUk3q
 m9YoMsEfQJlxGo3ysQMap3QuO32IhD+StUSkHVyteNbTuT0MKOYWjcH/Sdr5U/7Vq1Dfien7aZv
 Cl2/zqW2hLswCdS5hIfcJtLTiNJhDkRPtg7O1NV+VgQltp4UogA1/+WCkZ8AzRGRNvQw94UsitQ
 lWx3ti+NqCH9MfLqHmZIFUCOa+eKIL8PYkd04WRmpL8DRAoCGmMqtDYKz0NoaCiEDmm8bsmM+1Q
 Ol3XWNdu0tA6ej8b/EOGyaQsI0V4p5B5E+j/LOoc1xlMKpX1JMH6nZWfv0WFsBBtzhwXix1G5Rz
 y8G3HX619aSedWM8S9sngPJbkJJN2UhNZtYTxW/UHMvEkTqhYvSyGLJ9vYj+Q/uXyG/DD8fzui7
 fn4tT3fx2bAbYY0zAQtA59vulOJDmvIefkdzTUUWKJ6Vysq/Q/XIy/kshfgoNDrmLtD6GOL21vv
 BBL9H+jZqa4lNoixAgpERI8Kcb4zaED0aYl34ao0pbWmjw3zuNAIZ5dLGWGWTOt2XutGVhbTLik
 kPR6IWj7AMmm3q+mkm44hui7jFZBzCW2PAQYnXD6dCWk+oPOCpdjnPnHdt/psxSnWFx8AnKZGne
 piWwewzgdNue6HA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
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
Reply-To: sebastian.krzyszkowiak@puri.sm
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

These are various DTS patches collected over time in Purism's
downstream tree - fixing the vibrator's PWM, improving reliability
of SparkLAN WiFi card and I2C buses, enabling power-on on RTC alarm
and cleaning up an unneeded property.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (6):
      arm64: dts: imx8mq-librem5: Enable I2C recovery
      arm64: dts: imx8mq-librem5: Set vibrator's PWM frequency to 20kHz
      arm64: dts: imx8mq-librem5: Enable SNVS RTC
      arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency to 50MHz
      arm64: dts: imx8mq-librem5: Set cap-power-off-card for usdhc2
      arm64: dts: imx8mq-librem5: Don't set mic-cfg for wm8962

 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 67 ++++++++++++++++++-----
 1 file changed, 54 insertions(+), 13 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-l5-dtb-fixes-ca96eb9900c7

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>



