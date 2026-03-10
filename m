Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8208EFCD9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8byY2pi6aZMASU/wIMl2Z52enhJy2O8vbvW26gwVodc=; b=bf22Pr0HaL6RrbuhSUkwTFjDtH
	RS6whWLXEAHhClCVqkVSi4mBuWw6TDi+GLfDCHsMqUh9ryvRcMiu622S7nffFMQJ/tUskH6/dpDLi
	DEBhMhkrxnjmvYRwW4Ye2baFXulTA7Iju82+8bNZ5JXPHX9aWiG7Wc7kupl4NLt8iUphypiTxakAT
	8q3VvRF1IWHBlEKXliAMCbjXR9nf9AHh8+W6ciboP6Mw2srmic7yhfs+BunVyMPJ7AxT9whElkIVQ
	FVVwz6qSgRkUl8OfuwTgPqD2lZU9+DZ5RKIRkuvPJnBBdmcrzo7K3axEcg3bH6eyj8Cgw5yG3Nyji
	VSoRLjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8G-0000000932I-2spF;
	Tue, 10 Mar 2026 09:12:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8F-0000000931z-0jBN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8byY2pi6aZMASU/wIMl2Z52enhJy2O8vbvW26gwVodc=; b=c/EE42fihHitKo1KQQLWBaT6uj
	zyQ5RegpS+bWfbHWYOv0YSU/P3FQ81bGzXFkOYttKNT20awPJhl1Su/0QeuUwMPSsqWtTx3JCkm4k
	ILUwIVOnp1/k92bqNtX1YJVSmfxdSPC5Nk6VD7U1B6vx9RNFitOIqkGcUg3+0z+sDy6aIAW9iU8Bd
	tu5ZHwVI0herGbvg0NxgmbNjUcKeR//cRjYBYLRGX42qDx8mnKXGtCoN0mEGmQDZ5iACfPY1xAOAA
	nS5Jaqv0IZhpqD2XSTAtu6I5xV02caE2Zwf8+DXbtwBmKG73XUshD3g6ooOw/5rcFngQaSb9xbEYx
	dxRBe+6w==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8B-0000000E4eg-0RxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:12:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-482f454be5bso126820965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773133917; x=1773738717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8byY2pi6aZMASU/wIMl2Z52enhJy2O8vbvW26gwVodc=;
        b=N4WwplS1Yur1du37EIxsv4BSakOCO3PShvNMUsBlmJ4wXtFkfrUt/H5POxfkQYP6/a
         grtp2KMlsbfF4nLPk/WYM1RYtdWWIJUjAUUp8FHO6enwgKYQodHd0XW1nCQ0iBZzZwGg
         v4eMRa3ZyOCI6SLy6lL9J9ZrCw6a0UejCF4CgxNlHPyS7avy/+SdpzSlguHGOBKSolnI
         Adua9SfqpQwsgEFVtXG3NnNRr5o3gFWF2VE6+76HS2JvtrlkhE+vCk6ABmBG0c9Z4/HX
         yB12+oy7Zkdax378mxGRfBFUx1lHN1w7/rl4+z5CsUsU6+XNndh8f97LhmoevyrSGm2W
         rYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133917; x=1773738717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8byY2pi6aZMASU/wIMl2Z52enhJy2O8vbvW26gwVodc=;
        b=oYJMBtNp0rNkdGueFzeCpwrtfwIjGujw0pDzv/EfSLLE7jB3NrdUyrQRHD2hWmPqMC
         8d/76MdxSsY7+1Ihsqq2m9YxS4eX1+5Jp7PFSom8y385tZurCtW/YbnIhhpWP3gTp79X
         4OW6pPFafIr9Tsj2krubM6vk1sXzyw2/JFnaTkBT3MTQBIDERjx2y3rIkJjxCfl2rYFy
         mDAgI8X8y3FZDIwGnXaGgjTQ5o7hpDT+d7+5Lj0NywgUPpFmvkltEYcft6jJk0DPKagr
         adW3HHQDKNYtpPzsgU+c6A8fLzyu+TglMcWYG7iurue4/58H71HCpbpxpi5fJvLC0YLK
         PleQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy6sDNy4z1+y5zZbntv7seqkAGjW4Erzt70WPAUyOzH+iZObBiFApc85nFECfrFQOxip0V+PSTCCwoiPITXYWR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8DdpePwSp0zud3l9QLpDTCxIGgumVG0t7aqFgbyUSEI9VaTUC
	MxlexZ4V98C2TeDCPmCQcZnYuZqiAJsknYficpOa12SIg0RVIUZ/5jrI
X-Gm-Gg: ATEYQzxYxhnjT2FvFgaPG8VyrNAVgVdUbs5FnhWvbV3QQxj/0ZcBllbKLrZLyJre6Bb
	aZsIsV5xp5IERL3s08YzEEUGKJZZadcilsMVZsqd8tuap1kJft8L2WGBycAlwGdVexLW2xRd7QL
	e3UpN+WQEw/FnpyRX6CXiGp5/fQHUCYQV16R71od4cBhPof12u9jG96e37hA2iuRgTOcXpF3dMg
	5rSh0XA8RgRzsj6qczexCHnCY1GwzWTX8xRamAjJDtdLZr1wnCRXUDe1zobIWJ7KhEGqXQxEdJ7
	Ae/YfCdR3d0R8spMFQVzWdynzTiVhIHfyNlbJuJT068wuxe/Y17rPrae0L/jT7TUxMUpateIf9C
	eZBu1pKLvUOyVeQhsOdeUHwqzXvkVcU9PkWh2DessnIqywp0gt7XhyH/ZMvYXIkDNnrILhasnTY
	AnOAdtgzhAn+viSVr7CsBemmMTdM1TH3plVekH01fI7g==
X-Received: by 2002:a05:600c:8b4b:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-485419f1614mr41410525e9.11.1773133916565;
        Tue, 10 Mar 2026 02:11:56 -0700 (PDT)
Received: from homeserver.tail6d6c39.ts.net ([82.137.32.29])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541a6bb86sm56808345e9.1.2026.03.10.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:11:56 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] arm64: dts: imx8mp-edm-g-wb: Use 0 for reserved bit
Date: Tue, 10 Mar 2026 09:10:53 +0000
Message-ID: <20260310091054.2029912-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_091159_297532_FB5FD342 
X-CRM114-Status: GOOD (  12.85  )
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

The i.MX8MP Reference Manual documents bit 0 of the
IOMUXC_SW_PAD_CTL_PAD registers as reserved. The hd3ss3220
IRQ pin (SAI1_RXD6/GPIO4_IO08) currently uses pad config
value 0x41 which sets this reserved bit.

Change 0x41 to 0x40 to leave the reserved bit cleared, as
recommended by the reference manual. This also allows for
easier conversion to symbolic macros.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
index 242fa930b..a78401d11 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
@@ -345,7 +345,7 @@ MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17		0x16 /* DSI_VDDEN */
 
 	pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x41 /* GPIO_P253 */
+			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x40 /* GPIO_P253 */
 		>;
 	};
 
-- 
2.43.0


