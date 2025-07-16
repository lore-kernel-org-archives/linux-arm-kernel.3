Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECAEC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cp9vNxFVE61mtQfVZ1xC7aCKo2yRPekH+M/h7ezzeWQ=; b=oB+sn8FDjuJFYdyDzR86+WeW0i
	7RpuABoQlqHAJGpNaucyhXma1fcFRW8Rfs0s8PVB4CI+nVoH47ULpILytGQVOzr0s39HS4UpfF/hf
	sKnZR4jV5Hnx5vckjVJi+n24Yr2abXrNwpzc/Mnc6wTCJNqNQ+lQpFrhSzEI7kgemCbRvTCv/3pxW
	eigm1J9JV8tv94nAC/sp00wLoDo3zyDi/XRRUMwvO74DjIuts49DnRcrlD8Si/UjkKZSmCR+IfXVB
	luKUqX1VGodbNEzVz5bNZqpcM9nerSyiIjQ4dsH+Dmd1L6IaMJ+2w5ix8oqtAeyHRkGUbqB02tyNJ
	NfHr1h2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzfx-00000007T4l-2zSl;
	Wed, 16 Jul 2025 10:47:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzBt-00000007OGK-07vP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54689A53603;
	Wed, 16 Jul 2025 10:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE950C4CEF1;
	Wed, 16 Jul 2025 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752661004;
	bh=XT9cXOKCmgl+ldwrsrHzx8+e2njm2xgZ6MA6eRd2e/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LxcZwS4aCnkKDwRprVZ6dIySrzUO2MocrydHWue/iOuPpLgSEvTwNrEg0h3f3EF6i
	 Sb4gUi2vhzfyem5XOWmJMa4rmCJJD1kpdjVaIA9NoQtQaP0AUJ1dMk62mxeHrjq+dE
	 qEE82XVL6VH2M0jlIrFl/LRKxFNIN6zyZgEut36q26nThcrpv95YtIJXY9f2QjTEYa
	 D2f9+kKHQk09fWT0Msq0IFEljX9xz9OPn3fiEOe8/5iYipAw95KGOj8ttxUvpqinNp
	 R6Zntx3xNm/i1UjTvEw+Qc7AiBhySpFTNsV75LquyGPBEWCFEkG6DEDhydjL3uGrkH
	 5Cr56zlrxRLCg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 16 Jul 2025 12:16:10 +0200
Subject: [PATCH v2 4/4] MAINTAINERS: Remove sdm845-cheza device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-topic-goodnight_cheza-v2-4-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=865;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ANVp9wD1JKerNgZkOFesI2FiXPrTvVkvGY5Hg/6LtoA=;
 b=qAkxUuVfq2BgTuvJ55zGB+Qi2KJW+DlZZqVzcXUyp80yzPuP4rZbQ+3K+h4pndYjSXVkqT85t
 nuAx28SbwTqDRfiIdrqHZl5cmxa9zQNkE5WnrvbgDQ6nobfM+Xnp5EO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_031645_142567_16D6F262 
X-CRM114-Status: GOOD (  10.40  )
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Cheza was a prototype board, used for developing Snapdragon platform
support on ChromeOS.

Since almost none are left in existence, and none are left in use, the
device trees for that family of devices are being removed.

Clean up the maintainers entry with it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5efcdb5537f52b84a57505857399af70f0fa7e45..1458ff091a864e539c554ef9e915331c44c87370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3071,7 +3071,6 @@ ARM/QUALCOMM CHROMEBOOK SUPPORT
 R:	cros-qcom-dts-watchers@chromium.org
 F:	arch/arm64/boot/dts/qcom/sc7180*
 F:	arch/arm64/boot/dts/qcom/sc7280*
-F:	arch/arm64/boot/dts/qcom/sdm845-cheza*
 
 ARM/QUALCOMM MAILING LIST
 L:	linux-arm-msm@vger.kernel.org

-- 
2.50.1


