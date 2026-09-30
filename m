Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB97CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XU8HIZpe1oO3y7TtlBE8Jw6wJiFXsm+bmC+ZhFp7YSg=; b=GkKrE17fTxAqik3ycwqWqCri/4
	k18dhQDnTyJ++4C5zVwHrFmE4vtyYAFUsoneRRKhjwIBy/emijnKwVSio0WPN1ijY9rqbR2w492rp
	QZT66SqUxVdulWv9R97q21jNbIEaWL/ib+fpT5uyuGCd/32a23/mpvDEPMDdQTUTwdo0CtOU90/bH
	txXCLaY+gPH8B/rQsOBGQNLK2d2Zln2tamDRB7DjuAoIREksVFyc5lQw4Q/D+zGVgO4xl/Yq2fzvZ
	dJqY2LfLN37X3wDvxX7zNGMK7utuyjsfiIxnKaei97TbKuna7e/Iz/sanRy5F+LRi7bdfOacVYDPp
	wVbto4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrW2-00000005kju-1fPR;
	Wed, 30 Sep 2026 10:26:23 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrVy-00000005ke0-2jn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XU8HIZpe1oO3y7TtlBE8Jw6wJiFXsm+bmC+ZhFp7YSg=; b=KM5TxsoFwFCXK6I69LZ1GeAFeP
	JW3UrKPurS2NtH0yspyP+Si/+5qDPJPNnDZJxkgPhL5xegr3mlCbKqy3B/0PGq28s6x4Yia7WwWvt
	nV3PJW+cmHGsqJ7knW2ry6mOHfPwZUoHgjg/5ZukepnrKX+CyM0U3uH68uczvwX/lgZfMmxCNqpT5
	AUgUS4EDfYKX7kHkPQzf+gi0JzWCoTxJlQuoN118GEuilp0N1I1JFoxjtZatz5dAAPdrLBD3xQ5p0
	VZKcZvuWoE4LGm+kr9QuKXw85q8pAhKn+X8UsesEq8dLBPJKObKKbGjbB5mcGBwWsXLdLsXgY4dqp
	hmG0fdgg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-28ga;
	Wed, 30 Sep 2026 12:25:34 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 0/4] ARM: dts: imx6: phycore-som: PMIC and PHY fixes
Date: Wed, 30 Sep 2026 12:25:28 +0200
Message-Id: <20260930102532.2262700-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_032619_152929_5DD4306F 
X-CRM114-Status: UNSURE (   5.00  )
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

A few small fixes for the PHYTEC phyCORE-i.MX6 SOM:

- Pin the DA9062 PMIC watchdog to /dev/watchdog0 (1/4).
- Raise the PMIC's SOC/ARM buck ceiling to 1.5V, needed once the
  1.2GHz OPP tier ([1]] requests 1.3V for VDD_ARM and the anatop
  LDO's 125mV dropout is added on top (2/4).
- Migrate the Ethernet PHY reset off the deprecated fsl,fec.yaml
  phy-reset-gpios property onto the generic ethernet-phy.yaml
  reset-gpios/reset-assert-us binding (3/4, 4/4).

[1] https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/

Primoz Fiser (4):
  ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
  ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
  ARM: dts: imx6: phycore-som: Convert to generic PHY reset binding
  ARM: dts: imx6: phycore-som: Add reset-assert-us for PHY reset

 .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.34.1


