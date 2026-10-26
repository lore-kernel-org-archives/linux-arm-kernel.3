Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1HFQYXY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YM6g+05q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=; b=v1HFQYXYHdOEzsn1vqVUCOmzOp
	mbT1k9drKSrYKC3sKDnEVu1W676Y6xT42qbJdXQfwB/vcOrSssLiv1BYVsGilO2cWkdHx8V9UIYGi
	/dxZovJEQFzHLT2HyHHqIQmxASNk09b5SuhM+2mmQyAPkm7ZQI+BYjXkwYgQ/HVdL/Yklpr7HDsJM
	LIL0QR3rrYaMkboExxkzJq1zDGpHUzhIgA4NV8f8xKXvWYunrcmxFT068+QPOT2aVHlKXIlwuMZZJ
	ca2g+pREcIRFo8B2TCz3ud8Up6nXtO3qVvEh7Qwhk+95iDvUPE/4LWljgUYh/jHsgtuU8UC25l9Tg
	GF4hzckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH0y-000000024MS-43jg;
	Mon, 26 Oct 2026 09:29:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH0x-000000024L5-0Bzq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:29:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso8660395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006949; x=1793611749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=YM6g+05q+NsLWXTtrPFUdYZNxYEnf3K/t6zfW8RXzjL3BchLsR7gwq03V6fgi3DFc+
         SjHVeaG4nXfQdgztGgM3MaX9eVOBzEqEi05ftHdHwxnPQCaGxgUln4Vk7RpPegJZQDjO
         bp8ztU8Gu/h/s8MYpeU29CqN+cpfT7r8k50KyU5C97fEVrRO1C5eJTnCfMRCzS7XiUHe
         zhv+/E2mge5/q5qvoMqd3RvhWF/5aofu5rwUbM1DuCKcJcDWSr62NoIyptJFdQC10yXV
         1swkkeXcDkOcCwIFx6d8k0/g8tj5/T92uG7d8pVoWqdrgbxF0B99tA1nn2IhCglpqtjh
         111g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006949; x=1793611749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=hsLXi4eiE61rt1ziHYLizp8lee8oVkBDNPPLbmE+UWzBjLsi4J1TiHKUsyJ/jlpN3G
         rMod5NhdTWu54rvkT44c+5zgNw8HLLMfFTECgGih7d0T0KP0TSSg3PVCvUAMxE4DAV2/
         CAWWIrvt8tMC8Ckz1Vmg3jYhRaeofBIjbZLMbVFYJkB1rZSiqvHW79YCPbV1fSbC2CHS
         K/RiIFvQDftjkzF2CpAtm+qwe5JR3bWyK9naQ0lMzLEcBXzWzLR2aCo9YJE24x4SMYan
         sAboEqphaZdXUyasC0hvAHUdgmIwkk5NToNDrrNwZDOyUIAFWYuDIw5nWRYaw87prpK7
         8VIw==
X-Forwarded-Encrypted: i=1; AKwUvBwBF7yXw8e8+4kO9JZsQlQ+jE73LyrVrMimQDpZpFIqbrTWzYSQVh0deCtJ9eN3YWZINX65LONgwSblINbyO74f@lists.infradead.org
X-Gm-Message-State: AFq9FYIsaVa4cYTxmV+7JQOIlTXeTCa3oKtvE/vCcAWvuhzGHdxs4s42
	IkFb/WXkShTkbZUa7LDp3fD2NZ8A44RNnYntv0B9/XSAjntGaln9KSHH
X-Gm-Gg: AYBFou1ChILe3q8TK3Nq6DqQYglqiVKBmbpEnTp6zKQvP6U1UtaoNfr0tvXPA1S4NaI
	bjgMzNuaamSyvRr+jpd2UE00kC2t9gA8Tp2xUEpBxQZqa5DKheUGqLKUhY5Z+oNjZ/JBKwb/pIZ
	vmI4xDmLOTBFjwoSSn9xmEA+0/JLLuaKhj2VsRLdk/hKvh+e8xsnywygTdRPXiEpHpwnnsdJKkX
	XZtw6XbZXKTtgqu9aVs+IV+znVARXvnamV80YpyrtLQIDYIx2q80TL1pp0Ziqu/DMekYubouXBo
	U4m4aBbto4ewjYD8yY3Umcungo20vDBWHdvjI1c/hquTLpVYmPlDpgEwA3l+8AmhmHuwpDOZ8B7
	Zxqic304rbC7prDTzoc83pFpE4kbTYmY/3Q2f9wmchFUC8GsSzQ2jCrbW5XU20cuDKw2Qw4OO6a
	tXfKvlixVsNB4NAZDaS1XHyFG5ZkbIbGS5MTPmuihBS9AZEbMp1HKxD1sVLwJM+yDN/PBsY7QtU
	3ub+9Fae4ibdDK1+chZScMdFJQbU4aVbMlgLMz9XiNzmfLGZCPMzpOFDhL6CF2iOKDBWz2txqvr
	U6QLsbYiMyDNdJa6UXwNypENIhCi2Ti34rxeR1hG2InBkQTbzPSbFLF2+xg4WXSrfi0M7E6Sl14
	=
X-Received: by 2002:a05:600c:a04:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a7555d89c5mr4396695e9.12.1793006948732;
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm187356525e9.11.2026.10.26.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix PCIe PHY init
Date: Mon, 26 Oct 2026 10:28:58 +0100
Message-ID: <20261026092858.10591-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022911_100819_6540E174 
X-CRM114-Status: GOOD (  10.60  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

The PCIe PHY times out during initialization on the DART-MX8M Mini
with the Sonata carrier, preventing PCIe device enumeration.

Add fsl,clkreq-unsupported to configure the PHY for operation without
CLKREQ# support. This makes the PHY driver clear AUX_EN_OVERRIDE,
allowing PHY initialization to complete.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..ccc81e5b3d36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -267,6 +267,7 @@ &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
 	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
 	clocks = <&pcie0_refclk>;
 	status = "okay";
 };
-- 
2.47.3


