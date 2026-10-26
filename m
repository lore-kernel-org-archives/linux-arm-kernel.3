Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I7zK9HPI;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=oVPQn6sL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YdEI+p6jv0sS8rZSJUqdhDsNGa61fFMt9xG3DcZgZbs=; b=I7zK9HPI/XVOvd
	SI5hOZlSj6fp5w90YrDPuL9K+SV85FzGlklhIePfwoJH1JN6Mc4Mq1dNjYnQb/m9nmVNaKAVpQd7O
	VQ1nup0AtNktl5nHzBzV1WNrhN59UmY2jkLVnP1EWLXHx9L2AVrBeCsU5SYBnNcyRiWLqSSHjUyQV
	GlGGkjYxIxHouDQspANDxl0xBF37WXVUWuUXZFUJv4AxBUEGtPbVYxumfqSM8OWmLkW2n07sPcwgy
	YWUR7eT8yyBBTXz63Oe9mjD9m9kS/ag+dQTXrgjuySgQ5pmEuMv4N96ANWwcg9VvHNs8G6pmOfoNA
	wkb12YXZnn1Ye/5rTdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFwr-00000001w8S-0HoY;
	Mon, 26 Oct 2026 08:20:53 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFwn-00000001w7x-37qE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:20:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YdEI+p6jv0sS8rZSJUqdhDsNGa61fFMt9xG3DcZgZbs=;
	b=oVPQn6sLHuRWMbiYz8fauQ35o+f8hfS6lNAgFzK9Y2UlBdudqI9MTAS1a0inhE9oWBgK5CfLa
	Pu6Ecwyu2JCYziujEzihrXiFoS/cWVofRT7AOa+uDl2ZO7GTj8OBO+6jxKL9evIpHLmoDNi7VhS
	hx5g9ytLyLRHjdxyu82TBQs=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jCmlV2VMXzcbZ0;
	Mon, 26 Oct 2026 16:20:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C3D840561;
	Mon, 26 Oct 2026 16:20:32 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 16:20:31 +0800
Message-ID: <90e7109f-4953-436b-ac77-d801da6deb88@huawei.com>
Date: Mon, 26 Oct 2026 16:20:30 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
	<fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu
	<yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, Richard Cheng
	<icheng@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
 <87ecba5b-e396-45db-bab0-4eff0f30cb25@huawei.com>
 <96795f1b-08ff-4d26-9b51-8c54bcbe537d@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <96795f1b-08ff-4d26-9b51-8c54bcbe537d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_012050_135679_FEE704FA 
X-CRM114-Status: GOOD (  19.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/23 22:51, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/22/26 6:23 PM, Jinjie Ruan wrote:
>>
>>
>> 在 2026/9/1 1:22, Fenghua Yu 写道:
>>> This series enables MBA bandwidth control emulation on ARM MPAM when the
>>> default MB control is disabled, using a node-scoped MB_NODE control as
>>> the native backend.  It extends memory-bandwidth monitoring and
>>
>> Hi everyone,
>>
>> We also have the requirement for the MPAM node-scoped MB_NODE control.
>> Are there any follow-up plans for this feature?
>>
>> Is there anything I can help with?
>>
> 
> ...
> 
>>>
>>> Apply the patches on top of [2].
>>>
> 
> ...
> 
>>>
>>> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
>>> which is on top of [2].
>>>
> 
> ...
> 
>>>
>>> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Concept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
>>> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
>>>
> This work depends on [2] around which I believe all discussions have now settled
> with the planned changes shared during LPC:
> https://lpc.events/event/20/contributions/2368/attachments/2066/4625/resctrl_2026_combined.pdf
> 
> Please note, as highlighted in 
> 
> 	https://lore.kernel.org/lkml/9d2f589a-7d10-44ee-a7a4-7d75d860e988@arm.com/

Hi Reinette，

Thank you very much for sharing.

> 
> as well as the LPC presentation, that the support for MB_NODE is planned to look
> different from what is presented in this RFC.
> 
> Upstreaming of [2] started with two series currently outstanding:
> 
> "x86,fs/resctrl: Cleanups in preparation for multiple controls support"
> 	https://lore.kernel.org/lkml/cover.1791406459.git.reinette.chatre@intel.com/
> 
> "arm_mpam: resctrl: Separate MPAM domains"
> 	https://lore.kernel.org/lkml/cover.1792443633.git.reinette.chatre@intel.com/

Let me start with these two patch sets.

> 
> I see that you already started to take a look at the MPAM changes. That is much appreciated.
> Any reviews are much appreciated.
> 
> Once the above two outstanding series land I will work on the next batch of the foundational
> work on which the MB_NODE support can be created.


Thank you for your detailed guidance. I will keep pace with everyone and
help review and test the latest upstream changes.

> 
> Reinette

-- 
Best regards,
Jinjie


