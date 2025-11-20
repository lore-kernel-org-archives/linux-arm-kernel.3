Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0651CCF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFhpJKIcqes9gFcy7I+3pvbyB0hH/HnYmueMzCw4SP4=; b=h9fL5PtQn7tfoa99yz5+oFaQE4
	4ic0Ix50a4DlBGhFwlt3bI96r5A97NdVcKEtS6ui/2jyA7v9rBC4mp6snI3dxr9MIjSnim+iCzZRP
	ZYxyzgPkiyWCMVCtEpX14jQ0w+hUtNAo0Y/4Kmn+L3Ok++J5vBRm0JipoQJ+S99D0HW+JKxsf3KFD
	Ur22ReDaVLHlsbUAJ2vnBtxoUnYMMrvdyVWhzvZIu4+jEA3Kt1cDYXZ+Y3N5cFHK1cVzj/6ToMwjF
	R6rQxwdJd4bTNNL1J+e5jZATvnJfSt7ZWTBcfqD0b+fOEvD78P9soIAc0QpjLQwGzqKw+UtDLoekV
	Qs3lLoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8ab-00000007APg-3qeP;
	Thu, 20 Nov 2025 17:37:01 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8aZ-00000007ANx-4C74
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:37:01 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7be94e1a073so2472124b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763660218; x=1764265018; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OFhpJKIcqes9gFcy7I+3pvbyB0hH/HnYmueMzCw4SP4=;
        b=sl7Q9szDh105P2ma9WzVj/UdZ2F7DRN1rkB6NOW4aj7UWKtlW9mGqPNAeUxqfuIeaj
         SzI22BaNcqcVO+Z/T5Rajk9UAzjjPtdm4Jjl5ELO8lc31PJpqyTQipE6oGm7iQUnwC6p
         tN0icSW9FygE292p6Hkhe6poFgbnfXxedYiZaIB9ituI0/c3livp2gaCWMZUlGbDkf7V
         NkP4lKHTg3yb6X6yrE8htRyx/VJB9P684igfR5bZQxQUATIBWmm1N/Z5CeekfHi9wNeI
         ZUhHoHNVb4INzU6PFkPtwvyHnp3kTIISVyEOD0W+UJHxo6CAGqF8i0K27f2zZrGXz1gS
         SKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763660218; x=1764265018;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFhpJKIcqes9gFcy7I+3pvbyB0hH/HnYmueMzCw4SP4=;
        b=pyoJJjwTiffu85KPd6aauIpZjR2MGPkcYjq49+LKGBUt21ufKQsYZe39ktRFt/Mjlg
         jeIhVZVa1k/miVk9ikUUidtdsvQajZrXLfmxZ+4ecoL6qdoczJFPl9ZBWKFY3ovn2dbR
         s+ChUekEbEmesrjYFA6N/2viB7ZCcpIYopJYcu6onYXOignpkYg2QoniiT2vSUP3HTRu
         mTIGsmKW0oR2Duri4Y5e4o3FMEjyRzseA+9KPvIqrw6rTyf5Db2YPoVEE3oIAwv3yB7L
         E2APG1VfAPGoswh90JEesWhUd00w6ZcEO7fDoRtt/q58yXErlqRHwjbAd5BlM6wmUtf7
         +oZw==
X-Forwarded-Encrypted: i=1; AJvYcCV3NiVnLv5wlb0D++IohHDkhu1bBMWKH5bx1DpRKClxsqZrWSIzI6JCPiCO2YOAqDBm1YhPauUUiYkq04Y7weg5@lists.infradead.org
X-Gm-Message-State: AOJu0YxiFP0vfJ6vV+egMuNhgldB+8XR41ldEcV5FmB6TfQvv3h7Do09
	T6Jd8dk2wEAsrWQTpPXBB6ObWMyt6kqAQGGVM13pY8bAR9sfZcs/xu11DBdDd5gUgFmqmQ0x8cU
	nFfiU2g==
X-Google-Smtp-Source: AGHT+IGFo+p0WlPj9Paobaw5vUvwfOFWPwB1dL40zeiXpe02+C7tIF6tiC3OF+S8WBQ3crxEOzfqU3kVKtU=
X-Received: from dlbrs12.prod.google.com ([2002:a05:7022:f68c:b0:11b:d4a7:e833])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b902:b0:119:e56b:9590
 with SMTP id a92af1059eb24-11c9478ab64mr1112164c88.21.1763660218304; Thu, 20
 Nov 2025 09:36:58 -0800 (PST)
Date: Thu, 20 Nov 2025 17:36:40 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKhRH2kC/0XMQQ6CMBCF4auQWVvSmRYIrryHcYF1gCbAkKkaC
 eHuNm5cfsn/3g6JNXKCc7GD8jumKEtGfSogjN0ysImPbCBLFSK2Zh23uzfE1nVN8L4NHnK7Kvf x8/u53rJ7ldk8R+Xuv7bUEnrrqHTYVFSjQaOyTS+5DCLDxGWQGY7jC6IpaBWUAAAA
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763660216; l=4218;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=gsS3QINB3jX+ZRH8cuZXIVubPgqbPwUz2dBtzJJwyyE=; b=nKBxDu+hW1XAB/2+eENQ1XLCEWJM6tfpn4cqNbVISMLXtgHyz7sPjnMNHE4OAdBgCN6L1aByZ
 J445SDv9iPMBRmpMMTiBvqjX3bFNGPFqA0kfKFU1NRWRm3lXqWi9Guj
X-Mailer: b4 0.14.2
Message-ID: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
Subject: [PATCH v6 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_093700_114781_8EFE1FF6 
X-CRM114-Status: GOOD (  16.58  )
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

This series introduces USB PHY support for the Google Tensor G5
SoC (codename: Laguna), a new generation of Google silicon first
launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The controller
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org 
- Add "usb2_core" to the reg property to define the MMIO space for
  the eUSB 2.0 PHY IP.
- Rename "usb3_top" reg as "usbdp_top" and update the description to
  reflect its nature as a top-level wrapper and align with internal
  documentation.
- Use syscon to access the "usb2_cfg" MMIO space.
- Remove minItems for clocks and resets, making all listed clocks and
  resets (including USB3) mandatory.
Link to v5: https://lore.kernel.org/linux-phy/20251029214032.3175261-1-royluo@google.com

Changes in v5:
- Add usb3 registers/clks/resets to binding as suggested by Krzysztof
  Kozlowski. This ensures completeness of the binding, though the
  driver has not yet ultilized the resources. The usb3 clks and resets
  are optional if usb2-only operation is desired, this is denoted by
  minItems and descriptions in the clocks and resets properties.
  Additionally, rename existing binding entries for consistency and to
  better differntiate between usb2 and usb3.
- Move the description of the phy select to phy-cells in binding as
  suggested by Krzysztof Kozlowski.
Link to v4: https://lore.kernel.org/linux-phy/20251017235159.2417576-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Remove usb2only mode configuration and the corresponding usb_top_cfg
  reg (moved to controller)
- Add more descriptions to dp_top reg to indicate it's not DP specific.
- Add u2phy_apb clk/reset
Link to v3: https://lore.kernel.org/linux-usb/20251010201607.1190967-1-royluo@google.com

Changes in v3:
- Align binding file name with the compatible string
- Simplify the compatible property in binding to a single const value.
- Add descriptive comments and use item list in binding.
- Rename binding entries for clarity and brevity.
Link to v2: https://lore.kernel.org/linux-usb/20251008060000.3136021-1-royluo@google.com

Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/

---
Roy Luo (2):
      dt-bindings: phy: google: Add Google Tensor G5 USB PHY
      phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,lga-usb-phy.yaml           | 133 ++++++++++
 drivers/phy/Kconfig                                |  13 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 292 +++++++++++++++++++++
 4 files changed, 439 insertions(+)
---
base-commit: 8b690556d8fe074b4f9835075050fba3fb180e93
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>


