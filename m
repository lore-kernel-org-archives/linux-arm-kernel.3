Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D89606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDVSmP1Z;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=gCZAKxfm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QH6jjxSQFlE/SRUSa0R2JTLIXImVKkLijmsa5G5HISU=; b=WDVSmP1ZI8dfEa
	1GUB1202HpC5R2MNgqbFyegGQkRBbPH5+45XcI8Wz0VSAyvDeq2eWjeA0DacjnV0uEwFxycg16gOl
	WbgPO/JljJq481p5rTOEaWMONm+jThSlZcs1vowxUFd5JVtSOoym+44Avi6+e5hcbrQZOShnpaEau
	mlMlhzdDgYmNxYEEHgazCTU3+QevR36uuG9dF2Jr9aF90JPyvmVNuYDLRC9Y8JwTYPO5mkyFBH+no
	rM1aI9rJrMxU9stgMjeh10XNNct2merb3FLr5VtLHA7s3Ys7dm07VMCkH87OG7fA2CJLQfIenVqfM
	BxZCgrK6k8oOFkICo5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5U9-00000007LPD-2F05;
	Wed, 28 Oct 2026 15:22:41 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5U1-00000007LBJ-20ow
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:22:37 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152231euoutp01f3d46a9ae34e8221c7a138646358d59d~iusO9yW-h0462404624euoutp013
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:22:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261028152231euoutp01f3d46a9ae34e8221c7a138646358d59d~iusO9yW-h0462404624euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200951;
	bh=QH6jjxSQFlE/SRUSa0R2JTLIXImVKkLijmsa5G5HISU=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=gCZAKxfm5FRNb3iMGpzVSs+9ZEf8KFC2gz5Af8FpuCfCBHRvgakS4SorFHzGOkksU
	 4KLHxgl5Ys32+af0A8S/iRyCB9VQi38Wcyw2XZNP7GusF9zYeW39ds+FCqkX/I9LeJ
	 vTokevr51K0ZWG7j5TjLLms9vZs/9pxTQcnxCvQM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0~iusOMQrXD1847618476eucas1p2F;
	Wed, 28 Oct 2026 15:22:30 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152229eusmtip1dab83fc87e0f4950dfc56f2d63f29ea2~iusNYwzjr2111121111eusmtip1k;
	Wed, 28 Oct 2026 15:22:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 28 Oct 2026 16:21:45 +0100
Subject: [PATCH v6 5/5] MAINTAINERS: Add StarFive JH7110 HDMI PHY entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-5-f3379684d97e@samsung.com>
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=GkUbaSZ7nQRw0MA7ruQjsKC0roRhT37Hf3V6QvV5qcY=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjbY+ujj78SDL06ZLZu9RnvL4/lRZy6fLtBYZjThr
	RbjVs5ZjztKWRjEOBhkxRRZzm6MNpL8x/C0/PjjXzBzWJlAhjBwcQrARJTnMfxP95XL6O5y/7vq
	JXPaSZH2CPa2y54/f8481BPanPX3q4YEwz9dB9aA/5M2tD5elyhWmGBTkPBNJHHPi80/vF3KqyZ
	/5GUHAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0
X-EPHeader: CA
X-CMS-RootMailID: 20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
	<CGME20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_082233_899907_5FB28D14 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an entry for the StarFive JH7110 HDMI PHY binding and driver, next
to the other JH7110 PHY drivers.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3d9e0117ebdfae707e1f61cb3e772..9e42d1705fcb3fa46325761a19c6b7244c18b7c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26106,6 +26106,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-tx.yaml
 F:	drivers/phy/starfive/phy-jh7110-dphy-tx.c
 
+STARFIVE JH7110 HDMI PHY DRIVER
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
+F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
+
 STARFIVE JH7110 MMC/SD/SDIO DRIVER
 M:	William Qiu <william.qiu@starfivetech.com>
 S:	Supported

-- 
2.34.1


