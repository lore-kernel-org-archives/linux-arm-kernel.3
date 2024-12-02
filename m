Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EDAD7833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7MFJjFqgBYAJJx18nzW4sg7YB7trfcVHo+HdGwnzy+c=; b=wqdQQxlcF0gVr+AE8I+JA9lB0U
	gEXPIp34nWvcaDo7HGiO9f7IPqi0t2g0gQZ/yyRCwWUlZxA1xHKmMDQVRv9Nu8fLLy4ttcs19w5ss
	vXfjWF61vNk1r1laGvKsq+FF2LaaD5yGtHxNWONMHn8PBpcQw2TgGxgb7qKXHEnbyk4wuMD7VnZmL
	ymeax3EaXRFyaBffkKEPcvAg+v1Ne+w1HgvZDi0cLenM0dyqgSgHsyoOyL7j6wRawD1MNxXt1VZaL
	rNoVR/yplvxrMUDWAPp1D3r/mXMAMFEdl4KCNwqMsbS1VwQEaEerfZfA1mkjla6z+1WamcXvjI7tW
	enf5pvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIASX-000000073t7-3dT6;
	Mon, 02 Dec 2024 17:43:46 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Bq-00000006pTA-1vjH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:22:28 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y28FW22myz4wDF;
	Mon, 02 Dec 2024 16:22:23 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y28FM2ZJlz6tkK;
	Mon,  2 Dec 2024 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733156538;
	bh=3w6h8OGAMVa5Fzirqv8ni0hUpNILhJLCE0izk9850T4=;
	h=From:To:Cc:Subject:Date:From;
	b=GKqXwvXs8OEPrp5pgITViH2WJezVnJzxcMQ1WnzmPG5qtQYkDSqTp20KHkbrOwwNh
	 OfndSn9lvOj0mTRXHN05TkIqBbLrR/U3YH3GJZxO4fPiexL/dwcUkHkitu8X2PZz2I
	 184+5LZIia+gB0ObM2LnWrc6vSIZ4UMv2B520WPr8N9OO8hFWjL/B5ujULMY17IBDl
	 JncLeGEY1hrlj0hyT9tGr6oGHgdYkC+CXSsD5Xr+yTPkkP2hzH60AhfCReQ9KHZ7O8
	 x/2GmyaPcbh+Ktr1zqlzv2zyQJpBYcfntxvE82tKaY+wK8u9oBNoEcSP1XpTsWxvrH
	 K1Nn80Zq+ua9A==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [RESEND,v3 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Mon,  2 Dec 2024 16:21:54 +0000
Message-ID: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_082226_546863_BCD2BD02 
X-CRM114-Status: GOOD (  16.11  )
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

Hi folks,

This series adds initial support for the Samsung Galaxy S20 Series and also
initial board support for the Samsung Galaxy S20 5G (SM-G981B)
codenamed x1s.

The S20 Series feature a lot of similarities in their configuration
and internally Samsung named the common devicetrees in their
downstream kernel 'hubble', please note hubble excludes the
S20 FE series and Note20 series.
The device trees have been tested with dtbs_check W=1
and results in no warnings.

This initial bringup consists of:
 * pinctrl
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

Just like SM-N981B, the preferred way to boot the upstream kernel is
by using a shim bootloader, called uniLoader [1], which works around
some issues with the stock, non-replacable Samsung S-LK bootloader.
For example, the stock bootloader leaves the decon trigger control
unset, which causes the framebuffer not to refresh.

Device functionality depends on the patch series from Igor Belwon:
"Add minimal Exynos990 SoC and SM-N981B support"

[1] https://github.com/ivoszbg/uniLoader

Changes in v3:
 - Fix oversight in yaml
 - Decommonise memory map

Changes in v2:
 - Add Samsung Galaxy S20 into device tree bindings
 - Add support for Samsung Galaxy S20 as well as the 5G variant now
 - Fix typo in Samsung Galaxy S20 5G commit message

Kind regards,
Umer

Umer Uddin (4):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
    and SM-G980F board
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
    boards (hubble)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
    (x1s)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20
    (x1slte)

 .../bindings/arm/samsung/samsung-boards.yaml  |  2 +
 arch/arm64/boot/dts/exynos/Makefile           |  2 +
 .../dts/exynos/exynos990-hubble-common.dtsi   | 98 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  | 28 ++++++
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 ++++++
 5 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

-- 
2.47.1


