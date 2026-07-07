Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XELhEOkm5vooBREmPpclMRxFV3AkBs4ju5W5TL0lEvk=; b=E6YxkkoGeYBC9A3Rz5omUV5oHq
	F73sEXwftKD6p9KION8DZj0M6hAzVu0QrNo0jV1oJqoRdHKHCMuJRf/0zB1kypc3vxfLLwHwUbj6i
	Ty2qDS7e9rCYMCgGfmCUCLoF7wkJOe7KeYlEqKp8RYkd+OcE0zrRwX15w0mYovtncxQWrm7J4g3JT
	JBvBU/6YXjXjS93RttPYO+q3EoZCGd6H5QnlILutxabzO6SpH8XFIp7GtsABunbTIU4yJYZJDsiQb
	kC+v2TfgwhK+zKtWQ9+0aYX5dPFRSX0r00cmnjU6zhK813LnHEXfhe2sB2E26G182bK2EUbnDtRZZ
	TrsIA6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzex-0000000EFpw-1lOS;
	Tue, 07 Jul 2026 06:51:59 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzeu-0000000EFoP-1IXJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XELhEOkm5vooBREmPpclMRxFV3AkBs4ju5W5TL0lEvk=; b=lyh/YVEB9iRtD2uzwUFFtXTCFC
	/owA2bTUOU0E/fMPBEmM+yxo3b4vwCrLpw+r9piuhC4uhV1SqDRISiT+R6eV/j9JZ1PNglTQRow7H
	yrS7TUq69khPWTzG41CQ2WPsZG3F2xVzB9XPC/VLp5N19rVNCX4jheVJSadqelfAwFFmHgrzn+Pbt
	lJeSnIWqDeEmrtR1Bfgp8k29F6G18tuo3r7x+NzdoiA45HJZ2ry2dB7AiF1APy3P38ihHbRE8+N0Q
	CocP7elPi95Fqwfoj4r/6rmiSSEo3FcniHviMguQG8B7A+B0vd5bvR65KRr5f/ai9VRsdaeKiHru4
	XD9u/REQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzes-000LgH-09;
	Tue, 07 Jul 2026 08:51:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzer-0005WX-2l;
	Tue, 07 Jul 2026 08:51:53 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v4 0/3] TQMa93xx on MBa93xxLA/CA/LA-Mini LVDS support
Date: Tue,  7 Jul 2026 08:51:46 +0200
Message-ID: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235156_465670_C4C17298 
X-CRM114-Status: UNSURE (   9.93  )
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

this is an new version of the series for LVDS support on TQMa93xxLA/CA.
Now that the LVDS bridge support has landed the final missing peace is in
place.

Changes in v4
* Dropped all patches upstreamed already
* Adjusted for new imx93.dtsi node names
* Fix clock settings
* Add support for MBa93xxLA-Mini
* Reuse DT overlay for all mainboards

v3
* https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com/
v2:
* https://lore.kernel.org/all/20250224142831.485159-1-alexander.stein@ew.tq-group.com/
v1:
* https://lore.kernel.org/all/20231020130019.665853-1-alexander.stein@ew.tq-group.com/

Alexander Stein (2):
  arm64: dts: imx93-tqma9352-mba93xxla: Add LVDS overlay
  arm64: dts: imx93-tqma9352-mba93xxca: Add LVDS overlay

Martin Schmiedel (1):
  arm64: dts: imx93-tqma9352-mba93xxla-mini: Add LVDS overlay

 arch/arm64/boot/dts/freescale/Makefile        |  6 +++
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 21 +++++++++
 ...3-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso | 38 ++++++++++++++++
 .../imx93-tqma9352-mba93xxla-mini.dts         | 45 +++++++++++++++++++
 .../freescale/imx93-tqma9352-mba93xxla.dts    | 21 +++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso

-- 
2.54.0


