Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B976ACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FACOskeNa1pvEccBq6+kT7spelQ0a75v22vE98QSEI=; b=HPDZ8Hfa4yAANs65iVGvVc+ptv
	07FKVFfOOCTc6QG/83uJHsEU6tuzkfrgkT4SqF0kM+/arDZptYJkfYUT9BmAiJLM7mVvBUtAdNKSp
	8vksatnaSCYjqCXgTEJeQuNZi4+zB1ggTTMSn2b4lT/DsU8RQNT/1RWtq6Z6hogQNN2swycOQpLmJ
	q3OsWFiK8uh4jF1PKXwBrEAJRM5poWpadhHuLgYA28U4/nlqK8Qkf0zAJbe0dA+aJthl8SCBO8Zds
	xNVqqgHVdtFsk0S0PPBE/TPl3Xt+VHN9X3Qqnyk9bVIE7C8CdRquM7yxFrPcN6kUXiJtlLYX+IPci
	IZQwBRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6s8-00000003nuk-1pmb;
	Mon, 15 Sep 2025 10:55:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6s1-00000003nrm-3TOC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:55:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04ABD1424;
	Mon, 15 Sep 2025 03:55:33 -0700 (PDT)
Received: from [10.57.5.5] (unknown [10.57.5.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AFCE3F694;
	Mon, 15 Sep 2025 03:55:36 -0700 (PDT)
Message-ID: <cdcf1c3c-aca3-4a32-b4ca-ba1a4af5a321@arm.com>
Date: Mon, 15 Sep 2025 11:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/43] arm64: Support for Arm CCA in KVM
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <2aa76e3c-1e97-46d8-a8b7-c13cbbf05e8b@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <2aa76e3c-1e97-46d8-a8b7-c13cbbf05e8b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_035541_945254_9ADC8043 
X-CRM114-Status: GOOD (  29.21  )
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

On 04/09/2025 01:46, Gavin Shan wrote:
> 
> On 8/21/25 12:55 AM, Steven Price wrote:
>> This series adds support for running protected VMs using KVM under the
>> Arm Confidential Compute Architecture (CCA).
>>
>> The related guest support was merged for v6.14-rc1 so you no longer need
>> that separately.
>>
>> There are a few changes since v9, many thanks for the review
>> comments. The highlights are below, and individual patches have a
>> changelog.
>>
>>   * Fix a potential issue where the host was walking the stage 2 page
>> tables on
>>     realm destruction. If the RMM didn't zero when undelegated (which
>> it isn't
>>     required to) then the kernel would attempt to work the junk values
>> and crash.
>>
>>   * Avoid RCU stall warnings by correctly settign may_block in
>>     kvm_free_stage2_pgd().
>>
>>   * Rebased onto v6.17-rc1.
>>
>> Things to note:
>>
>>   * The magic numbers for capabilities and ioctls have been updated. So
>>     you'll need to update your VMM. See below for the updated kvmtool
>> branch.
>>
>>   * This series doesn't attempt to integrate with the guest-memfd
>> changes that
>>     are being discussed (see below).
>>
>>   * Vishal raised an important question about what to do in the case of
>>     undelegate failures (also see below).
>>
> 
> [...]
> 
> I tried to boot a guest using the following combinations, nothing
> obvious went to
> wrong except several long existing issues (described below). So feel
> free to add:
> 
> Tested-by: Gavin Shan <gshan@redhat.com>

Thanks for testing!

Regards,
Steve

> 
> Combination
> ===========
> host.tf-a        https://git.trustedfirmware.org/TF-A/trusted-firmware-
> a.git      (v2.13-rc0)
> host.tf-rmm      https://git.codelinaro.org/linaro/dcap/
> rmm                       (cca/v8)
> host.edk2        git@github.com:tianocore/
> edk2.git                                (edk2-stable202411)
> host.kernel      git@github.com:gwshan/
> linux.git                                  (cca/host-v10) (this series)
> host.qemu        https://git.qemu.org/git/
> qemu.git                                (stable-9.2)
> host.buildroot   https://github.com/buildroot/
> buildroot                           (master)
> guest.qemu       https://git.codelinaro.org/linaro/dcap/
> qemu.git                  (cca/latest) (with linux-headers sync'ed)
> guest.kvmtool    https://gitlab.arm.com/linux-arm/kvmtool-
> cca                     (cca/latest)
> guest.edk2       https://git.codelinaro.org/linaro/dcap/
> edk2                      (cca/latest)
> guest.kernel     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
> linux.git (v6.17.rc3)
> guest.buildroot  https://github.com/buildroot/
> buildroot                           (master)
> 
> Script to start the host
> ========================
> gshan@nvidia-grace-hopper-01:~/sandbox/qemu/host$ cat start.sh
> #!/bin/sh
> HOST_PATH=/home/gshan/sandbox/qemu/host
> GUEST_PATH=/home/gshan/sandbox/qemu/guest
> IF_UP_SCRIPT=/etc/qemu-ifup-gshan
> IF_DOWN_SCRIPT=/etc/qemu-ifdown-gshan
> 
> sudo ${HOST_PATH}/qemu/build/qemu-system-aarch64                        \
> -M virt,virtualization=on,secure=on,gic-version=3,acpi=off              \
> -cpu max,x-rme=on -m 3G -smp 8                                          \
> -serial mon:stdio -monitor none -nographic -nodefaults                  \
> -bios ${HOST_PATH}/tf-a/flash.bin                                       \
> -kernel ${HOST_PATH}/linux/arch/arm64/boot/Image                        \
> -initrd ${HOST_PATH}/buildroot/output/images/rootfs.cpio.xz             \
> -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                   \
> -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                   \
> -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                   \
> -device pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4                   \
> -device virtio-9p-device,fsdev=shr0,mount_tag=shr0                      \
> -fsdev local,security_model=none,path=${GUEST_PATH},id=shr0             \
> -netdev tap,id=tap1,script=${IF_UP_SCRIPT},downscript=${IF_DOWN_SCRIPT} \
> -device virtio-net-pci,bus=pcie.2,netdev=tap1,mac=b8:3f:d2:1d:3e:f1
> 
> Script to start the guest
> =========================
> gshan@nvidia-grace-hopper-01:~/sandbox/qemu/guest$ cat start_full.sh
> #!/bin/sh
> key="VGhlIHJlYWxtIGd1ZXN0IHBlcnNvbmFsaXphdGlvbiBrZXkgaW4gZm9ybWF0IG9mIGJhc2U2NCAgICAgICAgIA=="
> IF_UP_SCRIPT=/etc/qemu-ifup
> IF_DOWN_SCRIPT=/etc/qemu-ifdown
> 
> qemu-system-aarch64 -enable-kvm \
> -object rme-guest,id=rme0,measurement-algorithm=sha512,personalization-
> value=${key} \
> -M virt,gic-version=3,confidential-guest-
> support=rme0                               \
> -cpu host -smp 4 -m 2G -boot
> c                                                      \
> -serial mon:stdio -monitor none -nographic -
> nodefaults                              \
> -bios /mnt/edk2/Build/ArmVirtQemu-AARCH64/RELEASE_GCC5/FV/
> QEMU_EFI.fd               \
> -device pcie-root-
> port,bus=pcie.0,chassis=1,id=pcie.1                               \
> -device pcie-root-
> port,bus=pcie.0,chassis=2,id=pcie.2                               \
> -drive file=/mnt/
> rhel10.qcow2,if=none,id=drive0                                     \
> -device virtio-blk-pci,id=virtblk0,bus=pcie.1,drive=drive0,num-
> queues=4             \
> -netdev
> tap,id=tap0,script=${IF_UP_SCRIPT},downscript=${IF_DOWN_SCRIPT}             \
> -device virtio-net-pci,bus=pcie.2,netdev=tap0,mac=b8:3f:d2:1d:3e:f9
> 
> Issues
> ======
> 1. virtio-iommu isn't supported by QEMU. The guest kernel becomes stuck
> at IOMMU
> probing time where the endpoint's capabilities is queried by sending
> request over
> virtio device's vring and the response is expected to be fed by QEMU.
> The request
> can't be seen by QEMU due to the wrong IOMMU address translation used in
> QEMU as
> virtio-iommu provides a different IOMMU address translation operations
> to override
> the platform one, leading the DMA address (in the shared space) can't be
> properly
> recognized. The information has been shared to Jean.
> 
> 2. 'reboot' command doesn't work in the guest. QEMU complains some
> registers aren't
> accessible from QEMU. I didn't sorted out a workaround for this.
> 
> 3. HMP command 'dump-guest-memory' causes QEMU to exit abnormally. The
> cause is the
> realm is reconfigured when the VM is resumed after the guest memory is
> dumped. The
> reconfiguration is rejected by the host, leading QEMU's abnormal exit.
> The fix would
> be to avoid the reconfiguration on the realm. The issue was originally
> reported by
> Fujitsu and all the information has been shared to Fujitsu.
> 
> 4. In QEMU, the CPU property 'kvm-no-adjvtime' can't be set to off.
> Otherwise, QEMU
> tries to access the timer registers, which have been hidden by the host.
> So we need
> to take the parameter (for QEMU) to by pass it: "-cpu host,kvm-no-
> adjvtime=on".
> 
> 5. I didn't try virtio-mem and memory balloon, which isn't expected to
> work, especially
> when the guest memory is hot added or hot removed.
> 
> Thanks,
> Gavin
> 
> 


