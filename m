Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCE606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3yjLlwW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRg/U4sM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yToQM0paQR7zmvZ2SmvD3OBSFxK8Vhr65+b1WzhUJtw=; b=b3yjLlwWYsKfMt
	tEq4O//gX6CdN3COsIFzUo2Qsgf/IUT/XIGMkZ9gBCAgyiNRsUTrFtY+3hkSKGSsT1uCUiROq6AD/
	tPruku6oxjDkfx2u2TEWEqXVFEpxVRsfgP04KgpNJ7Ked9JagSdrazgiuzapXeEbulXJddJxLRNgM
	TY/j7xrD2pLGYsV6PtNW4CWNagd/X1LTA+O/Pi6DHINbLLAPKlgzzChZ+l6uuX8jLZxTarrmG6/2R
	oEpT4YKrACJ/O1790UnEBB+p+Nw6AyYSgSoEMndtFeDav28PQRnswwr4i7CEMeEXaNdJDc4vJantL
	T7f7Y6ec3pdZgiQ/gePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrFW-0000000GV6j-0YPR;
	Mon, 02 Nov 2026 12:34:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrFU-0000000GV64-3czL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:34:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F08542475;
	Mon,  2 Nov 2026 12:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEA51F00A1B;
	Mon,  2 Nov 2026 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622892;
	bh=yToQM0paQR7zmvZ2SmvD3OBSFxK8Vhr65+b1WzhUJtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SRg/U4sM6DHhpVNA26dkVLbZO/F+ksV8GzkceT7d65ygsIDmh2c1ZKpzKf3jTQSo4
	 INcd54EykhjhEg2GZtjXkwo/x32QX/p5QJ0WNd2vPbjZFu74xJJWaZaN+WdgKQ5pio
	 uxD/F15JS/dcqcldR0QlyBOwQA4F1FgUAPZ5/Km3dIYKZexvpd/+3HofXh9f3TOgAA
	 8FFt/kDVA7zWjIZslYgqiRWcqBtcbX91dtD87Xk/gdphjY91NeTsKMpiSpvPsvy6DE
	 ONo/HqKOUHQgCfOBoSB4iNKK6rw7FvqOnh7LwDuANSQRH1RTykhZkWOcbd/JScaXvN
	 wtS5gD/HigRKg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot node
Date: Mon,  2 Nov 2026 13:34:11 +0100
Message-ID: <179362278571.150793.14951710959877368862.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015040601.30049-1-semen.protsenko@linaro.org>
References: <20261015040601.30049-1-semen.protsenko@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=422; i=krzk@kernel.org; h=from:subject:message-id; bh=wM+eEA1rbKLNIo4wh2GGoOCxTleRi5qz+wg8J2hNRS4=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6IND0svnDInJLBouViSzAvaEWjmrP1qBCzfLZ hdYc6YxMRSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDQwAKCRDBN2bmhouD 1w0CD/4+lshG6uIfgawJKkPJYVKoML+zPhqIb9vVgt1G5XIfjBDvgaIOJLTtuDbkGIIAvcMv05o gj5Yd3NW43n+kID+7J3bq+JULQjYat9PBxfpW8O5nuvxzt0bM7eKOjGpktROQRZwbakMU9b6EIh 6EU0a5uD9E9IeYl6S/gjJkMrlWYWcS4eX3RjUcpqwLCAKzxb4nZnsDOmnpdHPvfP9r0GYaWPuN5 bM69JlQhpDbaocdZvCdjCK/KiYTaVleqmO3vynXBmvF5vAWE19RRoLowL2OHFa8ioOo9obf58Mr RDPMAa+mnPR2p7xWKEcDw4i5sSfwEXDZ39X9gsLkuB4MZlaZji2thvRUalmq4KZ6b6GLJfl3h5L SG45y5FnBjol6UO3ZzMWHTh7hcsNnk5DvyCe/1agdtMjCXVylBW62IoFczbKYDCkxySbhlPs8cz xi7muUZMFWLwefGqveYb1CzJJvo5e7bLyrkEEpL2wAt51sb4NgOjQZAUkfW4bwi9FQpjZ1yK00R ysVp4d4m6dp+8hTcARYfpu+bL3O2VQ0cuUrhZqDiOpTUvILUmkroaHaLNjZ9r6H8j8wjEGShCDI ZlOijncY6sKE+Ybx3ibrOfchNoQiqmcfYu5sE5dVtm9gY+JevX2qEbW4kYhJxyZc5Xc8FrElSiC iWwXvUqK90iWp3
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 14 Oct 2026 23:06:01 -0500, Sam Protsenko wrote:
> The 'regmap' property was deprecated in "syscon-reboot" compatible and
> not needed. Remove it to keep the device tree clean.

Applied, thanks!

[1/1] arm64: dts: exynos: Drop deprecated regmap from reboot node
      https://git.kernel.org/krzk/linux/c/e6893608cf46691588406c0538d6a0c6c84f15f4

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

