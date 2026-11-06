Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99491606D814
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M14dNtGU;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ReNeYfCO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kPbSQnSE/QJ3x1rfPbGOXpcL9+sompGSau+wLZMj/jY=; b=M14dNtGU543+0dhJRA8+O5S2pS
	VWn9SK1T3smRp/3cI2AYFddDQe0/yqckWLnH/Yj9S2m/JxhFlZWlzHnGR8vDLo1/ubJdLN1GbEshb
	TUcP0aIE3S0IigM+zOA+RT7Zfw7ofniqHoJQm550jaFvPasR5zN3Fgx8ENZDso7OYl7zg801VgPBx
	T9nApaUe8kbLI7ZmP7tILPFQOf0O/siLAPMHcGrlXwmvEmWP+k5o5hFYtN91WPL249wTUa6pv+YTc
	/nbVyW/EXqWdMTPy0Oz/WmOhkg00OY2klrif1jFXbHMhuzANgPisPBBQZe+QG430FaevpSpJD5/Me
	XkSKodKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqr-0000000BVG8-3fqX;
	Fri, 06 Nov 2026 07:59:09 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqp-0000000BVEQ-1tej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:59:09 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9F45F20041D;
	Fri, 06 Nov 2026 08:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kPbSQnSE/QJ3x1rfPbGOXpcL9+sompGSau+wLZMj/jY=;
	b=ReNeYfCODfomlVdCheXppJS3kDPTfv3rlI0YZvjJ/dtPnNwHYpmcExyjMdsrh/CBRF2XY2
	qolZHRay0uslgFVT01et+9/nYwOVCUyFhQiSkmMhbPOTcEN4c5QSCohzHrjMumo1gfg+1F
	OkR9MtMtd1Bjg9FGot7qliNj2NAugwfv6NReWAYR7pjuPXwYjhV4TNNZK9ywcw1hQEiZNJ
	Fc938oMv1iLS5M60NIpuPFZvhQxAMl1Zb5974ZVPpkeGhp8+lurrhv9KTwuD5gQDW+q+Wh
	qqfp1IIVpSIcazMCtGwhanKbqCYswz88GaDV6EkYGBHCJRvwJonREXBXywIhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kPbSQnSE/QJ3x1rfPbGOXpcL9+sompGSau+wLZMj/jY=;
	b=KE90NvHM+cd2vMrolv6/WcqIH2pfZ/OfuyV/xvREFuN7lMNiNc1WumxkyXqq9GQJjInHzV
	rAgCQMJXolHuSArrE5EftrtTuBBAXAeO07Q2q9MrZzCIWR/pHjFy0FQqyIbYZNmqhEfTPz
	LIULrT36MOdWrxRbSavmPmwXdDRxC3nandjHlCrOHGdj9q+AsriMdGbNT+Q/zwqi5AT04z
	kZPUKfTqK0iEF2xXlFleXXZuG/uTXCZBHEZsLHXXD3nDMOT1ASwkc17wZYX+Ywboj1uZUB
	BT0iP57vMSNsSpeX3xxno/PwiLLIbJLHXuEH8HSXAkmmu4XtBT4bvbQGIATmuQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793951942; a=rsa-sha256;
	cv=none;
	b=fe87B8CcFvG6lvmdFWK1W5h7Pm0mxXwDrwUAG40Be9cPrlZucaA5nxWsS+Q8YKOn2fG7mJ
	w1NixVzFu4R1w0CHb7smXBiWVMTSWquCdBnsc5q7LUmg3tU/JUjDa7GR+yO80ylY6GTuvv
	i7iq3kUNb22R9qMGofTpnXOhw/F9HC2hNOcluTu+pxrRuWbW1+uua1r3SFEJMlXA3m/z0y
	ekwqoQs7VgtyVdsllm1x9xAdsGQ65V34Q3jz+/9cNOqHi+uIo5jjWE5XPtRv66l5GkMPgG
	Lvh206Ob04fPrpJ8zEELL6p+4tEuAha0WYOtFd26tezgNPwSZjUkJgE4VR/vrQ==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH net-next v3 0/5] net: dp83867: add new output-impedance DT
 binding
Date: Fri, 06 Nov 2026 08:47:24 +0100
Message-Id: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrh1T2tqCK+9hXEAZoC5K05YGQ
 7i7BTcmGpc/M//9hQT0BgO5HBbiMZlgRpsDPx6IHmrbI5g2Z8Iok7SkApICBnF0RkPrSl5KBah
 4XQrNFS0kyUXnsTPzjt6IxQgW50ju70uYmgfquJnb72BCHP1z30/F3vg3lQqgUOhaVdicBWJ3d
 Wj7KfrRmvnU4r6S2IfD5E+HZaeuVCM0aokV/3LWdX0Bo/XfkB0BAAA=
X-Change-ID: 20260804-v7-2-topic-dp83867-e73a84c37016
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3673;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=al1FHRm3IZNEtLnKufWsjtPBIJAxTPWvgFsTaGtRGec=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bbjkOe/0v7VvdolUyb6bB+Zt1LjwpB5n/Sx6pElKsZK
 owPRUV1lLIwiHExyIopsqgsrOAT9fjgGTlNhAtmDisTyBAGLk4BmEhiF8N/97kc0xfz3rPgU2f2
 sXTsks1+V7PPL+mhcen1nsk1s/8GAVVcT32xNLDO7tp1SX/trFO8Ft/WHy361ubHesO7uU3EgBM A
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_235907_650051_5B2C6AE8 
X-CRM114-Status: GOOD (  14.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently the dp83867 supports setting the io impedance to minimum,
maximum, default or a value from a nvmem cell. In situations where there
is no backend for a nvmem cell, the value can not be set to anything but
minimum, maximum or default.

Add support for a ti,output-impedance-ohms binding, allowing to specify
the impedance in ohms via the devicetree. It is mutually exclusive with
the nvmem cell and the boolean bindings for minimum and maximum; the
binding schema now enforces this for all of them.

Until now, dtschema never applied the binding: it had neither a
compatible nor a select. The binding gets the compatible of the PHY ID,
which several devicetrees already use. The Xilinx ZynqMP devicetrees
then fail validation on an unused #phy-cells in their DP83867 nodes;
patch 1 drops it. It does not depend on the rest of the series and can
go through the Xilinx tree.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v3:
- new patch: drop the unused #phy-cells from the Xilinx DP83867 nodes,
  which fail validation once the binding applies to them
- new patch: give the binding a compatible and reference
  ethernet-phy.yaml; without a compatible or select, dtschema never
  applied the binding, so the new constraints would not have been checked
- ti,output-impedance-ohms takes ohms (35..70) instead of the register
  value, the driver maps it linearly to the nearest of the 32 settings
  (the datasheet does not specify the impedance of each setting)
- fix the range check, out of range values were silently masked
- describe the mutual exclusivity instead of a wrong precedence in the
  commit messages
- fix typo in commit message
- also forbid ti,min-output-impedance together with
  ti,max-output-impedance and drop the precedence note from the binding
- rename the binding patch to "Add ti,output-impedance-ohms"
- Link to v2: https://patch.msgid.link/20260826-v7-2-topic-dp83867-v2-0-a97b4cec6e93@pengutronix.de

Changes in v2:
- change 'u8 *val' to 'u32 *val'
- fix logic in driver
- update description of new binding
- rename ti,output-impedance -> ti,output-impedance-ohms
- make mutual exclusivity explicit in binding
- Link to v1: https://patch.msgid.link/20260804-v7-2-topic-dp83867-v1-0-1ca79eb54eef@pengutronix.de

---
Steffen Trumtrar (5):
      arm64: dts: xilinx: drop unused #phy-cells from the DP83867 nodes
      dt-bindings: net: dp83867: add compatible and reference ethernet-phy.yaml
      dt-bindings: net: dp83867: make exclusivity explicit
      dt-bindings: net: dp83867: Add ti,output-impedance-ohms
      net: phy: dp83867: support setting output-impedance

 .../devicetree/bindings/net/ti,dp83867.yaml        | 47 ++++++++++++++++++----
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso      |  2 -
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso      |  2 -
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso      |  1 -
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso      |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts  |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts  |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |  1 -
 drivers/net/phy/dp83867.c                          | 29 +++++++++++--
 12 files changed, 65 insertions(+), 23 deletions(-)
---
base-commit: 6584acd42820478910a771efb28a355a707e9cb0
change-id: 20260804-v7-2-topic-dp83867-e73a84c37016

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


