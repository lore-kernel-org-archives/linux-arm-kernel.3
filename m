Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z9Ce94XR2IBdMohRvs8y69ajZ4JeAI2hb4QUuYehro4=; b=TmDCcNoPmD8xk3nK/UoexvOLdn
	JhhHmZAAvoMPkk7CBtWwMT0fP/3Geg+0kfPn/UceOi4aEeuhH+WCE6FS0trIk3ha997f2/uRndLkD
	+O5hofG5o+IGYWqh8vLtR1bwUyXic+vOyE0Su6pIre33lgXR3IToeynAi0sZE+QL+y/a5cHPO4Ykx
	Z8XdZxkmMvBa0SfD7D70ApF+XbpF+Nch9K8gUymPIjVROeVv6tq5D1UcQWXL30Mt3QALqKM6L3Hvu
	n2B7972QrijXabzJLRrT4ReGSDZhWohdiAfQCR+ol864dIigjW5NHri2OrptyTKluPMiAbdvQ23PN
	v0MmzopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCpD-00000008hss-282e;
	Mon, 13 Jul 2026 09:19:43 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCpA-00000008hrw-3EuE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=z9Ce94XR2IBdMohRvs8y69ajZ4JeAI2hb4QUuYehro4=; b=QGAnsDoOm0yhaw1y81UbA5kH0O
	A9SLOzYZVLggRrrbHKx+ZpNF6jyeLdTTgV5jQ/37iJVfr0BfoT9qpwyhsXu9+L/9Ww7M37eehDgHr
	W7AkDc2YvBetW/F3F0CFJfGc0qBJQM3W+vVNZ2DmYt2kD3vU6ynewcxo9tHF6XHCPYrzyxyPNBA5n
	nOb/HJo4zpKGW8Wmy09niLZH8dXq3lAR2tAfyDTDuSyxXPyH8Jgp4jEYetKk1NMeWXyMLmL0fllf4
	A7IePrx7Q1yf8fVR5v+VzGm8TmdUCrUGETV6W0eoYRBmgZTKZxr0uRhvIoGjv0sBLh47hlOV7ZACE
	cD6b5BKQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp8-0004Rx-1w;
	Mon, 13 Jul 2026 11:19:38 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp8-0004Bh-0f;
	Mon, 13 Jul 2026 11:19:38 +0200
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
Subject: [PATCH v2 0/2] Support for TQMa91xx on MBa93xxCA
Date: Mon, 13 Jul 2026 11:19:20 +0200
Message-ID: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28059/Mon Jul 13 08:25:07 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_021941_451838_91342C93 
X-CRM114-Status: GOOD (  10.41  )
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

Changes in v2:
* Fixed commit message on patch 1
* Adjusted description in bindings
* Fixed PHY irq type (-> level low)
* Collected Conor's A-b
* Link to v1: https://lore.kernel.org/all/20260707091424.1702245-1-alexander.stein@ew.tq-group.com/

Markus Niebel (2):
  dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and
    TQMa91xxLA SOM
  arm64: dts: add devicetree for TQMa91xx on MBa93xxCA

 .../devicetree/bindings/arm/fsl.yaml          |   6 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba93xxca.dts    | 937 ++++++++++++++++++
 3 files changed, 942 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts

-- 
2.54.0


