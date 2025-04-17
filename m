Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE092C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeoSQl2FLdGTN2XQXHvy2Yf+6ASS0TB+E/t2YCPe3wg=; b=VtJZnVvdYlehRx5obJ+qHiLnxK
	tohNc2oJeTGG+MEO+BvyHLdUUVUkmH7lzlCs5TR2C+2chCVdWHWMu3adozf+yWurp+mptQjNpZgcI
	AZQv7sRahVv+PLYdm0O1ecVmKfMeeStX/THYHC5LgjLhxTSEr7Vl9Gwz4YxGBFcnJYlmZ9ZMpSlFV
	NWen3S0A4rFfe6OMG0OLz8GPb9j9K2Daz5FGDHgEeuCOUh2t7V6799Ei3XMiTM0cItAOE4CezvFpz
	vlijQsk6GgPZKfYpglGG5xD+8c0iLVWxIutqLL+F7+H2Pd6xESkhQR9T+OzOszgoahyLyxFvm9ahF
	yI0vKR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MLa-0000000Cc9U-2QQZ;
	Thu, 17 Apr 2025 10:19:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MG3-0000000CaeT-3eOL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 100394A47A;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EED28C4CEF3;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744884850;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rGS8XwNd9vPwIX674pUwFgxxR4dmj/iP9+VNa0yV3dqREB4uGM31dB7YIorqRkhWw
	 D9nS4ain/EcU7nKjXBmYLrt0JTCezdu4M2+M/fl/Yw5OU+3Hh7Gp5RWEblCqTAxmQM
	 kDqtiT8Dh63NivRXxojSIDYgtnhtKlw0V/0aEsAKouCptXOPPYnQWY4/OB+aRjAX4q
	 B0yx2FkvKuVF45pPt82m9OtKSNvPR9vR7tSSGkz+zwGoOgD/q01EYwlv1lepNTf+Pd
	 2bi20eGq0d2D/bYGXbirZis8zDb6Rl8u3OLBVf0qO7E6cYyEcVRqcVID1z+ckPuepH
	 y6IsJriiPOKzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2628C369B2;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 17 Apr 2025 12:14:05 +0200
Subject: [PATCH v6 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-initial_display-v6-4-3c6f6d24c7af@gocontroll.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
In-Reply-To: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744884848; l=777;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U+cI301uttTYTg6gAR1QRerlXekISKPf4H+SFf8T4EI=;
 b=wwQo+EHWiwxiFPkQ9jV8EoqYOLl9ZEgbLzBriJ6o10ZAJ8Uo2ffsNX6kyHE8xk0qclxskTUsv
 0NDuOTCumGICFSFIu2JT6tmgc43TnW8AqQNL7JGl3YGXy8RPAE//3AF
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_031411_928931_DA69DC2C 
X-CRM114-Status: UNSURE (   8.41  )
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



