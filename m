Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEAB606D808
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m0Qv9qwk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hGdRVfQcdtQSbKgueRKAsfkTIP1tHUDFQLDjBcke0wA=; b=m0Qv9qwkETjwrB
	oMebIaWAzTwlz1MoJKz3OalVHtj8Tvy/Fi7Ws3dI1LB3LJuT43G1mPYIZBc6qwryxUCK06A1NI5Mq
	U3+m7v2ZD6U5ibp5pt0KvHocpveO1yQexDkZ8CwoIwvPijRI2pDX0+46srLO+EFVxQ0fGEByKeQhq
	65atMLwPl7LnR+Nq8/IGZgOyRZTxM6JQ+UhJbplB9EOkXsxC96fpvpzIPqH4mWa9q+lw+btis0U32
	4c7xhIoeuKQcnC/fjpw+9+FMfLyrH6fDbtpsUuTbQk+MYu9Qm8R2ZPIbF+2+GlJZjE/JOSa8xE+HS
	e1rQismwL6aFOUwMeThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaIC-00000005Lxi-13hg;
	Wed, 04 Nov 2026 12:40:40 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaI8-00000005LwO-0ta3;
	Wed, 04 Nov 2026 12:40:39 +0000
Received: from Vostro-3710.. (unknown [14.220.232.26])
	by smtp.qiye.163.com (Hmail) with ESMTP id 537c3cf4f;
	Wed, 4 Nov 2026 20:40:24 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Wed,  4 Nov 2026 20:40:20 +0800
Message-Id: <20261104124020.3546166-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102174450.3000397-6-coiaprant@gmail.com>
References: <20261102174450.3000397-6-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a693295003a2kunm0429b5521628f4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR1PVkhITEtIShlOHRlPS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUlNWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	xJVUpLS1VKQktLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_044036_439969_5B9159C9 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> regulator_5v_boost: regulator-5v-boost {

I prefer to use vcc as a prefix for consistency.

> +	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
> +	 * and VCCIN_5V (via D16).
> +	 * It has no enable pin of its own.
> +	 * Model it as a fixed regulator depending on the boost converter,
> +	 * so that VBAT is boosted when running on battery.

What are the benefits of doing this? This is not a real regulator.
It is the same path as 5V_BOOST. D16 controls which channel the VIN
of VCC5V0_USB30_OTG0 comes from. 

