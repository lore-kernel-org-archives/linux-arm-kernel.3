Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D40FD25035
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lnEjCT/KXjdeggJVqH516vSvN1fXPkx8st2aEXQ5S0Y=; b=VVT+2L5F1U42fjB9MF8MKirj38
	aXtmXk0C5akqhfevc99LIbW6H8aL2rHYrgT+2woLI64Kmsw/feFA9rf95GN09oUx3+4swNPT7vDJh
	C2vv8SExyOy6p8a3G2ySR9kUyA33GRdAmCRT2/TI/mwyGH5Z7K4nnQJMUpMrciYLSMdTcOfVYorn7
	SipVrxwAKNcWYqAZh+D/aDFuxTsD/iukq+SN2n61f0zQgXcQfELbSCt7oSh2D+6/CV2hme1ppVFxp
	P5rwBCGHvwupSwL6rq3u9iueV0zvMHnGf5R9KeneZKFncyulrBNGEuBgRuxr9XRH8PG6u3V1Bw5xb
	TfVeS1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAZr-00000004meC-0ahG;
	Mon, 12 Jan 2026 05:34:55 +0000
Received: from lgeamrelo13.lge.com ([156.147.23.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAZn-00000004mdG-3ajT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 05:34:53 +0000
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 12 Jan 2026 14:34:47 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.31.97)
	by 156.147.1.121 with ESMTP; 12 Jan 2026 14:34:47 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
From: Chanho Min <chanho.min@lge.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Kael D'Alcamo <dev@kael-k.io>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Chanho Min <chanho.min@lge.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2]  arm64: dts: Initial support for LG1215 TV SoC
Date: Mon, 12 Jan 2026 14:34:19 +0900
Message-Id: <20260112053421.3185738-1-chanho.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_213452_227276_3A7531FD 
X-CRM114-Status: GOOD (  10.29  )
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

This patch series adds initial device tree support for the LG1215
TV SoC and its reference board

Chanho Min (2):
  dt-bindings: arm: lg: Add compatible for LG1215 SoC and reference
    board
  arm64: dts: lg: Initial support for LG1215 SoC and reference board

v2:
 - Switched to "lg," prefix
 - Dropped vendor-prefixes.yaml change
 - Fixed DT coding style issues (validated with DTB_CHECK=y make)

v3:
 - Removed changelog from commit message

 .../devicetree/bindings/arm/lge.yaml          |   5 +
 arch/arm64/boot/dts/lg/Makefile               |   1 +
 arch/arm64/boot/dts/lg/lg1215-ref.dts         |  50 +++
 arch/arm64/boot/dts/lg/lg1215.dtsi            | 290 ++++++++++++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 arch/arm64/boot/dts/lg/lg1215-ref.dts
 create mode 100644 arch/arm64/boot/dts/lg/lg1215.dtsi

-- 
2.34.1


