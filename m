Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29BDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 22:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vZIS1CbEs3bOzT/oAKtshVSpdScLBO84tQWKqCqrZU=; b=FVmSZwW5OfbpSbeQY/ydu69u/g
	GVHT6KhnzfmoxGkUuthdFS46w/Fi8w6KxcTxt3rqnCvgacDWfIZ26YV/skckJ6u5b/jszi470Kpgb
	RI5RwoEtXKvn4+18Xoa9STtSHzakB12hGMRCEkjby2qDq3nZLyxk80mWPG1kTfa88Ss/NGOQQ0P0C
	Q75NBjFbtqRIrtTz14qCQ/fbBzXQNJos1BKRjSiwms1qYnRXCDpGPF0pEBuNeWLl8oo/4+khjroeg
	PxgHuRIaMhM5BdaG6FQowTb1DNbAgSGzI6UsC9LhhGmPyubY7ScFrSre289pXGeTc63HmXXyEdP7v
	IHhDfhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQwWz-0000000GZLM-0kMK;
	Thu, 26 Dec 2024 22:40:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQwVn-0000000GZ4h-31Fa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 22:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00599A40F52;
	Thu, 26 Dec 2024 22:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89543C4CED3;
	Thu, 26 Dec 2024 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252762;
	bh=tV+CdgR7E6rGMJlDVv0V3QP7ZUnPgARHrkQOYbkfKsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P76UBlt634sh7YJngIsL+cVDVzRaCXyvEDDpBj777ntesIrDLpFKjuJyCx4Af8zPC
	 LqV+MHIz5piyz0OLkEWeGem9JBsVuj2opEsfirPytCp3YA350xsU2tmTPiJV/OyWhT
	 LeWn0eIKyvSULL53I2y368xzpiGf7PKgWacqRH5PEIF/mYNjGets+1YCKEvD2MHjyV
	 4uuZLkxAvJeq5RbkF7zhwnu2J8wuyRSLE53lLWfcSARQ0NZYpXBm1PO3MBbVjCefSn
	 dxFPPRFZC6MIQVDLrkbotIN1FD1sMpZkj/nrwHftgMcdXdiVTKz996wRnxEyFDND5u
	 8AW9s8ESZ0XNA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/4] Add initial support for QCS8300 SoC and QCS8300 RIDE board
Date: Thu, 26 Dec 2024 16:38:47 -0600
Message-ID: <173525273239.1449028.17978193547825691565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
References: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_143923_826738_8A426BF6 
X-CRM114-Status: UNSURE (   9.21  )
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


On Tue, 03 Dec 2024 17:27:11 +0800, Jingyi Wang wrote:
> Introduce the Device Tree for the QCS8300 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> [...]

Applied, thanks!

[2/4] arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300
      commit: 57039a27658a1e7ca1c60fe7e381092c609e4bc7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

