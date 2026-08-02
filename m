Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjSayV/sJlc3KNTb3fMX3RwzhLQRHzSBn4xsieBjaMg=; b=VVPUTuw+8byQxuBJAcJvAl0U57
	xWIccglrG0mQ/zTmCgb9qBhLL7CaNNT3s1GYTMQyYqTG341iM5ebeKGVQ7zECNvNMy7QAcy+8uf7n
	RevRbZWhGLPVzwtePROFjgfemuNZ9tcSXF2zsp5p88SyBWJNaMSWa6jTM2Wh6uPojWMW50EkHumsB
	28rZKwctc/PjHGly+nlvduzIGJPg26IwOA21I3TjPmyBWQ5ysSlUZx5L4TIcXteHIeQ+BNOOsLmGo
	KzeVs9Cv6tt3TebFN6ZibZ9tfon5YxymC9rUQ+j7yuHkmFIQBPO/ty6gRq+jBKfZ/xoyS27Q5ekhD
	9iNPD0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZDx-0000000FppB-0Z5q;
	Sun, 02 Aug 2026 16:39:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZDv-0000000Fpp3-400w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:39:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54A72437BC;
	Sun,  2 Aug 2026 16:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A546D1F000E9;
	Sun,  2 Aug 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785688779;
	bh=VjSayV/sJlc3KNTb3fMX3RwzhLQRHzSBn4xsieBjaMg=;
	h=From:To:Cc:Subject:Date;
	b=GTzDUMcOi0HIaAgBOvcoh1pnhBh51/HQ812MNtZ6w31c/CoctTee1fxFdK4DYfAfX
	 YBPnww/cEUl85c/4RacqmPnYfixjYnmn0W2/SBksUnT163OiFR/5R3Rj4jdHa6BNxO
	 E1eDj54fYFKB2iyEybMKFxnSmJPJnXT6lgW4CVAbaqZXDOxt56HfJTSB6ly1G1eQRt
	 9Rn+0qwoQEW6gQqldDzc5zy5GLmEKznrgVbSwXAX6ucJphU4aEp+qdfP+Z825FePGE
	 plev8wAwJiSDJILQMPCG8ztLUFvCbKUcjVGAPmTuzgFk7NH1+UpqT+fcVm4NSQsPTX
	 WHlci5SrGvAxw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Device tree fixes for v7.2
Date: Sun,  2 Aug 2026 18:39:34 +0200
Message-ID: <20260802163936.1257450-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm64-dt-fixes-v2

for you to fetch changes up to a7c28483fd57dd0e1487024af70622315320774b:

  arm64: tegra: Add EL2 virtual timer interrupt for Tegra194 (2026-07-29 18:05:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v7.2

This contains a single fix adding an interrupt to the architected
timer's device tree node for the EL2 virtual timer. This prevents
a warning from the driver at boot time.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add EL2 virtual timer interrupt for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
 1 file changed, 2 insertions(+)

