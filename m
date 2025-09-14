Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C93CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlOCRdQpg4y/WfDOvcboU58+3w8eZWJ1gkNu4mFoDA4=; b=pLXWDExqqq8C5TKUQd9zCLfwFa
	tmVYFH+jx7GGdbyrPBbrH4izmxxrArHvR0QwWgLGLYijYhCbYnWVs/0rJandKnrVY5jZYlAkw3kpy
	gshmE0n4PwmoivVcinO9AVux2fnpDRTX0Tz230xNfB6Fv2n4lQ66c6Z0DlDx9QgB7RmnHgXw+MY98
	C6u000r8d5/KeHQHxn2+7PJyQiBiGKuRzfaKP98WNwq2+scKE+gjvZJdXp/zau9pVHAnRgP8851yw
	bHqrzkOtb8W9ZkDGWYo71fdx3ph3TpsxcsBZdfWlwGjJg0xzyjQaXMKD2nLDIab34lgiuHJPKo15g
	wmxIVNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxskJ-000000025zs-1PGT;
	Sun, 14 Sep 2025 19:50:47 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxskH-000000025yW-1BgZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879442; x=1758138642;
	bh=XlOCRdQpg4y/WfDOvcboU58+3w8eZWJ1gkNu4mFoDA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K3wGXptBWtMzFp/UbUC16n1uVm1afU8VGDDs9saBSXUOU8T4L5Ixczr/8jLW2CWEZ
	 puzjxiww8Lr5EHULvC38QUZOERJ4DxPZlMwL/nMbaY/QYS/TWpRCMreDvl6FFF0iiw
	 3M3iqOXzmbWbfYTKm8b1gD5mwnpD6NBCuWo1wE6A/DC8JiJcaPPt14saxiWWw0SkmN
	 17i+f8KZwCsNV47yXulfQrUxoCpymBSZYfFgTC58zsX8qjLOrZUjrj0n/GdX4/x7EJ
	 Ny46TmlUL37WwUbEXBDAk30GoWTWG+xwadQ0Bzc00j0PyRz6P02Yd1MuwfoBbY27G0
	 YwcnjfDpp1ISw==
Date: Sun, 14 Sep 2025 19:50:38 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: Add exynos9610 SoC support
Message-ID: <20250914-exynos9610-chipid-v1-2-ade99e09a23c@chimac.ro>
In-Reply-To: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 4c5e4e61f8d64a8418c7619da4b6ed8a851907ad
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_125045_476891_0A3A7EA3 
X-CRM114-Status: UNSURE (   7.41  )
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

Exynos9610's product ID is "0xE9610000". Add this ID to the IDs
table along with the name of the SoC.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exyn=
os-chipid.c
index c86f1058ceed7c40f89cf65cb7027382cae38829..a5ed1c105b8f5d08c7ea71515e0=
778ea17bec75f 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -62,6 +62,7 @@ static const struct exynos_soc_id {
 =09{ "EXYNOS7885", 0xE7885000 },
 =09{ "EXYNOS850", 0xE3830000 },
 =09{ "EXYNOS8895", 0xE8895000 },
+=09{ "EXYNOS9610", 0xE9610000 },
 =09{ "EXYNOS9810", 0xE9810000 },
 =09{ "EXYNOS990", 0xE9830000 },
 =09{ "EXYNOSAUTOV9", 0xAAA80000 },

--=20
2.47.3



