Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882B5CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNTPIavYmp4HHmaVHz9IcG9aXjM5kGxduF0sYiEsKCs=; b=HubwVjrHr3gj5zoV6cUicKeHfi
	d04Nu1sQI6wpd+VpFvtUTCbkapGtDc32etSrpqT7d1FvZHyt5q2R8NwnhjDXwtSh3+1fEA0pzDsF7
	zdz1TdxKVfy8dWuywVgoOIGo61x5+7mhfevLFvXMRVNry/bEGR0kMJRvKpMRmso8dwn5CruhLVgy5
	ZttNnV2LT9KY7SjYfMcgOwrn+hC1/F3QIXZB2sZtgFjv4OL843Vh37sxk0qwtk95xXuhAavimlaB7
	2EjxcICohvd+LcjH/xdlXXrAOVsrdcJmGBVqxUCdcmGFMsCSUuli2tHbfUbcNVR5ZYvAMDWI1/r8V
	WYqjYCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9FR-00000008yUD-0hXR;
	Sat, 02 May 2026 12:15:05 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9FM-00000008ySn-4AbN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 12:15:02 +0000
Received: from ipservice-092-208-105-007.092.208.pools.vodafone-ip.de ([92.208.105.7] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wJ9FI-00000000146-04iP;
	Sat, 02 May 2026 14:14:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] arm: mvebu: two simple cleanups
Date: Sat,  2 May 2026 14:14:25 +0200
Message-ID: <20260502121438.116288-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_051501_033765_8C3A17E6 
X-CRM114-Status: UNSURE (   5.67  )
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

Two small patches that simplify the devicetree parsing in
arch/arm/mach-mvebu/coherency.c.

Martin Kaiser (2):
  ARM: mvebu: drop unnecessary NULL check
  ARM: mvebu: simplify of_node_put calls

 arch/arm/mach-mvebu/coherency.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.43.7


