Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72184D1D463
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu/o0y1RHmas1O05BrwP6XFZ+n7kB9GLpGMyJ6q1Qwg=; b=kfxRE9FAGu8YF7SvQLIkbmCRUo
	t6t7fh0ubbBkGef3J+xJstqqjd4OeNlEPuvNWTwF8n7zuIQU9M8ZWWbKL6a0vvX+vwWKgRjCLlXF1
	lOq9YJfUfNP7kAdOkbC5rk/aiFoYONcZalxd0c9jte/6G61/sKPRvTVZLcJeMlGso7QDvMLXvkDhG
	K0MqukE28V7AD0aYS7cbjQBGaeOVgnkosRlVSx6x70cEFJudTrKlisaZZYDBjl077Jk0//QLQIyub
	EkSeUFVdayCssVrzINofbcblPhpC4aqkP8j4IqV5LdNhWHMFJIDJYguk67SUqeAeXaDvVNOp5p6vI
	n+ITLG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrB2-0000000HNWr-22Dq;
	Thu, 08 Jan 2026 14:39:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrAz-0000000HNVZ-3mNg;
	Thu, 08 Jan 2026 14:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767883186;
	bh=gug5MGTUrIC+7Kc+bZUycy/flK74uye/kFa4Mt7i+Yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aA5m4KlxwAwgMYq2mcB1WhEKYQe7q7gF/fSfVK9Zp0154rmnf6NSLSMzhjcWf/nxL
	 aaGEyblsgZdKxZXi6dafI1l3Zu6jMUAEAX6HXoqGPNepCndIWk4CfyVYuyEbsElIEs
	 KXogjYm0XBbOEl+ummctXCVrF7FnOyAaxyVFCQaEA66YKsx0o78aXWnNiRA28kXduT
	 p4KvZ949UuazMV9MJDhpA1Z/QSJd7mIrL0NlBL2fldS505MjfDCrMUStB905BVrupZ
	 OVoBwdtsotiJkRNU0Fq6cITyq0up9f/1FfaR/qENNVbN3Z75YCvaRUW3/ItjMP92q0
	 LKZruq0PSqliA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC83917E13E0;
	Thu,  8 Jan 2026 15:39:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8195-cherry: Fix warnings for vdosys0 endpoint
Date: Thu,  8 Jan 2026 15:39:33 +0100
Message-ID: <20260108143934.69634-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_063950_092295_8DF26092 
X-CRM114-Status: UNSURE (   9.38  )
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

This machine needs only one endpoint (@0) for vdosys0: remove the
address and size cells declaration and rename the endpoint@0 node
to `endpoint`.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b3761b80cac7..d5b632489b1f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1512,11 +1512,7 @@ &uart0 {
 
 &vdosys0 {
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdosys0_ep_main: endpoint@0 {
-			reg = <0>;
+		vdosys0_ep_main: endpoint {
 			remote-endpoint = <&ovl0_in>;
 		};
 	};
-- 
2.52.0


