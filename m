Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A99E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 04:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KGWUyeOha+X1jJGqKNXSQpB1hVyHAmJEjzhsVzT9bUU=; b=UAya0Ui2XsYbupWrHe6zYKdfYu
	jAYBqpUpOrs7UroNK2TDB6gC+AQY0Ds1aTKFsw6X8/kvnjDn4PDtRgiW2+JUfzeX9HfHyc0aFZJJ9
	U64+xmewZSgTnB2oAlHwyW13GMrFa7JWODhkln/ebhpVCHP5HJGSSLb+vWXqnVEm130aQbxtgDcyd
	GQePpPH/S6VnfRvKJSFIHNwXoQM4k9SISlJHOBHXte4gpjMdz0QDDgmLI9mYrIKj8Stx7KspJB/I9
	wVd2Q59K4GnjY1x6hy7rcNwSX/vNx4v5CJx+X7VZIkx0260NhvVR9Rl+Z4Ph7X9HCEl2fUFgMOYvr
	mL6IJ18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2Pf-00000008ykd-1SQv;
	Mon, 16 Dec 2024 04:08:55 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2OY-00000008yUY-21in
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 04:07:48 +0000
Received: from hwang4-ThinkPad-T14s-Gen-2a.. (unknown [220.197.230.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 0F2B63F214;
	Mon, 16 Dec 2024 04:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1734322061;
	bh=KGWUyeOha+X1jJGqKNXSQpB1hVyHAmJEjzhsVzT9bUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=oeOAJCuXFmfYlkbRyGRJjMn9gigh91xMdP8fEgFaHt/AVunbtpFgUeXqSBnkSyldy
	 MSrRjIdahH9aC7kvPSQUafpzXqMZ1nPhyIMzG0c+vdymxTO9cANjlfOUcy7yKxHgaO
	 4zmG4TTmxRJBPw6AqX4ym1l6+b/nweAxaIT1aQiulASgI2nCzo8Qu54/SyoetujE7l
	 02uzSA4mtVceFGM2MzH6b/W41VmZHLUm6hjipcOws11oni+s5h1TMDJxkTfZJiVP7c
	 lrO3FG/W85jkjSKUUrwgCNyoNXp0zVD9A/GyhKqLqEcpWm2bqj4n8fSKJRKPb0bQ5K
	 g0ED4doIqJbnw==
From: Hui Wang <hui.wang@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: shawnguo@kernel.org,
	xu.yang_2@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hui.wang@canonical.com
Subject: [PATCH v2] ARM: dts: nxp: imx6qdl-sabresd: add dr_mode to usbotg
Date: Mon, 16 Dec 2024 12:07:22 +0800
Message-Id: <20241216040722.21738-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_200746_786691_C83A1C91 
X-CRM114-Status: GOOD (  10.21  )
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

Currently there are 3 type of boards (imx6q|imx6qp|imx6dl-sabresd)
based on imx6qdl-sabresd.dtsi, they all do not set the dr_mode for
usbotg device node. The chipidea usb driver will configure it to otg
mode by default if the dr_mode is not set, but some testcases need to
parse the dr_mode from DT and decide the follow-up test strategy, here
set the dr_mode to otg explicitly for these 3 imx6qdl-sabresd based
boards.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
in the v2:
 adding the dr_mode in imx6qdl-sabresd.dtsi rather than imx6qdl.dtsi

 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index dc8298f6db34..914c129b09a5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -804,6 +804,7 @@ &usbotg {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usbotg>;
 	disable-over-current;
+	dr_mode = "otg";
 	status = "okay";
 };
 
-- 
2.34.1


