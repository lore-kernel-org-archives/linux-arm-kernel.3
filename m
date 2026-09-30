Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66588CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oNXoQLGJPYIyqmegQF8ZeOlBHbHDVMfq4HhnXwXvDpQ=; b=eXmEU2+hYQsCQjfpX5kM0PDoyw
	QrELitae4qZm+maDaJDH71OZ9DqDO6hACXbg8h2+UBrEe6FhSjUzoL6wqEF3N4XDlF/CwFowWWNG2
	FFxJbgwn+BOk5xAx8QCdQIVNA01d8X479N6ZCuIV0e7XHBXTuG1q4pCuJIJB+5JA3FnldS3Dt+JhA
	2XPdm7VWpaONimiwsfmHRNwYVAKdpbqADLGPKieH8FzyUxq9Mo+WfZP+RMn4EmuCM5bf5G5dJyEno
	58rYI5G+o/16lLuucCXjJB8Lkuxkip+89hSU19mgJd7J+T1zTGIGS2YyoPxyah1MJKDTKWccbAct+
	p2v7rSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsWD-00000005sPk-1YRb;
	Wed, 30 Sep 2026 11:30:37 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVt-00000005sIl-1r7k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oNXoQLGJPYIyqmegQF8ZeOlBHbHDVMfq4HhnXwXvDpQ=; b=DeId9KKCEjwRWHlVV0tRxH9sYE
	aMgzvJs8P7Ebt9EUX5mFU91NAOQbXQJLdoH0AlEFD5kOA9kUY3tiIJy9tcKftbembo2eZr8t26NuG
	zqnLGU/1FswFRVSlOsaXty8Qe8Bpz935C35Sunz3YGuEV81UFc/7O3mliB5eMZGdZwKVxRzds4y6J
	CAJp4SM4o7fcoqakGgv9I2s2XtaLMdriGguSWzbf+taEnGwRMYWT796MECyeHoyRMiSdm+QdGE0Kl
	COo8k83OPWAyfN+f8BjxL8loW192l0UVKQlZrSjMMWnUasvL/rFgbGd4lQ//8mKKyM40/khOtxnJy
	jjoEheAQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46122 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrds-00000000Z3d-3ED7;
	Wed, 30 Sep 2026 12:34:26 +0200
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
Subject: [PATCH 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Wed, 30 Sep 2026 12:34:23 +0200
Message-Id: <20260930103425.2315286-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20260930_043017_646582_62B0FA73 
X-CRM114-Status: UNSURE (   5.56  )
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

Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

- The i.MX6DL NAND variant was still described as the LC (Low Cost)
  board, missing CAN/PCIe and capped at 100Mbps Ethernet, while every
  other in-tree phyBOARD-Mira .dts is the FF (Full Featured) variant.
  Sync it to match its siblings (1/2).
- Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
  swapping capability") landed, the touchscreen axis inversion these
  boards need can be described in devicetree instead of userspace (2/2).


Primoz Fiser (2):
  ARM: dts: imx6dl-phytec-mira-nand: Enable all peripherals
  ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties

 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts | 8 ++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi        | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1


