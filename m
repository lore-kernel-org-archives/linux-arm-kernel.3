Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58950F327C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUyZBqYnC8T2p7GUQFa3Z0ZKitWTRSgZGt0/Qe1m47E=; b=SF8qDDOBm7ddNxCBPdX22b1zlF
	YMoDRsxOKP0WQyMstV5MhuXnP4sv+wFHQ+DY7g4O+TldOEpWAlMqdHhO0/jKRbvyuIFk8DG0o7ET8
	agHmWlIqVlNO0JQ1C4N076qijMQzD/Os04Fj5D4S0YoS6wWglXf6AlxxzAlYCTqrSEZa29dy5V50r
	YuelZC9xjra3yTXMA3OAvJOSfR+ymWqvbdCrF2q1FQR83UEsziJ/jeiC3ptBxrFywBeF5WxKzqadk
	4yX1Hcd8fDlefYfdTvdDK4XdkFI0yTEHPlQ9EpkZX41Pt41JoQJTRsxLl6ZQ1C4u6KgKt74ri5QXY
	Y90q1f0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Jl-00000008FDS-2vHl;
	Tue, 21 Apr 2026 08:18:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Jd-00000008F8G-1o6f;
	Tue, 21 Apr 2026 08:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C9074456B;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1F6CC2BCB0;
	Tue, 21 Apr 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759520;
	bh=Kz+3pMMySerYI/J54KnH+TrQYs1a5xtXn+eQ4dPN+Sc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HbDfS2sz/GEqyOWvWu0tVs4//pfHUfkVGOhRjoB8dyL0Vu8cSEypyhK6EOLNaVos4
	 b44YbFhG78K2fFInuoVLv43Ny1LVOdrdX5hLkn0kmHnqvg2Z30x3Jxpp8ugog0hWer
	 wb2+n0Dt4J/DuiYzWKhO7kSromRIOksl8JI0OUDAXklpNcbH08aO5c17G8foGScP94
	 O4b+qAVsHrrnyI0lnnPk7CZbn+D4n0PkXloNMPFcEXeFEIjvWOwPXmI+o0kHf7KTvf
	 lXN0gaUosglh0CE3QvNLp2Mj0gIMgQ5Lt/vywR3uGVx0qnX1anHSNGFYynVpTtx283
	 0SHJRpAGVqRVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EBEF327B0;
	Tue, 21 Apr 2026 08:18:39 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and T7 support
Date: Tue, 21 Apr 2026 16:17:40 +0800
Message-Id: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUy52kC/3XMQQ6DIBCF4auYWZcGRoraVe/RGEMRdVKRBoxpY
 7h7qfsu/5e8b4doA9kI12KHYDeK5Jcc5akAM+lltIz63IAcFZfiwsz8dDF0WnRrxZoaeVPLnut
 BQL68gh3ofXD3NvdEcfXhc+gb/tY/0IaMM44PVQopsbLqpt3sRzJn4x20KaUvP46grqoAAAA=
X-Change-ID: 20260415-clkmsr_a1_t7-9820984d0af1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776759517; l=1276;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=Kz+3pMMySerYI/J54KnH+TrQYs1a5xtXn+eQ4dPN+Sc=;
 b=87Uj5tJYBxyT81mPVwhTw3g+vaPd1voTESeTuQlrUEWiUyQumNsXr74S/xP5tUaFeLczeJt/x
 FMyEr/5af2bDMGm7SXh++dvdWb7sGxhSTIGZ2t+KJ6syTecpUqhbSjH
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_011841_517169_DAFCC2CC 
X-CRM114-Status: UNSURE (   8.57  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds Amlogic clock measurement support for A1 and T7 SoCs,
including binding updates, driver additions, and device tree enablement.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v3:
- Place the clock-measure node after pwm_ao_gh node for t7.
- Link to v2: https://lore.kernel.org/r/20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com

Changes in v2:
- Add const for a1 and t7 clock measure table.
- Use b4 to send this series.
- Link to v1: https://lore.kernel.org/all/20260410100329.3167482-1-jian.hu@amlogic.com

---
Jian Hu (4):
      dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      soc: amlogic: clk-measure: Add A1 and T7 support
      arm64: dts: meson: a1: Add clk measure support
      arm64: dts: amlogic: t7: Add clk measure support

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 272 +++++++++++++++++++++
 4 files changed, 284 insertions(+)
---
base-commit: 401e5c73eedde8225e87bd11c794b8409248ff41
change-id: 20260415-clkmsr_a1_t7-9820984d0af1

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



