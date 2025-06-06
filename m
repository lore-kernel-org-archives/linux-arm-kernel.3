Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB9C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWCY/OyoAHozSbX+anG3WJk2NR8xMPEqjRMacDlPDwk=; b=mAkHA0qpE025z7P0XEKWRiJAzU
	oW1jvuQGdHmODPjowbcovgSlRiODtyPgEL7d8i14kt/ReOiMHQ9EmY+Az2x4q5tDYP+FlRWAS8KRJ
	J/5bXAFz7bSMEV7VK5uDLrKNeoVh/BOoxHXWS431akDFtBXz7WfbCGwnrBM26LDPiYPI/IubeKsl7
	FPkg22EPP3jua92ifmZoaq0xtAvPmI7tz/AWGnZpQtvzP0A4qvhYt7ZR2xHEjTGWvvxmbmroHBrrs
	3K63jcuv2VFCLS7HLuD745pHDnZ266k9x7pbPdqfWKO9kLIb6Zzynp7OL73xbMMG4x/pD8YjqB/ZB
	Vs40rOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKdF-0000000GpIZ-3L7g;
	Fri, 06 Jun 2025 00:08:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKb5-0000000Gp6U-1XDq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 00:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85DD461F1D;
	Fri,  6 Jun 2025 00:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CBE6C4CEE7;
	Fri,  6 Jun 2025 00:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168370;
	bh=kOeEXWQNRy2OTULbzXmLA/yVFQzsao71agZKirZ35u8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nJFctsbUoQa5qk+VChv8Sz/jIrNNMapriCXS+1rgwt/pRbUA6jdgJaltLQ9Q0GGXu
	 SpUE7buCTNRKRolFrV0iL5lJ97nzR6fBamyzlpOYnFSoJKomEUOQex/CNrkV3jhs63
	 yir9JRDb1KMO6X8MYOChZwH27mM6Ks/+n7ARyuF6YFTiYVgF2yx4eiQmFQ392jsMRr
	 f8GyzKlZBCwirffmaIBdNdbSTBxKw7/kgypTnU7+cxcAW4Qg5n15NcRggWawJdDAK4
	 b2BYsCPoRC0uuCAjFui6r7HeZWEYHUYV4894/ihDY/aTu+901w4SkYZwGjERPDLO0H
	 nsuNMrMP2lsrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B829C5B555;
	Fri,  6 Jun 2025 00:06:10 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Thu, 05 Jun 2025 19:06:06 -0500
Subject: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0wQmgC/x3MQQqAIBBA0avIrBNGw6CuEi3UxhoIE6UIpLsnL
 d/i/wqFMlOBSVTIdHPhMzaoToDfbdxI8toMGrXBAY2kaN1B0qfLJzkqa9D0AV1Q0JKUKfDz7+b
 lfT8Vhg+VXgAAAA==
X-Change-ID: 20250605-enable-cpucp-91a5053f0bf1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749168367; l=931;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=mwZCvU5SjPvj2kO7B5ZfonxzycfZ+NOz+VGaDsi0ueE=;
 b=L05l4pr3UPZUZ5Tco/EHocmMvBvnHuoV/CG26hOOlmpoGvi0y/J50xiVyWHqBhKDtLGRRVJKx
 4BWrg4OWuZ6ByYUBCzvI5YNd+uPCN6J6cirhNYCrvDjo7wT9Z4C8hnI
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
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
Reply-To: bjorn.andersson@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
scaling to work on the X Elite platform, so enable this driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..d3ef95df7b2770ac1c7a6022a9ec22d1fb4c25da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1447,6 +1447,7 @@ CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
+CONFIG_QCOM_CPUCP_MBOX=m
 CONFIG_QCOM_IPCC=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250605-enable-cpucp-91a5053f0bf1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



