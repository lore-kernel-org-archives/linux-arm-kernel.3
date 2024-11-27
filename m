Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84808D609C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9h1TW4ypbZ6f7k2DEq7YdhyiACx5yHAJ0C4odFuGmI=; b=ZFzRbAPVBbA7R4knjCjhOelImI
	JZ4JM3zEYUFkSZDt451FXZzhW9sBu3C7S5ofRayvdEABU7cn1rQBkTdTjIdE1hj1WSle8nV9xNlmJ
	gluP5ZvOLj+sTkIV4pUPtgUkENtGFc16Qua2dYCY31grLKNfMSNVMjXc3HvJC4oRDzTL9Dfud2CpU
	/Ry+gTt1e1SSM1gq21aBzRJm3C7U1RdQnpORuxbRG8tJV/47hIRhsPkYYMxqnk/BmXJ9jgraxY3Sr
	6LEFy6+F2au8k84ZHTCsnA/BaLt/1i8ihK4q97AO392vkL+TlFUlJZRHn3w19yyRThuItWNpXPufh
	NmAkE0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEYE-0000000Cisu-3Cb9;
	Wed, 27 Nov 2024 09:41:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEXG-0000000CioU-3Gau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2534BA40EDD;
	Wed, 27 Nov 2024 09:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3620C4CECC;
	Wed, 27 Nov 2024 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732700437;
	bh=iK/cZpP3in9oQkiP+zslk6edX5pzwthEzCyqGqnUsyU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=S/fvBgUrq7Uaq5hfwrA4V0Ru6g+9RCikGwzEopIm4vVwm3IWg+SUqOduOzWF9ZLDr
	 oQmGSk0qYOFe0GQya7Nik3bXGPPOrq/IRpuaw0L69Uf5EN6l8zYm0335N/NhyZMPD8
	 svKHtE2KAVMMKsZfUgdYZJwsbWsUZND+kmCDH4cpd/V5Uw2GkWoQxE/joYw67jJpBP
	 8ywNfJClHsdHNefdc/I45Isp4CUq1gUH/JpGiZZU6fNEFStAB9yRH5vRY5jQM0tYw7
	 /Qz/s1DpH4dHaZp6+DZ+7hhrQeBKd/b/BAJQFNrZHPKEUxnwHADLTst//W0qeCaYgK
	 R/FBz/LNi9gUA==
Message-ID: <766219f6-a535-4eaa-b1cc-768e0522d71c@kernel.org>
Date: Wed, 27 Nov 2024 10:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com,
 quic_aiquny@quicinc.com, Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Xin Liu <quic_liuxin@quicinc.com>, Kyle Deng <quic_chunkaid@quicinc.com>,
 Tingguo Cheng <quic_tingguoc@quicinc.com>,
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <5a4a80e7-b6dc-4c01-a16d-ed8ea1aefe44@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5a4a80e7-b6dc-4c01-a16d-ed8ea1aefe44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_014038_958364_8ABDB94D 
X-CRM114-Status: UNSURE (   8.64  )
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

On 25/09/2024 16:01, Krzysztof Kozlowski wrote:
> On 25/09/2024 12:43, Jingyi Wang wrote:
>> Introduce the Device Tree for the QCS8300 platform.
>>
>> Features added and enabled:
>> - CPUs with PSCI idle states
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect
>> - QuP with uart
>> - SMMU
>> - QFPROM
>> - Rpmhpd power controller
>> - UFS
>> - Inter-Processor Communication Controller
>> - SRAM
>> - Remoteprocs including ADSP,CDSP and GPDSP
>> - BWMONs
>>
>> binding dependencies:
>> - remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/
>> - ufs-phy: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com/
>> - ufs-controller: https://lore.kernel.org/all/20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com/ - Reviewed
>> - smmu: https://lore.kernel.org/all/20240911-qcs8300_smmu_binding-v2-1-f53dd9c047ba@quicinc.com/ - Applied
>> - ipcc: https://lore.kernel.org/all/20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com/ - Applied
>> - qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
>> - tcsr: https://lore.kernel.org/all/20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com/ - Reviewed
>> - rmphpd: https://lore.kernel.org/all/20240920-add_qcs8300_powerdomains_driver_support-v1-1-96a2a08841da@quicinc.com/ - Reviewed
>> - bwmon: https://lore.kernel.org/all/20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com/ - Reviewed
>> - others: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com/ - Reviewed
> 
This submission has bugs and instead of fixing it, some other people are
sending already patches on top.

No, fix this patchset instead.

Best regards,
Krzysztof


