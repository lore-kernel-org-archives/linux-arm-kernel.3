Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B7FD44167
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYtPFqDBrsIXWeM6Bj2yn9iL8d0RcBuroM9tYLE1h/Y=; b=ZiFK4XRLDTA9C05fN3OQBg/kIS
	V9JRozNp9wV8Qj+Z1vZOQm2xzgAYy93FOlMFXXuwfqlKr+c9UoT18FG8GEsFdx0i7JRlfTKWZYvqD
	3f+RQbn03hOMcT+wjRZEQvn0lV1+fj0WRn14uFjtm9Hdx9CHLSJIkVQPAA3apSeAm9MVhQddtgOdm
	lZJOvIH1k8ZR8WSpvv8wIbwELVtIn7CpbZYKoxAYnAfzAb5TJHHYvpZdfb3+dYQ5Ha2jUkODVGyFz
	cOqbq/LSgn6hIIN5muCmSoHOIrMv9nECeyzFIDqB3dVm+v+FvcH/een/K8RDVx6urbVNLh0yVR7tA
	wX/wCDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQDx-0000000CruI-3ms0;
	Tue, 19 Nov 2024 15:33:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQD1-0000000Crnq-1T5N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:32:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B17A20E3;
	Tue, 19 Nov 2024 07:32:33 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C1D93F5A1;
	Tue, 19 Nov 2024 07:32:02 -0800 (PST)
Date: Tue, 19 Nov 2024 15:31:59 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	jonathan.cameron@huawei.com, xiexiuqi@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 0/6] arm_mpam:
 Introduce the Narrow-PARTID feature for MPAM driver
Message-ID: <Zzyvbx9uubrLNv1C@e133380.arm.com>
References: <20241119135104.595630-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119135104.595630-1-zengheng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_073207_480791_B3E3A637 
X-CRM114-Status: GOOD (  37.31  )
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

Hi,

On Tue, Nov 19, 2024 at 09:50:58PM +0800, Zeng Heng wrote:
> The patch set is applied for mpam/snapshot/v6.12-rc1 branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
> repository.
> 
> This patch set is fully compatible with x86 RDT functionality.
> 
> The narrow-partid feature in MPAM allows for a more efficient use of
> PARTIDs by enabling a many-to-one mapping of reqpartids (requested PARTIDs)
> to intpartids (internal PARTIDs). This mapping reduces the number of unique
> PARTIDs needed, thus allowing more tasks or processes to be monitored and
> managed with the available resources.
> 
> Intpartid(Internal PARTID) is an internal identifier used by the hardware
> to represent a specific resource partition. It is a low-level identifier
> that the hardware uses to track and manage resource allocation and
> monitoring.
> 
> Reqpartid(Request PARTID) is an identifier provided by the software when
> requesting resources from the memory system. It indicates the desired
> partition for resource monitoring. By using reqpartids, software can
> monitor specific resources or allow the system to subdivide smaller
> granularity partitions within existing partitions to serve as monitoring
> partitions.
> 
> For the new rmid allocation strategy, it will check whether there is an
> available rmid of any reqPARTID which belongs to the input intPARTID.
> 
> The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs,
> with a specific illustration as follows:
> 
> m - Indicates the number of reqPARTIDs per intPARTID
> n - Indicates the total number of intPARTIDs
> (m * n) - Represents the total number of reqPARTIDs
> 
> intPARTID_1 = 0
>     ├── reqPARTID_1_1 = 0
>     ├── reqPARTID_1_2 = 0 + n
>     ├── ...
>     └── reqPARTID_1_m = 0 + n * (m - 1)
> 
> intPARTID_2 = 1
>     ├── reqPARTID_2_1 = 1
>     ├── reqPARTID_2_2 = 1 + n
>     ├── ...
>     └── reqPARTID_2_m = 1 + n * (m - 1)
> 
> ...
> 
> intPARTID_n = (n - 1)
> 
> Each intPARTID has m reqPARTIDs, which are used to expand the number of
> monitoring groups under the control group. Therefore, the number of
> monitoring groups is no longer limited by the range of MPAM PMG, which
> enhances the extensibility of the system's monitoring capabilities.


The idea of mapping multiple reqPARTIDs to each resctrl control group
looks like it can work, but I think that there are some issues that
need to be considered:


1) There may be a mixture of MSCs in the system, some of which support
PARTID Narrowing and some of which do not.  Affected MSCs will not be
able to regulate resource consumption for a single resctrl control
group as a single unit, if multiple reqPARTIDs are used.

This matters when an MSC that does not support PARTID Narrowing also
has resource controls that are not of the "partition bitmap" type.

(Consider a resctrl control partition that throttles the partition to
30% of memory bandwidth.  How can the same behaviour be achieved if the
partition is split arbitrarily across multiple reqPARTIDs?)

Because the MPAM driver needs to be as general as possible, it may be
hard to make the "right" decision about whether to group reqPARTIDs to
provide more monitoring groups.  because different use cases may have
different requirments (e.g., number of control groups versus number of
monitoring groups, and which types of control are useful).


2) The resctrl core code uses CLOSIDs and RMIDs to identify control
groups and monitoring groups.  If a particular driver wants to
translate these into other values (reqPARTID, intPARTID, PMG) then it
can do so, but this mapping logic should be encapsulated in the driver.
This should be better for maintainability, since the details of the
remapping will be arch-specific -- and in general not all arches are
going to require it.  With this in mind, I think that changes in the
resctrl core code would be minimal (perhaps no changes at all).


3) How should the amount of reqPARTID grouping (your "n" parameter) be
determined, in general?

As with (1), the right answer may depend on the use case as well as on
the hardware.

From my investigations into this, I feel that some configuration
parameters will probably be needed, at least at boot time.


4) If the mapping between reqPARTIDs and (CLOSID,RMID) pairs is static,
is it necessary to track which reqPARTIDs are in use?  Would it be
simpler to treat all n reqPARTIDs as permanently assigned to the
corresponding CLOSID?

If reqPARTID usage is not tracked, then every control change on MSCs
that do not support PARTID Narrowing would need to be replicated across
all reqPARTIDs corresponding to the affected resctrl control partition.
But control changes are a relatively rare event, so this approach feels
acceptable as a way of keeping the driver complexity down.  It partly
depends on how large the "n" parameter can become.


(Since PARTID Narrowing allows any arbitrary set of reqPARTIDs to be
mapped to a given intPARTID, it might be possible to allocate
reqPARTIDs completely dynamically.  But this probably would require a
change to the resctrl core interface.  It is also not clear to me
whether the "num_closids" and "num_rmids" values advertised to
userspace can be satisfied.  For now, static allocation seems the most
straightforward way to to get better monitoring, but perhaps it could
be enhanced later on.)

[...]

Cheers
---Dave

