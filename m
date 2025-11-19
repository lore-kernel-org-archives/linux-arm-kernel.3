Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715B8CF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mAVQG061YW725q/wmjUYBgy0COgl5nGBRM+6s0kYZuo=; b=buGnz2B/9bi7iRwfk8gSadUn7I
	lhF7wTIjKWe+M2eEl/aKJzluGA1vwAQlDqmndDtpX6S2od2yYPhasBkKWAxAS4ZSgqJDRxsUVZ+7r
	27JY/4OPVSzu3oRU2eDBATt0EiZkdxKsBX7+P4TUJ3LJ6NXOPIW3Ell21kBXGBV8qJ5JUBgyDzmUL
	TPtwLTzZ5BMSAVheILTK7aHcF1SxcOYiJufQuei2hFegx4k9r31hyt0QNVSpWLxmX+BwRoALLIHzF
	vkzY1bGKm75hJ7TB/Bypm56HQyweWlpcp71CSNrYJaQiRpI+a56JcPho9zZK8WZMAk/Sxx/PIzxfI
	CLMnGNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLedW-00000002shI-3sqD;
	Wed, 19 Nov 2025 09:38:02 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLedS-00000002sfb-20w2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:37:59 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-11bd7a827fdso827c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 01:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763545077; x=1764149877; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mAVQG061YW725q/wmjUYBgy0COgl5nGBRM+6s0kYZuo=;
        b=k+5++TcGbl0p2VCiBF5HTEdL7fck+r6wTl9f0I4/KuJMMAqTvnyiNcj0oGn0Mu0OsP
         jyKRKGk2JIcRsK6FF0GdImXe4Fy9I9SVG2exK9sZQoq4MnNGBh0oP4jwFDYF9Xuveo3k
         O3qHXV2QkwB5YR9aZmNykxRdISl/BnMsdAPT2cCDLjZIhTDDEeWJ3TS0yWumNMnM4sil
         efF+wySl7v5M5A28ZQ+vnZ91/x/L9Sf8GCpRcUOMYdKtIpGaDUG0dqzwzk8lgTxJJxvV
         QnnxxQMCg4vY+JTf08l/tMrOg7KGNCpuVS0PXklsU8Y23Msbg7OjuczZT3AA4k63Losw
         gB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545077; x=1764149877;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAVQG061YW725q/wmjUYBgy0COgl5nGBRM+6s0kYZuo=;
        b=AdA2Oxv8jyJ0lk+IUs7V4+7t8FCdnDi3MLkjnViVkpMlS0nVOQXh7oeOn0GuWaE7bo
         k0EvtJtk2VXvxtw0x7czrn++3Ph6eb+D9XZGUkRftBQugZynSBxnluRLuJJW52fcUXcy
         AkVTrxk+FUJ2RXy5i9fsy/yBiP0/fR2jajgkTQdsYtOua/MA29N0iWN/vKioX1HchQxk
         fBSqU7DwpYarhpUPesfiVzfJ8tkuJLQ4r3gRbjtaI3fUpVv3j7z6UJJbrYjjsoxPVBH1
         zYFOc4Yn59fz+iIGvpeJPfYnow0l/Y17TOhYQD1jDPQrFz1qKOLI6iunD+U/8oaZYckv
         HQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ak80xokNsDJayGqEIKOs7KG3xCgzKrZbrIqwwn300XyIrUJLLqCYDQE02Mq0HpWMGZDjU3eyHtNGwKsJmhI3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx4RW3CcXpnSEYo2w0liSdFCPmYEB/BwdphXvLtcPh/8OEmgum
	9J+gVt+mgr0SmGFOw+++aEZAPdlNjkay4ktdcbcMpAcTPKXyJ1q59lXEZdaEe4vVzVFI86zZjg5
	9dZJY3Q==
X-Google-Smtp-Source: AGHT+IEjF6sLuOZO6K6uO5uOpAxqm66tBkwkp0GiH/cYEmkoiS90zBFbVK08yLSxq9hgLXgfWB6Zs/rO4SQ=
X-Received: from dlbdm33.prod.google.com ([2002:a05:7022:6ba1:b0:119:49ca:6ba1])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ff42:b0:11b:b6f7:563b
 with SMTP id a92af1059eb24-11c8dd1e72cmr683912c88.1.1763545076721; Wed, 19
 Nov 2025 01:37:56 -0800 (PST)
Date: Wed, 19 Nov 2025 09:37:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251119093749.292926-1-royluo@google.com>
Subject: [PATCH v7 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_013758_550073_0783BC66 
X-CRM114-Status: GOOD (  16.73  )
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

 .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 628 ++++++++++++++++++
 4 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.52.0.rc1.455.g30608eb744-goog


