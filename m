Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AEDFDEE4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KDHzqFZNMKkSuHenyDpjYIKv7RjiWoFw1atH27kZG04=; b=D6T+Hwpoh3ULZm
	Ez1gwCZMTgkCrW96UhUaDNftV+9he9+5vW6Zazx4eCHRrVERjK7awj98/nSpd2x+ZJfqHpCzgXvGV
	WLcAdjYEopxU8tDycsNo0yfii9BydwJpqDkr3rX3qnKkGQWD9UNg0KPnnf5NCvqo+NQCa8WoZ4Lo0
	eo+fc9uNgBtSu1rDTxZTzIC6dz2ZJJ67rzNgr7f+9ryuMoADkeD4l6ELHrHHs9e55xts8XhcMtUzw
	WBIw5fqkOiJI1+nVYze6TedNjKtZD8uMaj+Aw0oQylZ6IWu8CeHyTctqQ3yiwBNTlRBiyeNo6AfYs
	ZftUChMLh/1vYMzgVnoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1O1-0000000CKCu-2KkK;
	Thu, 23 Apr 2026 21:15:01 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1Ny-0000000CKBo-4AiB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:15:00 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g1pl14JdCz9t9D;
	Thu, 23 Apr 2026 23:14:53 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH 0/5] Google Nexus 10 display support
Date: Thu, 23 Apr 2026 23:14:36 +0200
Message-Id: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNj3dzEvJJE3ZTM4oKcxEpdU1NzC0MDY8u0JIMUJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAHB6MUFxAAAA
X-Change-ID: 20260423-manta-display-55781039fb0d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_141459_268227_119B9DF8 
X-CRM114-Status: GOOD (  12.78  )
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

This patch series adds display support to the
Nexus 10 (google-manta) tablet. 

The panel can be used with the panel-edp 
driver and just had to be added.

Also needed for display output were two clocks which had to be defined.

This patch series depends on previous patches which are
currently only found in linux-next.
See: https://lore.kernel.org/all/177214038655.341086.4114348823043257597.b4-ty@kernel.org/

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
Alexandre Marquet (2):
      dt-bindings: display: panel: Document Samsung LTL101DL02-002 panel
      drm/panel-edp: Add support for Samsung LTL101DL02-002 panel

Lukas Timmermann (3):
      dt-bindings: clock: samsung: Add fimd1 and vpll muxes
      clk: samsung: exynos5250: Define more clocks
      ARM: dts: exynos: Add display support for exynos5250-manta

 .../bindings/display/panel/panel-simple.yaml       |  2 +
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 99 ++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5250.c               |  6 +-
 drivers/gpu/drm/panel/panel-edp.c                  | 31 +++++++
 include/dt-bindings/clock/exynos5250.h             |  2 +
 5 files changed, 137 insertions(+), 3 deletions(-)
---
base-commit: 6d130a71abb393ce99b081e78783581bd3b5985b
change-id: 20260423-manta-display-55781039fb0d

Best regards,
--  
Lukas Timmermann <linux@timmermann.space>


