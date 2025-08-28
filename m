Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453CDCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3tyat0CIDgWc47dqO8BykJDn/dhLK7zoSe+DV7NUmbI=; b=zHL084XDrOeGNr89tzr+QGfTba
	07mDfTc+AflvZKE0EtIUrHbJac91z4RwslnU4UrVwVvFwa/vbbD6rNZiWTI8CWZFzgVURDhmxZITF
	2OrJp4QAZNGkWgAQlhK3BcRbFZomA+le2Cs4uGkO/CnrLIu1a1SeFQS6NMNWhxfTXzwgH33KD/8Ql
	qmSEY5hehYvssCNPJDMUTCmtHcAjiqkXKvZ1SRizau2DLm2GUewiG5tF7TK77ojvc3Hj9Z5DHdjm6
	5R5149FuSCPUGHmnDzKp1PecI7yeWOb98nFY5D0j7pkp0XetFhXVijOjIGQU/teetm9VE/Zu+YBFm
	v9fVaq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgO3-00000002Sx6-1uhj;
	Thu, 28 Aug 2025 17:26:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcPI-00000001gMS-0avs;
	Thu, 28 Aug 2025 13:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=3tyat0CIDgWc47dqO8BykJDn/dhLK7zoSe+DV7NUmbI=; b=x8quDUAVkQG9AXuFi+lkThBD2o
	pRdCDBPdbBqQkUG5cSwKvDbPpJKk2ymQkhfN7hxCoofs30dn6m9SiK1GwafLhmEinE+iRua6v3Hjx
	bXL3bLR4h8tsO37W2KIaCUE9qE1bAhC3kUXRbNDCvoUm7MJja+TbfOzVbE7948EJ5ZNn5HLUatkWO
	XqdNGnPdk08WoM9MH/mmdzD4YLS1qwJLLljZynmzdGg+pkxKKLORmDgQKxRQiQw5Hv5mzgAKw58uW
	gcEDdGliidHwXpSMx/FmsnEjYMSPSvI4cFLQJC4sZatINPdgye9D/PGo+l7yVnrNhhESQnIHcVZbf
	hog/Ye6Q==;
Received: from [185.205.242.134] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1urcPF-0007wG-HJ; Thu, 28 Aug 2025 15:11:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: soc: rockchip: add missing clock reference for rk3576-dcphy syscon
Date: Thu, 28 Aug 2025 15:11:07 +0200
Message-ID: <20250828131107.3531769-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061112_205037_929AA81A 
X-CRM114-Status: GOOD (  10.32  )
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

The rk3576 mipi dcphy syscon controls a clock, so needs to allow the
clock property. Add the missing entry in the list for it.

Fixes: 0e3f3d7c7ae3 ("dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508271156.z3wDB6bX-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 6a94c271a6b1..1d0f35e26311 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -301,6 +301,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-vo1-grf
               - rockchip,rk3588-vo-grf
               - rockchip,rk3588-vo0-grf
-- 
2.47.2


