Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC6C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyERwNUBJaFhaJLH8DuloJbZ7laRRy5ywKs3n//EALc=; b=bf3d6l6KzdPogMpKCN4YXQ5/L5
	qyG1bCiXMHPHHzcw2zlJSxwf6apRCVMkf4sM5BR2HHAlZVj3oSruDH7SJmMOZujZKZ0FW0YWZaFze
	9Dah9soCXM8D6qlbkC5hlCag/BrEHMjoOXXgM8Qr61TeN5Hk0HkkG6tlZgOZl+rLgTn9zIoOJbxuC
	Ud6q4vg8LyRMjfbhgQBh6GYfF1krGZEh+5174GJxDv/ApWN+VJdEYswLTm8jty6MQdU/7umvkbo8h
	yMkYDsaaexQKAgcfyqnj7vbh7RfbRgR472x2wpyxcGOU78e6oaJ2Ie14nckgXO24sB/v81u7sWCSH
	oecv9qnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lOQ-00000003RpX-3QRi;
	Mon, 21 Sep 2026 21:17:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lOI-00000003Rmd-0zWU;
	Mon, 21 Sep 2026 21:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JyERwNUBJaFhaJLH8DuloJbZ7laRRy5ywKs3n//EALc=; b=pwURikNimMJ2pcH9iS21Na606D
	LVHsV1tufj9Uit56ouN2ObwDu+Z4lLSvbVqFox6XRlvVbvRucrCNAgaQKy0aOa2wWLWMbYSlaspA0
	dxse51SKtTGESxLpht0sLZHWniEqfhPLlRvEFZRVa0ZpCUD4/uD/N2h8k9Y8yekTuaXGy7W2PkSat
	xvpOoZiVZblk3BBvN+MeKli47WAbiyI0pMgLsmVxwKPBru780mfxOnyvROhbi7E5txyrvkCUyneqX
	Wm9BPxHNKgzXIgNdpA1hTX1B5AessZiDIprDZEJ6JN5IULYLwgMKmmFoib3oxxvS43Y6wJdIj8vOo
	b9yScLDQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8lLz-0000000Cpp1-1MT0;
	Mon, 21 Sep 2026 21:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790025306;
	bh=la91QlmnzQ+cMr3xbEYXMZpWQxq/64sHaIS6pJZM8PY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G76fFAOPTBdCjFAlPzU51OJwGBsnC/9F35buwF3Phgw8N+OswUjMh/uzmsukk9H7P
	 rR1JusiY1opK3/zluoVY7gsMv5WllQSxjMmMY/pnduhTbz9U9FGyP97xfDhhAfhf+X
	 FbSTW8myCE3YRYScnwWoYdHbRjYGzMf4LGmpq4KWglCixG1Dpmm/N2r4nh9wyrQM0H
	 7ZTb8y/r1r4ua5GfW5MkhYWHqcjypTK4xX7BU0fraDleWPsyK0wQiia/Wq4pM/wK37
	 erXTSYav4+LwH1MtmuTXKw6+JnKOiJPNLAY3yRa9vwiLXeLz+aL98FLADNP+TTaqys
	 NQyMjHueRWsLg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B7F617E0DF0;
	Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 53CC148002F; Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 23:15:04 +0200
Subject: [PATCH v2 2/7] clk: rockchip: rk3576: add missing DFI clock branch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-rockchip-dfi-rk3576-support-v2-2-04f847016321@collabora.com>
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jv2cP7PAalymZeRc3au2vjT1JUKCsZkY6Uv6EoH/o0k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxnlpPFrnlK2x2AJJxKr4MewGejZIRr3Ain
 6v4uxmgetFdIokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZ5aAAoJENju1/PI
 O/qa74AQAJgaXuoidOqI43S7t7Y6p9s1UarNVNxQqTqwrVPUVdBDEtX24LeWvy90KWBqUIcCTBD
 sgsrsToomzhPMzLolliHDVxmGU+58CDst60SCmWGxvWuHTcjGamCgDiduzosl7Sh00WwhtWZoQc
 1wfEcy4p7Rmq2pkAhINK2bQeYUftIxA9eM4G6ETI7ph9flh0sZg6Hw4uPAACmhLYw2pPad4YYaB
 Oj53GOZx85rv1ucKi1OsjVM1m53pCs8qgeC+slvy0/aDuzk4SgktKK6xfeAEqq1exFXBHZx0OvV
 +nfKhsqHdBaInMkDuC/XVcYlRSxyiXHQFmCjtCs4LM/ataHBRj0YUOai1ABHrggUb0AmHNBcZtU
 z0qUG87VKKH15OvzSF7F9/a+7Bl3Nd9gto/e7XrGUXVxCd4zZL18CBFgoIxo3Mn4OonoU3TwTNz
 Srhgwg8WhPN7KCTeeeayPS1wvEtEvsVQbVw9AENtbJX47QS42GKOwq5hYViE/lW0EaO55roIQde
 bCTpv7XyDMpNFRZxnJ15PwY/lt2HSJyIUFlI7k7yG7xn+XLp1nZD8fTmYVfEEubXwNMgOVtZkCR
 cZY9REVN7hnK21MM/qOzdnorYxUEKUvOREBlDAJ1lipiKEGkAAU8KGPSUdEmZkx31NgxdWEfXCy
 XD1SS22bhIxRi9KGRvxQjsA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_221517_064264_C7A5CAB1 
X-CRM114-Status: GOOD (  13.21  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

RK3576 DFI has one pclk for each channel's monitor. However, mainline's
clock tree does not model this second DDRMON PCLK gate, and got away
with it so far because they both default to ungated and there is no
upstream RK3576 DFI driver.

Add a clock gate branch for it, and remove the CLK_IGNORE_UNUSED flag
from its sibling. In opposite to RK3588 we can add a mandatory
requirement for a clock reference to the RK3576 DFI DT binding.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3576.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2cdd667f4004..0c94e9db81c1 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -883,8 +883,10 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 	COMPOSITE(PCLK_DDR_ROOT, "pclk_ddr_root", gpll_cpll_24m_p, CLK_IS_CRITICAL,
 			RK3576_CLKSEL_CON(76), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3576_CLKGATE_CON(21), 0, GFLAGS),
-	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_ddr_root", CLK_IGNORE_UNUSED,
+	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_ddr_root", 0,
 			RK3576_CLKGATE_CON(21), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH1, "pclk_ddr_mon_ch1", "pclk_ddr_root", 0,
+			RK3576_CLKGATE_CON(21), 14, GFLAGS),
 	COMPOSITE(HCLK_DDR_ROOT, "hclk_ddr_root", gpll_cpll_p, CLK_IGNORE_UNUSED,
 			RK3576_CLKSEL_CON(77), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3576_CLKGATE_CON(22), 11, GFLAGS),

-- 
2.53.0


