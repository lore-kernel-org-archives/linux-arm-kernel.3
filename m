Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96674C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Is5HgQU2Ib+t6EwoFPSXUVVOefeQn+RYMmlnTTObgoc=; b=ZnaY2mIlm+xL8vifwhwomTi/yo
	Gc7YdYxSTU4NLeVbwLJSNuNcuol41rcfOXuHbJKJoSBbHhY++Esdz7hzzdPdOUGzQAhSD2imQp2xR
	A2Tdq3fiw3ZptuE6qP0eeCq3C1d7E6DuGLys8NeRcFnq6xniLxE0Q7056e572mASU5xDjV+YI20v0
	1SUUJ0OY1G5mUsv2ufD6jBiDzHyxQl+ErabhpdTaqDtk7YW/D4gzSF25Cpoq5MZhtsPUu+AHjVSzb
	FqF9gzUgIB65lrI6cBi+jCbea4k8PoQf4l1BnZ+Oz7h90ZrK/bJLh7jdq3fSm8J5a+0BiZa8J+Gvx
	gvotJpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbmw-0000000Fr0A-2XKd;
	Sat, 26 Sep 2026 23:26:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbmt-0000000FqzW-2IhW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 23:26:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840901570;
	Sat, 26 Sep 2026 16:26:30 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A3CF3F85F;
	Sat, 26 Sep 2026 16:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790465194; bh=qXRsgdtUI3eUMBcjIZ2U+x5n6IUT1Yp1xou5hmMNBic=;
	h=From:To:Cc:Subject:Date:From;
	b=EcxKL4PB0mFo7ASPx0Rk/bvEgjgi5o200btsxKGxohYL7po0vh3GM0VEg2dODk6jZ
	 jD065/D5J6X8FCGjJE/9Ljma/fbBaGpFLaVi7RbFbzJBeR4geYDtprEEaCWWBb+t78
	 YJXy/kNfvcwcGXrXh3aJYAFC98p+O26JE5IuVVNI=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Per Larsson <per@palvencia.se>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: x96qpro+: enable Ethernet support
Date: Sun, 27 Sep 2026 01:21:40 +0200
Message-ID: <20260926232142.5244-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_162635_658098_47B4D083 
X-CRM114-Status: UNSURE (   9.98  )
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

This is an update of the X96QPro+ Ethernet series, but just the DT
patches:
The X96QPro+ TV box uses the second GMAC in the Allwinner H728 SoC, and
connects its RGMII pins to a Maxio MAE0621-Q2C Ethernet PHY. That PHY
is clocked not by a crystal oscillator, but by a clock fanout pin, so by
the SoC.

Patch 1 in this series adds the two 25MHz PHY clock fanout pins to the
pincontroller node in the SoC .dtsi file, which patch 2 uses to describe
the Ethernet setup on this device.

Functionality-wise this series depends on the MAXIO PHY driver series,
though only the DT binding patch from there is required to make a build
pass, so apart from that binding patch they can be merged independently.

Please have a look and test. Based on v7.3-rc1 and this patch:
https://lore.kernel.org/netdev/20260926225625.25969-2-andre.przywara@arm.com/T/#u

Cheers,
Andre

Changes in v2:
- split of from MAXIO PHY patches (they go to netdev separately)
- fix misspelt pin label

Andre Przywara (2):
  arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout pins
  arm64: dts: allwinner: a523: x96qpro+: enable Ethernet support

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 28 +++++++++++++++++++
 2 files changed, 42 insertions(+)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: ded31e4869f9628e1af7f9676c718a17cb4f7c88
-- 
2.46.4


