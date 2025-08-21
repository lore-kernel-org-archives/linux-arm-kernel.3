Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8CDCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+v+/7/QYza8Gh1MF/K0Hq50l5OpOqznXzh+iHMsvAc=; b=m/nKatBvlGIIoKY82I04LWOg7G
	YCKGg++nGFCILWWXmAbVE/q4LjIVfPovUNQtu7K/BJarnSl1f/hBN2pHXasFnT3Ld67Ea1rSiuKmq
	PLQImu0wj/MNeWt8l++WsIjz5C1xcRNtDkOyJaU+aG1xkLu6HrepDNvwDuOFx7sCi3qHGEdeDAoI6
	nJFU8X6XMXtaNe5EtrDcqX5Qx9aOOo0wjMegHcwjkDgtZHw/vFij8MaNU0RpT930jC2bd1Q93K4Uk
	fXE8MFUHNeah9P2EhoN5cLv9lv40sNB1hLCft3LFZhWflNgcnB+7ZhHOnJC/qDDjs56dzVCCd+QLr
	/XldQpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1nd-0000000GT2l-20lS;
	Thu, 21 Aug 2025 09:41:37 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Fa-0000000GAyz-1y8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:02:23 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 16:02:15 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 21 Aug 2025 16:02:15 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Nishanth Menon <nm@ti.com>,
	<nfraprado@collabora.com>, Taniya Das <quic_tdas@quicinc.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<soc@lists.linux.dev>, Mo Elbadry <elbadrym@google.com>, Rom Lemarchand
	<romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang
	<yuxiaozhang@google.com>, <wthai@nvidia.com>, <leohu@nvidia.com>,
	<dkodihalli@nvidia.com>, <spuranik@nvidia.com>
Subject: [PATCH v4 2/5] arm64: Kconfig: Add Aspeed SoC family (ast27XX) Kconfig support
Date: Thu, 21 Aug 2025 16:02:11 +0800
Message-ID: <20250821080214.513090-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821080214.513090-1-ryan_chen@aspeedtech.com>
References: <20250821080214.513090-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010222_504322_D9158AE1 
X-CRM114-Status: UNSURE (   8.38  )
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

Support for Aspeed ast27XX 7th generation Aspeed BMCs.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..f426be639c4b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,12 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
 
+config ARCH_ASPEED
+	bool "Aspeed SoC family"
+	help
+	  Say yes if you intend to run on an Aspeed ast27XX 7th generation
+          Aspeed BMCs.
+
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
 
-- 
2.34.1


