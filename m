Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9ECD3B7EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrEA6K10caIyYSUnQG5tc6sO1syANSVcfUKDl8q12Go=; b=MWZenuhAGAfBGYt2T4u/PxkX89
	10+bOV754ABlFlmG8IgHEvyHIuv1IGIh+bl73d1WMwQRtDV73WI5AGJIXUhvdk9KsoctAR8t+mMIo
	YiUyIf4x7H9k9b2Z1it71/LX0z24GSUjVo+iBmWS5RhXpu09/x19AhjxeU+SgW1enOImDRi8e4s8o
	PHuFS2hWAu6xev+q/rzxD8nXQybg7RyqN04O20HRD4Dt1VnL9NzXgspdsDztyTahjH4tm29V5wp6u
	ZFcKdlden1tl04u5RDWJMNX7JABZ3je+NtW7/xuSyU1RwWJGauoNDXhHSsdytXqSJvL+2dAV/5BI3
	7bzWLSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUPK-00000007NEK-3vMC;
	Mon, 25 Nov 2024 08:25:22 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIr-00000007M3Q-2W4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xrEA6K10caIyYSUnQG5tc6sO1syANSVcfUKDl8q12Go=; b=U5HN/MgFwm/1e/fUu/RbSqbrrz
	h8eUDc1CO8l9wVbZzFNCWaNrClDTrRD88UOtpRXaPtbsCqjKFeUwhzYroUfU5hk5yrVZi8UbAKCix
	mJ7RGId+cWK+cNeVD97r8iqAbAFvOwoqBcyW07Px+Tne3FzHjQk7W6ToXusCLjAn8uOsvyLNm7crF
	Kzg4g7MjAMyJb07pXm51xI3xdrYnhWWDSTmYvlPYdSrEU1UHmR+vtkBDaPKuovoBRuXsqVvLvFzzx
	0Ptwfi5n2Mf7j6qt5KpuPuXjwARCJWNOh3cmVHP29JjgtBk7FbRw6QK8KgOx7dOfpDVGmOpXOFhTY
	M8mZGxRw==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIq-00Eq70-2A;
	Mon, 25 Nov 2024 09:18:40 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 06/15] arm64: dts: imx8mm-phyboard-polis: add RTC description
Date: Mon, 25 Nov 2024 09:18:05 +0100
Message-Id: <20241125081814.397352-7-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_001841_788481_359C85B0 
X-CRM114-Status: UNSURE (   4.84  )
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

From: Yannic Moog <y.moog@phytec.de>

Add RTC description.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 31d5c57d3c24..6c95257119d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -219,6 +219,7 @@ &pcie_phy {
 	status = "okay";
 };
 
+/* RTC */
 &rv3028 {
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
-- 
2.34.1


