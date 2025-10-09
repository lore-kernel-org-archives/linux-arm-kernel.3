Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/cvXYV+hxWMnanGdIDZWS1tw4x4tFrqfjfsPvwnguo=; b=w3e7K6LrJivtXtgeD33wycAt0Y
	54hP5xoeWIxfvk8rVmsw0/s3tx4elim+yiZ6aquiqfg5Ydp3MBx0i7+kcmgW5nyKiPUzRjpv9TBtW
	n7AIq7ffOi4ol/DTKZyLG9UGDAC+L09SM8qBHD5whch5YlibMNmBImCKwrl6wDhIwLLCpzuWLtkjB
	lxyo6Elwd9SqogaPRnWCZ9LtHFlKS5yofbqdzO+aK2Wj9sRG/txSfz36o6pSbXXpQiR3QEqdfqiEA
	zLm0yuZmViZdaolK6RicHdVa1AbZ4d6xn0VeLzhkbBnHUjwlBrUz/AvbLKxQA/yo+CabFHXqng5dC
	wG8K/R+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6r0m-00000006GUs-0mkp;
	Thu, 09 Oct 2025 13:48:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6r0k-00000006GUe-41ci
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Oct 2025 13:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a/cvXYV+hxWMnanGdIDZWS1tw4x4tFrqfjfsPvwnguo=; b=OGOSpYBMIAFeK3BvUzJiR1Nvn6
	WkBqMnZu7xe6dua0ZSf97EtQ7EQXREfUk3F2h9clN+1O1b4KoQJF0w8LkGnHqKo2ppGYiZHua/gYu
	/Z+fTTTP9T+4BhXy1TKw/j3edbwu164C315ONu8Wqwb4zsC2oFHAjNavfAc9kuDEj72vuc/ubLO4E
	VXXqlnbWkQr7qNcRuUfsC1wOTyZwrmm5w+Qo68XQI9FVCSpKHWSSwziyADo+uRoWf0ohwYUQdvaAP
	ZVhXZfIXqQ/AtQyKKUhtG3vvhPeYRYAdQYwZB62NS2umCUIMFC20BxkGPst0M7DwNnMjXob0sfgaa
	SVzdTsPA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6r0h-00000001TwP-3KkA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 13:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8990442CC0;
	Thu,  9 Oct 2025 13:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1EFC4CEE7;
	Thu,  9 Oct 2025 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760017723;
	bh=yOPE8FhFDCKAnOAaZuxzb+46ozcT2L+rNhVYaTDtEeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VFhfxFsOcKAv6SuuT9uUV+W7DSKX5NHkXLEwuebXTq960Mh+d+BxtGNrg49a3GhYO
	 nUO43NHbDniYGBAJcuxgW2VVDoWgd8VmLPIDhNmuB9KNoUe8QtnPn87MEtOOYBvRJw
	 zZUZbd0T7oLmWSg2ITUD0JuWF5ZAWFwA+E48LEZLJt4Z1zkGggXKx91DXYqN6ppHbq
	 /joUKuXXMHyFj/KBvSNAvTFu3p7Fw5xqHWAxsgQTpGTcWF0bImEe4DQprDD1hssyQa
	 aHE+XCY8GjSpmxnBWvkOL/VNfc3SmM36mXerFaQtRHb+LYJ/N/6icGB/8rM5ZKfDAL
	 adoGttQ4AJ1/g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v6r0a-0000000Ce22-2vNk;
	Thu, 09 Oct 2025 13:48:40 +0000
Date: Thu, 09 Oct 2025 14:48:40 +0100
Message-ID: <86v7koxk1z.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: salil.mehta@opnsrc.net
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	salil.mehta@huawei.com,
	jonathan.cameron@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	james.morse@arm.com,
	sudeep.holla@arm.com,
	lpieralisi@kernel.org,
	jean-philippe@linaro.org,
	tglx@linutronix.de,
	oliver.upton@linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	andrew.jones@linux.dev,
	mst@redhat.com,
	david@redhat.com,
	philmd@linaro.org,
	ardb@kernel.org,
	borntraeger@linux.ibm.com,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	npiggin@gmail.com,
	linux@armlinux.org.uk,
	karl.heubaum@oracle.com,
	miguel.luis@oracle.com,
	darren@os.amperecomputing.com,
	ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com,
	gankulkarni@os.amperecomputing.com,
	wangyanan55@huawei.com,
	wangzhou1@hisilicon.com,
	linuxarm@huawei.com
Subject: Re: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow lockless read when ready
In-Reply-To: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: salil.mehta@opnsrc.net, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, jonathan.cameron@huawei.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, james.morse@arm.com, sudeep.holla@arm.com, lpieralisi@kernel.org, jean-philippe@linaro.org, tglx@linutronix.de, oliver.upton@linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, andrew.jones@linux.dev, mst@redhat.com, david@redhat.com, philmd@linaro.org, ardb@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org, gustavo.romero@linaro.org, npiggin@gmail.com, linux@armlinux.org.uk, karl.heubaum@oracle.com, miguel.luis@oracle.com, darren@os.amperecomputing.com, ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, gankulkarni@os.amperecomputing.com, wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_144848_249338_E59B9538 
X-CRM114-Status: GOOD (  17.76  )
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

On Wed, 08 Oct 2025 21:19:55 +0100,
salil.mehta@opnsrc.net wrote:
> 
> From: Salil Mehta <salil.mehta@huawei.com>
> 
> [A rough illustration of the problem and the probable solution]
> 
> Userspace reads of ICC_CTLR_EL1 via KVM device attributes currently takes a slow
> path that may acquire all vCPU locks. Under workloads that exercise userspace
> PSCI CPU_ON flows or frequent vCPU resets, this can cause vCPU lock contention
> in KVM and, in the worst cases, -EBUSY returns to userspace.
> 
> When PSCI CPU_ON and CPU_OFF calls are handled entirely in KVM, these operations
> are executed under KVM vCPU locks in the host kernel (EL1) and appear atomic to
> other vCPU threads. In this context, system register accesses are serialized
> under KVM vCPU locks, ensuring atomicity with respect to other vCPUs. After
> SMCCC filtering was introduced, PSCI CPU_ON and CPU_OFF calls can now exit to
> userspace (QEMU). During the handling of PSCI CPU_ON call in userspace, a
> cpu_reset() is exerted which reads ICC_CTLR_EL1 through KVM device attribute
> IOCTLs. To avoid transient inconsistency and -EBUSY errors, QEMU is forced to
> pause all vCPUs before issuing these IOCTLs.

I'm going to repeat in public what I already said in private.

Why does QEMU need to know this? I don't see how this is related to
PSCI, and outside of save/restore, there is no reason why QEMU should
poke at this. If QEMU needs fixing, please fix QEMU.

Honestly, I don't see why the kernel should even care about this, and
I have no intention of adopting anything of the sort for something
that has all the hallmarks of a userspace bug.

	M.

-- 
Without deviation from the norm, progress is not possible.

