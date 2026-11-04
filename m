Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD09606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LkUbNhei;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JQHpOO+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DSZ44hi4g8RqJf7UpQMpYycq6ry0bT+HI5JoHAW8nqo=; b=LkUbNhei+Ck+XD
	RG41CEz2Vo4CWlzerPWHT53H9A763o8rfbVxfq45QiI4xntOu6JW/c1Ues/78X3Y9kvi4C5/AFnFW
	grqUY87H9Jidjw+bUxRZrmIQ1+f4blpExVqFrlQjxKBgR/A7E5EYpdeDlzLUIRz2z50OYiGtnLlfk
	FSB4Hj2W+s3H91th5P+FNl14SjuTbwP1sZw4Mc2MbS5Ae/zkuxpiF86B065Q9WULxk9QqH9I7ZcwH
	tvlvCYKo7k/PTEpd4+wtVIUZivDZsMYq37/9v8u5WYeqKeoN0LtpkwlGsr6dfB9ZAX9urMxMDngxo
	Xw5klomvIew5pPHrrXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaLK-00000005MQg-2czJ;
	Wed, 04 Nov 2026 12:43:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaLG-00000005MPR-42zI;
	Wed, 04 Nov 2026 12:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DSZ44hi4g8RqJf7UpQMpYycq6ry0bT+HI5JoHAW8nqo=; b=JQHpOO+mmu/C3OWcDgsMN7CW9a
	qFPWadM6RubfaSMPpyZB8qMxkT2kHHDSrYfvmI9y+lEO9Ip1pcqW7WdmNLh7dWFMUB6aQHf+SVHMf
	8wwU4hpQ3vldAvFrN87IGp7n8oYZ3X4p1fgqGpMKseIy5HlNySMXf5/DH4HmEgZXjbvqa9e56fAgZ
	S58Dujagf6ZIoEZLG/27WYfusdYLxLeV18uBxGTlVP4mLuoOKBw0qfULzD9zCqkCeEC/VnXh15lQ7
	6F92X6tVCZk6Xk70J1BjW5SedXkmMSKUD/CTXoOTGccfolnw1rgJITXl2w+I2l+E5PnabmpPWm3Rg
	eB4Twoyw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Cole Munz <Munzzyy1@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Alexey Charkov <alchark@flipper.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3576: add cache hierarchy information to CPU nodes
Date: Wed,  4 Nov 2026 13:43:38 +0100
Message-ID: <179379621576.656939.2433506598756603100.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
References: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_044351_066016_08A60577 
X-CRM114-Status: GOOD (  10.72  )
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


On Tue, 28 Jul 2026 17:46:14 +0000, Cole Munz wrote:
> The RK3576 CPU nodes carry no cache properties, so cache_setup_of_node()
> fails with -ENOENT on the first CPU. That error propagates out of
> cache_shared_cpu_map_setup(), which discards the topology arm64 had
> already derived from CLIDR, and the boot log gets
> 
>   cacheinfo: Unable to detect cache hierarchy for CPU 0
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3576: add cache hierarchy information to CPU nodes
      commit: 87fe687cc35a91d2798494791d40be4e00f119fa

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

