Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWOzFRZTiAsZM9ZZnHqipT0abAP9hBU/QGVHlb0lWAk=; b=PrbLd9spncBtsa1TdPzxhdt/gC
	z949QQeH/cWog1XizetGsR9S/qQ/SQWb29OEzhIwU/5i6X+LpmPMzm6diuq3KJaUI2UR/t1QZ8PJW
	4hja6g0gvTrWVgbJnxmhh93YnItkNiFyB8GQUwhWOSc7Etl8VAt6QaNa7IAn7/YgTpJ0ym01O51Rq
	sr8vXto8Kssns37it13kvZuP9ykW+ek9xhb3Db3q0S7/mHrBsOOHHVLiT3N8iylNMk8rUTBkwhcfE
	yaQJ3fST9jGo3zVoM24WHoclNC37EpihRY7OTsYygmlIeUT+qymU48RheS/3zJPXZZKd5CkGp8Wqv
	rGne6QRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUr2r-000000029ql-0NXH;
	Mon, 06 Jan 2025 17:37:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqzs-000000029Cz-0k1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2112F5C5D60;
	Mon,  6 Jan 2025 17:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60BBC4CEE3;
	Mon,  6 Jan 2025 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736184875;
	bh=YzBD69Ati05p96MYx7b6sryRrVaWQZkIv/X1D/dyxCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CaNOnMmTPChtOxc6VXw5sN6+sip0t3gP7/xenKzXHT04wWkfbYaDx+UQPpcDTC+ih
	 fxY/JRoDmHTpBvyqBp/tDANWUOm98neX/C/gtarb/nz/E9ktU2CEcKOERRoe1Bxss0
	 BghJg1wghE6V7GwtoVRGjeuD/Cspr2AaTN1S0MQgkzTIVvXsZLrSKNGQE74dC+VhUD
	 PYGVEl4zKBENBCQZDzNlOCOq10aVKjuj6zPtfBvKL8+sBTthILzpeKkp+29ch6SO9j
	 rKFk3WIMtZQW4czywzbteaMa9wZ2X18nIGBq/xzJ/q/6wmgTb+BPl0l7/dWdUInBJL
	 PxZ5p5Cfs0B5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jishnu Prakash <quic_jprakash@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: (subset) [PATCH v3 0/7] dts: qcom: Introduce SM8750 device trees
Date: Mon,  6 Jan 2025 11:34:29 -0600
Message-ID: <173618486756.8645.2856249152434296360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_093436_259238_825F917D 
X-CRM114-Status: GOOD (  11.44  )
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


On Wed, 04 Dec 2024 15:18:00 -0800, Melody Olvera wrote:
> This series adds the initial device tree support for the SM8750 SoCs
> needed to boot to shell. This specifically adds support for clocks,
> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
> compatibles.
> 
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: arm: qcom: Document SM8750 SoC and boards
      commit: 5202bca52a6b48bf51500e302dca24d722c40990
[2/7] arm64: dts: qcom: Add PMD8028 PMIC
      commit: 167466c07085d76ce41989edb0a9598f37b56185
[3/7] arm64: dts: qcom: Add PMIH0108 PMIC
      commit: 2cf3496e50f308d80142bad85946a3a3ad7d7248
[4/7] arm64: dts: qcom: Add base SM8750 dtsi
      commit: 068c3d3c83be47fe933679d6cf6f324f60941176
[5/7] arm64: dts: qcom: sm8750: Add pmic dtsi
      commit: 7f9738e0a8dbd78d47b95981792dee013f28981c
[6/7] arm64: dts: qcom: Add board dts files for SM8750 MTP and QRD
      commit: 6a02becf4b42f1664d9443e7d2049dd4e31e5ff5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

