Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B029BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A5plRENR+6hcn+NB/3J+YPI6tVFhPwktPXdd0DO7po=; b=2HJEYfphZMC4YsH5nmjwXgUX/y
	+HZla+ux/0dKyxDDfJSLS7P0DBQcrQpkBiz4GZIPNLYmJEmsE0CIkjNjtX/qmx6NI2wn1hVH7+HSZ
	o/VGTY31qubSUDdfKmZmxVtw/wt4cQu2J7G1RV5CXf95k0KBmiHB/1EPluwHaFPBodsJ34unFZQ35
	6oX/MplEhJBERH7LooX1h0akCPTaTYmjP7IaiPAdGrO4dkRa2S3fbujs4LQSdHcxUmDocpWmOZGVz
	oVeMwu6QL+hAD4oiPBsc+evY/jNH9fjfgx2pOXx49G5RpSPo94GiW5R5h3CytpzQU9JMKLdhNNHkO
	eqmy8srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmkr-000000018QN-2Q7g;
	Thu, 12 Dec 2024 17:13:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlt4-00000000w8P-1o1m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:18:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A6081764;
	Thu, 12 Dec 2024 08:18:28 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B6213F720;
	Thu, 12 Dec 2024 08:17:59 -0800 (PST)
Date: Thu, 12 Dec 2024 16:17:56 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 0/5] arm_mpam:
 Introduce the Narrow-PARTID feature for MPAM driver
Message-ID: <Z1sMtF9bvw5NZOC6@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207092136.2488426-1-zengheng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081802_564287_F093FAB2 
X-CRM114-Status: GOOD (  26.99  )
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

On Sat, Dec 07, 2024 at 05:21:31PM +0800, Zeng Heng wrote:
> The patch set is applied for mpam/snapshot/v6.12-rc1 branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
> repository.
> 
> The narrow-partid feature in MPAM allows for a more efficient use of
> PARTIDs by enabling a many-to-one mapping of reqpartids (requested PARTIDs)
> to intpartids (internal PARTIDs). This mapping reduces the number of unique
> PARTIDs needed, thus allowing more tasks or processes to be monitored and
> managed with the available resources.
> 
> For a mixture of MSCs system, for MSCs that do not support narrow-partid,
> we use the PARTIDs exceeding the number of closids as reqPARTIDs for
> expanding the monitoring groups.

Mixed systems still seem not to be handled completely by this series?

You do cope with the scenario where some MSCs support Narrowing and
some do not, but there is still the problem of incompatible controls.

If a non-Narrowing MSC has controls that are not of the "partition
bitmap" type, then splitting a resctrl control group across multiple
PARTIDs is going to change the hardware regulation behaviour.  There
does not seem to be any way to work around this be programming
different control values (for example).  So, there may be over- or
under-allocation of resources compared with what the user requests in
resctrlfs.

So, I think there is still a need to check which controls are present,
and either disable the use of non-identity intPARTID<->reqPARTID
mappings if incompatible controls are present (or don't expose those
controls to resctrl).

(If you were not trying to address this issue yet then that is not a
problem for an RFC, but it is best to be clear about the
limitations...)

> In order to keep the existing resctrl API interface, the rmid contains both
> req_idx and PMG information instead of PMG only under the MPAM driver. The
> req_idx represents the req_idx-th sub-monitoring group under the control
> group. The new rmid would be like:
> 
>     rmid = (req_idx << shift | pmg).
> 
> The new conversion relationship between closid/rmid and (req)PARTID/PMG is:
> 
>     (req)PARTID = (rmid.req_idx * n) + closid,
>     PMG = rmid.pmg.
> 
> Each intPARTID has m reqPARTIDs, which are used to expand the number of
> monitoring groups under the control group. Therefore, the number of
> monitoring groups is no longer limited by the range of MPAM PMG, which
> enhances the extensibility of the system's monitoring capabilities.
> 
> ---
> Compared with v1:
>   - Rebase this patch set on latest MPAM driver of the v6.12-rc1 branch.
> 
> Compared with v2:
>   - Refactor closid/rmid pair translation
>   - Simplify the logic of synchronize configuration
>   - Remove reqPARTID pool
> ---

This approach looks reasonable overall, and in this version the changes
do seem to be better localised in the mpam_resctrl.c glue code now.

I had also been working on a similar approach, so I have posted it for
comparison [1] -- though the two approaches are doing pretty much the
same thing, some details differ.

(Note, I have not addressed PARTID Narrowing at all yet; however,
I think more thought is needed for that.)


Note: Are there bisection issues with some of the patches in the
series?  It looks like not all of the ID conversions are applied in the
same patch, so I'm wondering whether strange behaviour may be seen at
the intermediate commits.

Cheers
---Dave


[1] [RFC PATCH 0/6] Introduce flexible CLOSID/RMID translation
https://lore.kernel.org/lkml/20241212154000.330467-1-Dave.Martin@arm.com/

