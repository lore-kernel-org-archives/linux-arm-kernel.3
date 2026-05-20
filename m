Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9506CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMPSO73IWGk2hZS1TCz+JCCfIYv2zI+oGe5qmaNSKhE=; b=0/YsBAnOqYr6RtIN3wxlm2dl6N
	iJNGodzW7sF8j6MqafFfLvMCJtj4/RyGjHfsU/AUtlofSc1fIJbQzNQQIkkKlvPsa9NjNlq/65re3
	8h8Bgfv6uJ+Ox4YYLoPz3iJLq3oZB3Xl4awNJv/J2UJcq2sBB8tRiQK3gGMQZQOPL5CbClu0UJVk+
	mXkorAASPXAm63Cyf/Hpgt4oVD5rkkaw061q2SwATUQQxNm08BH/WIg2rUKA+MiguiXijXU1ZVWVM
	TCODCPMGtC8HZEIerpou4t7HDsbn0C+eHkQd9G8ZdDjYWfyUgYxk118a5ja9R8EBS+ytbQ1yaPchz
	2uKE3dRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZtd-00000003bjF-2UpI;
	Wed, 20 May 2026 05:55:09 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZtZ-00000003bhp-1YLE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 05:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779256499; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xMPSO73IWGk2hZS1TCz+JCCfIYv2zI+oGe5qmaNSKhE=;
	b=Q2j8RGf5iz7YghnM4OYULsfwQ3NS/Dp9sr2ju/PMYJSsiJ5bKsi1uDykfk745uGN0F5ONhKVMRzD8Om0394sGjP+f+hiM1CJfnlA97Cws05tMa+dY6WUe6A6xmKHszNmB/bGbf0PBYymj05Po4efMOskTIx3+gBCT+cRx6XjDzI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X3Hek0d_1779256496;
Received: from 30.74.144.211(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X3Hek0d_1779256496 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 May 2026 13:54:57 +0800
Message-ID: <3715e240-0a86-4011-a55b-a8b6d85ac4a1@linux.alibaba.com>
Date: Wed, 20 May 2026 13:54:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ras: aest: extend AEST support to Device Tree
 frontend
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
 will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
 mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <8f1529af-f6fe-44bc-a4b1-c47a19824d1e@linux.alibaba.com>
 <f95584f8-220f-4bd1-a189-dc05ffd2a9bc@oss.qualcomm.com>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <f95584f8-220f-4bd1-a189-dc05ffd2a9bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_225506_293090_76B3B31C 
X-CRM114-Status: GOOD (  25.28  )
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



在 2026/5/12 14:45, Umang Chheda 写道:
> Hi Ruidong,
> 
> 
> On 5/6/2026 1:40 PM, Ruidong Tian wrote:
>> Hi Umang,
>>
>> Thanks for your patch.
>>
>> Would it be okay if I include this patch in the next version of the AEST
>> patch series? I will make sure to add your Signed-off-by line.
> 
> 
> Yes, you can include this patch in the next version - we will represent
> it and respond to all of the queries received on DT specific patches.
> 
> How should I be sharing the patch fixes based on comments received from
> maintainers to you ? so that you can include in your patch series ?
> 
> Also, when is your plan to post the next version fixing the comments
> received ?
> 
> 
> Thanks,
> Umang

Hi Umang,

Thanks for your feedback.

I plan to complete the development of the next version within the next 
two weeks. During this period, there may still be some issues or 
questions, and I will bring them up for discussion as they arise.

Once all the comments and related issues are resolved, I will post the 
updated version of the patch series.

Best regards,
Ruidong
> 
> 
>>
>> Best regards,
>> Ruidong
>>
>> 在 2026/5/5 20:23, Umang Chheda 写道:
>>> This series extends Tian Ruidong’s [1] ACPI-based AEST support series
>>> to also cover Device Tree based platforms.
>>>
>>> While the existing AEST driver relies on the AEST ACPI table [3], many
>>> embedded Arm platforms use Device Tree exclusively and cannot use the
>>> driver today. This series adds a DT frontend that mirrors the ACPI
>>> implementation and feeds the same core driver, keeping ACPI and DT
>>> paths functionally equivalent.
>>>
>>> Along the way, several correctness issues were identified in the core
>>> driver and are fixed in the first part of this series.
>>>
>>> The DT frontend is mutually exclusive with ACPI and does not introduce
>>> any DT-specific logic into the core.
>>>
>>> How to test with QEMU
>>> --------------------------
>>> Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
>>> virt machine.  To test the DT frontend:
>>>
>>> 1. Build QEMU:
>>>
>>>        git clone https://github.com/winterddd/qemu.git
>>>        cd qemu
>>>        git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
>>>        ./configure --target-list=aarch64-softmmu
>>>        make -j$(nproc)
>>>
>>> 2. Build the kernel with:
>>>
>>>        CONFIG_OF_AEST=y
>>>        CONFIG_AEST=y
>>>        CONFIG_ARM64_RAS_EXTN=y
>>>        CONFIG_RAS=y
>>>
>>> 3. Add the following DT node to your virt machine DTB.  The QEMU
>>>      fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
>>>      vendor records at 0x090e0000 (SPI 45):
>>>
>>>        aest {
>>>            compatible = "arm,aest";
>>>            #address-cells = <2>;
>>>            #size-cells = <2>;
>>>            ranges;
>>>            interrupt-parent = <&gic>;
>>>
>>>            /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
>>>            aest-dram0@90d0000 {
>>>                compatible               = "arm,aest-memory";
>>>                arm,interface-type       = <1>;
>>>                arm,group-format         = <0>;
>>>                arm,interface-flags      = <0x22>;
>>>                arm,num-records          = <4>;
>>>                arm,record-impl          = /bits/ 64 <0x0>;
>>>                arm,status-report        = /bits/ 64 <0x0>;
>>>                arm,addr-mode            = /bits/ 64 <0x0>;
>>>                arm,proximity-domain     = <0>;
>>>                reg                      = <0x0 0x090d0000 0x0 0x1000>,
>>>                                           <0x0 0x090d0800 0x0 0x200>,
>>>                                           <0x0 0x090d0e00 0x0 0x100>;
>>>                reg-names                = "errblock", "fault-inject",
>>>                                           "err-group";
>>>                interrupts               = <GIC_SPI 44
>>> IRQ_TYPE_LEVEL_HIGH>;
>>>                interrupt-names          = "fhi";
>>>            };
>>>      };
>>>
>>> 4. Boot QEMU with acpi=off:
>>>
>>>        ./qemu-system-aarch64 \
>>>          -machine virt,accel=tcg,gic-version=3 \
>>>          -cpu cortex-a57 -m 2G -smp 4 \
>>>          -kernel Image -dtb virt-aest.dtb \
>>>          -append "console=ttyAMA0 acpi=off earlycon" \
>>>          -nographic
>>>
>>> 5. Verify probe:
>>>
>>>        dmesg | grep "DT AEST"
>>>        # Expected: DT AEST: registered 1 AEST error source(s) from DT
>>>        ls /sys/kernel/debug/aest/
>>>
>>> 6. Inject a CE error via the QEMU MMIO fault injection registers.
>>>      The QEMU device accepts 64-bit accesses only (use devmem with
>>>      the 64-bit width flag):
>>>
>>>        devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject
>>>
>>>      This triggers QEMU's error_record_inj_write() which sets
>>>      ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
>>>      aest_irq_func() fires, reads the status, and logs:
>>>
>>>        AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
>>>        AEST: {1}[Hardware Error]: Error from memory at SRAT proximity
>>> domain 0x0
>>>
>>> Testing
>>> -------
>>> - Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
>>> - Validated CE and UE injection via debugfs soft_inject.
>>> - Tested ACPI path is unaffected: ACPI boot continues to use
>>>     drivers/acpi/arm64/aest.c unchanged.
>>>
>>> [1] https://lore.kernel.org/lkml/20260122094656.73399-1-
>>> tianruidong@linux.alibaba.com/
>>> [2] https://github.com/winterddd/qemu/tree/error_record
>>> [3] https://developer.arm.com/documentation/den0085/0200/
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>> Umang Chheda (8):
>>>         ras: aest: Fix shared processor node handling and error log
>>> messages
>>>         ras: aest: Fix CE/UE error counts not incrementing in debugfs
>>>         ras: aest: Skip unimplemented records in debugfs
>>>         ras: aest: Add panic_on_ue module parameter
>>>         dt-bindings: arm: ras: Introduce bindings for ARM AEST
>>>         ras: aest: Add DT frontend for ARM AEST RAS error sources
>>>         arm64: dts: qcom: lemans: add AEST error nodes
>>>         arm64: dts: qcom: monaco: add AEST error nodes
>>>
>>>    .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
>>>    arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
>>>    arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
>>>    drivers/ras/aest/Kconfig                           |  15 +-
>>>    drivers/ras/aest/Makefile                          |   2 +
>>>    drivers/ras/aest/aest-core.c                       |  63 +-
>>>    drivers/ras/aest/aest-of.c                         | 673 +++++++++++
>>> ++++++++++
>>>    drivers/ras/aest/aest-sysfs.c                      |  27 +-
>>>    drivers/ras/aest/aest.h                            |  15 +-
>>>    include/dt-bindings/arm/aest.h                     |  43 ++
>>>    10 files changed, 1310 insertions(+), 16 deletions(-)
>>> ---
>>> base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
>>> change-id: 20260505-aest-devicetree-support-a3722d90e1f5
>>> prerequisite-message-id: <20260122094656.73399-1-
>>> tianruidong@linux.alibaba.com>
>>> prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
>>> prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
>>> prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
>>> prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
>>> prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
>>> prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
>>> prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
>>> prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
>>> prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
>>> prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
>>> prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
>>> prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
>>> prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
>>> prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
>>> prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
>>> prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24
>>>
>>> Best regards,
>>> -- 
>>> Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>
>>


