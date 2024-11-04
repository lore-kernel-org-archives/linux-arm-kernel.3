Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD7D111A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 03:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wiLwb6GnipOmqvu7EQ4e3F6cXNoTrLpO1tW1/P4NpdI=; b=zw/dp4Qgt0qeRioWgnoT3CYG0i
	TPW4dUppHto/yevbxiaGqnLFlf8FDogpaKrsjSurI1bOXkhEOazOASxXXXmCtOp+DhAiSZzf4nrhq
	87mZJxBEHA/BaIPVMLyZSvJ0cV1sVkkfmSFo6e6Hk/FBy/ke74U2UnueCkdprFrGuTeap864nrCXv
	mv5PisAKq9eWlwijeMNRo19bYN0vzePbNE4rvWtg3anYS5RAkcgzkHhLc9UwxqRruEbEPYN9kXmTT
	2zEvIc2HugQHDgkS2ReGIxopMksANNp1u0BZ8TAYPalnwD1dulO7Yyvel7RFCiZ6pBFjpUPsn7Mfx
	oKUH2V3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7oEz-0000000CbEL-35ji;
	Mon, 04 Nov 2024 03:58:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7oDI-0000000Cb6x-3V37
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 03:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A249EA40111;
	Mon,  4 Nov 2024 03:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ED8C4CECE;
	Mon,  4 Nov 2024 03:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730692631;
	bh=mA+q+8QPE2k8hM9ZLaMOj/rQw3D4xoupILk2RpZ7enM=;
	h=From:To:Cc:Subject:Date:From;
	b=SQeq8t+BSTkTGs+E0cEy83bRdGF1lZxagBmo9IDH4sigRZ0V1ocfaZnynwcoiL0SN
	 0NYS12R9LvreAT6Bzaepm1haPQpvtROFDWl8bbQzgv6zSDDh/ABLmV1I5s1IOWWe2w
	 fK6R+jNfzoRT2WhtKDXvvU7YRDDtgWziuCh193RSgIYidsw2uxAuxKE3ue+x1KMnOh
	 V0cL2KU0CQ0QmiRfm1C2pFJ5QTRuEW49oLpGsGH0Mjn7NtCgqulsCE9CVcvCEm+7Ru
	 q0dsRGej7hu/0AEoPfEsLZQv79X9rWNQ+h+5Ey2DNCepDbbOYs5IMz3vv+JQkMPnOp
	 VWTh3dH8NpmAw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.13
Date: Sun,  3 Nov 2024 21:57:09 -0600
Message-ID: <20241104035709.19094-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_195712_958957_F8A9A1E4 
X-CRM114-Status: UNSURE (   6.00  )
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


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.13

for you to fetch changes up to 9c957ebbcdd131a890cf163875d4493414f84eca:

  arm64: defconfig: Enable sc7280 clock controllers (2024-10-15 11:04:50 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.13

This enables multimedia clock controllers used by SC7280-based devices,
such as the QCS6490 RB3Gen2.

----------------------------------------------------------------
Taniya Das (1):
      arm64: defconfig: Enable sc7280 clock controllers

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

