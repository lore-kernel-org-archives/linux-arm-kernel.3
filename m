Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FD7CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1xl80cwkWQ1D3+WDQ/nAM2SEDSnA//RlpMn+1BjLe10=; b=hvX5IU696ETTMnM13Zr1vU4b+r
	cy/qMiiYitSjFl2mEmyICHF48CkPRkjhGFgaBynhsvhX6JKxZkz8rbUgnhJdCMldqsJu7N7SnZ+UP
	2Qdi8onoqN6urDxcmikRB609Sf4ECJLw0/WymqbvxuHJZjxNmwBvCxYmWoDPIgf6pGSYtrTpYz9a1
	4CCzKUTbusAgwPbHg0QWzA5iP1I0R8KJpePCHEjNE6iBNzs2zRMhbbr9m3at7kIxNbh2LV72gPhT+
	BcD61M1z4OpOwNhfyAQgTOldJX68bOkFoXZXlNXEyI1lnrKCXU54KrRUZgb2mVAn61x6CzgalNznB
	ehyYC7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9hx-0000000914n-09Gk;
	Sat, 02 May 2026 12:44:33 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9ht-00000009143-3gz3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 12:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1777725805; x=1778330605; i=wahrenst@gmx.net;
	bh=1xl80cwkWQ1D3+WDQ/nAM2SEDSnA//RlpMn+1BjLe10=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jBBf7Na8OwfcH9/Cav1Elo6meZllHeSqBapXfvDc0fTaHSt1XDQftP5ZTtAPTIhU
	 NXiRaCuab1J+p7Ui1cJoFftk8NoW0TbSM5R03NriW0TgskkfbMFr2Ww9o4uVXV5JX
	 GPbUFrTTgAOfsuZIf+XKSzKryw7d0g5yGFM+X2pLxqSTQnnda6Eyz5XeArd7WRVHg
	 kY9/X7K4rFDQ6c2k5Z0XqktcvMzS3noLXcAJ31UpxgMhQdnYVJyZuN1ZIChDWvarK
	 o8s3EUgcEtT4DOSUw8mOUIU3jLKWRKeTNv9MPOTcIidg1jNM46q2JTSM6s5daAAtQ
	 JJnurbbDV8eY8bmbQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1w8OBD3ATb-000GAC; Sat, 02
 May 2026 14:43:25 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] arm64: defconfig: Enable DP83822 PHY driver
Date: Sat,  2 May 2026 14:43:12 +0200
Message-ID: <20260502124312.6660-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:36+O9g660PB/BxV2sIa34fkdnOGD/ffxzQNvfdOa28Cxh8fNmYp
 AghDnulXdL3eDjvf0toenVDzbF6+LK+/4V30wmxyO/QUww4Lr6tNX/VbcA60YvGhzw2x1QK
 HKBqf+Pk3WtwMRy6TLJp/bCdsvZthsjImJvQBUpCGJujZHGiCnMJWqFrXnhdNTRuzu6A4UR
 /IpQqqcDuMopFEf5/PPcA==
UI-OutboundReport: notjunk:1;M01:P0:zbEoyq6cDLg=;/HP7zyWQ3xPBdrJsMF9f+8hfr0Q 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_054430_301671_111D197D 
X-CRM114-Status: UNSURE (   8.33  )
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

Enable DP83822 PHY driver as a module to support the Ethernet PHY,
which is placed on phyCORE-i.MX93 SOM.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..cea96ed9a945 100644
=2D-- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -422,6 +422,7 @@ CONFIG_AT803X_PHY=3Dy
 CONFIG_QCA808X_PHY=3Dm
 CONFIG_REALTEK_PHY=3Dy
 CONFIG_ROCKCHIP_PHY=3Dy
+CONFIG_DP83822_PHY=3Dm
 CONFIG_DP83867_PHY=3Dy
 CONFIG_DP83869_PHY=3Dm
 CONFIG_DP83TG720_PHY=3Dm
=2D-=20
2.43.0


