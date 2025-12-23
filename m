Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6373E748E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xQqBPEjIjyfmPnQ7OqwKCSApA4c3YAryRblra9QBYi8=; b=yKgDRMFfVUwPXV
	zcz1Ye1K27dX+ZaIM0b++M7XiVHpsJyIyfY6qW0SK81s8DQnj8hyjJcfZL+uhroiO+B814rGJt5e3
	KU9OjybO12/txZfCiZ8j+PpXFFTvtI5RXz/PsqobDwYRKLEps/vwmaT+/YnnTZioubL8K0Y1SEExX
	LkN5PyEwUnWHLsx7/yKxXqDVrTHW5XkwZ5Mn9GDJ6m9GqdnWDH1doUDUhLF6P82OjL8Fg5UONccpn
	cZ5WJxZv4/+uWk37YyQUtbuPE+EPa/EIxtlehTjUxEADQlG87R0W3UILyB6iD9Y5lnwWq7JIR4vH8
	8aQFBd3xOXsJPRv0JsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYA39-0000000G6XO-3sii;
	Tue, 23 Dec 2025 21:36:11 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYA2Z-0000000G6VF-3REA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 21:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=xQqBPEjIjyfmPnQ7OqwKCSApA4c3YAryRblra9QBYi8=; b=izejPjLgN5y6GXW2Z4NPtK0JZi
	8ckA5wYqu4OXIqz+UrfX2bkNte7lR0eukJYjIAwxjFo41e2z2TBvuEhjfTnhoNRFeifyxO0Siig/M
	7OBWz1bmDv8DiahRRpfT74SGghpxUvcSXBDTjNywnINs8YKCAm6bMWASswAGjxvaM6RV+wd58MHbX
	JUpJq7C8zdBzKA2fCl8RuvfmKj1/zQqF/tjmXout11l+7UChxXkajlq+3g0pIUCTuMokzsH4a541j
	NcLPtpajI6VA8JoPCHxPes1J4Zgdj5pt0bzNakJYKyNjBz6vpWXNxRXt2U6hXNDwGp/hWcjoyYpiN
	LKWa4gaw==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: dts: imx: imx6sll-kobo-clara2e add JD9930
 regulator
Date: Tue, 23 Dec 2025 22:34:01 +0100
Message-Id: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkKS2kC/x3MMQqAMAxA0atIZgsmpUO9ijjUNmpAtKQgQvHuF
 sc3/F+hsAoXGLsKyrcUuc4G7DuIezg3NpKagQZySGTNmr23aOIRNBAb5xMmh8nSMkCLsvIqzz+
 c5vf9ABerX2pgAAAA
X-Change-ID: 20251223-fp9931-clara2e-59d1d51d32b0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=695; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=VB/32YG9Ct5aZGQZIwrgo28UOF+9MONPUTdSSEgoPMg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJneXD+W684Oeyl9h0HT1LqvP9vik+2su+/ZFATXiGTlM
 R3at2RRRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABOZ2sfIcNjKYXbMuefMHSut
 CkpPmEVsEns178sr7jmtP6Ib9+a2ljD8d7/75P3Efdd/Hnr66Ka1H2PkBCNZC6FvDtuYzk/9NU9
 oGTMA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_133535_857916_B7A36B29 
X-CRM114-Status: UNSURE (   7.06  )
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

Add the JD9930 regulator to the devicetree and enable the
corresponding driver in the defconfig.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD.
      ARM: imx_v6_v7_defconfig: enable EPD regulator needed for Kobo Clara 2e

 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    | 61 +++++++++++++++++++++-
 arch/arm/configs/imx_v6_v7_defconfig               |  1 +
 2 files changed, 61 insertions(+), 1 deletion(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-fp9931-clara2e-59d1d51d32b0

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


