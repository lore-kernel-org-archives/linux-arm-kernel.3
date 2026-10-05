Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A77BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/lUy849mj6VnNKpU9WpJMDBkHN9KlFh1cVOi8EQynU=; b=au54sNvOMqPPaULlKw4FTtjLj+
	YoKrpvpFEWCSn+GrVWalq/xYgbzmxlfQuX4OWrsIxFB+/9cIR6LyxgaSuzbEpDvtyeziGzFwV7Pc3
	Pec7Fr2jBBuK2MTefd8kpAhMw82egowyfU7EHZSIsSQyOzhMT/7CPNsiU5QCl8Ya7vPCFIq/m0xiU
	clwjFmLtHKQ8muXhEzXqTZUTCnYb0N+l2qDwYKsVkqNTdzbH2KKVFCQmrgvFgO6ESGNGFNyzWvgBD
	rvOtSO0xU2dPx11Es3ud52KpP55Sl5Jo8sihNYUMB20gpdw8Zgtd6HSrCuQhqhOQuYpZUYID9g2AE
	37LywfqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfzv-0000000GBgf-2epD;
	Mon, 05 Oct 2026 10:32:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfzt-0000000GBgH-40sd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:32:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 296016022E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Oct 2026 10:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4525C1F000FF;
	Mon,  5 Oct 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196360;
	bh=T/lUy849mj6VnNKpU9WpJMDBkHN9KlFh1cVOi8EQynU=;
	h=From:To:Cc:Subject:Date;
	b=iM0QOHD5DvGs59THN9N6wk73MIj4DjMjq9RJG4Tb8ym+t3Pjbi0gG9zPd4VrsHF7W
	 zKtupEpmxEze17lWyCefCiEG6jW9jQggkYEUbO7tyTWsXsnRwnwQsnaqhqhEZS6FP6
	 J40VEVbmVSupNlovnBCyTF3IFr5LuqAij8hzhx/MFLPVq6Kr+mQHBm4RCc7VMoWDYt
	 Q33Mb+IVe6cp/sfIZF/BuPr+GhWRe7S1/Ehn2RtMzgBGH+d4/zwJ02nS/CfOc8Gtjo
	 5LIjKPWYFrXDOxINesT183zCBgnTz9YCXTtae5gCOY94UctV33KRSJsvyml/GcEwvX
	 35RBGqTZj/UXQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] arm64: dts: dt cleanup for v7.4
Date: Mon,  5 Oct 2026 12:32:31 +0200
Message-ID: <20261005103232.37247-3-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=krzk@kernel.org; h=from:subject; bh=cF7kn8sbCTjHjPAnkFXtSa+cYcnQlfglW+sMPEYeiXI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3zAIe0E9u+XD4chZ5ixi+pEkbiLCoKR9ddth QazU1Khd6SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN8wAAKCRDBN2bmhouD 13NKD/9aotDiwjLm1cz4/dH/DhuK2z9l4a7AcETMf895hiW3q6u6sIfOkqfM5Tco8D0IIH5N/wi 2gN8q00h03nNRurpqUR2E0DQra+WnEJ7ecmTlb8gjMvyMogEmAjsdxtvrbIcHxT1JlHyk72uA9q S9dAAxRa6XrJj7oi5KJ4NmhzXVoHJMfd8KS6hXz1/R7bsYV8lxg+xTRkgq7MdbQld5bmwOYuROe qUtAfrL4jMkdzJVd0pa9f6Dl38bnxP/y6qDDvCHkpGxaLvPxCHSJVzQSRBvpIRtC9uQxmj0CEVF lQj7vcKBRnenRIfnMuNYsgqfN43r3qsKmdJkrSo1b2ZZuk29V9spq79W4aA2CCAvPwHiC7hrEcf Tpb53enXgyn4NXcLociQRLh0xU3tUhdGDCHqmw8jBBNMc1zglmiYPWtE+xEztZfCr2a01ZCmqkz rinoe2rT5+p5AFrDpJk3xViZtEtP3AhnoSZGY8Ike1fViP9Cyk/F7FrhVG7UItPzJEmgGUmbOZz HdZBBEVjVDwll8En8WqXf2k6EBQxK+1dIFuHCBCeNGsROPpR7c6/bQ10Z2/P0mZNhneJdoOXUfv J2yYtDY3iP+eaducth/XmKp+rRhx4k5v7zM79NnQ49XN2mCCnzbOUwuskF0NzR+cpV1qAKtTY33 SJFj0n2+PH/2kJg==
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-7.4

for you to fetch changes up to 1f6101ae9560c381bb6e3b4322b51d784a648019:

  arm64: dts: cavium: thunder-88xx: Replace spaces indentation with tabs (2026-09-19 08:41:31 +0200)

----------------------------------------------------------------
Minor improvements in arm64 DTS for v7.4

A few more or less trivial style cleanups pointed out by dt-check-style
for Actions and Cavium platorms.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: actions: Replace spaces indentation with tabs
      arm64: dts: cavium: thunder-88xx: Replace spaces indentation with tabs

 arch/arm64/boot/dts/actions/s700.dtsi        | 6 +++---
 arch/arm64/boot/dts/actions/s900.dtsi        | 6 +++---
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

