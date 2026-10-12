Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C5ACA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=; b=1eIN/w4gTZzJFMSAtZp3UpyEh6
	XsyKl/JytXbiGmTZczg+BWCPZbq9Ix429HZlx0S4gBWkOETTDszMvMbk3pzgIVu5519/FkFDpBcDq
	mwBK1l0WLqyJCWIjt7Frz/P4V2b+G7posUIyrIjrZHhAfg6u8uWpr2DJbPneFpASjjdlGhJntJsQm
	o+OaB+p/Y8Gd8LZYMSUUc80zSUXTgrz1m9q4iNS7junh3Ipqx8nkRkGlJp28y/MyDohMQxtnVS8xJ
	lxTB53rTiio+FDK1uJnAZo3oUwW+Rab8RbaRwXBNjpBeqrY/ipBKUnNy/3XrtTSUCm8mPS5/h8gup
	C5BR51GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZH-00000009jql-3ulc;
	Mon, 12 Oct 2026 06:31:27 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZD-00000009jnI-2Mtd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:31:26 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5CD9B2004B4;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=;
	b=FaJOmfKQlac6JSlJVVODHNe9WgvGuZ6EZIJMYMrAg+lvD/UIop/8y9y2bPXwC7ylQMW9oJ
	3XTB4Bn1/QAMTh2SQV1MBldsWkOOiUk5Tv1AebKlGjUgVgW/rq5d9W7vAsSqThEUcdbWIb
	R+641BZWOjwCVGEhqewwUdP0lgUEk1qqsEiXGmy0A29EykqliOI42aPRb6keOSd+rGgTyz
	qNVxI3OGjntokJXkmUxBPTg2mifVU6DYyiRiS57/EqIx3UoqdGsCtOCz9Y1w1IgPdnWjg3
	NSrb+hk9XoYVPW7zeUdGxLNAIrEfrL66B3HQ2MpWPPqWIsps6FTgpSJa1Li1UA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786679; a=rsa-sha256;
	cv=none;
	b=gKwTOkX6NNwiyu/Pvlqj1fNVcuj8edA7RbQTMq1mA7mp+SNtUXMdi48wTHt62KzjO3Xw1N
	LB/ZTgOJuSAnaLwpCimUIhxX0QAkGVhuU19sh74HZqHWTLPRyGPt6IN+3NpdBFq/DVjrqo
	a+v3M4Jwo2KrLY4HhU3lTePMsKZ0DTJekiPBAzSnQlUFyDYm74GWTcxAuIc8O7fY1hiy3d
	tpRqoic0JdIVXqMjyXpLXHgP3wf7JRJ4RKbGdOKmAoAV8t2pw3QqXeCCPbAzSy8fScpbcm
	FJTD2+5fWWSCR4rMUSXVsBXXFqgUn215glEUbMbbeCyfv27LxZh8xzQNZmguRg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=;
	b=XtLxnbEke8Am967qB6tABpLuWwei0xC64wjPBLIqcyDNufAlSmUH6Znzu6tmrtSdoy8HWA
	WWILs+U2Sw+4me9wyGOwbkPKuWqQikPbWHXhXEx0XQkVueunvx2L+Bjw5ueziNmaCCs0Bg
	Q0Fgxyyl4mz6uw4xWoMQvdf/2eD4AVrp5FsYZPSaGYnJsRN2sSJTArRbwhyhJGEJalour2
	lLZJ3e+o1UEhvydD+S0pvf2tC9EzHQhWw4WmpTA8CwxFJt8gMJtAJCpzS7Di7ZhsDASLQl
	XZfZl5+sC9amgQQ8jhiZdyYt7al3dLf+1fIYQ6x7o7juLByStOR0hXac2QnSiQ==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:30 +0200
Subject: [PATCH v10 1/4] arm64: dts: freescale: imx8mp: skov: fix sort
 order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-1-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=423yVuUc90HmONuXNkP5wWTzTYT7Jwx2uAIEP4GzfrA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum0G9yOzWgUux0QdOHL8ymeFLTOvn3Frdps37cMsu
 dp9jFdvdpSyMIhxMciKKbKoLKzgE/X44Bk5TYQLZg4rE8gQBi5OAZjIdm5GhnZBr8CWiy8S260D
 b0rVm9opHIuN/714+aNzcZadnzganBj+Sjx9l9l66Z3VRsn4vN65hqLamaIKHXmeeRLtU85qvLD
 gAwA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233124_110165_EBADA952 
X-CRM114-Status: UNSURE (   8.39  )
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

The imx8mp-skov-revc-jutouch should be alphabetically before the
imx8mp-skov-revc-tian variant.

Sort the entries in the correct order.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..475e1ad9116e1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,8 +707,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb

-- 
2.51.0


