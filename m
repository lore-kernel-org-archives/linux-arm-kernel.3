Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D873D65544
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbEtaAmMlxXyqDS/k6vOiNipXnzKHT+3DfTp8CiMnVc=; b=mEBYUuIcZCLKQiM7dM2XLT1pzA
	5c3ir6ByoU97N0HZnVM/8g9+VxaCV3iKXKlWkICS623Znd+JpwtOSKGZk4DvifqETRACTb30xHIpR
	bjMu7EWdjUiOp4pZbkr4gcB8pbp4TCQp669MqjstOEXwq4aCcQH1jOv8fE37UYtoK8nSLmoXymPAW
	U8DGLguZ8BsiwusDoub5ggxq7neQc1WDd2z/MdktpW0+BKJ1ZYe6Snnzcrj1yW7fbEKjy3YxJMvPw
	XkyPOSUjw92KNf8z61lxkglf8xlurHuSDgX+u7a3eJmPxMbKamIuFThhuL4O5dV/6vHR1LYa+OA0q
	bbF/RB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG053-0000000BPNV-3XmM;
	Tue, 26 Nov 2024 18:14:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG043-0000000BP91-1dXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF713A40EDD;
	Tue, 26 Nov 2024 18:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EDAC4CECF;
	Tue, 26 Nov 2024 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732644810;
	bh=BQkT98an5k79mH1rE1/XZVZUDrrIXpXdkEYMYEpOdQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNVpXuD4CpDuGo1X6ygFufKs0noyFhgXzKkl9XQZTBzToIeEeRMsOrZfGwhyzpIoN
	 9Xan5YZrGtvCuTBBGhHBzCnxmuGG6ZltpXxdVySCULFaoCsbMl6WMeIlXfAqy56eFl
	 ow5rliasd369bL4OiWnIQM3aWtOZtCfJPgk13Yjl1j699gXAyC8UKSGYinxG67HMnX
	 hkOFYRkjv0agMeUQm7qod0ynz+8twQvIx9fEQ7i5h1eYFu78Dx6C8tYClz6OSZqXrN
	 ka/VqCw2Tncu7I0tKXK930Pm4TP+ysptQuKssa7tNJKTRKUXOv90rWV+sZvuGrPy6q
	 Zc7SpKy+NvciQ==
Date: Tue, 26 Nov 2024 12:13:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Tingguo Cheng <quic_tingguoc@quicinc.com>, 
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: add initial support for QCS8300
 DTSI
Message-ID: <mjth25v54mioefjet2udacqqwvw7tfbhemmvjps4utjm545hyn@3f7zwohi4qee>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_101331_491937_83902C8C 
X-CRM114-Status: GOOD (  11.35  )
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

On Wed, Sep 25, 2024 at 06:43:34PM +0800, Jingyi Wang wrote:
> Add initial DTSI for QCS8300 SoC.
> 
> Features added in this revision:
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
> [Zhenhua: added the smmu node]
> Co-developed-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> [Xin: added ufs/adsp/gpdsp nodes]
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> [Kyle: added the aoss_qmp node]
> Co-developed-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> [Tingguo: added the rpmhpd nodes]
> Co-developed-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> [Raviteja: added interconnect nodes]
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

Sorry, thought I had replied to this already, but I must have confused
it with QCS615.

Please see my feedback regarding signed-off-by and subject line:
https://lore.kernel.org/all/4bhsuysjm2uwkk52g4pkspiadsf5y4m2afotj7ggo2lnj24ip2@yqkijcdkiloj/
https://lore.kernel.org/all/2qvv3zrop2i5hurrn7bfggfkjb7rqlbfa7bxiekdisi6c57gxd@d2fptisjhy3j/



For reference, here's the qcs615 v5.
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

Regards,
Bjorn

