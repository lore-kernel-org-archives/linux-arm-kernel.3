Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB70BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YW77SL8hSTW9KFJBlbwpfAzYufCsrQovezRCHkEwhW0=; b=esf7hmJpahniXZEYepQvIkmIxP
	JHfajRmjiOR6cy9nlqP5+VXt5xDJDJF8ferk2GJwImr4xi6Tq+fBWDqHUCpbE+Qz3ahMxQ9GUDn5m
	3em3qoMjBfyse47K45gb2DfYymEzPXW1N0+EkfoN/Es9jXqrPGJMmfRZ22jzR2G4OPxR1O9yjFNHI
	tzpSrKO/GMCR1taC2TVmUTMjO07w68GolEs0zaQeo/7GMKv2DWndfKcWvTOU1AiknZDoyiE+caxKg
	MLSoG384IND6oUQ5nxG4iZgBHnGgTGPh+BsiXuVscoz+y6oBcstn1cjZ74W2XYMtAVkzs46qEQ7ST
	9FcWnENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUlU-00000000faU-3zli;
	Thu, 13 Aug 2026 12:42:32 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUlS-00000000fZi-3GTs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=YW77SL8hSTW9KFJBlbwpfAzYufCsrQovezRCHkEwhW0=; b=qKbAExXOKC+jl8GT5ik4OGCHYl
	0QmOMmgm3olNj0PXTahrWmN/m5fHhwm3cyxHs6eD8v883uqhVFh2oeu5/0I/TmYI+RdmlzSFXvNgO
	O7+6Fwe1QxVBqmKUG19AmqZ2s8P1wDpGwgfLK3Plw41O42HIvfyPnJXRTImKEThu0EdtmiInlxAuO
	S9Af3Yk7lTySVp5+ZcTykVFxX50Z4S0EX/V1K5j5jJNSPty3mT7I9yhXiuaBukq7daRM85EO6Rq2f
	U5k0I76sV7IxkH6dYThPeCfXRFvNMZ3rpoa/+b2W0f4yxit4rMTUnW8WLxyD570pedJrWFGKToP9O
	Sks9Ikww==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-000BWy-0H;
	Thu, 13 Aug 2026 14:13:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-0005zb-1c;
	Thu, 13 Aug 2026 14:12:59 +0200
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
Subject: [PATCH 0/2] TQMa6UL[L]x[L] DT improvements
Date: Thu, 13 Aug 2026 14:12:44 +0200
Message-ID: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_054230_816715_34991A59 
X-CRM114-Status: UNSURE (   6.87  )
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

Hi everyone,

this small series improves the DT for TQMa6UL[L]x[L] a bit.
Ethernet PHY IRQ support can now be added. And the on-board USB hub
is explicitly specified.

Thanks and best regards,
Alexander

Alexander Stein (2):
  ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
  ARM: dts: mba6ulx: Add USB hub node

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.55.0


