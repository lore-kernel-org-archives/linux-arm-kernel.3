Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90BEEA4E22
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ElCiVGRSI7oKC/FuVyiioCEYRYr9uDDK7MtuOqMEEfU=; b=prQo0NfCL57fIR0bebrRT7HB8/
	j6hQ8OF64UJ/p1YTj3bESs8ICZ9q40rrFVbUzoEio2I5fpAk53lXmlKVy4pFmvWnOcdjQsof6HbqI
	KzG6EkzLWOi0c6uQq7qCtZ5RXTV0KPbtYDwKLQ12qlvrh56rypzUMGwec6H/zqkmaVbt/l6qql4L1
	Ppn3IefhUVUfuXLjceHCIOXKFMUZOZGfDamUJc3zki+Msq5pEXCxlXmEcY9yZ84eWXJu197obI//L
	RSBgi8wFwO3OU9Z6V4Zu45zOIapDc3FDdpijODV5GDkQThctwEEinWvkT6ZBxuO1/xtVPfJf85oH/
	FWd5h7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BL-0000000DMSG-2f72;
	Mon, 02 Mar 2026 15:27:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BK-0000000DMRW-3W5G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0508A60018;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6BDC19423;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465257;
	bh=U1LVZKiOs+6bdtnsgEbKMpwzp18gX4CvEKWahajFxIs=;
	h=From:To:Cc:Subject:Date:From;
	b=OthBj7JyQNqVdWBa+tKkfsYwNOE/jnS2htS8O+CFjl6ketwgSJoNjVhwLQTZL6V0G
	 CjuUrsCOhwpRItGRBVRaal/b7rZ6XONV0bGXnv9P0BToxAGW+PPTCCZ5DHMUzBz8E2
	 5pLo17vIyLBMJxvkuqR/HjAGvq8/ymI0fKGro0jcs0fXLWPhLhdDI6R0/g7+IhvItV
	 jfRaBHEidcdTb6L7Vsoz0kJAEJBA2xEBKvU3ILPk0I3xnvZGe9nz8cvnz7/xBEbwmO
	 IDOKTpqX9MpDWbz1IU6NBHsr2BahWRhGxMUyU+IgGAjhtytAn3o7kCYU5JjN2bfd6W
	 Pi0jz+yf2l4ew==
Received: by wens.tw (Postfix, from userid 1000)
	id 0B27D5FCAC; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Mon,  2 Mar 2026 23:27:19 +0800
Message-ID: <20260302152724.3197587-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is v2 of my A523 LED controller enablement series.

Changes since v1:
- Rebased onto next-20260226 to get rid of unmerged context
- Collected tags
- Link to v1:
  https://lore.kernel.org/linux-sunxi/20260225160828.1687643-1-wens@kernel.org/

This series enables the RGB LEDs found on the Avaota A1 board. The LEDs
are connected in series to the SoC's LED controller.

Patch 1 adds a new compatible string for the LED controller found in the
Allwinner A523 SoC family.

Patch 2 adds a device node for the LED controller to the dtsi file.

Patch 3 enables the LEDs found on the Avaota A1 board.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
  arm64: dts: allwinner: sun55i-a523: Add LED controller
  arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs

 .../leds/allwinner,sun50i-a100-ledc.yaml      |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 ++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 3 files changed, 64 insertions(+)

-- 
2.47.3


