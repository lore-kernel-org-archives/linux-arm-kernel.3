Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C25E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D+A4mkQytJYStCuZP2b4P6Lx3vQY3oLfPuYbPDqoU3o=; b=4pOxPhkZm5Wo8/OrSjIbfqWFi2
	iB4C8tmdXLgxbYX/2HOlA5y46E/owCf05U9WUDcrKba0IRu6Per9DL6Wu/LGdCoAzCx40QRNUbxTs
	XrqHH/aJS/ieg6EemHrSeVPWvzdmKF1I1w2M9v0uMc5NSusrfreOMNiDp8RoJMMWVO3bkkmVIvUhq
	5YZzbyCP7eP1sVmKPOxKVk+XuSqWzOJGmU3rdgvAfRFfMTLo687S0MDHcjj8zUFZGkk3KMF+JfOiO
	zPi5pF+2Wgip1vczAYzSzozKR4a2XD9xyHURyR+BVwWNxEYnp7GrpyTJ50+XbnEl4R3EAkKarmby9
	ms9AX69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHld-0000000HEqE-46fm;
	Thu, 05 Dec 2024 19:44:05 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHjO-0000000HEPu-0oAy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:41:47 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44X54BMtzGp8c;
	Thu, 05 Dec 2024 19:41:41 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44Wy33YNz2x9D;
	Thu,  5 Dec 2024 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427696;
	bh=Q7xMfkFo7t/4uxU5Y5f24KfnUdQXtb6PJXk40TdRHGA=;
	h=From:To:Cc:Subject:Date:From;
	b=i9XRK5MzgXd9PEU3tX6DNn9anUgbBfWIic6dajU61zhk/WLteEv5cZLhMG1UJbWsw
	 GiADDYisAHgdZ8XCP7GeU31XoulauHQXOdkFyEOt46aa+1UhxpssUvV9ZkjZLNolMI
	 ySkhcCet/iAuFcTIOdR5qEZqIWzXEEymiS5w0+IhYBImsnQEC1jBnYdWg55DPflRau
	 h/gF4JqkSqB21fM6wV9fiya/pjvcxZMo6NhA51U7LxF/TDPUrJ7zCR2wYqx80NXgZ6
	 xRnmR+I7njDUADSSKNdnJ6KSQOGeXLjZcR302guX3/eWFus7qo8BjTVLo2RbW0avEH
	 si4Aa7cxKr8gg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] arm64: dts: exynos990: Add cmu nodes
Date: Thu,  5 Dec 2024 20:40:19 +0100
Message-ID: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_114146_248985_90689356 
X-CRM114-Status: UNSURE (   7.87  )
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

Hi all,

This patchset adds device tree nodes for Exynos990 CMUs (TOP and HSI0).

This patchset is compile-time and runtime dependent on [1], which adds
driver support for CMU.

[1] https://lore.kernel.org/linux-samsung-soc/20241205193423.783815-1-igor.
belwon@mentallysanemainliners.org/T/#t

Igor Belwon (1):
  arm64: dts: exynos990: Add clock management unit nodes

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.45.2


