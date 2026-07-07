Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA00C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iXQR3WX2zxFM80tdflB+VVDwj3ay9NrpfosqulY53dE=; b=kNghSEViQgFn3z0Edki5BVgdkr
	UwNZL8SIoCfiytvFAUEuU3CJwJg54UasjyFnDUNC6Ux1vvNCvv7ZIyfuD3ofVkJ9LDRi0RdNbH3X5
	xX7Uo5KiaRiOPd72SkZFbsifrXo3ycQ7HKyOQhpKvrT8w7crneRqi74b2/M6mvSnFoZtzQJBMwhX9
	M5RERY1m0+qgeBkpPsm2nyvd8f6s01vkLIoHOFtvSmZKt00H1WqbO4cCsiibuNjNV1QWZWlwg7TmC
	IejVwlFeTUeqzcJ8A0P3SEHzYwNSbGH+5CKU6BXUUA+w95kUhz7obf3XiaUDDoNoX4aOAnCr+ogLH
	EYXsxd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1sv-0000000EbH4-3mWi;
	Tue, 07 Jul 2026 09:14:33 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1ss-0000000EbFs-3QHv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=iXQR3WX2zxFM80tdflB+VVDwj3ay9NrpfosqulY53dE=; b=DEx43K7mtJIhw0SJncsQyWzbS1
	WM+cn/hfQkcE6ZnemrccJ/O3H66dameP4KcVCNHefWHoILXqcRJeD34rR4jm6B9JXZT91qlZWEL6E
	g0bsVKT/wny/pmIlht7BEQHJBGTIq1lRvAFXqoNJ+F8cjasZKQkaAHNNcTW9kjjjt1/vxnIADewJx
	76nVVLJScnvnm5sRu1rC8GxCQtPPdXyPB1ooVnf7ZVeyi+6ydPou+5mjtkeIhblZs4kvgwpkQwTnJ
	oGq6DkOanLY7gLoKTD+i6SdQuYvTtn90QLbT+YAO2VA08THtRv1Jw6tjaC6q1SPvKMvfAFRIaAF2A
	G9WMeyrA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sq-000Jpv-1s;
	Tue, 07 Jul 2026 11:14:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sp-000LtS-2R;
	Tue, 07 Jul 2026 11:14:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/2] Support for TQMa91xx on MBa93xxCA
Date: Tue,  7 Jul 2026 11:14:18 +0200
Message-ID: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021430_963801_87B096A5 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi,

this small series adds support for TQMa91xx, i.MX91 based module, on
MBa93xxCA. It supports most interfaces similar to TQMa93xx, but LVDS is not
supported at all. Wake-on-LAN works on both interfaces.

Best regards,
Alexander

Markus Niebel (2):
  dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and
    TQMa91xxLA SOM
  arm64: dts: add devicetree for TQMa91xx on MBa93xxCA

 .../devicetree/bindings/arm/fsl.yaml          |   5 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba93xxca.dts    | 937 ++++++++++++++++++
 3 files changed, 943 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts

-- 
2.54.0


