Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA99CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CiILENAKFWiv9La2XUpapdMM6daaqMk4FnpMinPqYI=; b=kPXFUSr/e7JlOLpjPSjEn/8oXB
	hmz9H9VjUuN+GPR8O4s1xHjnSh1D6p7UR/T0uLthWpaM7UrzO+bgtIDaDl4k7oxs2+v3OK+F2AZ8+
	TQwY5onzRFmVDPR/SWnOgsCzktu+wzJjfremJPKuKdKNylTpxIl+Lp+gAwx72Bs8tpAONsNF5XBIl
	QsUmM9xmnX8i59B+Hir8EN6v1YPpisUWqPy1Z60ZTsGWCYHfeWTaBFa15fwOpfCX+8yRqTOOhLAdQ
	jnToJkU8+YrUpsvDNJTEB8o7hm9oI0Obxut7OGyZKoFQ4MuZhxoFo/sId8TxBEnWG0ZLN2QM8NOjS
	B/5eVUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuvtO-00000008826-3mae;
	Sat, 06 Sep 2025 16:35:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuv4p-000000081gV-2yL4;
	Sat, 06 Sep 2025 15:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C703D4526A;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D3D1C4CEF7;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173420;
	bh=BntybK4ghItAd51ZFEoy/6BXMrI0MX3OXUGh7tlF2wQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nd5VJLexn/JNO4rQ46wZHaAA2rdXQy4WRFRU83/JHb0FCIdv3m6jJ2NDxaNRost4E
	 PCEEJqy3ZF9tH3znRQjppDMlltPH4XpTjHnzRoMmD6yeJnfzjFSfNakibLeKbXR+ag
	 LndOYU1l2otaKyHEyN1GNBPT02XugtH8rLJgMWfE7caUVvRiT6Wezl8EaLjuccZVgu
	 HWrZhQDbYB3RHOH+7aDKYl6/GGo7pfMICv7A+yF3sEdUAqxwUKJLQhB3HoAg7Gr3hn
	 ltb2kUnEZr4jTpoNieECWl2dT6gxhfA6a2xmOG/tm7/FbL6pofBGiDLZIdNXhBMa8Y
	 WQDGGNao7uQhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C2ECAC581;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:32 +0000
Subject: [PATCH v2 19/22] arm64: dts: apple: t8103: Mark ATC USB AON
 domains as always-on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-19-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=KlPzmlrett6VZZaPvH7/eARfg+MitLPN79oIzdJZz0w=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesKVv25TfrFpgvlCt8mzcumJ9y0ztH/ZTDEKmtq9d+
 JrN7fHhjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEijYzMlzqWq1rX7rFWLbo
 CqNLej/H3vy0+wfTkpMYojP4V6drTGX471lmNdN+57zemxNlS/z67s02e/uXacWdf5lZh0u388t
 V8QIA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_084343_839488_910D9645 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Hector Martin <marcan@marcan.st>

Shutting these down breaks dwc3 init done by the firmware. We probably
never want to do this anyway. The initialisation done in the ATC phy
driver is not sufficient to bring dwc3 back up after these power-domains
were shutdown for example after suspend to idle.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index c41c57d63997a59a9fe3c88de31fddb31781398e..4bfe0d2de30ad6f975b31d443b62ef0e74b14324 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -1103,6 +1103,7 @@ ps_atc0_usb_aon: power-controller@88 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "atc0_usb_aon";
+		apple,always-on; /* Needs to stay on for dwc3 to work */
 	};
 
 	ps_atc1_usb_aon: power-controller@90 {
@@ -1111,6 +1112,7 @@ ps_atc1_usb_aon: power-controller@90 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "atc1_usb_aon";
+		apple,always-on; /* Needs to stay on for dwc3 to work */
 	};
 
 	ps_atc0_usb: power-controller@98 {

-- 
2.34.1



