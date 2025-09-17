Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78777CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R+tORz4TWFeliOdAXcWYscXp0qG+3eZV0SJ/GOPdCuc=; b=BIKeKGRAm3AtbjJDO1AjKmpwJH
	uqJNPNkjkV25x2cAPPnTVnmN18Kq7jQsfxsSCamHvEMFhZUg9EsyKqwCeLFLONecKlLL41Yf6Gb/t
	I5N+97VlwXquAcac/84p1gwYtkxw+m1Q0tz5toehLa8WZNGxPZzyhWppma0ACACM8ObUWPjYlk2Du
	Dz+5UH+wMYy8DyK2iqZ87enYKCpS/FHMlGOwrNbPw4z19VSDqfA8nNrvi6gUNQSmELYKqGU2zlQ5Y
	UT4XnWebhMMznjytc8Ufs5C1Db8XOK9bCf7Q0R6hvGY8X9fiGBgMu1KGoaxabiwcjsF47zRmHWVPk
	7XfNfNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvjF-0000000DT2D-22GU;
	Wed, 17 Sep 2025 17:14:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvjC-0000000DT0T-31Wj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9AA403A0;
	Wed, 17 Sep 2025 17:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B164C4CEE7;
	Wed, 17 Sep 2025 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129236;
	bh=vCIzkqHkDllVbjHt4rbcYERc7E1yPCDUfmpZYv9Cang=;
	h=Date:From:To:Cc:Subject:From;
	b=OcDIvZVhmNFkg+cVtPPwIvxgK6MdyvzOQeE4loXQThuZZXkgaWapQ2mVcqqxHmoS8
	 dCW82TNgWPphvQqu1UcIRUlP/RzT7lzfEoAT6G7AtfjHTrMHc6CKkUIGG7fhfZmEjC
	 4S3PeW0qkfhzYpKvIfv9chhf0xPrV+MbRjllPO/oNVsaNsp5IDg2bq9ag2T1Agw99+
	 QAPXHCKUM6rFgVqVjm3drI78JkdahEG4U6NF4bjzNTm0L0mLe2uJBfqWRPZjFgrJQG
	 IgJqHVErB+Nk/0Z98Vc7uQnR5cS6kPdbqirgSgcJn0TQOtCnDpnWQ/2xv+F+P8NbkD
	 akXRTb+uZFehA==
Received: by wens.tw (Postfix, from userid 1000)
	id 606DA5F9F6; Thu, 18 Sep 2025 01:13:53 +0800 (CST)
Date: Thu, 18 Sep 2025 01:13:53 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes changes for 6.17
Message-ID: <aMrsUfkTWx8g3bJ7@wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_101358_776537_5F05F164 
X-CRM114-Status: UNSURE (   8.56  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.17

for you to fetch changes up to a5d7a8ab4b21747173a2f8f0ebf71d72692793c3:

  riscv: dts: allwinner: rename devterm i2c-gpio node to comply with binding (2025-09-10 20:56:43 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.17

Two device tree style cleanups from the device tree maintainers.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: allwinner: rename devterm i2c-gpio node to comply with binding

Krzysztof Kozlowski (1):
      ARM: dts: allwinner: Minor whitespace cleanup

 arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts  | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi          | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi                | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

