Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDC2D10DC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8w7mkKLPAy8yAOEjS5yPmGXghTGpkocvUp6or0YXsQ=; b=kl49HpbKHN7OMs0IImp4nSmRcf
	S0oIZXUkc2hYBNqsYzxqD7OwsARxywHFesb+e3BmgEnTFLk4pKh8kwoGSPxLJpLTwtcy0X5FSyx/t
	LQapOPJdTsoAnjm2GjCfs90gUxZJvcrSOxlY5ycX18RR+fBB4yo23w9zSDv7D3ufnKp28TSfwU4gm
	6kU/EDrZhyDZAgPfjcYFYzOzdLy41gEG2pxSd6C7ZQ4VDS9A7c1+krhD7M+/wYeW+Z9VRD2v3lXtb
	T4m4mzAQgX2pZIu78p3c+hsLYg4jOd54nVEt7eaTzsQf0ANMaWsI9bPuuV4xnd2lbiiiHKAutSJ6Q
	SPGMvejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Dw-00000005TnU-1DJ0;
	Mon, 02 Dec 2024 08:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2CC-00000005TQD-3ZvA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABE041063;
	Mon,  2 Dec 2024 00:54:46 -0800 (PST)
Received: from [10.57.90.186] (unknown [10.57.90.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A3BA3F71E;
	Mon,  2 Dec 2024 00:54:13 -0800 (PST)
Message-ID: <01205247-ffcd-439f-b00f-d8e70720d049@arm.com>
Date: Mon, 2 Dec 2024 08:54:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/43] arm64: Support for Arm CCA in KVM
To: Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20241004152804.72508-1-steven.price@arm.com>
 <Z01BYOgsLXV5yULk@vm3>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <Z01BYOgsLXV5yULk@vm3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_005420_941923_C9DB8550 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Itaru,

On 02/12/2024 05:10, Itaru Kitayama wrote:
> On Fri, Oct 04, 2024 at 04:27:21PM +0100, Steven Price wrote:
>> This series adds support for running protected VMs using KVM under the
>> Arm Confidential Compute Architecture (CCA).
...
> 
> On FVP, the v5+v7 kernel is unable to execute virt-manager:
> 
> Starting install...
> Allocating 'test9.qcow2'                                    |    0 B  00:00 ...
> Removing disk 'test9.qcow2'                                 |    0 B  00:00
> ERROR    internal error: process exited while connecting to monitor: 2024-12-04T18:56:11.646168Z qemu-system-aarch64: -accel kvm: ioctl(KVM_CREATE_VM) failed: Invalid argument
> 2024-12-04T18:56:11.646520Z qemu-system-aarch64: -accel kvm: failed to initialize kvm: Invalid argument
> Domain installation does not appear to have been successful.

Can you check that the kernel has detected the RMM being available, you
should have a message like below when the host kernel is booting:

kvm [1]: RMI ABI version 1.0

My guess is that you've got mismatched versions of the RMM and TF-A. The
interface between those two components isn't stable and there were
breaking changes fairly recently. And obviously if the RMM hasn't
initialised successfully then confidential VMs won't be available.

> Below is my virt-manager options:
> 
> virt-install --machine=virt --arch=aarch64 --name=test9 --memory=2048 --vcpu=1 --nographic --check all=off --features acpi=off --virt-type kvm --boot kernel=Image-cca,initrd=rootfs.cpio,kernel_args='earlycon console=ttyAMA0 rdinit=/sbin/init rw root=/dev/vda acpi=off' --qemu-commandline='-M virt,confidential-guest-support=rme0,gic-version=3 -cpu host -object rme-guest,id=rme0 -nodefaults' --disk size=4 --import --osinfo detect=on,require=off
> 
> Userland is Ubuntu 24.10, the VMM is Linaro's cca/2024-11-20:
> 
> https://git.codelinaro.org/linaro/dcap/qemu/-/tree/cca/2024-11-20?ref_type=heads

I don't think this is the latest QEMU tree, Jean-Philippe posted an
update last week:

https://lore.kernel.org/qemu-devel/20241125195626.856992-2-jean-philippe@linaro.org/

I'm not sure if there were any important updates there, but there are
detailed instructions that might help.

Regards,
Steve


