Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E6AC54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 03:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B1sf6RWaa/HhOic5dLoqTUa4KHmrDJOhB3/L/gD0Jz4=; b=kSSNw35lSiXNBkVc9DkfDj2/7g
	ZyWgVNP9/599NaD2WzM2GQoQi//r3T5Afi3Z9ShSfEznWQx8YUraIAqGFRfNnvocbdQphGiASlxI8
	+Vu3I7ZogtxkpDQ6YHMQUSCX0NLRK5+Z4SE9rl7dnNp9+p92zxkzbUZepDaiGsOvg81a+TdseN6wP
	Z07dcQj3uDniuG0i+091Spmh20axe0F+Pq/mTaWsOFGI3BI5Uvq2vZIyFExB52JIRm93ogcZUW+FA
	JW4Iy9Ld4hj0n0fwuKXFIzJYMvNZ04vXjOIsXsgT0oLjmGSuc6g1Z+lDRoA2RfYjDJ1q4t/PcaPEL
	tTcMQqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHDDF-0000000BOCj-1kk6;
	Tue, 20 May 2025 03:00:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD4c-0000000BNCD-0o6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 02:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DD5EA48EC3;
	Tue, 20 May 2025 02:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D6C4CEED;
	Tue, 20 May 2025 02:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747709481;
	bh=kg0UYLoDLGn0kLuXPSoezYQoD1VnTY7WDm8SYnPDd2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=VfK2tGrdS9n21qxpoc/YdKOwpQDLsbCske6AL3olMAaMl/8rUrEbzivN9OBVoCgXe
	 iJ6OnfSwV7HSTyAH2O3tI5Aga/Ys3QqPxlJ6a6NU5tHaf4eNpYN03lBNXJmsgfh+ZU
	 gm0gx8MmBRBfg/Vr0QoPY/8stMlAPxVerz2pM6qvKlmMhiT7hE1ZTp3BSuKx0xIRNE
	 NSj9GM7RrFYIGc33vHjgwty5QREPJwP8ZPVxX+SRS3/5J9EcHe5hCBQW+sfCSEKTPb
	 oljE3UGHJA3ZTv7ipQZYvHp9rTrrXVww6bkePVN3vlxUaT5FVLh/M3l9q8hZMWccU9
	 FAxWAU7jQMe6w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: [GIT PULL] One more Qualcomm Arm64 defconfig update for v6.16
Date: Mon, 19 May 2025 21:51:18 -0500
Message-ID: <20250520025119.40021-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_195122_291329_93680BBD 
X-CRM114-Status: UNSURE (   5.87  )
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


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.16-2

for you to fetch changes up to 4b77122818239bcc05995d0234491b91c8cd477f:

  arm64: defconfig: Enable IPQ5424 RDP466 base configs (2025-04-15 21:32:24 -0500)

----------------------------------------------------------------
One more Qualcomm Arm64 defconfig update for v6.16

Enable global clock controller and TLMM pinctrl drivers for IPQ5424 to
make this boot.

----------------------------------------------------------------
Sricharan Ramabadhran (1):
      arm64: defconfig: Enable IPQ5424 RDP466 base configs

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

