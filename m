Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4E1D3F074
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oh7ZPhsMfLZpyfWAhrjwlzweoNrg4ytkjCHodc1OMBo=; b=O4pm2MdCkb4ovBL4qzf1iL3mzg
	aN0G1T6fvZQSovoLCNUXtzjoK/rDKvI3TyT4KyZ7s8kOrcoUmumQ/hHAlHMzbGYw/ts5pUaSFYzk0
	aXEyIPzcv5VwX+qstq6vFkbYUf4KXF1n+tQKneC3zugZlz/KIv4myEozmwCAkAki36Qrk/DfbL5Ou
	RdwLCQRyjSLEIPnbf2ZJO7Q5cNIcXFWkCcxX5XjEfj0czVQcMkNHxYxa68c9jSI0dimorIn2Ij8xo
	syQaR+64orlPjt4TESic+wJWK6FTNl9cRg2x5gX2dUn5nPECRzwuEwYROnaKds0Oxs3tGeQDDHOTw
	2vz0iHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7L5-0000000GGIX-0JlT;
	Wed, 28 Jan 2026 15:20:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7L3-0000000GGHf-2SOD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A80116001A;
	Wed, 28 Jan 2026 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CEDC4CEF7;
	Wed, 28 Jan 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613612;
	bh=n5r/uUVLuNiFYvHFPNXrYj+DESSqzslGS1XqaqDCoPM=;
	h=From:To:Cc:Subject:Date:From;
	b=uOQNpUVNNZKRvk1Pa2JvusSosDc32YrYzAu/YhJ8p+K+OI3Syeltdx44Uy9qxKwVz
	 9d/6xiGIB0yKhdMW1zl3mhlrbUc7U9aTIsrGYsdF5ruEXH6qSzPun8viohS5PPrQUo
	 PY0T9xNmTkcZuWWIe3i8WLGXFdsnMcLNkbRYu3uY3B2w2ieIwchOnYXCDfV9Fhph9V
	 WzbCZyLnB4RwQSTlWCmE8VXr4rjKa0YqX5+QoQ97nc4srmNH0ImOK3h5Vq1LZD72tZ
	 fzsmTVj7UbGIbmcBQ2ehpHTzNK703f5sn1dnV3bNnAZwzaGKN1XJdICFhFy/TMjtcu
	 YqaYzsy//JyOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [GIT PULL] Qualcomm driver fix for v6.19
Date: Wed, 28 Jan 2026 09:20:10 -0600
Message-ID: <20260128152011.2091082-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
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


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.19

for you to fetch changes up to f2090ebdb59d0546cbd7b55d9dd63a77133efc03:

  soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid (2026-01-28 09:10:53 -0600)

----------------------------------------------------------------
Qualcomm driver fix for v6.19

The changes to the logic in the Qualcomm SMEM driver for separating
"failed to probe" from "not yet probed", did not change the
qcom_smem_is_available() function, with the result that clients sees
SMEM as always available. Clients might then proceed to interact with
SMEM in codepaths that aren't suited to cope with -EPROBE_DEFER.

----------------------------------------------------------------
Christian Marangi (1):
      soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid

 drivers/soc/qcom/smem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

