Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33188E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m90eR2pZoM5wYBdraC1+5wxeRtDbP6ZIOP51SCYg2dY=; b=kJzJq3A7ca+T7XlQMG6t62PoDk
	+VrU4HDG7ZB8L9onqYdiSQhDmhA66x9CpOP6fZZuNZaS35jwzjsKRffOqaEmaBMenGrl4ZOZzVmWv
	9ddeA/pz52VIX4oBcwLteJb093DrEdOcVDCnqvgqSTqiW/uDT70fYmsrucpGGQ7P0WTNGmndF63GU
	4g+hgUbaQnzYL57h/FnP+CWsJs7U8imUeeNtrWT0aN9V5iAqEMYouALXQ/xUlk9wI/G7QdFgmYG/U
	bQa+IMWr5RHOjHs7jiWAqmSOlyyEWpqI4Rqg1AxJogdS5xOAqSerPyk0+a3Th5fWg++cAk0LLvaxB
	2II/P7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaUC-000000021cJ-1dEf;
	Fri, 06 Dec 2024 15:43:20 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaT8-000000021BS-2YoM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:42:15 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9837m0zGpQK;
	Fri, 06 Dec 2024 15:42:04 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b902H5Qz2x9C;
	Fri,  6 Dec 2024 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499719;
	bh=neTaqtoQH8oCbcDacsjTmUKBDT+DBo5JmI9hlb4ud6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=ORHIgFas6siPawcjiGSl2faAqI+z1ld32cdyiu0NhLFcW0iK+nqnRcxSLbb+DYaDn
	 3p/U45krUVZfEi62GEvmQF80XtoaRD5eNJ7uGalOMs89OJZTn44fITUWRqi/ptXxLR
	 oGHvL/IRGoKeIoPq+3oBgI5z+D5XRZf+adCotywjwIlSgaGD2oM0+52nR/GDmnfMAs
	 Jarc0cfE/E/PErAeCbpppys2ttxfyF6k9ct9rzlE/5WjF5kzM0ewnxd/pacv6ekgwl
	 U778b8tBQtw1hyA0XCo4Z42zPWv8a4GzEx2cUXgP91TNhTnnCoTKgeZ5E39SOglkz9
	 UYoCQovZ9o0hQ==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Fri,  6 Dec 2024 15:41:45 +0000
Message-ID: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_074214_665062_6C8AB4B8 
X-CRM114-Status: GOOD (  17.36  )
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
S20 FE series and Note20 series. To accommodate this, I've
now named the device tree common's matching the codenames
(x1s-common).
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

Changes in v5:
 - Fix dts makefile order

Changes in v4:
 - Rebase from krzk's kernel tree to accommodate
   for the merge of r8s
 - Rename exynos990-hubble-common.dtsi
   to exynos990-x1s-common.dtsi

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
 .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  | 28 ++++++
 4 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

-- 
2.47.1


