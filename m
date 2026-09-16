Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7648C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xTOSXHHE0Mp7WmhyDX8b5V5DuyvbmNcf+A+5A/N8sLo=; b=ahaonxIXEHovG3VpRyCB3TrTpg
	C+SC1eTtY4GA34VpeI60lMjNZYNeh4+2gjaSsx3SDvc6QgLGht05NEgaSZIJC2aB9wGI2v+oBSMeY
	2dvm2Y69SSZ7Pg8FLVVCmVCZCevV2MW3GGEffJHrPst30dbRyWK0xec6Lcm0Gy5q2CDIVf8Y8fZaH
	iP0vlu2Nr70BxsTd7+84YLUnAonxLFSUvQRHX6CyRce8y+uCOKlg39CM58fSVBukwAk2R2KrWVyPJ
	3ypQFZtE4VLv+oVPYDHH7ORXIGdrrRJIxETGnnjl/QsH2tdpFbbuh3XKiT36I0RstohVAXW10DgDx
	nNGQy2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hSh-00000008JKa-2Kv9;
	Wed, 16 Sep 2026 04:41:35 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hSb-00000008JKB-0WHh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:41:34 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id B042B40B5A;
	Wed, 16 Sep 2026 14:41:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789533679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xTOSXHHE0Mp7WmhyDX8b5V5DuyvbmNcf+A+5A/N8sLo=;
	b=UlWnZZ+UVMEPdKCU7xcAFSbFO3th1cLIUDQAVgxHnxVx1R+lEdIoyMk1vV0Zvwe2nSIpwL
	ZFyTQtYBEJxngpet4wEa3OPi+HSxb4lNcF1PXZITorzVYPJT4u3LOS8vxeo3DLrUmsfe6B
	TewlUlT2TQQ1Jy3bYF7TtfNh9XyrThGWCMlvR+GJSfOutXpYKeisnXx9dwWGRF8qlWMsEG
	auLx73Cc4M2pirx+S2/HIHW1devcpDo59O9lqW8cz8l750238DpVNnbKOBNHEZyWKcO5j5
	Zhfw65agxQeObJuk7lgCCccPAoV2TQR2qaioEusCk4c4fTDd7nGlets9PDlnOQ==
X-GPT-Reason: legitimate; the email is a technical software patch
	submission for the Linux kernel (net-next) regarding Allwinner
	SoC hardware support. The sender (alastair@d-silva.org) matches
	the personal mailbox list provided in the environment context
	(alastair@d-silva.org), and the content is highly specific technical
	documentation with no marketing, phishing, or scam indicators. There
	are no URLs, no requests for sensitive information, and the subject
	line directly corresponds to the technical body describing driver
	and device tree updates.
From: Alastair D'Silva <alastair@d-silva.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300 EPHY support
Date: Wed, 16 Sep 2026 14:41:15 +1000
Message-ID: <20260916044119.475666-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_214130_915310_B7BE28D3 
X-CRM114-Status: GOOD (  12.61  )
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

This series adds support for the secondary Ethernet MAC controller (EMAC1)
and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
Allwinner H616 and H618 SoCs.

The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typically
used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
dedicated clock control register in the syscon register space, which is
accessed via an offset index in the DT syscon property.

The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Ethernet
PHY communicating over MDIO at address 16 + phy_addr. It requires
retrieving factory bandgap calibration data from the SID nvmem controller,
managing internal power rails and clocks, and optimizing transceiver signal
parameters.

To ensure reliable link establishment and MAC software reset with the
internal PHY, dwmac-sun8i is updated to defer MAC software reset until
sun8i_dwmac_init() after the internal PHY has powered on and begun
clock generation.

The series is structured as follows:
- Patch 1: DT binding for Allwinner AC300 EPHY.
- Patch 2: PHY driver for Allwinner AC300 EPHY.
- Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
- Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
           internal PHY deferred reset.

Testing:
- Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
  Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
  iperf3, NFS rootfs).
- Device tree bindings validated with dt_binding_check.
- Separate SoC and board DTS additions will be submitted via the
  linux-sunxi tree.

Alastair D'Silva (4):
  dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
  net: phy: Add Allwinner AC300 EPHY driver
  dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
    and syscon index
  net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
    internal PHY support

 .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
 .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
 drivers/net/phy/Kconfig                       |   9 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
 6 files changed, 486 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.yaml
 create mode 100644 drivers/net/phy/ac300-phy.c

-- 
2.53.0


