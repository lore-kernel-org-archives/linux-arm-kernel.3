Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811BE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/F9Jp1D+EZxuAKkkzsaTARg9AsNebxpTn3NnJ0fE7s=; b=mOwi5yUh+Cn1vIB9BRTSS9MaTM
	be9fptomJX0mBfi3Xs+3D9mfGEbzCSh6VD3d2ry7nhJbuHyV5bltRZIiWpIBnCP7ajolkAJjeIrmC
	DfqbBZpyhfXsfCJ7Fs9XHnjtz/Y99WGwQxCP8eb1ZNLKuf0mACTUthGL6VVChFbnZ+HpNVWnXLERs
	pPukygp0NuhoLdc16izr2hVl8HzOL9SQXexml721XEJx67d4bJdAvIkxUy8b1JljUupbNOJ/MzDIz
	gM1K55MLK5iLqhrv8KbMiVmrd8gqmD/eP5fwJ83g4TvfIkGyWOdPdzTx+7XyRpMESGMEB96tDclDk
	je0OuX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWfNR-00000001AGz-06tl;
	Sat, 11 Jan 2025 17:34:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWfMD-00000001ACP-0sDJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 17:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00116A402F3;
	Sat, 11 Jan 2025 17:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345E3C4CED2;
	Sat, 11 Jan 2025 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736616788;
	bh=3FHm1o2a77cyqAtNnb+6A0yOHRJWuUqqYK8pCZPQ9ZI=;
	h=From:To:Cc:Subject:Date:From;
	b=IaF4wjVNrWiQW/9e8Vy7NQhtbSMqlMP14L/b0C/ICbRDHh/iCRnGUcagr9dnRxLxU
	 2k3bT57btrU9QSVq37KNIDVTK72EDPjd1DQAgxQTtGbfb/q/QPkOUVg66Yyg05V/1P
	 XgWO6NSWK5RtNdtf4MTXdv5AAf+vmlB59PJIRYhANOk+SfE3FEIEobI4pAq3sLqeZp
	 oP72qOEBD2qZnVxzacLh9yh0VkTRXis4MprSAJYL5Lx8H+s7bAcr/4tzPeZw3+re3j
	 0u+ucjmE/Ez5lxs3HRYG17kjyt763plfSJszgfVtAoLpGJPnLjlD80efRV2CTNrZza
	 r+JlSzOSHec6A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Ross Burton <ross.burton@arm.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.14
Date: Sat, 11 Jan 2025 11:33:05 -0600
Message-ID: <20250111173306.392204-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_093309_312122_6F873C2A 
X-CRM114-Status: UNSURE (   6.68  )
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


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.14

for you to fetch changes up to 1fe6c70fec8fd8c823afee66467f85f028b0d22c:

  arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller (2025-01-07 21:08:21 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.14

Enable core drivers for SM8750, QCS8300, SA8775P, and QCS615. Enable the
IPQ CMD PLL driver. Drop the 8650 display clock option, now that the
driver has been consolidated with 8550.

----------------------------------------------------------------
Jingyi Wang (1):
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers

Lijuan Gao (1):
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615

Luo Jie (1):
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller

Ross Burton (1):
      arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650

Taniya Das (1):
      arm64: defconfig: Enable sa8775p clock controllers

 arch/arm64/configs/defconfig | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

