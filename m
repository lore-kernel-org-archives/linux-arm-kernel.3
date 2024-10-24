Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA3BCE8E94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFV3vu4k4Vnr6fnUULAuFfZZroVUQ5JW8e4KyAni4BE=; b=kMP/NVsFGVUHPo0gxQJBcwkUUo
	hChkVLxQf77dhSicGi3Nmc7An+knAsROJoeM3rwgCJV8ESznlD3sw2Gjy1Nmewkef6VEEfcK94Aip
	sBdekaOJ4zwPkku9RbVlpXQqyBGFj+RIsDmojfRE1CGX9rj2Vpj74rv3vPByKMEu48txTRr0YsAmJ
	Lg7Wg4xYRotQEKTzPnOPmEPkzLVYh2prCCPvcOAXHSF3pS/xf/09DkgIBGne6+tJiV3/iTmc2g4RS
	O3TdkE/BqxHxJBTMU6FOsl+vc0IMn7OunAePmCSLEsZBWxXoSsCorqQJdIvey1Si3GkbZOybpri7x
	4i+2dCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40vG-000000018Pp-1OXt;
	Thu, 24 Oct 2024 16:42:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40lv-000000016eA-2UzY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8017F5C5CC2;
	Thu, 24 Oct 2024 16:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACBFC4CEE9;
	Thu, 24 Oct 2024 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787594;
	bh=HDBJ+uOpS26fWgvQvOCW/T7/SZyOlHewKBKNueUbUBA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FbcEnchIiiXwnEqVE3SJypkwhULJkXS9aQIN4TyqLQPYzf+AhpzDI/ahWSinMpxrR
	 fQerS0KDTC+5pIVvmKFHEwafrkyDcP3htb+7zhIIdBt2H35OOnU2RIvEQCnBnfhjjg
	 n6wzFpWdfUKLMvra5diaPSuGxsF4m+dRLKKoqnGpXvwQQP9S3zKn7fiZgZRW+XWpo7
	 MoNxfN3dmACRZpG/RT6KqvAstyltE82iJ2vi62Jk8ASedz+4qCwuaIcvEZHLYtJTjO
	 hlQx11gNQL1z2yMhBmjVgLHjlkbP84E6Ebn39FW3ghKbZUbuWTyYmVi3/6vLgEz2jG
	 lohWHZ5VADzVA==
Date: Thu, 24 Oct 2024 11:33:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Taniya Das <quic_tdas@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Tingguo Cheng <quic_tingguoc@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Will Deacon <will@kernel.org>, kernel@quicinc.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Swetha Chintavatla <quic_chintava@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
Message-Id: <172978739698.623494.13901719999982782781.robh@kernel.org>
Subject: Re: [PATCH v4 0/7] Add initial support for QCS615 SoC and QCS615
 RIDE board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_093315_763524_CBF0AEF6 
X-CRM114-Status: GOOD (  22.08  )
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


On Tue, 22 Oct 2024 16:54:28 +0800, Lijuan Gao wrote:
> Introduces the Device Tree for the QCS615 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - QFPROM
> - TLMM
> - Watchdog
> - RPMH controller
> - Sleep stats driver
> - Rpmhpd power controller
> - Interconnect
> - GCC and Rpmhcc
> - QUP with Uart serial support
> 
> Bindings and base Device Tree for the QCS615 SoC are splited
> in four parts:
> - 1-3: Binding files for QCS615 SoC and PDC (Reviewed)
> - 4  : Soc table entry (Reviewed)
> - 5-6: Initial DTSI and RIDE board device tree
> - 7  : Enable uart related configs
> 
> Bindings Dependencies:
> - watchdog: https://lore.kernel.org/all/20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com/ - Reviewed
> - qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/ - Reviewed
> - tcsr: https://lore.kernel.org/all/20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com/ - Applied
> - tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-1-e03c42a9d055@quicinc.com/ - Applied
> - interconnect: https://lore.kernel.org/all/20240924143958.25-2-quic_rlaggysh@quicinc.com/ - Reviewed
> - rpmhcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-1-bb5d4135db45@quicinc.com/ - Reviewed
> - gcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-3-bb5d4135db45@quicinc.com/ - Reviewed
> - rpmhpd: https://lore.kernel.org/all/20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-3-18c030ad7b68@quicinc.com/ - Applied
> 
> Build Dependencies:
> - tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-2-e03c42a9d055@quicinc.com/ - Applied
> - rpmhcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-2-bb5d4135db45@quicinc.com/ - Reviewed
> - gcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-4-bb5d4135db45@quicinc.com/
> 
> Patch made the following verifications:
> - Successfully passed dt_binding_check with DT_CHECKER_FLAGS=-m for earch binding file
> - Successfully passed dtbs_check with W=1 for dts
> - Verified CPU Hotplug, idle and online CPUs on QCS615 ride board
> - Checked pinctrl-maps path
> - Verified watchdog functionality with "echo 1 > /dev/watchdog", can trigger
>   a watchdog bark and later bite
> - Verified functionality with UART console on QCS615 ride board
> - RPMH controller driver probed successfully
> - Sleep stats driver probed successfully and checked qcom_stats
>   node on QCS615 ride board
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Changes in v4:
> - Configure vreg_l17a to High Power Mode (HPM) as it supplies power to UFS
>   and eMMC, which can be utilized as boot devices.
> - Link to v3: https://lore.kernel.org/r/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com
> 
> Changes in v3:
> - Added interconnect, GCC, RPMHCC, QPU, and RPMHPD related nodes for UART console
> - Enabled UART condole on ride board device
> - Link to v2: https://lore.kernel.org/r/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com
> 
> Changes in v2:
> - Collected reviewed-bys
> - Removed extra blank line
> - Removed redundant function
> - Renamed xo-board to xo-board-clk and move it and sleep-clk to board dts
> - Renamed system-sleep to cluster_sleep_2
> - Removed cluster1
> - Added entry-method for idle-states
> - Added DTS chassis type
> - Added TCSR Clock Controllers
> - Added Reserved Shared memory
> - Added QFPROM
> - Added TLMM
> - Added Watchdog
> - Added RPMH controller
> - Added Sleep stats driver
> - Link to v1: https://lore.kernel.org/r/20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com
> ---
> 
> ---
> Lijuan Gao (7):
>       dt-bindings: arm: qcom: document QCS615 and the reference board
>       dt-bindings: arm: qcom,ids: add SoC ID for QCS615
>       dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
>       soc: qcom: socinfo: Add QCS615 SoC ID table entry
>       arm64: dts: qcom: add initial support for QCS615 DTSI
>       arm64: dts: qcom: add base QCS615 RIDE dts
>       arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
>  .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 219 +++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 688 +++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |   3 +
>  drivers/soc/qcom/socinfo.c                         |   1 +
>  include/dt-bindings/arm/qcom,ids.h                 |   1 +
>  8 files changed, 920 insertions(+)
> ---
> base-commit: de938618db2bafbe1a70c8fc43f06ccdd60364b2
> change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24
> prerequisite-change-id: 20240919-qcs615-clock-driver-d74abed69854:v3
> prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
> prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
> prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
> prerequisite-patch-id: d0c5edf9c06568ae2b3ffacba47e57ebb43acb15
> prerequisite-change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924:v2
> prerequisite-patch-id: 3a76212d3a3e930d771312ff9349f87aee5c55d5
> prerequisite-change-id: 20240911-add_qfprom_compatible_for_qcs615-e3b02f6fa71e:v1
> prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85
> 
> Best regards,
> --
> Lijuan Gao <quic_lijuang@quicinc.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#






