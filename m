Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC4DD6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrezF05hBTPlyoc9tTvkwXhrzwuC5VZE33OKqww2y+o=; b=IhYXEsal51AgpoURqiUDa0YQGE
	mr6kihJZ2rq/GYekyH2XwR1KGOUQ1YoAFGHLii46I5HTWKBdopChe62ShyL99djcrCN1sGoyOMxjc
	ymjT6U9wDIgYq0Cy1EouaOaOta5/xqxDhOqsCgDkQfUY244O+Qhb2hVc/7Ns2zUB09Z3dU9317ehi
	EhUy9s9ycOmczJmxE25Nn+xlFKG3+Z1ZZavoJddDmkDjdsZPRso34Z42k4UoO1E/2mr0S5X83/cP/
	vfxVNfubUQdkPZK5luTi0apbg4li721eME6EQCJTei5ZDNfR20c4o5WrJPvsBfQ6RkjXWOCN38qVo
	VoaCTRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJbp-0000000953K-1igx;
	Thu, 18 Dec 2025 19:24:21 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJbm-0000000952W-3L8h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:24:20 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1037948a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766085857; x=1766690657; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrezF05hBTPlyoc9tTvkwXhrzwuC5VZE33OKqww2y+o=;
        b=u43PShbNwpMKNjhpsR3bi9xdFF2GlNRkEhZemwzFsTqIZQG3McVMywDs4sotFyObI9
         3zT93RPONxYB+4Agh3CdqcUTlXNygY6SozymCle7ARlC6Rp7fz7gI49CYWkRVeuj3TDl
         hmkrWjpWjzuaBc3YjadWX0RlEIiI6dz+Pz41Q1Y9lzZ3OU9ZODWlq1b8xrujaZJ270rC
         f7yz93gtV70HhEwcvbj3E8v8x/WoQKymllBjPC/bMNGvIlwnVNH51JL4wP/1/5uj9dHw
         OrSHy5scXBe/vweJtzxgn7U1H/zuNcOECtZ3olYp+dSyCe2ONjiwX6y6uYe/UMYtxvtR
         +2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085857; x=1766690657;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrezF05hBTPlyoc9tTvkwXhrzwuC5VZE33OKqww2y+o=;
        b=nfUcz18UXQOkZL5Cr01x16t1aOrpJotCAihrYQvqjWNgyF0YHCS3NwzHNQ+FtNYFQR
         WsxJsDUe7ZRzJ8TxzYxWgdLNV8jgk0JjFp6IU+lNEFuREgLT2mg/xX/8n8XGTp4rPnJS
         YGnVoevELQokk6N2Hlgozese+wivxmV/BQVCiofZKcJSeDpgc+ItOfQky9EEekslKrHA
         jFiEj4X9XDkhVU3B4tZSzT08pfuUbNF4DHT7DvARKMASaYE4PTJljU0/IoZjWwaTqX7U
         tgeh1h6Bf1IOH+QZCzwU80XhXVHohhw0D329vyJcK4B9ag0/QHPwkI0CwUfWoG9140gW
         LZMw==
X-Forwarded-Encrypted: i=1; AJvYcCUR6kHF7XM/ghkL3sMpab7JGGoiZX9tpUTenHZxvssaSutq80UQ+gXZS8CdBVyZFFnToHVTfRxCRf/9dAeXgj8l@lists.infradead.org
X-Gm-Message-State: AOJu0YwxXYhz0VYraw5NEDj5PjNMxaSK8BN64z2p9w2eGSnR/GpXGORJ
	lBDkdo/lgj/XEd+2mYTfB/HUDUZwG076oWGJpgU4cxd1FnLy90O+SproRf+3jUy5PwVuLzgmFes
	vGxYzfQ==
X-Google-Smtp-Source: AGHT+IFa+6SmGfUkIqFcWYkM71AGyzleptfMzh2HOJNU/e7vccjigezYG+iRc0Hs9V5FciCCNY21d7DzDfs=
X-Received: from dybgx3.prod.google.com ([2002:a05:7301:2403:b0:2b0:15ff:44c8])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4185:b0:11e:3e9:3ea1
 with SMTP id a92af1059eb24-121723022e4mr297799c88.50.1766085857216; Thu, 18
 Dec 2025 11:24:17 -0800 (PST)
Date: Thu, 18 Dec 2025 19:23:09 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1URGkC/22OzQrCMBAGX6XkbCSJTZP15HuIh/5s2kDblW0ti
 vTdTb2oIHv6FmaYp5iQI07imD0F4xKnSGMaWu0yUXfl2KKMTXoIo4zV2hhZ0zgz9T2y1AYq1TT
 WlS4XCbgyhnh/286XtAPTIOeOsfxSaFBwcDnsDaQrpJZMj/5Gp5ao7XFf07C5ujjNxI932OI34 9+ExUsl0dnCoGpCYf23ZmtY4MMaZX9YSCwEbX2lfQAHP+y6ri+vdSAOHgEAAA==
X-Change-Id: 20251122-controller-129b0dd57a74
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766085855; l=4872;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=r2nfcgE9H5Zw6cGRbY0dMONGUMXhlb7voPYvTZk/85g=; b=9tR7mlclTjSkDEjA2dTpWxvMt66/rqatgrSFSBP81dwqat5HpqCGmSCYQH9KHthQZ5pIjoKWv
 GJsMpkbyDCYAWNbICVWhqVkg0wTf5A1IpNz7pz6vp1bBSBYWqJkulPf
X-Mailer: b4 0.14.2
Message-ID: <20251218-controller-v10-0-4047c9077274@google.com>
Subject: [PATCH v10 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_112418_842252_1A4CC14B 
X-CRM114-Status: GOOD (  18.25  )
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

This series introduces USB controller support for the Google Tensor G5
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
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v10:
- Per Greg's feedback, remove Kconfig dependency on ARCH_GOOGLE || COMPILE_TEST. 
  Remove ARCH_GOOGLE as it's not yet in the kernel, and COMPILE_TEST is no longer needed without it.
Link to v9: https://lore.kernel.org/r/20251205-controller-v9-0-9f158b18f979@google.com

Changes in v9:
- Update the Kconfig dependency to depends on ARCH_GOOGLE || COMPILE_TEST
  Note that ARCH_GOOGLE does not exist yet but will eventually
  be there when the following patch lands
  https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid/
- Mention SoC codename Laguna in Kconfig description.
- Sort the header alphabetically.
- Add driver and binding files to the Tensor SoC MAINTAINER entry.
Link to v8: https://lore.kernel.org/r/20251122-controller-v8-0-e7562e0df658@google.com

Changes in v8:
- Add COMPILE_TEST to dependencies for build coverage.
- Drop redundant default n in Kconfig.
- Update Kconfig help text to explicitly state the module name.
- Use container_of_const() in the to_dwc3_google() macro for type safety.
Link to v7: https://lore.kernel.org/linux-usb/20251119093749.292926-1-royluo@google.com

Changes in v7:
- Follow driver naming convention and rename the driver as "dwc3-google".
Link to v6: https://lore.kernel.org/linux-usb/20251112123257.3755489-1-royluo@google.com

Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org
Link to v5: https://lore.kernel.org/linux-usb/20251111130624.3069704-1-royluo@google.com

Changes in v5:
- Use syscon to access host_cfg and usbint_cfg MMIO space per
  discussion in https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org
- Make warn logs in dwc3_google_resume_irq() dev_dbg.
Link to v4: https://lore.kernel.org/linux-usb/20251017233459.2409975-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Rename dwc3 core interrupt as "core".
- Remove u2phy_apb clk/reset (moved to PHY)
- Configure usb2only mode when usb3 phy is not present.
- Adopt pm_ptr PM macros to fix build warnings.
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
      dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
      usb: dwc3: Add Google Tensor SoC DWC3 glue driver

 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++
 MAINTAINERS                                        |   2 +
 drivers/usb/dwc3/Kconfig                           |  11 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-google.c                     | 628 +++++++++++++++++++++
 5 files changed, 782 insertions(+)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251122-controller-129b0dd57a74

Best regards,
-- 
Roy Luo <royluo@google.com>


