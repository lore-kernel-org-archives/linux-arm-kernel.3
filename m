Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD155E6ADEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3s9b2T8bKTUgD7rJdbzWSKwVIyRA40JlCQGgsSGFNQ=; b=0WkUcPp25MnbIJwoU4lc4cXkdz
	c3ERVgWpo2jluf+LxduK+la0Rny0R7wUw4DGJIWTFaUWjcmR5AfuPt1XK/VfrjHNktXOCHG9PXugV
	Li51aqA9O9pTl9TcZJPA4GIJCwdz0i+5n+seYcwQ50I78wpLAcx3JlaRO3EUZJBfwdp4muqVkby7E
	R7wXfchf+gFh25mMKBZYh8sXJiq4W+wa7zHg/j6TREli3N5qEnsG94tzr2masjsYNt6DgQpAYxy/t
	0rN4ZB6Z1VZz0fswfAAl5WLUs2ns3Qz4PK3hY8TP194RbVYVll3QVY+EwHAEZulVZI5Xe7HIW/ern
	P/C/FUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEmXv-0000000427w-3zeU;
	Sat, 23 Nov 2024 09:35:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEmWy-0000000422u-38Ng
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 09:34:22 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XwRb04NvjzRhqN;
	Sat, 23 Nov 2024 17:32:44 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 2AC67140159;
	Sat, 23 Nov 2024 17:34:10 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 23 Nov 2024 17:34:09 +0800
Message-ID: <c5c5de75-151b-e6bd-952e-606326b46e9a@huawei.com>
Date: Sat, 23 Nov 2024 17:34:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Zeng Heng <zengheng4@huawei.com>
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 0/6] arm_mpam:
 Introduce the Narrow-PARTID feature for MPAM driver
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <xiexiuqi@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <bobo.shaobowang@huawei.com>
References: <20241119135104.595630-1-zengheng4@huawei.com>
 <Zzyvbx9uubrLNv1C@e133380.arm.com>
Content-Language: en-US
In-Reply-To: <Zzyvbx9uubrLNv1C@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_013421_113942_9122DF46 
X-CRM114-Status: GOOD (  31.59  )
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

   Thanks for comments!

On 2024/11/19 23:31, Dave Martin wrote:
>
> 1) There may be a mixture of MSCs in the system, some of which support
> PARTID Narrowing and some of which do not.  Affected MSCs will not be
> able to regulate resource consumption for a single resctrl control
> group as a single unit, if multiple reqPARTIDs are used.
>
> This matters when an MSC that does not support PARTID Narrowing also
> has resource controls that are not of the "partition bitmap" type.
>
> (Consider a resctrl control partition that throttles the partition to
> 30% of memory bandwidth.  How can the same behaviour be achieved if the
> partition is split arbitrarily across multiple reqPARTIDs?)
>
> Because the MPAM driver needs to be as general as possible, it may be
> hard to make the "right" decision about whether to group reqPARTIDs to
> provide more monitoring groups.  because different use cases may have
> different requirments (e.g., number of control groups versus number of
> monitoring groups, and which types of control are useful).

1. The patch set solution is designed considering mixed MSC scenarios.

Regarding the definition of the quantity 'n', here is a detailed

explanation:

n - Indicates the total number of intPARTIDs

l - Represents the total number of reqPARTIDs

m - Indicates the number of reqPARTIDs per intPARTID

The values of n/l/m are derived from the following formula:

n = min(intPARTID-np, PARTID-nnp)

l = min(reqPARTID-np, PARTID-nnp)

m = l // n

reqPARTID-np -- The number of reqPARTIDs supported by MSCs that support
          narrow-partid.

intPARTID-np -- The number of intPARTIDs supported by MSCs that support
          narrow partid.
PARTID-nnp  -- The number of PARTIDs supported by MSCs that do not support
          narrow partid.

The software needs to ensure that 'm' is an integer, meaning the number of

supported reqPARTIDs is an integer multiple of 'n'.

To illustrate how to determine n, l, and m through examples, we can assume

a specific platform:

L3  - Supports the narrow PARTID feature, supports 32 intPARTIDs, and

     supports 256 reqPARTIDs.

mata - Does not support the narrow PARTID feature, supports a range of

     256 PARTIDs.

Then，

n = min(intPARTID-l3, PARTID-mata) = min(32, 256) = 32

l = min(reqPARTID-l3, PARTID-mata) = min(256,256) = 256

m = 256 / 32 = 8

The mapping relationships between each group's closid and the respective

MSCs' intPARTID/reqPartid/PARTID are illustrated:

P - partition group

M - monitoring group

Group: Closid        MSCs with narrow-partid      MSCs without narrow-partid
P1  : 0            intPARTID_1            PARTID_1
M1_1 : 0              ├── reqPARTID_1_1       ├── PARTID_1_1
M1_2 : 0+n             ├── reqPARTID_1_2       ├── PARTID_1_2
...                ├── ...            ├── ...
M1_m : 0+n*(m-1)          └── reqPARTID_1_m       └── PARTID_1_m

P2  : 1          intPARTID_2            PARTID_2
M2_1 : 1             ├── reqPARTID_2_1       ├── PARTID_2_1
M2_2 : 1+n            ├── reqPARTID_2_2       ├── PARTID_2_2
...                ├── ...            ├── ...
M2_m : 1+n*(m-1)         └── reqPARTID_2_m       └── PARTID_2_m

Pn  : (n-1)        intPARTID_n            PARTID_n
Mn_1 : (n-1)           ├── reqPARTID_n_1       ├── PARTID_n_1
Mn_2 : (n-1)+n          ├── reqPARTID_n_2       ├── PARTID_n_2
...                ├── ...            ├── ...
Mn_m : (n-1)+n*(m-1) = n*m-1   └── reqPARTID_n_m       └── PARTID_n_m

The advantages of doing this are:

   1. There is no need to modify or disrupt the existing resctrl layer

    interface, ensuring that each control group has same resource

    control functionality;

   2. MSCs that support narrow-partid (including intPARTID and reqPARTID)

    and MSCs that do not support (only including PARTID) can share the

    same PARTID space;

   3. On the premise of ensuring the (1) point, the number of control

    groups can be maximized, because users can always choose to make a

    control group act as a sub-monitoring group under another control

    group;

> 2) The resctrl core code uses CLOSIDs and RMIDs to identify control
> groups and monitoring groups.  If a particular driver wants to
> translate these into other values (reqPARTID, intPARTID, PMG) then it
> can do so, but this mapping logic should be encapsulated in the driver.
> This should be better for maintainability, since the details of the
> remapping will be arch-specific -- and in general not all arches are
> going to require it.  With this in mind, I think that changes in the
> resctrl core code would be minimal (perhaps no changes at all).
   Yes, maintaining the interface of the resctrl core code unchanged is,
in essence, the (first) important constraint of the current MPAM code.
We try the best to keep all resctrl interfaces and ensure the existing
functionality of x86 RDT.

   The only thing that falls short of being ideal (forgive me), is that
it introduces the sole new function resctrl_arch_alloc_rmid() into the
resctrl code (resctrl_arch_free_rmid() will be optimized away in the next
version, and there are no other new functions any more).

   The resctrl_arch_alloc_rmid() is the result of several restructuring
iterations and it is one of the most critical points in the patch series.

> 3) How should the amount of reqPARTID grouping (your "n" parameter) be
> determined, in general?
>
> As with (1), the right answer may depend on the use case as well as on
> the hardware.
>
> >From my investigations into this, I feel that some configuration
> parameters will probably be needed, at least at boot time.
   As mentioned earlier,
Total number of intPARTIDs: n = min(intPARTID-np, PARTID-nnp)
Total number of reqPARTIDs: l = min(reqPARTID-np, PARTID-nnp)

   We maximize the number of control groups because users can always
choose to make a control group act as a sub-monitoring group any time.

> 4) If the mapping between reqPARTIDs and (CLOSID,RMID) pairs is static,
> is it necessary to track which reqPARTIDs are in use?  Would it be
> simpler to treat all n reqPARTIDs as permanently assigned to the
> corresponding CLOSID?
>
> If reqPARTID usage is not tracked, then every control change on MSCs
> that do not support PARTID Narrowing would need to be replicated across
> all reqPARTIDs corresponding to the affected resctrl control partition.
> But control changes are a relatively rare event, so this approach feels
> acceptable as a way of keeping the driver complexity down.  It partly
> depends on how large the "n" parameter can become.
   Yes, totally agree. I will try to remove the reqPARTID bitmap and
the resctrl_arch_free_rmid(). As mentioned, this will simplify the code
logic and reduce changes to the resctrl layer code.

   Initially, to reduce the number of IPI interrupt, keep this resource
tracking until now, and I will prioritize optimization for the next
version.
  (In fact, the initial version of the patch set was dynamically allocated,
and during the code restructuring process, it was inevitable to retain
some of the original ideas.)


Best regards,
Zeng Heng

