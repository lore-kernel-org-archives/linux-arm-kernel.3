Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CBBCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 23:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/u7wggDrKzH3YYTuLbezrvh1WzwUDA2SSV6WnLEbqo=; b=oLEY6JRD5wZnP/NoMmEITqCnk3
	ifL12+xkP4T5nSxVBTkXuQtegjrobMpEZcEJ2OQ7J1guSzY6CO6gz71YHNmVrBywX7EQ0ggPYD9+d
	sXjtSwQxErf3LFjdqEEE1HJVNt53t7/Oz0/L6g+HO/ws6uR+8cpdgyvS1cu+YjFkqDfmQqPjLQklv
	DKeJFwSiNPjmMVy76NDoLtcPw6Cd09FTDwlNM/kk7BTUUqHQEGkJZdqC6rehjAhzarJMjWVGTVkZe
	688drHwiCq/71g632E3qOYDSC+au+X8aGQ1Y2O7MZv/08uD0hiEKhckoEk8vQ832rlYD51s8V8COz
	UtVdmU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbxq-00000009OCL-0FPM;
	Mon, 11 Aug 2025 23:30:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbvE-00000009Noj-1Y2g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 23:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87AAE5C6487;
	Mon, 11 Aug 2025 23:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C94C4CEED;
	Mon, 11 Aug 2025 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954839;
	bh=oEKIeomaSLSmtb9O+c6vF8ODZah1fEMj2JS83zzAivQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YxKKFophfNKsCis96v2TvoKgAxJ8+nIXOxcVQP+MYFENjvBPX44HTZQO6F/maNMJH
	 yuX+GA248dEI7XTKQ8Sw1CNycBBCNEWPiabM1U2Yupe3YtzSLMvTJHEKYaLmpijMRg
	 aWYekWA0lZc+uq6zQZTvp5LrcEez/h50/rTsCUJy6VrOmKwil/mIDrLZYKgKjpxAMi
	 bdu6BYG1uLtsjyi5jysGN20ZWaQ1cnkmqrdBSiiuZ3DMQg92TNAJtCD62MldCi3FNi
	 LGQp/WK9uIh44wOhPlUrOc5RQh7JoiB0oCwcUpu3JNFEtAphjLuaf9VsoXrHVqNnO4
	 Cuom2gBvMBR8w==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Retire SDM845-cheza devboards
Date: Mon, 11 Aug 2025 18:26:55 -0500
Message-ID: <175495482455.157244.15046215797350240153.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_162720_452448_FEE6F603 
X-CRM114-Status: UNSURE (   9.86  )
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


On Wed, 16 Jul 2025 12:16:06 +0200, Konrad Dybcio wrote:
> Cheza was a prototype class of boards, based on the 2017 SDM845 SoC,
> used for bringing up ChromiumOS on Snapdragon platforms.
> 
> Today, almost none are left in existence, and the small amount of
> remaining ones don't get any real use.
> 
> To ease maintenance burden, remove it from the kernel tree.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: Remove sdm845-cheza boards
      commit: 5e4ca587f56319c3c9800b9d1a97443b9c364a15
[2/4] dt-bindings: arm: qcom: Remove sdm845-cheza
      commit: bae72efa3ca6674ff99668b00290376babae10f5
[3/4] dt-bindings: arm-smmu: Remove sdm845-cheza specific entry
      (no commit info)
[4/4] MAINTAINERS: Remove sdm845-cheza device trees
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

