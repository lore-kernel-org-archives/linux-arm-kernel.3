Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70167C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/UqMJMSAhvrPSLkcAN2tNGm4QReSxJ4zyS/t/eFDaw=; b=lQceRLcZOvTz9iQFgRuhy2AApU
	gFWZTttRe+GgIe/6kdqJOqk4Z7NuIruXk59snFbCVWPv6eBdvIIJ02Ww6rfwTHSdyBlXuAAnNyc54
	W63i7Ya6EjbOHIBR6BpGduv+n/OtpZtv2egj3g9yp8FNvSTVcST9rwEWzT1RamcfwF+Fo6nZmhOvl
	PLI+TH7K1s6sOXLGQo1Z2ZAAWDjMRwNk+8G2PUBG3v+EdpbBCNu9lJUItbaNgylrmDCv682MfraPm
	rHjrgn1Gj4fosN4x/TbJt3DzOo4WiQjDFBZgV7zdz3HMI62dUQKzcIh13wI/mmku/MQUK9WL9hm6p
	AfL1g1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJ9x-00000007KL6-3Rck;
	Tue, 18 Feb 2025 08:40:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJ8V-00000007K2n-0vZH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F04E6A41DB0;
	Tue, 18 Feb 2025 08:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DA3EC4CEE2;
	Tue, 18 Feb 2025 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739867961;
	bh=SPcl/UOhW/cy7ZS6G7DShHFIAuQPHxxo6CaqutmigeY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eshHsXGDvwxrSHeRVtLo5ST1o2VIA+LPzeg+O23XxmbRPQaCqxz+dECGnfzd10GoT
	 VrGLz6yhKsbKKDyUO1toIM6l0sAMP2BuNkSRjXs1chd8KHT3OV1tj+Yd2ltVeX1vJk
	 agB8ZtSlxSseQLdPtOjWI+/V63wBOAFiu78ezmFP+AtEtRtFSC1hjlKMXptdzUZvYZ
	 fjXcdY9keTg2m6neiFESrVSGChyx6yBnsfBRLLJ4fbchv87RN//LvLLNej1AWaUnmb
	 9CzAGitAygkWr9qqHaA2U2dGtJz1o3XjtvS/1pErLvatCZ/zO+0qqmIFizhB2tFexn
	 ihbTCIOqHnhzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62117C021AA;
	Tue, 18 Feb 2025 08:39:21 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: imx8m: Add pinctrl config definitions
Date: Tue, 18 Feb 2025 09:39:15 +0100
Message-Id: <20250218-pinctrl_defines-v2-0-c554cad0e1d2@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNHtGcC/3WNwQqDMBBEf0X23BQTbSw99T+KlLhudMEmkgRpk
 fx7U+89vhnmzQ6RAlOEW7VDoI0je1dAnSrA2biJBI+FQdXqUivZipUdprA8R7LsKArVdNSNg5a
 oDZTVGkrxPoyPvvDMMfnwOQ42+Uv/uzYpamEHvGrTKrIN3ieP3qXgl+WM/gV9zvkLPCtAqLMAA
 AA=
X-Change-ID: 20250214-pinctrl_defines-237e7db61c6a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739867960; l=1173;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=SPcl/UOhW/cy7ZS6G7DShHFIAuQPHxxo6CaqutmigeY=;
 b=WjUzSixqXZo3HZ5py+rVjBFU2osjMWLtfUUHAw7i8UoIHjvmiDZBG7dchTMK6tDDJuAFt7mBp
 bdZCkawsCreCnrG+Jeq20itLp9IenEbjYO9c1fOUCt/qGdErcDKwJjs
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_003923_332057_8B370A76 
X-CRM114-Status: UNSURE (   9.68  )
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

Up untill now the extra function mux (pull resistor, etc) has been
defined as a raw hex value, this is difficult to interpret. Add
definitions for these parts of the pinctrl registers to allow for more
readable pinctrl definitions in devictree files.

It should also be done for the mn/mq but I currently do not have the
reference manuals for these to verify these fields, though I can only
assume that they would be the same.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v2:
- Changed mystery bit to SION
- Link to v1: https://lore.kernel.org/r/20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com

---
Maud Spierings (2):
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: imx8mp: Add pinctrl config definitions

 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 27 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250214-pinctrl_defines-237e7db61c6a

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



