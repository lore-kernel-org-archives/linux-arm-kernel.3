Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9DCC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeoSQl2FLdGTN2XQXHvy2Yf+6ASS0TB+E/t2YCPe3wg=; b=f9opx9s4joinT7VCgnWzTTndyh
	iPsCccnm/nR5B0QJOzM9z9TV+dkevC6P28MMrpyNLlceForhqzvQ6SjuZuiV/THPS2H5wMCy8P2ZL
	tmC5J0eEPZh/VRAJ8dFB7BU1mEAIn5qow64CyfK78OEhooW6t/xCAtG7/dIIhZQmG5YdfAo1EHlcM
	2Fxh6o7ZIdKXAQb2fNl9iqFZQ8rClC2ZusAG64M5XTdB4JA9PIzX6DMEXWXp7t78dZa8nKwP5272Y
	qkiMU5rIAHlbTIEkSEuEEroZhlkmWn3JqM3ET2VBkmZktNeSDWeSIEKSH6OmsXcGIdxnEb5j3fSMC
	Dgk4zoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aOM-00000004kJy-2bPr;
	Tue, 15 Apr 2025 07:07:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aBh-00000004iL4-3992
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B10795C5569;
	Tue, 15 Apr 2025 06:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 291EEC4CEEF;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744700068;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oJW3BvVrZjK63rHZrFWVLPrVFAcoBh17mEQ0AdKUDZVThtcfz7PVJ1DhedSfmJo9C
	 8r5t3FNynBnwGNZ83V29a3Bjh3NxIK4nCMlx21qx41xZTqeo6L78jN/4YgXGKSM8hz
	 zUMGYXGlCPMYfmACaDba5t2TqWAJrv24pjNflZaJiCDD4ul+P0+ZMm/BefAAe9k6GM
	 CZqtUv5/CKVCAxSRd9SiRP/h93N0f72HQoQfJffAH6Q5QnAUFiSQZJazGXTjADLZ1w
	 tAgbjDMEnW6oHYdHUDbqcxQ3AfKB6cyo+Q/yLniHZBat7nFphGPrIiPlAhbOle+CEy
	 WjzajXZK7YWHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A984C369B9;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 15 Apr 2025 08:54:27 +0200
Subject: [PATCH v5 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-initial_display-v5-4-f309f8d71499@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
In-Reply-To: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744700066; l=777;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U+cI301uttTYTg6gAR1QRerlXekISKPf4H+SFf8T4EI=;
 b=8R9Qv7eVCATXQybZcqW6FXRKqRe/5yNEdrsJZ2Dv122cIscipOZULbmyu5hncag/7FC6wiRFU
 4Q3S6elRmxGAGTbtD7d1bbI5Ul4TawZXTjlgiu/oY7L6oTvB9fD6Vv3
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_235429_939087_4B05F729 
X-CRM114-Status: UNSURE (   8.99  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ca022081bcf564c8ec91fb6431570045495ec23..3c94e530d0784d90b50109d4f9e7e6ced40f08b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10060,6 +10060,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0



