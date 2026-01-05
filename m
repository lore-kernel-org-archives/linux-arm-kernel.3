Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95FDC9833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqoLhRAd7hjSVPqqtyi2W9BFooGmgob32u5knUXL/14=; b=MWYQcUJqATkLbT9wi7jVG/6Dz0
	0iLtQonLWcOQEw2QA3jQY0heUZ1I3CTiP60gWpd/mKZcl1HCllwXHMhOjGvQ6D5+q64NmEnyXqRtb
	sVIlFgkNn71o0hoZC9nouAIDGiCTcFuUPbPJmfkvOLp7FqeqaDVO0rzsBh/gcXmyY8SQdK+lT6AJ+
	FdEidS8RNetD6W+2LkNX0WtNppwgBh5LtLkLuddUQa3gCXe12qigX2fnQVJmSxpw0/Wm0q9qDUhMc
	H9xOV/olDy9iZ5Nc/wqsMHjtO7aVKuKB95ZKnYMFLhlKQEviO+cJvxkrdNeYnIot06/vHmJxmwH45
	IyCRLjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrN4-0000000C3dd-3OLB;
	Mon, 05 Jan 2026 20:40:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrMy-0000000C3YA-3X70
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:40:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 634F3443F4;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ED5CC2BCB4;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645603;
	bh=CVpX/S7y+WNjSJw8sgxQxlG0GBmMDerBsAHYJiDcp9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qByPEqYvaB7LBc7uaE/5hoTWyqF8gLJCp/tKeL3+VPLAbCTgGwFmZ5lZ9abh5dnDE
	 7KmT9dcsiYJPMh1wbkVGatFpFlgwcL66rGDQIJsHyWb6+lq1lfJnj20HOKaUljicOp
	 Av58siTae8YN5c0CLzz0UcoQTQoyeDgnMH21aFp9VGf31i1ge8HRekrz2IXLCZLbEl
	 mxZmRNs59b/Mx13sAq7UBOXopPSZjox6YggEltM8eCtENyFsk1bbDZbGUJf8Vt+ZKP
	 t5H3IdYlRId99sQHx+ca+UvrU3SCeUroW4xi86TRofZkughWmfv8M7NYLCYq3R6oa0
	 QGN7qHbxJ/9Xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27363C9833D;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:43 +0100
Subject: [PATCH 6/6] arm64: dts: imx8mq-librem5: Don't set mic-cfg for
 wm8962
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-6-f491881a7fe7@puri.sm>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=iFYwHw0xgQRdhe+3vnkoxkuFJ0xjTKuaUaWtu79bHaw=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGhzVlyX3SOiwl0zjSkdqxo5SJDUEfUGn+Yx
 cg4R3ha+9SJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoQAKCRDo8jXPO9vD
 /xOLD/9WUc6hoI0nps0Y5JE1FvDpvYojnUw7HY8XWbPpo0MCODdQzM7mFlqnoJCcRwezi11j2SR
 atDjtGdYpFlyVhU+erBM+5kwCoQulFI/+wb0Gu/qIsUJaOkAvHZ5e+xjMo6EBg4E74K7PuQn4A7
 J7+E9xo9Hl07CNGhcs5xQ9QqdoaYs+/3z5VIrKA2DK3fXXEs32VXoN9vohnAhM6G1B26edOWMIw
 9BPHoLtX0x/m0FsniLRUsCLtuyLI7YGNgIqP0xjnBO5eiqDYQn0RvwD1GM1CfL6xBF+P/JlEIOZ
 Lj/COX0MjnTXSuPr5OSBjJ5cKWbQZsSGRjy8ZjA3JY25PmSvD5pWfiiKiNCRuST+bBHe/7X2lfa
 EHmaB17AOBnQe3VngkSZztCwzcTbRrbN0fage/BfdKfuSKAQ4lQoBOT9IGUtIGebdrwlzwivFsA
 9ejJ7g8+98PJeu8o2zsSsOVg7AcrAdpDZmFxp4zMpmMs6ravcMAIHQWAnt34V9C+z76w4YsNSDa
 vfCkOGe5huJXv/Co1zedudRe4npKTANU9+38stpyDbSSpVRsP9nl1q6p+5xfRcma0w4kIUduH0U
 i3j+1kIK1SjJGYTmNKucPVu7kAXqP1mvBuY1JYpN+F1rhI1CsKG0jDbARViuowdSOm8QDxE5Roz
 AjqXxh4SWLby+2Q==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124004_924825_0F59A181 
X-CRM114-Status: UNSURE (   9.81  )
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

The default values are fine, and MICDET_ENA is handled by the driver on
its own anyway.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 22b1a29ad440..b6f7daebadf2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1085,7 +1085,6 @@ codec: audio-codec@1a {
 		assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1_OUT>;
 		assigned-clock-rates = <24576000>;
 		#sound-dai-cells = <0>;
-		mic-cfg = <0x200>;
 		DCVDD-supply = <&reg_aud_1v8>;
 		DBVDD-supply = <&reg_aud_1v8>;
 		AVDD-supply = <&reg_aud_1v8>;

-- 
2.52.0



