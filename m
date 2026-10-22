Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76760A381B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O+z9Rfk+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YJd5tkLp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=; b=O+z9Rfk+3oXJahVDiT/jRtiKPH
	hpQwuwMky++AZTDnts7E3Rzzuool53/mmuM5u+MXIeX/q/EhDlLKOVS2qdKH9SdriM1B5nlWFdMMX
	pMUjJz5/583SFiB2vGqvDwSWgXE5hj7hpXyQgt5AwPgQ+gHRjkO9LD5dJDTmWkAuFJePvYtY6qlwH
	VB12lYye+MtQsHF++nQ793AO3FWP3P/pxMTl/R6RvBxMxRQXIqumkg9gEpFK1KxCzL21ndjbblYH4
	SYRA+ndoSpTI1NoTeNMA1NpaYxwDebaYMOLJ3fDvkJztErt7pjENV/i5GBU+5EKFlEzNF93AqdB7z
	1G4GGd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUG-0000000EGpQ-0Gcm;
	Thu, 22 Oct 2026 14:09:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUD-0000000EGoR-2F0y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:09:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48dc202a60eso1004283f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678179; x=1793282979; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=YJd5tkLpjarZ6rMf2xek82D1WP4BGE/ZO3EsLG92qg2EKibp93pHwaeVvWscMGjI45
         JN7IrIIXoZvye1e5UIHPmFN+Ijc4nsL8odpEi0G7iRZnmx0dCbU8ElP3W2WI7GtEtTVQ
         K0QEADgWN8KVr4PQKU/yx5MdJ21HBI+ed/Zn7dyYq2oz4g+gwA+JRafJTliUxMSJp56X
         iqUJO8ynGTa7XOhISCgAmqpRl1D4RNcQdlsvtMEWGUg72QQr+XEiIviiEl1t9OsYG98p
         RANr7BclRgKSrLhi5SOIh87DCsziTAmT7EgCdm3RWI1X8Nf0iudLk1Rf++v9JczyWJS5
         wHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678179; x=1793282979;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=EX3WT4Yv1VjQIKwLLzq3HmZ434ya1WVXjE+zOqUgze89srhohaM6ttrayhhG8cvmc3
         SRY48DHBh3wBOwxXaYhXacJ4Y8wnMRdcQbksG+kWyDn9paN+TdbW3of3ryoLlwi33d03
         jInDm6/aNo6BZvoS6DG4og85DWxZOQHfpDKhySSPcPdzBpL1PmVFqW+YaFTl/e8aarBJ
         io5y+RSRJcEd2Aw2+3JqTHhXsqnZfls2EqhWTKiR2Yrv2hNphC/KoyT9+ofiiUlRhgXu
         EUY9rqn5druqA+3zhBsvoJIdIpIDmdesgm9xL+NGLRRomKAWP7qLcNm8lEQFmAJf1xbP
         oUPA==
X-Forwarded-Encrypted: i=1; AKwUvByVED2eX6wc5ntKB3l2rasRgBZSxgkDuCoGGnpKcJvC3l9A5jAG1MI32eB+CmLsV/jKKo+mAMtg5scDPYr9b178@lists.infradead.org
X-Gm-Message-State: AFq9FYLUd6NHOAxxj0A7Yg1/m7LqauAw6925co6o8/leHzYjlHJaGEtY
	IZPHF+4O4oZJC2M2qhXURAS1Kf9fLtRaQR1YuNzcs0IlyZWSajCMhd48
X-Gm-Gg: AYBFou2ArlqqcByRy8XNlTA4cKB+0JGggJuayiBQyELbuYjIrYnLAscL+jrC1yDIfJ4
	wJlJxKafupgB9yWyC4znpJu6cvlvG8HeDbYQw05Mu02RNgQtiW4hYbZYdQTQJ7HtWVxmxiBdKue
	p1pjPL9buk7WWY0h934gVzQ7VhKQ8i0yhbZJl3Km0FzJXWbHtHIJGVOjp7tZtKg1dh4o14eqn82
	yyByLafxQ7PvwDN02N7/x/uZxQ04MguZvipNMVO7fhXuxk2c7OzKVZ691AT0BB0YIsaMjoFkEjA
	9d9XSiJqNnHjfOdJ0Jb9KCotEeKGJkSGPITkFbKQ1BWZcJtFiigqx/CWRr6QSy1Z8cFVSM9DMyT
	k9o6teiEhPi3VMfiDWQ4pvnGgar2Visn3LdVVgzFHpFi1uiMOAtVepqAaaPEaiyZdQS9UJ1/rhX
	V+muhirDUmova3Cn332ouAqhXIuabyex0BQm0qOjrJ3r4uIqAF5JNmzfd32MOMZYtpmNaI5Xd+K
	WtflLtREr7tRSJhIjI6pFmjVHcXlQJ7PeWAMqbxExSiZVp5hTvCaGCB26B2jf0pHnsrZ/JXAZRT
	x0JRwJ8o7wxhN+wLVkiVzM23fCbIHJAThrnI+0mrQ9jPYHIuX0gHo04=
X-Received: by 2002:adf:e00e:0:20b0:48e:1e03:687f with SMTP id ffacd0b85a97d-48e264c3ffamr7880482f8f.31.1792678179143;
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex Cortex-M
 UART overlay
Date: Thu, 22 Oct 2026 16:09:32 +0200
Message-Id: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwZ2moC/32NTQ6DIBBGr2JmXRrAnzhd9R6NC8CxTlKlgYZoD
 Hcv9QBdvpd87zsgUmCKcKsOCJQ4sl8L6EsFbjbrkwSPhUFL3UnUWiQleNmwFT5ReJk9ih5tbVD
 1rcUayu4daOLtbD6GwjPHjw/7eZHUz/6rFSNFh42S0ky2se5exmak7er8AkPO+QsnW9p3tAAAA
 A==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070941_597364_F96D4180 
X-CRM114-Status: GOOD (  10.73  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several Toradex modules assign one UART to firmware running on their
Cortex-M core: Verdin UART_4 on Verdin iMX8M Mini, Verdin iMX8M Plus
and Verdin iMX95, Aquila UART_4 on Aquila iMX95 and SER0 on Toradex
SMARC iMX95. The overlays reserving it only differ in the UART
instance.

Label that UART uart_mcu in each module device tree and share one
overlay, imx-tdx-uart-mcu.dtso, which reserves the labelled UART. The
merged Verdin iMX8M Mini overlay becomes the shared one, and the
combined Verdin iMX8M Mini DTB keeps its name. NXP's imx9-mqs.dtso
uses the same pattern with its mqs1_conflict_dev board label.

The overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Share one overlay through a uart_mcu label instead of adding
  identical per-module overlays (Frank), and include the merged Verdin
  iMX8M Mini overlay
- Add Verdin iMX8M Plus, previously posted with the Verdin iMX8M OV5640
  series:
  https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com
- Drop the Verdin iMX95 NAU8822 BTL patch, now covered by the shared
  NAU8822 BTL series:
  https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com/
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the UART_4 MCU overlay
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso       | 14 ++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi           |  2 +-
 8 files changed, 32 insertions(+), 21 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


