Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48047606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OdkyxDU1;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=isrv22Qo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2Wui6IZ8+3IGT64LYdI3jyRRUf+/gPZP21F0NxyFocQ=; b=OdkyxDU1k+1w2q
	89YLCNPiaGtStyCkf+lmzMlVTn8PjIbEm9tdTdBS0qzXvanGkb7Lp5w+0Bx6x4SmY1q5yby+95fOt
	+AXq4Lu/SNo7q8krmI3a/ze02nADijNg1WRBj49gzHYWIquLYFVHGJJutYdhRPzt6PglTXRGCDpiD
	TfFwXA981SZ9r+XQXYmH3RJ9hN0iAEXmB+NGuDGlm+JdYtkp/GLMbL30hDSBPBTAeSFMxYRE62+lE
	fUfs9r+lxkL25Khqkazn6LvRHW+Sgvm/4fJE9yKislGKADoGZiuBGaVHWuNYGIao8lY2sQA/rPN17
	s5G/g1UfKySslxczrxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMI-00000001f5O-0SsC;
	Tue, 03 Nov 2026 08:59:10 +0000
Received: from [113.46.200.216] (helo=canpmsgout01.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAME-00000001f2O-33xg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:59:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2Wui6IZ8+3IGT64LYdI3jyRRUf+/gPZP21F0NxyFocQ=;
	b=isrv22QophiKZJmHwiKj18ROMvnstRKjIO5KG/TqqRwa3SnAL84BCdjX2f4IR7ndwUDmEt0vg
	3m/9phItTB9i/QXD7Df5zIhq1zWhXy9o1/Xw2X7yFJ42Ax0X5f6AxY85HkyFW13SzTiN8vvC/bI
	0tTDoXsiI2Bt3HAvPJ+LmNU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJjCp3g83z1T4GB;
	Tue,  3 Nov 2026 16:58:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BDAE64057F;
	Tue,  3 Nov 2026 16:58:48 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 16:58:47 +0800
Message-ID: <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
Date: Tue, 3 Nov 2026 16:58:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: Daniel Pereira <danielmaraboo@gmail.com>
CC: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-20-ruanjinjie@huawei.com>
 <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005907_266309_CB580A99 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/3 10:29, Daniel Pereira 写道:
> Hi Jinjie,
> 
>> Say why a bandwidth counter is assigned for the life of the monitoring
>> group: rewriting its filter restarts the count.
> 
> I could not find this explanation in the diff. Is my analysis correct,
> or was the paragraph left out of this version?

This is an outdated message leftover by mistake; please ignore it.

> 
> Thanks,
> Daniel

-- 
Best regards,
Jinjie


