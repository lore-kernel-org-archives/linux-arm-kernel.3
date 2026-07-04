Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF722C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 19:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hhUGyc+mT3QeW23DP6O9D/tS3OeqgAHNIRcWRxe91w=; b=YmeKes4Zi8vYNwts22kONcQiQF
	cTlbtNwakClX2ns42+fPkQjBYgZqljjmRUHFJM1X/ufv94mak8dX31Pv9vCAnY3kivIhbZ7nkXUvM
	gqph/RXqwWu6vvhrASrFa8u+JCPR2CcCIDHaca8gjnIZ/fONLwUujoTmNKRcb0fXMGgf1rlMLP4Le
	ltRoSmKnUsrS92GsvGYmtca0b9Ji1OgfzsLSflVOVGCNSJS14gzazkTUZ2ibf0D3MbwkEuOCbOXBv
	n4VPkk0GfGnphA6RyRTFOcvp4d/H3yw8lRSrtzCs+a04SgT1izsjSW1GBEkPLXoYHDFVo01MaP8Ln
	7QBDC4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5vw-00000008hRI-48Oq;
	Sat, 04 Jul 2026 19:21:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5vv-00000008hQg-3291;
	Sat, 04 Jul 2026 19:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63A8A60052;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E73C1C19425;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783192906;
	bh=DrmEnoWmyWcxAHLbfs449WCtfzaKrN+jtcI2xYUq4jM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s2h+J/PXSLPoVCq5HoZTcJWZRH1TyzEPI1fBa+lUbkvKpeQ/NWU+exS23rgQz7aMQ
	 WpOVKdlRcl+UqJnX1PVFgWzykvpOWO6KwqSyqRwmHEoJj52Rk0nYj9OJi42o3n+TeY
	 8WIOBZ9zYUxytb+hjtyGGqWYbNt7qHipnHuGcdvHaXFRFB0FF9RgVS6RMqKMdrC46i
	 Q04QiOw5CUK4EpGPFNoorpG/p7iBzCGQfnF+ANTiI5/HkyLkCzcFVc6/MKS5G77cy8
	 OoHmT7YmCGh9uF/ABrS9Duz5rKQruZQZHlLFvAeLx5xrArJAS0czltsB/3OdRIG/+G
	 JxRPrkaXntVDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05C3C43458;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/2] ARM: dts: mediatek: mt6572 DT cleanup + cache info
Date: Sat, 04 Jul 2026 22:21:41 +0300
Message-Id: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBNUMqGrRIt+xpwWFk5FEN49q
 +W3eO8GxkjI0BQ3RDyJaQ0Zqixg9H2YUdCUDVrqWlpZidpYLTbfMyohVTUZowZnnYZcbBEdXd+
 t7X7zMSw47u8CUnoAi2ZjYW8AAAA=
X-Change-ID: 20260704-6572-phase1-014d551bf7f2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783192904; l=1091;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=DrmEnoWmyWcxAHLbfs449WCtfzaKrN+jtcI2xYUq4jM=;
 b=nNNWxh6dknyQMeqBS+KrQhlN0NrksqTdzm8NiuX/by9b77T9D8qEXOtuC8k79UQS8ERkyIADj
 qgfY6gpSNb8CKCHewkxtdNFWWAFO1ei7BN4q//uqqMkR2wju2Q+JzwK
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series replaces legacy clock naming like uart_clk, system_clk and
rtc_clk with clk-*FREQ* equivalents. It also adds L1 and L2 cache info
to properly describe hardware.

Note that patch 1 doesn't break DT ABI. The changed clock node names
and labels are consumed only by phandles, and there are no drivers
relying on the legacy names.

As a brief heads-up, this series is a small part of an ongoing effort
to upstream mt6572 support. In my kernel tree, I have brought up clocks,
pinctrl, eMMC/microSD, cpufreq, thermal, DRM, GPU and more. I plan to
send those series in the near future.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (2):
      ARM: dts: mediatek: mt6572: rename fixed clocks
      ARM: dts: mediatek: mt6572: add cache data

 arch/arm/boot/dts/mediatek/mt6572.dtsi | 35 ++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260704-6572-phase1-014d551bf7f2

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



