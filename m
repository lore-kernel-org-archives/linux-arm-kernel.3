Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B977AE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Jd+taegJr0DmZFvhQfYN7GrLIQ8J5C8MEHt5zy2j7g=; b=N/cJTxF/MXI2HqOshFaoyg7sU7
	iX++QGwugmxohVty3J/olkz4phxemcSt2W/Afa39o7zZt3IBRqx72kx0/cykV9oEog95N1+bYCNpE
	WSLJaRrYCuONWrTxi4ZqSShZ8Ki8TTWnwkMSYZLf6HZpDY0mjRCFqBuppS5FZpPYeMah5Jcm++Nl4
	HPmVHZ8iWeXjTGPhlgJMpG8FGOMM25hzZyOl/2dXBMvgOYK/ptCBy9BiVl+wCM4VGlSrLwfxcuW9C
	Z69BWYF3VVve9q9pBECcnwg0zgnSQY15rNjRLjgpFoRx9OF0uZ2+yytlsBT8BrLQYFDGlHBi1XZBS
	ufD9uKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHgh-0000000HE5y-2DXU;
	Thu, 05 Dec 2024 19:38:59 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHdt-0000000HDSK-3Yrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:36:10 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44PW2Zp9z4w84;
	Thu, 05 Dec 2024 19:35:59 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44PM1J9Rz6tkK;
	Thu,  5 Dec 2024 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427354;
	bh=Wcwqyb0t9X8Dian9aqmXA7QSUUAXJ9EdO7wmHSMUfAM=;
	h=From:To:Cc:Subject:Date:From;
	b=R+knRNXpFoK5kazo6L7cMtbEIAPAE1APKmdGwMnFEDtCYulqxwUZ7y5eN74BZJrCr
	 K/9sUJgqCXgqu7JdijDEQQmp+u3quu4PHEAif2YTZ7vm/y2coNrBv/dM0tNdIWB2cy
	 ieSDzsy6Ta3zhv9JCYnlmzYte/DzKqWUwoRwBo8XOTENq2oOihXAPLB7aVoxlgSjMw
	 ihe4KZN1VOhDjcVvf7LqpiQgxf/gKWJ12xekbyhat5CBTF/WQreaZk/cnP3CzBOS1W
	 U2jAivb9UmyL4B56xrr9n0Et0vzaq0PkAwZBUSMIcT9mbMujLVimxW5pi8xs6YRMPr
	 9BhizRLS37mNw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: v1-0000-cover-letter.patchFrom 10d9a244391bcf592fd3e5fd902bae7f01cb4d4b Mon
Date: Thu,  5 Dec 2024 20:34:20 +0100
Message-ID: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_113605_967542_A514EB8A 
X-CRM114-Status: GOOD (  11.20  )
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

This patchset adds support for the Clock Management Unit found in the
Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
MCT, et cetera.

Currently there are two blocks implemented, CMU_TOP which
generates clocks for other blocks, and CMU_HSI0, which generates clocks
for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.

Best regards

Igor

Igor Belwon (3):
  dt-bindings: clock: Add Exynos990 SoC CMU bindings
  clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
  clk: samsung: Introduce Exynos990 clock controller driver

 .../clock/samsung,exynos990-clock.yaml        |  120 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos990.c           | 1343 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   14 +-
 drivers/clk/samsung/clk-pll.h                 |    3 +
 include/dt-bindings/clock/exynos990.h         |  236 +++
 6 files changed, 1715 insertions(+), 2 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos990.c
 create mode 100644 include/dt-bindings/clock/exynos990.h

--
2.45.2

