Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F71AC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNEHmgqHQ9VME0ghPEaUzTmerTfpbnS94UfYPgQYDfI=; b=4f+Z6oraGid7IeExC1xT65WX6L
	F3YITETPqdF3oPudiA2WNAxwxjAd55fswStWOImVPNwddPOn8ApfeJt6OElkaD2iQgmSHbLxuJWZq
	P+A8hRr8d1IbXB16s0hAs6Vy9QApIoUMRPzy/f7c3jXgTp9qNaet/Dz6qb0vNAffU+lw8PLODGey9
	JcWT5DREYlv9vAF4kAjArF+s3/VmxRHsto+MNYTyJN3KIN+qe10XWuOmmwlrG63BphVw4zzwX9AGc
	nAXXerTI4iyRtzErrUEpj09wOLgri3amVvECKUzAsSAO9ir/sLN1rnl82KS/C9dr/LhWJSQSB0o+i
	kXiyJQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEtY-0000000Fjoj-34dH;
	Wed, 14 May 2025 16:23:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEPz-0000000FeQo-1zhZ;
	Wed, 14 May 2025 15:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=JNEHmgqHQ9VME0ghPEaUzTmerTfpbnS94UfYPgQYDfI=; b=XpT5xwEagfHB92DyI0OSxIoQpQ
	k+o2W9CNcZnt52RuoNRDWLwn+nvK4IaAE0uU5IITergzt9ciNojrMjyiPZy8grh/IRL1SK1xJMxZO
	+wUB/maNEQqCejepZyVdSRPINv42K5Fdo7g2BEqusEkYQ4rFKOg7oM1wTpslH5+N8P9AY6i/nclGm
	UNIAyX5os6ZXNZlZ0dvXSTGoWTDhEvGOVC17q8rFwYkoHC6q6Q7YkyDxm23X9IQGKekXtIBEZe3zD
	5/DB0fc89k7AFqUlMgjV+GbFdE8ExfQntB9Hjal4ivV3q0gXtytNtIAi40XM93thBJHYbGrxlzxDK
	C54uUFxA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFEPs-0000000HF3K-1PgG;
	Wed, 14 May 2025 15:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D72B1A4DEDC;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F4A1C19421;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237983;
	bh=mMVNXp+mq/+JBFSLAWEcPv/J6p5kURcJD8P/BmJmQE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eTJQCjc68ym//B26JtBuuBxHt+aBN4bFmjfHNVRKFdm3kNOsxCRqFEsndRr3j/QGN
	 H9lHYorpb5dyhC4cKNQhFiXQU1KYO7IJI3XAhpLVQDXH+309IT0sgzj+OZ3WJjHAnu
	 l62sDCZAHXspoDPtwGhaBAnAA+lscNAf0v28SdIcLgS7wd3TDTxLDC6Fz0GgQoORSS
	 oLuqOevrINg5bRVdEriGtYckf5x/9S7I4p8syZP+CCU42CsZO2HP2Q+sHz7eKRbtCc
	 ttTpY42AMhXQ7Y6rKdW6R1YjUn5iqsGKAGC3wZvkhL5lDSng69/r46RCPOOT+STTyp
	 sRtDU8fds8vlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446AEC3DA4A;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:10 +0200
Subject: [PATCH v7 09/14] arm64: defconfig: enable rockchip camera
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-9-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=824;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=n3CId8qA1gc+LyCUe4pJdG8S1W2SAM8vXhX4LLRdgiM=;
 b=PNc012cCEuBkBIV9CArGWSyzpOjtM28dbeTF3MQocvKy0QMubUO8YtYquY6CVUuKFhK8eP8dW
 uDT8YuoLajcDP/tDU0JHtwIPfojmU5PL5KNmDgUEWLz+IDwhm0nhqhS
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_165308_597384_C4176F73 
X-CRM114-Status: UNSURE (   9.36  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
in different variations. Enable the driver for it in the default
configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..110ff52195a6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -858,6 +858,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

-- 
2.39.5



