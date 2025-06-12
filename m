Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCC9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DipjT1nC2l6n6odMhid63zieO8e4FFOCMh5Ii0hAN94=; b=rd0m7ToXPvo5kQfE8EUiuUxMkJ
	R73SGgr8Bsf8mryfhzzGYnAfHsMXBuU1J7zenXqGrbi1rnBlbFq30Q/wu/iWco4CvszNAq5BZRiIR
	/l0sS1mCFS6ke+IXwfGAQ5fn+5yZ6vuHcgsg6TkTOVyCOdi781XSKhuafFldev8H8eH0t+zgdokMY
	ZoaybC5fZFOBEM6i4VzRblBCUUe6DljvSAmJJlcxMn2w+amtWeEge9eSDDM9X/3K8/ZD3z21tj1MT
	SuFD4VnmTnPCAOSwzSGp7VQuCQAcXhha9HU2rN23TfNk9HIpXxXSl65ZnaFqA4KPZb6euWxdEomSM
	p1vRLC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphV-0000000EfU6-0jqj;
	Thu, 12 Jun 2025 21:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDd-0000000Ed86-38Zq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DipjT1nC2l6n6odMhid63zieO8e4FFOCMh5Ii0hAN94=; b=F7QbJ8mq9RucVJKdH2Dt4Cu63Z
	sfegYjDzcPXvg364OtCOCRnJKErqjJVwUrXTgkkhivOR9+6ZNtUP+B4KuMNZ9rmErecs5J2NNcBJH
	gnplSFOKJ9Ji2irCBmAlxjG9KDiIe3wf4VK5JKAyvQIHwUuHYnBjujD/l7bEEzXT5rkxW0/ycxRoV
	Sp0k2VpalS/M2FDVQEIRGcyaz7wEC/jy3BMkTqE7LXC3szIDyYfaYlDHVNzjur6wgz8PLr7aq8Vva
	Wv6ojyqNTiHy7uQ5s3gTWMPDLJFfdetVvYOWLmo6/Bk/LbqYwDzKpDK2YDG+em7wf9pep4kGSsG7G
	FJHereIg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDS-00000002hzL-2Qk0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8A825C68E3;
	Thu, 12 Jun 2025 21:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEBE0C4CEF3;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=tyfoi6A3/hWKyBxg+7dQ9gWUnySxJ6hV0JWYh2NA5SY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lqm1mW9zhoSi87OuQ3NBNdrXrH2pndZjeBBcCC06n+rE36Thzj+tq3eUHZhGrwHeg
	 9anWYUzgBu6dtA8ELYzcOqIWBmD9WbnChKpdjLUNhEumJLg0Y6s0J836c04w8pipwu
	 m8Qjj5ZkYGetH36ACw95NMXHAQCVBCan+lYBWCd8RaCx/VvalaU6gHTqcDbkSU0dQj
	 tLoKTRKi6GbZR/keJ/5TAeKLKT7qCE4d2V+iGVQDp4XKtakuMX10tLuORKgjVcVZ9G
	 NXI1UUPalEvI4PwUjBjmHbYlV90VnPTyaU/e6cD2eJTYUaJsql8fm76MXgdggcREWS
	 741feaYc18BLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A55C71148;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:31 +0000
Subject: [PATCH 07/11] iommu/apple-dart: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=tyfoi6A3/hWKyBxg+7dQ9gWUnySxJ6hV0JWYh2NA5SY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a304y5gocs3585cclobV4/76v+mRxML5nmhvmtlPK9y
 lh36mtSRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiKzQZ/gpeKXvIFiTHKB+Z
 9mjDcaF373RfOzuHbYt+5bXy7cnroecYGRZMSZoflsp0q0rx7wvjO0/e/U4Xci+7H2h64e+TaTU
 peSwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_419631_B843F2CB 
X-CRM114-Status: GOOD (  10.73  )
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

When the first driver for Apple Silicon was upstreamed we accidentally
included `default ARCH_APPLE` in its Kconfig which then spread to almost
every subsequent driver. As soon as ARCH_APPLE is set to y this will
pull in many drivers as built-ins which is not what we want.
Thus, drop `default ARCH_APPLE` from Kconfig.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/iommu/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0a33d995d15dd759eb47705c00b411f1157b408a..91d0c871acc418ac5fede4f177ce3af97aef5560 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -305,7 +305,6 @@ config APPLE_DART
 	depends on !GENERIC_ATOMIC64	# for IOMMU_IO_PGTABLE_DART
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_DART
-	default ARCH_APPLE
 	help
 	  Support for Apple DART (Device Address Resolution Table) IOMMUs
 	  found in Apple ARM SoCs like the M1.

-- 
2.34.1



