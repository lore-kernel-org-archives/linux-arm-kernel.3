Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E1CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bNpo055vatlDnZ2i7Hnuv3r7aBr2eMw8QrXnXexITlc=; b=yPcOrP/N2IjpSM4BPvlLcLu6/R
	20flNm/n/Us/GpfGtfZaRqABXAhU5EhslSiH58ePPkyQs345NFoTt5CIyHzJ0Nu+ow+H+SAIkplaB
	uPbaXl4iRYjq+P48KmeKzHmYzs8Veds9nfH1VnoFm5rq23YVYwKObs6Y55bRP+yfdzS3yh3+wt7Nq
	r+4z6Y57mb/pGJ7JCJupD45VA4cso0+WxdmqA8y6/BibAuwK4dAWrwXXgvdbdNrTjO/inj+b1f3Ce
	YP1uewaIEbWNUt9gKtn5hY7BCNsQEsL0SVfLXfgPKFt9Qj/ZAg0IpSNWFKWehd3KxZVB6PaXjkKn+
	Bj+Iscxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlID-0000000GGjB-3d8x;
	Thu, 08 Jan 2026 08:22:53 +0000
Received: from lgeamrelo13.lge.com ([156.147.23.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlIA-0000000GGiB-2MGA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:22:52 +0000
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 8 Jan 2026 17:22:40 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.31.96)
	by 156.147.1.127 with ESMTP; 8 Jan 2026 17:22:40 +0900
X-Original-SENDERIP: 10.178.31.96
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
	Gunho Lee <gunho.lee@lge.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: Initial support for LG1215 TV SoC
Date: Thu,  8 Jan 2026 17:22:10 +0900
Message-Id: <20260108082213.6545-1-chanho.min@lge.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_002250_950917_9E42C48E 
X-CRM114-Status: UNSURE (   9.26  )
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

This patch series adds initial device tree support for the LG1215
TV SoC and its reference board.

Series overview:
  1/3 - dt-bindings: vendor-prefixes: Add 'lge' prefix for LG Electronics
  2/3 - dt-bindings: arm: lge: Add compatible for LG1215 SoC and ref board
  3/3 - arm64: dts: lg: Initial support for LG1215 SoC and reference board

 .../devicetree/bindings/arm/lge.yaml          |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/lg/Makefile               |   1 +
 arch/arm64/boot/dts/lg/lg1215-ref.dts         |  51 +++
 arch/arm64/boot/dts/lg/lg1215.dtsi            | 304 ++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 arch/arm64/boot/dts/lg/lg1215-ref.dts
 create mode 100644 arch/arm64/boot/dts/lg/lg1215.dtsi


