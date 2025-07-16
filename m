Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D98C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PqNKbBW1P3sM3F6qQ01IHJ/uEi0ffk3aLv1ZXVsVfag=; b=hWQQpTPbuwonXy
	SrEpudxfDImpzHTncoZhivtD+KduZo5Pq7girNLIzgjB/VLUGEQrEM4JFxKBU7iN45kby/hLfnfdJ
	Pz8KU6tHDsWWy2oVj3uFsmZaTqhSEvgPd0c2DjckWG2kt4HVDOOgQwzJrPKXBFLwRVbkR7YWAyc84
	5x0FtxQZDK8W3ixs0rhtVX1Fy+nwrsfq/0ogZo31qKY+O1LvK3+Tu2esavL+Cq/8cvDQsCeaSkg0d
	sP4VDfvBFBct3v1bKnx1eh4p1f/5xEb0TNxntDGNO3MTdbbdW2jh1evmQcBPwD0HAN4BJIgQEMjct
	AFNYVbQY2EiJGvgah7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzWK-00000007RcN-2iYw;
	Wed, 16 Jul 2025 10:37:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzBZ-00000007OCS-2aJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AE72A534EC;
	Wed, 16 Jul 2025 10:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41C9C4CEF0;
	Wed, 16 Jul 2025 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660984;
	bh=C8U2EKW6jdsZWIl2RXIYDu1e3lyJ/jnCYupiNbG6rqk=;
	h=From:Subject:Date:To:Cc:From;
	b=CDuu6Dlp/PE2oWBq/n1FeXcxSAfhs3iBAQb/bxYtoGHugL6UzEYQFyq6MPoUszI1w
	 NDLiNlKHiR4KtZXycihHzygL33DZcmAbPGYIrjiy/xfFvCndy7EEgtRGNw1z2RRwLj
	 6aeF38E9jE8/3VaRK4SWp79IO9TOPV6nOC23ipOuBOOl11nP90n03PoSp/zoJl+lai
	 QnRvdgISFdwd5KahOh8LIxwvijMpwGiPmT9iEpSGIoRW7mSboftnEDVGgom7h+hbQp
	 ilVfxTjSmwUfLAxyQB3z21ct0fYixxliTdIRGzpZdoRR0cPTc9Tq3jUN7T8xQzYmX3
	 QeQ2Oo9eB/U1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] Retire SDM845-cheza devboards
Date: Wed, 16 Jul 2025 12:16:06 +0200
Message-Id: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZ7d2gC/4WNQQ6CMBREr0L+2hJaUkBX3MMQQ0uhPxE+trVRC
 Xe3cgE3k7xJ5s0G3jg0Hi7ZBs5E9EhLAnHKQNt+mQzDITGIQsii5pIFWlGziWhYcLLhpq359Ex
 xXTZqHM+lVJC2qzMjvg7vtUts0Qdy7+Mm8l/7zxg546xqVFUPVaFFLVryPn88+7umec5TQLfv+
 xd5MBMhwQAAAA==
X-Change-ID: 20250715-topic-goodnight_cheza-b1c38bff935b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=1733;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=C8U2EKW6jdsZWIl2RXIYDu1e3lyJ/jnCYupiNbG6rqk=;
 b=ABLFgPgQnwfUegih1onsZ2LADJ3O3eAVzR7G4DOPYRlcqMIDaIHQVdmXgY2BBztinW5HV3bn+
 ImJ6f+6E9FdDWr4SzHOgtTao6yWdNQOUVkmokuOamhtHuIlbVo8U86b
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_031625_796569_8460D24D 
X-CRM114-Status: UNSURE (   9.62  )
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

Cheza was a prototype class of boards, based on the 2017 SDM845 SoC,
used for bringing up ChromiumOS on Snapdragon platforms.

Today, almost none are left in existence, and the small amount of
remaining ones don't get any real use.

To ease maintenance burden, remove it from the kernel tree.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Drop the MAINTAINERS entry
  I wasn't sure whether to go with a separate commit, I'm fine with it
  being squashed if that's preferred
- Drop the dt-bindings, as the board practically doesn't exist anymore
- Drop the SMMU bindings entry
- Link to v1: https://lore.kernel.org/r/20250715-topic-goodnight_cheza-v1-1-68b67d60c272@oss.qualcomm.com

---
Konrad Dybcio (4):
      arm64: dts: qcom: Remove sdm845-cheza boards
      dt-bindings: arm: qcom: Remove sdm845-cheza
      dt-bindings: arm-smmu: Remove sdm845-cheza specific entry
      MAINTAINERS: Remove sdm845-cheza device trees

 Documentation/devicetree/bindings/arm/qcom.yaml    |    3 -
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    4 -
 MAINTAINERS                                        |    1 -
 arch/arm64/boot/dts/qcom/Makefile                  |    3 -
 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts       |  238 ----
 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts       |  238 ----
 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts       |  174 ---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         | 1330 --------------------
 8 files changed, 1991 deletions(-)
---
base-commit: 0be23810e32e6d0a17df7c0ebad895ba2c210fc4
change-id: 20250715-topic-goodnight_cheza-b1c38bff935b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


