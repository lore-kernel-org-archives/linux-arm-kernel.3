Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70073C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AvQmEBLf/4WAI3Vp2KLCIDBnXuFpHOAyles88CxinTI=; b=HiGiBP9cbng60B
	dHHehqGY+FkOaFeAh63Aj2Y6BRZCbrzQkauV4VOUzqZAY9XsIP8X4YmLeeSLQHWZ9OLVXMe9wzCBl
	WF6TgDZRv4vCHYKbh1aA7D+ZVVjjAjzXaMOa4pgcWEjKEy60iv8D+A3iPtt+ORO/K6jWIe+tMuW+2
	rU7wTzbTb+r3ZmIs7MbZwn8eO6gAr2oI84IHZHOalnBc6IwaAalRp3kkMMTVjuyqJ/9lDOEOImFnX
	5TutqkMwwlVt6kX5vYgzY14QsF6J/ghMTZcSQ6uKltw8Lh5rkE7lBEt9EcM3K+UCEZ4T2BdklPUIl
	eghaLiGgUchCdb/RzI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujttv-0000000HMCN-3SFN;
	Thu, 07 Aug 2025 06:14:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtov-0000000HLsE-1BWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 06:09:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ujtot-0001UZ-S6
	for linux-arm-kernel@lists.infradead.org; Thu, 07 Aug 2025 08:09:43 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ujtot-00CKWX-27
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 08:09:43 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 512E6452500
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 06:09:43 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id B6DFC4524EE;
	Thu, 07 Aug 2025 06:09:41 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id b287dab0;
	Thu, 7 Aug 2025 06:09:39 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH v2 0/2] can: m_can: document and add external reset
Date: Thu, 07 Aug 2025 08:09:29 +0200
Message-Id: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlDlGgC/42NQQ6CMBBFr0Jm7RhaLIIr72GIqe0UZkEhbSUYw
 t2tnMDle8l/f4NIgSnCrdgg0MKRJ59Bngowg/Y9IdvMIEupyqasMaaxkuMsFI5Poz1qazFQpIT
 GOHO5SlG9dAV5PwdyvB7tR5d54Jim8DmuFvGz/1QXgQJb2wjXGtnaWt1n8v07hcnzerYE3b7vX
 52D6/3HAAAA
X-Change-ID: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, linux-can@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=dBTy/8+JrxokQ4xSHmojU5rylaxcvQQGcenu7LFj3ss=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBolEMbBIwx6KTVCmP4+ZFkh+ZEXOfVGQsPsSk9e
 1NTWpn+9HWJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaJRDGwAKCRAMdGXf+ZCR
 nAzLB/4xr+zbeYmKkhfYMQD6E2ANXZMEPkDKdmNqom6qvgZYi0qOEmKhoZZR5W37ozkQnS0ZmLn
 iKTOvy8wBaYFn+Dy7pgSAuO5BX5U/98rf65NjFFrb8WxXKJJxPND+qPZqDlp2+RD3zI06RVvIw8
 z5I8XcF/CGyzGCz6GVnYXcWof5cUQAn//BqJ5zPUHR73TYoLHjLCPMHDeVw6Pqfy7/7dbVcna/i
 7JoC3puZ1dvpou6HkEyzDm4dudhdhi/yAc0oypJVZrw7YnibPZxLuVfOP+tgKRtiEO5KgAv/NZV
 oXc2y239HSTb8zQPSj5+alBkj5y2UFZWmX/Zwtsk6EDGz2tX
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_230945_334552_A3BFC640 
X-CRM114-Status: GOOD (  11.78  )
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

The m_can IP core has an external reset line. Update the DT bindings
documentation accordingly and add it to the stm32mp153 device tree.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Changes in v2:
- add dt-bindings update as 1st patch
- move stm32mp153.dtsi update to 2nd patch
- Link to v1: https://patch.msgid.link/20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de

---
Marc Kleine-Budde (2):
      dt-binding: can: m_can: add optional resets property
      ARM: dts: stm32: add resets property to m_can nodes in the stm32mp153

 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 3 +++
 arch/arm/boot/dts/st/stm32mp153.dtsi                       | 2 ++
 2 files changed, 5 insertions(+)
---
base-commit: 1a32f7427eb3d1248bc64cd745b93f88cc838933
change-id: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>



