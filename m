Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E05D111A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ncvWODKuXOWjfOJU8Hbk69ipGmSa0aAzlhwRkNBrkD8=; b=vGZrB/2FtZuO7qK4uwTbVcJAN8
	VcJ5d6rZnz9i1eRAsZiCyL5zEHtONCnlV/RCDn9YIIhdFpCrDeRTlVBgIvl70j3unRVp9Zh5HHR1z
	gv1Ane2dabV1eG2v6CaN7txBBfTNb9giGCvaFObLVKwRqiWHGcqcb5BD3jHrKhJAeqjQo2Jzfze9n
	uqhH5hdNXpmZhIEeqp2czeXa/VeSUCq8W1aGGy3FWW/w/9uWNg3rfjxA6TzhFFsKg5sq/j8e79aVy
	26beQ0JBL610KleyLjhlaKmnZmdvxLYVOuddtLyFe1UqhZQGlX3SCVd3Yn5CWPYvjglu1DMx5/ydc
	ta3vXIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7oAT-0000000Cay8-1ovv;
	Mon, 04 Nov 2024 03:54:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7o4B-0000000CaNG-2phF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 03:47:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28444A40306;
	Mon,  4 Nov 2024 03:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4DDC4CED0;
	Mon,  4 Nov 2024 03:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730692066;
	bh=BxTdEBrwuoUPawocmr4roN/Pu6iOj2aVRgI+R08NuDA=;
	h=From:To:Cc:Subject:Date:From;
	b=PDmBUW55OAIQDSfCj7VeIqh1sVtaVyYdlduJ29cHcI8pqfdT/cJOtd3cTn70tByys
	 WMKT8sDE0W0hk+EnP3+QzQ5hLvOikBIqWcSJJP3N3jhVq6C6X3zqMXLWH4WZccJPRl
	 iJkLMzOSdRkk48dCX+GwwSh5qVRZlPuuV34rWho5e4EbJtmXOkSwJJAG7Y6VFnqldl
	 ohkTcGhGU9CSQ9JL78QfJsH+OaqO3aPeH6JeUulAWtdAI+hlVgqHjEAhyTdguO+R+Z
	 gb2e7ipzlvPY2hR2ChTNtrps80g1L5LqEQ/njmxc477Ar3eQ1HQyyZdXjx7+VKaCey
	 lk2c38N5aEI9A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.13
Date: Sun,  3 Nov 2024 21:47:43 -0600
Message-ID: <20241104034744.14378-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_194747_825155_902463EF 
X-CRM114-Status: UNSURE (   8.58  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.13

for you to fetch changes up to ef4b38462e627f58bc929fc502e601dd396f1ae2:

  ARM: dts: qcom: ipq4019: use nvmem-layout (2024-10-24 09:44:57 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.13

IPQ4019 flash partition scheme is moved to nvmem-layout. SDX55 and SDX65
PCIe EP controllers gain missing linux,pci-domain properties.

Stylistic improvements across a range of platforms and devices.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: qcom: drop underscore in node names
      ARM: dts: qcom: minor whitespace cleanup
      ARM: dts: qcom: change labels to lower-case

Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55: Add 'linux,pci-domain' to PCIe EP controller node
      ARM: dts: qcom: sdx65: Add 'linux,pci-domain' to PCIe EP controller node

Rosen Penev (1):
      ARM: dts: qcom: ipq4019: use nvmem-layout

 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 38 ++++-----
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           | 78 +++++++++---------
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++--
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           | 10 +--
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  8 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |  4 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 34 ++++----
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |  6 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  6 +-
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 92 +++++++++++-----------
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  1 +
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             | 67 ++++++++--------
 14 files changed, 186 insertions(+), 181 deletions(-)

