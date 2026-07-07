Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D3DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U7F17aj8Sa5BJFs3fVPcy2J4kSdJYymT/XgbT8NZ0cc=; b=4s/L3UIwlqBBMIu/TqmlYIYnA/
	H79+bXAS9Cqps8hCPPTPhwY+s9eyEPv4uHeADbio1CzpSBME9NaM5j0GwWSy6EHK5GUq1lrAdgqtx
	xXsg9s7JObwIi7hq8SpBFh8dG3p11P0sAFe3t5jbEXJgrq9S0CYwNqJEnpag2pBGDOb+dwWnCSO/j
	m8aDmujuJY3wDmULEL4A0OgsY5v8l+3roTxbvb+w0cbbgvlESuxjZYTEVgLsZbjLX+xM7ItNceFZT
	RVc6Javn5f/2JAL2Odu0XdlqJPG627MxmD/HFKQ4mXe8C4zTEdR/baIFPQAtMCdiGhMZ8OVyUdLMJ
	dhDWBLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1az-0000000EY8G-1sws;
	Tue, 07 Jul 2026 08:56:01 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1av-0000000EY6O-0jMB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=U7F17aj8Sa5BJFs3fVPcy2J4kSdJYymT/XgbT8NZ0cc=; b=nhD7UhcretKxextf9sjVeaORgy
	goWAXXXqyUP/MJ5sr/PYhgCcXrjDul7WxbYgd9cjQq97p5dNPqdfZUBHz0OM9+smxfYY+HpYgrpCU
	YwnhGkUdM1kf7UdbkACw5F9A5M7fUPcHfLkQfD742t6OLLDcTVG/GszQSPvntha7JaAlZYdz1tOxn
	lL+7j4JWJcHh1ibM79MP/0O4a0PSzNZgbG8V1VNIQCPDHY2r6CqQBubSg10xsVKXsoBlzUBFPFSo4
	onUUwtMdl8yC3Nbr4ubbPU6QVdnegctL8S5oA3leQaxiWi6YPGHz5rWGaJcZnduArEPt91TA1kXFE
	VjTjfavw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-000Gjp-1T;
	Tue, 07 Jul 2026 10:55:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1ar-0007hK-1y;
	Tue, 07 Jul 2026 10:55:54 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Small fixes for TQMa91xx
Date: Tue,  7 Jul 2026 10:55:41 +0200
Message-ID: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_015557_322853_471B4AA3 
X-CRM114-Status: UNSURE (   8.29  )
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

here are two small fixes for TQMa91xx.
One adds the USB PHY settings similar to other TQ mainboards.
The other one fixes the reserved memory for EdgeLock Enclave to be suitable
for 512MiB variants as well.

Best regards,
Alexander

Alexander Feilke (1):
  arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range

Markus Niebel (1):
  arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments

 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi          | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.54.0


