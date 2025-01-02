Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07841E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIyYY0XK8X4RY7jfK1r1XszV7ED+QH8G9tLlmp8c7ws=; b=MU00GocEa3GlO1WgNtQFjkh2bl
	Sl60CRVfgnleJFwOgO1aHsKatySu1kh1pAajrMOkUVaG9mrH86VSZthXJSEgLdDSKwm1srV3lCDBC
	UZFxnZx2z5969DNrkyhVFRgfSI3kZ5zlIEciziTfXQoruCPWyRS0Zr8QuOrVyRe0k1x1QeZR2eZ0H
	Lo2IJrDUgDbJpIewKKPIAgxLZT3YNpCR26Xt3V/RamY8VEDx5pc8t0z2H3DvkkXiahProsQXrlUZM
	asYP9hHDlFDzeL2IirEUAL5dC2NF7P4RYr0WavIaRNDyLxfmlFz+QX4pn/B0+l86OLDTo5/wKmMGo
	L3zZ4ydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPPU-0000000B2Zg-1qlk;
	Thu, 02 Jan 2025 17:55:04 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPOG-0000000B2Fb-3Cib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:53:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=QIyYY0XK8X4RY7jfK1r1XszV7ED+QH8G9tLlmp8c7ws=;
	b=QZ4yzxNU5Ljte+k4V+6PqQhqe9gjQqNffdQj+vxPekK2PIZERjd6A7dqFNGGdR3//p24psXJKY1FVjhq2ZkVyFkWZySawa7I/UJ4kgCrWDIJQFlbaZcGJV8DEQxnrxvexEyC1CHmPWeay+5Oisc1fBMpVOeLSh2P56zLlVvKf/I=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 18:53:37 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: 
Date: Thu,  2 Jan 2025 17:49:58 +0000
Message-Id: <20250102175006.3675-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_095349_100338_B0552CA0 
X-CRM114-Status: UNSURE (   4.95  )
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

Changes in v2:
  Fix the devicetrees according to the dt-schema




