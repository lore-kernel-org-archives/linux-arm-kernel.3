Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D255C98333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxMXEf2TFq+5X1fWatTNAoT1NCgKFgHmmICGjTqqu8s=; b=qd+PWqCmMu5TAVe8hKGl/L8DCi
	KxkZXxR8Lx56TgYb8vcaLGf2F9gGmrw6olC9Fa5HZEOzQtG5aYliE9SB8Zp9AftqNgKjlTjsG6zAs
	fXqAFbNaF+Mwg0Tco76/TeUUnbXiGNMk+Ixr6bBOlcOxMmcIePqsSD2uIGZqO1pbNd41Jj41Kpqak
	lf5opK8tw7licVpwdZxOO/8P1Jp4/AIspYfEE/XRippacMFsKiJKzmYIoMg1khvtWwgdFU8y6hknf
	aHj4q6l+av+r4uUf/fAGfmdXDC+D+34TPEYKRbLhiIOhSwB28MKa++2qoTtfg35BPbpRFTbUtqFhG
	SDnI0PhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrN1-0000000C3ai-2PpZ;
	Mon, 05 Jan 2026 20:40:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrMy-0000000C3Y9-1rHW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61781443F3;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23FE0C2BCB3;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645603;
	bh=G3CRfHErrrKcZhENL4huqEWH+BxfPIUut+G9whJnJ9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tJlzfAMApVLWBMTba961mS1yYClTAwokdZuRDXUVTAExKEq8ewOSKTFZE3Vlp1GF2
	 P+84pGCTp3c6XwxXaR80e9x1IrQ1g3WjXGbzd/9aK49CHeebukBRGHDuK8PCNwelDj
	 ZXBofKyO1eJELSl9FCv/s/IFZhVcEgrfR/lChzBzBoouWR+EjRCOW8JgLl6tk7Ba8l
	 WFJB+wQYCM/w6McoGGKxeJUq8mGrES7e0jMQX7kJVGLohPspiPWGRy/qn0+GbcEdBt
	 MwxqoK5N4N+sfFiypHq/RDQFr+/3wZkHYk/Agj7hkX1LgpzwmvfaZUImuW1QyHC/5h
	 6bCnao1tYp8/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1979FC9833A;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:42 +0100
Subject: [PATCH 5/6] arm64: dts: imx8mq-librem5: Set cap-power-off-card for
 usdhc2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-5-f491881a7fe7@puri.sm>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=3FmSteF4kPJyYTm0fb0Nk+/Wxx/y4JRs2j8lvXT5ndg=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGhv1BbnzOMrNgXf2F2pqaDZuF2imhh/5Gfo
 HC/cycG2waJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoQAKCRDo8jXPO9vD
 /9ckEACMLR31FW9Rh+tgbacz/tzzqFw90zuYdeYeu0//kRl5pLccTfrBRioSptiQxRI3NbBgUN+
 6eq6rD/MZoFwEV+ReR1VTjiB4gh4+nNcE0uXyFsCsU8qgdw5NQKPgTUm4FviecoKvLS1jpIjmzG
 PqDj/P8y7kujaU06lHxA9YjZzHxDnl05hYc6ry3YQI/cLmPMEDpL7Su7e/X/M1AU3GP7dNPBGZJ
 nDbOZ8VQ227IfaJn7n/ktdWWTdWQS6WWYWaeSA0NgqCOxAtKoQlJU414nbgpwwNQDIWTmi13pl5
 Hc9Rn0iHaVGedwvrlxb6GoR2yELakDpe5Ma/atvRmxnnG1E4kBzMYEb1JWtx6IzcXWwcjJyHNvR
 V1tCDvnuJIT7ir68qCkFA7qwFTrPZlN1raoSAOQOoDbuDcbHROO0M94vVjhrmMlbmqh7BdlJkju
 xWgMngrIgB8cB/3bFyhjOimNrSt2tGqDZ9bnbvIfBH9H/HE3qS54pK9nqz2Ip6lSDXMG+8M+QY8
 PogIo9dIkgqvuY0omhWoKwDKtJSybKlZhXzycB7Z6RBghUDtSeXEWTYJLjNOBVdemKv2/+4ofdS
 LZ0XQXRl1MKNS7EFmT6ERJG6/vg/bV7Fwnt43WHfkKFtzyQ0tw2G+tqhPtE2VNvg8GFogE//pL+
 +hSsDVq1CISEuyA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124004_531017_A2757DC5 
X-CRM114-Status: UNSURE (   9.05  )
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
Reply-To: sebastian.krzyszkowiak@puri.sm
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

This is needed for brcmfmac to turn the card off in suspend
since 8c3170628a9ce24a59647bd24f897e666af919b8.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 0e3c103dd7ff..22b1a29ad440 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1437,6 +1437,7 @@ &usdhc2 {
 	max-frequency = <50000000>;
 	disable-wp;
 	cap-sdio-irq;
+	cap-power-off-card;
 	keep-power-in-suspend;
 	wakeup-source;
 	status = "okay";

-- 
2.52.0



