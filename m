Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9815FCF45DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aagg5CByuuM83QbD5l/5f6UabazEpojGX4+0wJyKVt4=; b=Uj60goeDTav2Rw
	b5HeieMdiI2rV8uE/5HlqRXgq2tw9y4VbZX+qqAERwYUHUojKLNzvdjcUjLZ90DU1ssKoe2Or/x6i
	byqPSwB6CJH+PGOBAi73UHjb7qamC6HchLtnby43ahaulagHm07v9jkiHvBIfjo2ptBGlThASu5L8
	SuGjwjalwrAUQFcxtiltzGDtRRLHxi6GqUKP7Mq8uHzr17avVq4UVkJAy+vafObqCNkYymTNpvrXt
	1esi96JLR2U5FlKlYFD3EJt/4FvzPyi8lpBIvpGIWXMImqVV8+yt2qn0vM6cM7/n7kn6cBEpjIQxT
	mMVX8xLbMbUoTKJPjofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDd-00000006Hr3-2alT;
	Mon, 12 Jan 2026 23:21:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDZ-00000006HqM-3pX2;
	Mon, 12 Jan 2026 23:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768260058;
	bh=h0bRc8fFe1CrTyUCIPiwLR8ecCWXmwysclhrLiQSeAE=;
	h=From:Subject:Date:To:Cc:From;
	b=ovIQ/icPjPN5ATKBaWvue8EPmPWcHyd3mdEMPdgH1E3qna0PA+M9LeOlzwG56X71+
	 vI2dbCYwkSqpz3E7GpTcX7DfSTjAriX3/aDJ2kaIdOSj3XdA1aTjxHLpN57kOa48ok
	 q6ITyktAn/GTR7sFvbOC7MryKR2DDT49mSXFF40P65DdhBejSiPtguh6VYvPxUJzy4
	 sJ9+aVpcj87PsAiFovDES9jyT96jgoNSO4uhrtQh00YouMeXKbHHK2vlJoc8zmtu0r
	 uYT+FcB2g/g9R3oTyb9eLobkFO9WAX48HZaS90HlhNFLhF7qJOJvzItdoqziXWIhi6
	 3t9UUxEVBQwMw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FED817E0E30;
	Tue, 13 Jan 2026 00:20:58 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v6 00/11] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Date: Tue, 13 Jan 2026 01:20:47 +0200
Message-Id: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+BZWkC/3XRS07DMBAG4KtUXmNkjx07ZsU9EAs/xsRSqIMTo
 lZV7o5TEEVpWP4jzad5XMiIJeFIng4XUnBOY8rHGtTDgfjOHt+QplAzAQYN06ylQ3emXRimE42
 lp9ELoXVwJgKS2jMUjOl09V5ea+7SOOVyvvIzX6v/STOnjPqIzCgEkFE++9z31uViH31+J6s2w
 01oWbMVoAqB89YF6RQytyeIPwK/m0GsM2hjjA6tc7AryJtgGGwFWQUdlOFaCS087gnNr8AB+FZ
 o1i2sF4ZZ3TJ3JyzfZy748Vm/Nf3celm+AE+KsMrLAQAA
X-Change-ID: 20250708-phy-hdptx-frl-fc3377db9f2e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_152102_150047_89BB0494 
X-CRM114-Status: GOOD (  10.27  )
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

The Samsung HDMI/eDP Transmitter Combo PHY is capable of handling four
HDMI 2.1 Fixed Rate Link (FRL) lanes, while each lane can operate at
3Gbps, 6Gbps, 8Gbps, 10Gbps or 12Gbps.

This patchset extends the HDMI PHY configuration API to manage the FRL
mode and provides all the required HDMI driver changes to enable FRL in
addition to the already supported TMDS mode.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v6:
- Rebased series onto next-20260109 and removed all patch dependencies
- Handled the conflicts caused by the recent conversion from
  round_rate() to determine_rate()
- Link to v5: https://lore.kernel.org/r/20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com

Changes in v5:
- Dropped all unused members from struct lcpll_config and improved the
  readability of the rk_hdptx_frl_lcpll_cfg table
- Rebased series onto v6.19-rc1 and replaced dependency [1] with [2]
  (the former got merged)
- Link to v4: https://lore.kernel.org/r/20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com

Changes in v4:
- Moved the following fixup patches into a separate series [1]:
  * Fix reported clock rate in high bpc mode
  * Reduce ROPLL loop bandwidth
  * Prevent Inter-Pair Skew from exceeding the limits
- Renamed enum phy_mode_hdmi to phy_hdmi_mode and
  PHY_MODE_HDMI_{TMDS|FRL} to PHY_HDMI_MODE_{TMDS|FRL} (Dmitry)
- Rebased remaining patches onto next-20250901
- Link to v3: https://lore.kernel.org/r/20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com

Changes in v3:
- Reworked patch "phy: hdmi: Add HDMI 2.1 FRL configuration options"
  according to Dmitry's feedback
  * Updated commit message providing a brief description of FRL mode
  * Kept PHY_MODE_HDMI in enum phy_mode and introduced enum
    phy_mode_hdmi defining the TMDS and FRL submodes
- Updated "phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support"
  * Implemented .set_mode() callback in rk_hdptx_phy_ops
  * Introduced .mode member in struct rk_hdptx_hdmi_cfg and used it
    instead of phy_get_mode() to verify PHY_MODE_HDMI_FRL
- Rebased series onto next-20250818
- Link to v2: https://lore.kernel.org/r/20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com

Changes in v2:
- Added a couple of new patches:
  * Fix reported clock rate in high bpc mode
  * Drop hw_rate driver data
- Applied several tweaks to the following patches:
  * Compute clk rate from PLL config
  * Switch to driver specific HDMI config
  * Add HDMI 2.1 FRL support
- Rebased series onto next-20250804
- Link to v1: https://lore.kernel.org/r/20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com

---
Cristian Ciocaltea (11):
      phy: hdmi: Add HDMI 2.1 FRL configuration options
      phy: rockchip: samsung-hdptx: Use usleep_range() instead of udelay()
      phy: rockchip: samsung-hdptx: Fix coding style alignment
      phy: rockchip: samsung-hdptx: Consistently use [rk_]hdptx_[tmds_] prefixes
      phy: rockchip: samsung-hdptx: Enable lane output in common helper
      phy: rockchip: samsung-hdptx: Cleanup *_cmn_init_seq lists
      phy: rockchip: samsung-hdptx: Compute clk rate from PLL config
      phy: rockchip: samsung-hdptx: Drop hw_rate driver data
      phy: rockchip: samsung-hdptx: Switch to driver specific HDMI config
      phy: rockchip: samsung-hdptx: Extend rk_hdptx_phy_verify_hdmi_config() helper
      phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 667 ++++++++++++++++++----
 include/linux/phy/phy-hdmi.h                      |  19 +-
 2 files changed, 585 insertions(+), 101 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20250708-phy-hdptx-frl-fc3377db9f2e


