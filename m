Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F98F4613D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8dPtDX5UcdnlkKns2BheQJPrdQkfFYPTg2bktP5Aow=; b=Weqgc6kaT/BMdtPFUMme/6XPCD
	xZ4Ji/fJaitPoEgHazf8YPWdPFlZqbs/zLYWd9WfnVccTIizeDvWOZHZVyY+BhkrqZYJAz49umKkl
	dCBNJUnO25dSmG6TXWFCzAamYY1EWtApK3+UAb4toiM7klEfXQaWtDZsgAuoQQzaKRfrqmU+fTtsx
	fetsHdJr0is3eU/e7xJwuqzQvGIcMLWGRC/Xj9lVGfJKItTIvU507kMe47ym+LijQyE5A2NG7HwrG
	qwCVBrJYLRfN+1guf49TOh/649vknA9jpzAsIqmaBYC9zClQOG1ncXHckIC1Z75GReWBqu/XmMAkq
	QVsTy8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51La-00000001SsJ-1dV8;
	Tue, 24 Mar 2026 12:59:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51LP-00000001Snx-2yV9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A9284421F;
	Tue, 24 Mar 2026 12:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450E8C19424;
	Tue, 24 Mar 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357131;
	bh=A/J8K2+w9v1wDxavLP6cEzv4qbtsm7vPK1ygQauOSvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0vCS6zmnPko+Shcp0DGlu/HqBfoxb6rm05pHWbw3fQBkAD++eX9q2G2KvSS+tqHg
	 S+1LKUxQaTwCJrvvG65dFaQzzjKN5eK2EoZj7oO090K2IgK7bj5sgqREcY16ByKCd8
	 FDnAzwySNim5AYd+oKz8bnT8UaZ7jIamSomrQLQsdmRcepW6wEo7Q8LIzlpC/ClTnM
	 05jXjm+VluhJPlIrofZcN5Q0JBvB5vxFstQIQS66pkVgdYl8FttCk1tNOKWIHUKFzi
	 ewOIExVZf0XVPLePseWCdOxIdm9yhFNwDtXA50lvwd0XRqy5BUNcxKJbmcNiV5EnTL
	 crAvGkeyhBBxA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 4/4] ARM: samsung: mach code for v7.1
Date: Tue, 24 Mar 2026 13:58:24 +0100
Message-ID: <20260324125821.59728-8-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
References: <20260324125821.59728-5-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=krzk@kernel.org; h=from:subject; bh=A/J8K2+w9v1wDxavLP6cEzv4qbtsm7vPK1ygQauOSvM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwopwirt7jHBLea/R92YkT++xs6N600UwKfdNB 1brVid79cCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKKcAAKCRDBN2bmhouD 114eEACazJfGYdwz5FFHbQxtpT2DV+Q32u8c4D1Ovbo2AcnO+sZYqbd0dw6Aig7IcpWSL9hzYhj onv7fagUlntrXkwaVn6/gz+zCiy2TliJEjZc6jGzDDaYay7QgkRtpkYkMgVTTlOLhqcD4O41YQe dDezODxP3CQj59yhbI6FuW7aB+nNl3Dh4fOE0RHNPezPPQyxei4sk3X6vJYv44hA6/xAyiYceNV Req4VeyJw2OEZJK8iPpZ9z093VHaq65ToFbr4PS43WqQ4FaP27SDKIlDEaY0qZ18t6DrIsMv+zt 7MUH/Bml/yHIYg/ocOvjhtaeHhZr3l0p/nehYQBmjnQyKG5nzHOlpkS3MGYDkhoceW38IA6+/Jx +Jlrh/DCpo3/Dn3n7kjyfo8/jWcF4V4KRIrUCu2POGXVjebae7KeLyL367luZ5pFbIZIkbyrXZ/ 8D7P4QJd5kpZfm/LUltfwM0ycSb9fKbTewyAm3ZNaYqF0cIiEP2rlvmrDmmL83+y9K/2bm5yzyz xtLkrvDdfjxCmK0L8dAXkGXa/+lGhSnKv51j02dZtmcmau2c5HZKKJDlIMJ9T8IGv8DdPmXf3Y8 8QnkODStowMCVr39RGAstaSk6KkaRkDztyGkqD2i83tYbvnU5WehaVe5XaOjHHU03BU9P3m71yi NwvUz+B4hMd1b6g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055851_771215_D5236AB3 
X-CRM114-Status: UNSURE (   7.62  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-7.1

for you to fetch changes up to 32d4b991f25eeffac7568ef51367f924394fbdc5:

  ARM: samsung: exynos5250: Allow CPU1 to boot (2026-02-26 22:13:27 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v7.1

Fix booting of secondary CPU on Exynos5250 based Google Manta board -
difference in TZ firmware.

----------------------------------------------------------------
Alexandre Marquet (1):
      ARM: samsung: exynos5250: Allow CPU1 to boot

 arch/arm/mach-exynos/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

