Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C748103E17A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A91VE9zUrSarhv4N3nkmhVVO6faCulKxcborukDvgLY=; b=MCpJU38aW94yNDqaZhHONx+0Kf
	L1H21+f9W+NWzL+6V9fsduudkH6iZzb81VZfp/p0grBYTUANGr39nwmEKhCPvtWoVQCXzRp7lQd8F
	EakxuB9StnjyJU+oigkncCyDPPcdCBbn6A+qFW+0lcd6mcP0I4FaIDa4CrxH+VYjS3hQ6/9+NbLai
	iva9ZNw7e4B3mYogTVrmNGq/TvF1BlqGCkct6ObmTVY6J/lJLSe88CGefXZDCq6rZLQJZpEoJ9TIi
	IP/G4p+DI5MtqunMniEdNe0pKxptHTevF0OOhysrEa0S9L2fFtg+QI7Fpm/DljxBDr8c2wTf4Ho3y
	jyP5XhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rYE-00000008YEF-35lg;
	Wed, 18 Mar 2026 14:07:10 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rY1-00000008Y7N-1Is2;
	Wed, 18 Mar 2026 14:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=A91VE9zUrSarhv4N3nkmhVVO6faCulKxcborukDvgLY=; b=nmrnwH9pG2mqsKD1lZrM19kaDU
	/3aLB0+tIO0Vrg8qlynkCu8JEZ3w06Z3JVCUCNpcxuHccWniFaEAjXhiKdToTHTKhF2CaKDLbE/oM
	qKxusimom65Ks2viu8TFARbsEiJJrrWO3CglRF6uKKictQ/+quEkR4YEM7xbaZH0/bxCvSqAjnEPH
	E/N+VMjVNkSM9s3Oi54xkY6G/ZegcgfQnh0Kl5TP9hiRQLSKWv5gASuq915BzCX0vXR+hYMz6Ta4t
	1UySG8addNXDFPx4ZyiLGdqsveKKpUOnKat0muU+tAduH2XTAk1wiDtGqJJYqrqqL60VSuPYRqD/Q
	XLf5MjnA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXv-000BpY-2w;
	Wed, 18 Mar 2026 15:06:52 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXT-000B1s-08;
	Wed, 18 Mar 2026 15:06:23 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 0/7] J722S SGMII support
Date: Wed, 18 Mar 2026 15:05:22 +0100
Message-ID: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27944/Wed Mar 18 07:24:13 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_070657_484772_B61027A3 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

The J722S CPSW and SERDES are very similar to the variants found on the
AM64, but they additionally support SGMII. Introduce new compatible
strings for the J722S to add this support to the drivers.

This is a prerequisite for the Single-Pair Ethernet interface of the
TQ-Systems MBa67xx baseboard for the TQMa67xx SoM, which will be
submitted separately.

Nora Schiffer (7):
  dt-bindings: phy: ti: phy-j721e-wiz: Add ti,j722s-wiz-10g compatible
  dt-bindings: phy: ti: phy-gmii-sel: Add ti,j722s-phy-gmii-sel
    compatible
  dt-bindings: net: ti: k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss
    compatible
  phy: ti: phy-j721e-wiz: add support for J722S SoC family
  phy: ti: gmii-sel: add support for J722S SoC family
  net: ethernet: ti: am65-cpsw: add support for J722S SoC family
  arm64: dts: ti: k3-j722s-main: use J722S compatible strings for SGMII
    support

 .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   |  1 +
 .../bindings/phy/ti,phy-gmii-sel.yaml         |  1 +
 .../bindings/phy/ti,phy-j721e-wiz.yaml        |  1 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 12 ++++++++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  8 +++++++
 drivers/phy/ti/phy-gmii-sel.c                 | 11 +++++++++
 drivers/phy/ti/phy-j721e-wiz.c                | 24 +++++++++++++++++++
 7 files changed, 56 insertions(+), 2 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


