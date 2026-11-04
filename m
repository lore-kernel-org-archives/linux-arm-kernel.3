Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12B606D83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ssnfLdMm;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=GdlkD5rC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uJilNf/DuzscctLyLUnhtlaW8CcMOEh7Gq1rB8BFr8U=; b=ssnfLdMmYxDOsm
	31ZE7tFzHiwZ8o2IZE3lmM/e49jjyRb21iXeMlVy92HKHrJ7nRDGWK9I/8rb7/M6ARjREbfjTCWu1
	hse7n1AIqgx9+cBTplY+H2UATtRJ7aHzJF6aSPk11ITSb+xjaqU7EjZzhlqNVyRpvMOcVMnENbX1Q
	/01Xe6wPFNd1+B6DhNN4Rhv1ZDSn3KWKqhCf25gzYI6ncA7qXMhNNHexMHOyLRNkGHgpZ9CKvvrGV
	m+TWbi4i3xcGxh9IZ+jCPv/7wQ/SosyIuzq7OV6ug8eG+dMgNvqK8r4379DtYCSVtubGI+V+KV7MT
	3c0r6xPzyZ6vlF8gjddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOadc-00000005QYQ-2qTp;
	Wed, 04 Nov 2026 13:02:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOada-00000005QXZ-1pfP;
	Wed, 04 Nov 2026 13:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uJilNf/DuzscctLyLUnhtlaW8CcMOEh7Gq1rB8BFr8U=; b=GdlkD5rChX2w1X58aPkGyzqN0K
	I7MJdxIq98amV+fOJctpJiKV3jDJyDTqhzGdnvgDVHhjKho++BKpOlKsnEOg7SWcAEo5oYtk/NC9w
	ZcU94sJNGEHKJ2MzbpqiofpHczDZGyPF0MJqMM5RD6omxSSYAIjDL4EMHrL6ELyv7CcYR/AmjYn1e
	7Er8449rKWS0JTbPpwokEbUNWP5dEJFv0ybGutfXyhttNA2dYqLqQT2Gp1+E77BjSTK5A9iB1JjrW
	VGJAYESp+6dDN47W+6VwLj8pqE66GV3E24BSausAz/yknM19NtEwBUZ6BH64vPgmMgPaJBS4moRAU
	lD3qk8bw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Vicharak Axon Lite board
Date: Wed,  4 Nov 2026 14:02:39 +0100
Message-ID: <179379735607.665309.15426546617217855160.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730134815.434654-1-hrushirajg23@gmail.com>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_050246_479299_BDA23891 
X-CRM114-Status: GOOD (  11.10  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 30 Jul 2026 19:18:13 +0530, Hrushiraj Gandhi wrote:
> Add initial support for the Vicharak Axon Lite, an RK3576-based
> single-board computer.
> 
> Patch 1 documents the "vicharak,axon-lite" compatible string in the
> Rockchip arm bindings.
> 
> Patch 2 adds the board devicetree, enabling the RK806 PMIC with
> CPU-big, CPU-little, GPU, NPU and logic regulators, Mali GPU, Gigabit
> Ethernet (RTL8211F), eMMC, microSD, UFS storage, PCIe0 and PCIe1,
> HYM8563 RTC, GPIO LEDs, and UART0 serial console.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
      commit: a9dfb4613bd2c44250d57bec8fc72a08f71d1d6a
[2/2] arm64: dts: rockchip: Add Vicharak Axon Lite board
      commit: 80e2828a00ba4f472289a699727abfd72a31de34

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

