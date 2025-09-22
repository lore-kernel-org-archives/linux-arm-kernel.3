Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D2DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lNykhdeInP/eiLs+GjvBwqv+VVWLwIMm2T2NAbP4BQ=; b=qMp22U9m5kM6xQ9L2CTj0KHmGx
	FrMjY9ZjkZ56uYJH3QrSLmis3tNo7ptka5UVe+qPNH7eaCtPC9piX8KLxqdS8s5X/p4cg9p2aNYcJ
	vSkfawEUiuetWOc1jk7upNdB4ds3+xnJsVls1oeiYpG94nrNFHeOXaBE1c4dochftFc2bdjCfLRo1
	CzWc9XbjNIlIT52qIMSP6R3M7MpJykdO4gTbk0OfXA2B2gV8cN/SK2Ty7/JmST0DlxCHcKBWj8W8+
	bm7AQ3jqpa/fZ1oFmzQiyqQmVhwi3EdnhUv+mxf8KfHrb1Do+Rwwb8FQdbxPkOitfKETVewsAqJTk
	DwcJw3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j3I-0000000AvmG-17a2;
	Mon, 22 Sep 2025 16:06:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j3F-0000000Avld-1bgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C685243C78;
	Mon, 22 Sep 2025 16:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFB6C4CEF0;
	Mon, 22 Sep 2025 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557164;
	bh=xd23r+XPRKUhoqOC2QyRgh7gsLc1kz5qKFbjLd0vuXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Klnq5wyTEEwwZuDvCzAf9eNVUqEgkN0oiCi0L6KCrjyu+eagc7jGEjFHxQUOKoqbR
	 yVPgBcFpkiyG2hg4q5n6fAqHI5gz03I6zn8VXN37x+T5NNBSe8avgp9/RpxhedGeDn
	 PJCcTO3VrkttXJgjT6jAkD5tsEIfK+B/H6kvXvfadHrPL4ym9g+pFxyrBf4BO9NLzF
	 fzAW4zBx5WGS1Zci0v7TiIyn9XPULs5haMR46zC2eZB7qgcXsjt9BVhEKItViEDYfS
	 e9kq06WtiPOLxpRY/+wmQy+STTI1dYYtnKyvFU+xRI93Diulvs3HH153OLhpkfEukV
	 2STz2eKHnod9A==
Date: Mon, 22 Sep 2025 11:06:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: conor+dt@kernel.org, karthik.sun@samsung.com, cw00.choi@samsung.com,
	krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
	mturquette@baylibre.com, linux-clk@vger.kernel.org,
	shin.son@samsung.com, linux-arm-kernel@lists.infradead.org,
	chandan.vn@samsung.com, dev.tailor@samsung.com,
	sunyeal.hong@samsung.com, linux-kernel@vger.kernel.org,
	s.nawrocki@samsung.com, devicetree@vger.kernel.org,
	alim.akhtar@samsung.com, sboyd@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add m2m clock
 definitions
Message-ID: <175855716306.141333.16307821570342985917.robh@kernel.org>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094512epcas5p223e2eb264967508527f478eb2200be83@epcas5p2.samsung.com>
 <20250915095401.3699849-2-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915095401.3699849-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_090605_438890_109EE387 
X-CRM114-Status: UNSURE (   8.24  )
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


On Mon, 15 Sep 2025 15:23:59 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_M2M
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
>  .../clock/samsung,exynosautov920.h            |  5 +++++
>  2 files changed, 26 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


