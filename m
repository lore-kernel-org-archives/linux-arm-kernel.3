Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA14C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XhB8TBwvxkpXNuCeNVmLUNGzZMA9f4JBRC9sHFOwzA=; b=rQgFDz9hT2TDUYNkN3o4CkIeAW
	cEdld3Eo1FU2XH3DFIgN83KVb9oiiTzLawgHkceJz7MTfRjX3sFaMnMIXTOUOTGwwdJg5epuEyN0a
	oWO4R8jx8jV6axhR8K0fsffTAg2ilGDRRR8OCsn4rKUwYvyIgHzGoVx9F+qQdszaY5khakETln/jT
	oTF52EQhJT+VjZKb0M/U8xVgRilYsAKV1GfdsApa4wWC4IR6xSUfqvsBfgYYE94SjwkjNpL9vAhWu
	WEJW6YOKHZPoHzSYE/yThIPkqs0tZq75dBYlWJl8UDQ0usdZYEtqEDaMpbapdobmP1+VFrSGu8FBQ
	c7DrbdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DO9-0000000543x-0Ykw;
	Sun, 06 Sep 2026 13:58:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DO7-0000000543b-20Wj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 13:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73629601DE;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F78EC2BCFA;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788703106;
	bh=cYpMKA3aoI3t83XGIqY+x6nd87kg/8bFsvsaaI15egw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GMmUdZs/mrR9CrfdMLzztAPPxeWn0XaBrlMLxx1RY7Ryg+/OE+6FAnQO95hA25hBV
	 uMYjzBmV9yn8+wtzxIZ7gutTCXx2jo3d21nvCcDujJ7aMRv75mawq1Aw5e6Qo+du6B
	 EPPlZp5bc6N41wmiDDz36Om/xPEYAL7FT+HiOXzi4nIYUkbusW4NJLE2nuuMjposzk
	 I1svvQP8mKv4bztQh1Lwaaz0WabXNBA3RW9g2y1BNA4HoGmYcFQmOtALArEPxuFNhu
	 YRGOtak+S8Zl2lL1goR9wws/FRUrLsQTvUxMF+usFAPByYNHbAXdqXTg2hDoAHbv4q
	 Qw/9CmKQjvmfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E4FC79FA0;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 06 Sep 2026 15:58:22 +0200
Subject: [PATCH 2/2] arm64: dts: imx93-11x11-frdm: add missing vcc-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-imx93_frdm_rtc-v1-2-3fadbda0bea1@hotmail.com>
References: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
In-Reply-To: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788703104; l=734;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=/6HDos0ffXRqjJ/U+G+dvR4yRCMOxOYwMu+cAp0G3Jg=;
 b=hSwACxKfBKhB7HmhyoI+UsL9K5XAQkT+JQjZ6DWZIBvlqaOaK4j9Ebp7Nkwc/+PRSdzwxl+aI
 gkmEuP1tIaeC9CtWjfCOPchEfVSmRs4jpFeT4rh1D/bRu5XyxuXKgW4
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maud_spierings@hotmail.com>

Add the power supply to the pcal6408 gpio expander, it doesn't have the
dependency loop like the pcal6524.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 8034992a73c7..23d2b9930420 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -45,6 +45,7 @@ pcal6408: gpio@20 {
 		#gpio-cells = <2>;
 		gpio-controller;
 		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&buck5>;
 	};
 };
 

-- 
2.55.0



