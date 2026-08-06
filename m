Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA5DC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5P80yRKNrlYquBxRicfrAaD3b5AK0W4qjEeMTHYgOA=; b=Jps/7BAn6RTWLmkwNs/1z540Py
	6hWa2j+kFBSSgV+Eef4KC32HpCchNbcgUF8WTBPxOrNc9XjrFmxxuZUAQpyvAStQigZBBFHfBJJ4T
	EsUuluhu7Ba3QdDV5hhGlzcga83uhQt2Plyf47XZZbITeMuOVGsVSeYBiuBl6NqiLyJjfcUROC30O
	xjghRt4mH16A3keelmT+OMSK4ZEWEIrMXeFG3NJQMytuRtl+SckRtdVlxXmoE4ZAztZs/uCS/XB7Y
	6jgLfyE5tTXW99g06K2lyO0bOvUXrVXr5ElJEuO5Ip92PaBJLUdAPVe3WR82+o6K3c6lrY8KT2vYz
	LTe7K9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtJw-00000005Cr3-04uT;
	Thu, 06 Aug 2026 08:19:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtJv-00000005CqP-033e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A3EE60A64;
	Thu,  6 Aug 2026 08:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0841F00A3A;
	Thu,  6 Aug 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004358;
	bh=z5P80yRKNrlYquBxRicfrAaD3b5AK0W4qjEeMTHYgOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WbpAugg8S00Qpei6gXsuzpNSTVMpNIJrK0CPO1RIqMyUkIC6p7Qpl1k5uF6w+XuGH
	 StaUR/WgpSVVH5TVEzmnnDbszk5F0EVxo32uxTUNB9/viuLY7mea8J40pweCXETTcW
	 o9OHmxCWdFUN4IcLDaqyQO9UxRV7ha7xJxm1teFOyJ3MmiLNvKhbWhvisunzA84n8+
	 PXLK8oh5dmfgbAQIi+T4zOaN/5HQu4fWvrQn3bx3J+0RL7SkKoHLGv5M31IrVzyHAF
	 +Q8WoFVXuumQhU7CmCY602vSb98/grH1m0V+vwO/Jdscji71l36NJunFA3BL50CZHU
	 V2mMcMGHzLWjQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v7.3
Date: Thu,  6 Aug 2026 10:19:02 +0200
Message-ID: <20260806081903.165005-5-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806081903.165005-4-krzk@kernel.org>
References: <20260806081903.165005-4-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=krzk@kernel.org; h=from:subject; bh=ltZzOOnh/qfs9F1SKre0GKeQ59g2TlOHTQyPYAcP8xI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEN4pHKKZGPshaCMz/8QNwR3DTlgJ9J8b2Hbg 5t/Al8p/oCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRDeAAKCRDBN2bmhouD 138oD/kBGvzT6G3+YD/2TIbaeYugcPufbrKz0aFWysCX5jAGUnbsR4xvqIW8gryDczd92IYqygC 2bWRmd3IyOb+cts5WhffhEaOR8Zc5kQ9vNbaSM1IG3Xn4394e1HskTt39nX+daWa0cGBxh8/5t1 MfZbTrwjXCZotDYYx0+FdTpkzZEm2iXYgTJDckT1iGJzZmhu/uRpkD6kYockLp1R+8d1D5Xy6W7 ry9YBprDJNwJMC28sltmUfcwMKTC5DnOl7zF90JAO1iYvlgxW4/LcB6R4EtpLOCktiQHjYq6PvR BB6ErjMZ4LEMSVXPLpAWgRY1ysjVhRrKpjZZ66G49xv/comEzl803nIQuLPEgBHNKTDGHDokBEw C9URWPGI2cz5DjUzdNPN3BeYrwas8eXDQiPVQ5PxXoOl3DiKK4HKqvyxYsfWhVcHFWKmJsnI8hx 2lqKodrP+EcyeTV7/elKtRyuBDPlBa+zLukmY17+nTZcY966+k+F/8dnswDgjc92ikHuj5llHnC 1ceZhWOxnEYbs8zNfL+xHkWUi+Rp+b2RtJ3WyaxaOLNRJHjxDHWHavTSfyweRNQ1koNlcHSDWOy V4g+yp1Dh8N6u8ogOEsuu+qjqTV9MMCXXU0kwJUOZWp0mUrrCyTPP7wCNfzZwgGEcWF1V+s+PUE 080yTc1YgILVbCg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-7.3

for you to fetch changes up to b78d749d4ba7c217d2be644619a79a72e1fd5dfd:

  ARM: dts: exynos: Add bluetooth support to manta (2026-06-29 12:23:04 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v7.3

Add Bluetooth to Exynos5250-based Google Manta (Nexus 10) board.

----------------------------------------------------------------
Lukas Timmermann (1):
      ARM: dts: exynos: Add bluetooth support to manta

 arch/arm/boot/dts/samsung/exynos5250-manta.dts | 41 +++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

