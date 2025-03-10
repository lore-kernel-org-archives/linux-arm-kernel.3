Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CEFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+PUH+cR2ve7Y5AMMZrYsc+Lr78WSgGXcqlz7/qhbWYo=; b=u4Fr6S/RZTW2kx9Gt7ybzW3LHj
	FTA+r5Hgu2WtjrD7Eh19uCcSLcvlpS3G0LPqT5Shg8FHggn5XnRUu9vca4FWwYqoqa9KRaGKisRFg
	m9/T8DAtZMk2XhznPFirHth2zWDLbda1y9GhKuraGmPI2xxT3KQmVN100osiHH3IHBFvKXD35/JDr
	2AwnSyqsRvN07u/xXzEwyj0I7AskjZ5CBzv6/Rf1ui4Cmy2dUOXHXzZeZC9NzP9IlRRjKIr7iZ0vL
	3+S8H+ShtgvuTWWVKhTZ6Th8XU0wgt7FwKEEbPyEQnZOd2LAgvczUfB16zJLyvZ00fB8i+Bru2Hl0
	DRr5A9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tribS-00000003imV-25qI;
	Mon, 10 Mar 2025 19:15:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triZo-00000003idp-0WfK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 19:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E972A460BC;
	Mon, 10 Mar 2025 19:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD97C4CEE5;
	Mon, 10 Mar 2025 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741634050;
	bh=xQeemCsrfUF+jP/rsD1veh7JdHq+E8YcGMftlCccdmg=;
	h=From:To:Cc:Subject:Date:From;
	b=Yi88lkebQIjrJiDYz7RgeYpBz1fH4NtfixP8nEee3ndJTluyve9Hm/vB3WOFUmmiC
	 i2DcYZrmIGl1HMv8S/mYOXsFupNTmOixGBXVDp7HnkqJiyN0u9wpp7TK82tc9W3IFJ
	 2U847Ap6yxYmZweDIwMDajso44Iahgnu50LCeIYp4jzkHGJ0pPfmqd3gW/DjbYRdU8
	 ULwJXqwCIoZVFkKDoD6DUKIMKAds+zJyEOSePF0hGDzgGxk7jZqi/cdswQBi37I03i
	 pq/dn1MDUxj6s80k98cyLUVRySlRztRHPlhGJ3G+qmWO2I+p/BHgynVdmq1Ud1+V2w
	 lWCaJcELT+SGA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 Devicetree fixes for v6.14
Date: Mon, 10 Mar 2025 14:14:08 -0500
Message-ID: <20250310191409.1208520-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_121412_230324_72ABF9CF 
X-CRM114-Status: UNSURE (   6.22  )
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.14

for you to fetch changes up to f00db31d235946853fb430de8c6aa1295efc8353:

  Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu" (2025-02-25 09:52:52 -0600)

----------------------------------------------------------------
Qualcomm Arm64 Devicetree fixes for v6.14

Revert the change to marking SDM845 SMMU dma-coherent, as this is
reported not to be true.

----------------------------------------------------------------
Konrad Dybcio (1):
      Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu"

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
 1 file changed, 1 deletion(-)

