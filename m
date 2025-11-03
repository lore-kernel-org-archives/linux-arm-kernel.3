Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21082CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnTxcLtAJLOyvzCsx/4DTYpkHdNUlvMGiWTN+Hezun8=; b=oYZevsrIgyfXyDU9YNXYjvS0zZ
	9g7IJd+NOdNe6K8s9Bqx4IBIuot1QZjh9OqvkXZEYpXVQbiIGTLGwGF0JMl3k/hhI4BMVAXaJAUeg
	tgo+m64ODufe8Q/wRrt/v5Ju4Ae2GnOMIP4TnszoTkyU2qOBvlnLxX99pN32zvcw/sn6bNCeo9NKm
	KzTGtbH1l6mc7fcDknqXeZ9X0UrZ30nSs83qpHtgpxUoeV76MYk+4QpRfMvjgPT6f5k/3bEdYhtJ4
	ZzRPTV3JH4Vdp7+nl7pbHoU32IdgW9uHKCFrnOV/Gj5aytNervLe/5FL1kzY2+lHFY06Ctx58BIxY
	8+U6Ksxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4AQ-0000000An5y-2hhr;
	Mon, 03 Nov 2025 23:40:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4AO-0000000An4p-14FT;
	Mon, 03 Nov 2025 23:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=nnTxcLtAJLOyvzCsx/4DTYpkHdNUlvMGiWTN+Hezun8=; b=KPyCYAeVmfoep9n41L0AGgJGaM
	XvaxQOkbNiD9V697sJ5hE1497bWlQIMsTrkkTofAPJPQUbSCva++vC5Vab16OwY/ZGC655m7fNIMw
	FipeHPqEkt+0+bm60TJV5CuXtrO+RqdAUq/+ACg4vIJbHtFBTpDAt9SQUZEY3aaVTdHbun+iGxHXY
	COMeEQ/Hasn90dqPAzUxUvAttTc4XQF5f26MKSZLrokuxbCmrVUHYLxmAlxUokib+dZa97TL+V5Zo
	M8BmA/9Oz9/4G5OAExqzEydWncs0PQRDHgbH2heLQsQwrn4GkVLA9sxiK8exrPIpZ7t5dg/yYErnK
	KCeXv58w==;
Received: from i53875a3a.versanet.de ([83.135.90.58] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vG4AJ-0007rE-Gl; Tue, 04 Nov 2025 00:40:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: [PATCH 0/2] Drop RK3568's variant of the CLK_NR_CLKS constant
Date: Tue,  4 Nov 2025 00:40:30 +0100
Message-ID: <20251103234032.413563-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_154052_295522_3AA51304 
X-CRM114-Status: UNSURE (   9.94  )
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

This drops the use of the CLK_NR_CLKS constant from the rk3568 clock
driver and after that, drops the constant from the binding that should
not have been part of it in the first place.

Heiko Stuebner (2):
  clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
  dt-bindings: clock: rk3568: Drop CLK_NR_CLKS define

 drivers/clk/rockchip/clk-rk3568.c      | 5 ++++-
 include/dt-bindings/clock/rk3568-cru.h | 2 --
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.47.2


