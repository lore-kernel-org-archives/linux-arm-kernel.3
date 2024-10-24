Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68008CE8E85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMF5hH6zY80mdGBoVEJnBLAo4FyRzdJS2trtpfQq8H8=; b=KN3bXdNveM/PBhXQhpy5iwxxXu
	I+9o2PePMtnR+BQwwh1glq3CMkMg2O5p6yjoulsnU/Qovt+myBzco2kNyL+eLdd2ZENH17yq2/+7E
	ML00iilej1JFCvbevzVLCDBaDsx0DrnJL7jaGZPAtXYVEXsIW3d23orEzKhg06s+4p4NPAZAs9F85
	kvFxExmD9yMGD9aqKPLP/lvxA/0rz/z1pC9Xbgut50EnXpp+R+mIwx50lrfbZ1P73b2uVPvyIkh1K
	RzvBiA94BHi0zFiNcwpPPdVNT/gb6asgoUgTv3T4taM+EFVnCkgKBVOtLJXWoHYqoaAjlbjd1waOH
	P7VNzZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z7I-00000000nit-0MVQ;
	Thu, 24 Oct 2024 14:47:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z3C-00000000mzb-0raT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 323A0A45582;
	Thu, 24 Oct 2024 14:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C01DC4CEC7;
	Thu, 24 Oct 2024 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729780977;
	bh=t0OZKA4n9mqRbbHhAysa4Kw5aWrJMRzwz3vf4umP7xM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYKDodnz92n7qFauFPJX856mxEtkMRGNMjwUV3bSfuD0OhqE5y777vSTQMVai1eby
	 dezWu7I0s2pZn1/Md7UiCeTTCrgNR1nBVE9tS6lkCVmT9ZLVNeKhUvBdLZSN0BdVGW
	 RFjOBNBgcI9snA5UIgyKtbIYtKsecpcQ9xnhQ4MqRIKwB/SngBKoIPvGU0G4B2TM8h
	 t6lHtDvX+RLgvrI+5nVZdQ9PFa1l+UYKZk/nvAMuwfV1BpkhYMc3ng7/nnx1C/1fiX
	 gz4f4dJJALNX0HfLLnlpkWNGbaAU/ICOGkGlEc2cf78+sPwMA11DkdFGg3yalKt8tB
	 SU9IfRILVVs8A==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iommu: arm,smmu: Add Qualcomm SAR2130P compatible
Date: Thu, 24 Oct 2024 15:42:49 +0100
Message-Id: <172977349100.1427890.9934602061209095444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org>
References: <20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_074258_327977_6A0DA698 
X-CRM114-Status: UNSURE (   6.89  )
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

On Fri, 18 Oct 2024 11:28:46 +0300, Dmitry Baryshkov wrote:
> Document compatible for ARM-500 SMMU controller on Qualcomm SAR2130P
> platform.
> 
> 

Applied to will (for-joerg/arm-smmu/bindings), thanks!

[1/1] dt-bindings: iommu: arm,smmu: Add Qualcomm SAR2130P compatible
      https://git.kernel.org/will/c/0ddb903fab63

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

