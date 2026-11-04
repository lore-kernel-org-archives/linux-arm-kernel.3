Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B35D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 01:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QJyboj31;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Q2Z34R/F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lYMX9gV6Dojh3jBu+0B6wZGmoQtuUvF5WWAGmG743YU=; b=QJyboj3171Seap
	6QTefeBKS1CO029lyekqmIIid+JZGdbLfzTTMeaEuZCpptSZCKjdYdkHJprg4TLuruYorQfx3ztSF
	eeJ9j3OjbpLacSN+SIfyW65zK2P/o9ItjC9moclhOTI08Lmth9LlATM0Y4fa+NlHrgkGQMYoMDDb/
	lAPtktWkbJ9sUWccU9qZ+lE+E+9m8XZKU9Kh0w2eGs/dX/mmk2KFfV0bbcu7KFmrT1GZx4euvstWc
	loJKmaREIUF7Z1gE6PAmsT8ZTIEvLad2RVABrTFNSZQstitpkNWVTnuplP6YFmh2fwVIHNkoPEuKu
	GEmQi17dw6088ta3gSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPZt-000000044DW-1Wr7;
	Wed, 04 Nov 2026 01:14:13 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPZo-000000044Cs-3NB5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 01:14:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lYMX9gV6Dojh3jBu+0B6wZGmoQtuUvF5WWAGmG743YU=;
	b=Q2Z34R/FZisDKgb2p9yXIy3A3J8SAI3gYAMlNgfl6mnpIew1xbRm/q032ff67OuoMTna4vY86
	4hp0rcrdc2QqBcM/C2C60GZyK7SweVsX6y9N/JdhR0kH2AbsiLsKrGXkYT24a1lKrx3/tw1KI7R
	5fQi1SsdDBUbF58sbH87d0c=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jK6sC0FtKz1d056;
	Wed,  4 Nov 2026 09:13:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E8B914057C;
	Wed,  4 Nov 2026 09:14:01 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 09:14:01 +0800
Message-ID: <e63525ac-e0ee-4c69-9390-a1e9805eb716@huawei.com>
Date: Wed, 4 Nov 2026 09:14:00 +0800
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
 <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
 <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171410_123268_DBAD77D6 
X-CRM114-Status: GOOD (  10.40  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/3 21:02, Daniel Pereira 写道:
> On Tue, Nov 03, 2026 05:59 AM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
> Hi Jinjie,
> 
>> This is an outdated message leftover by mistake; please ignore it.
> 
> Thanks for clarifying. Will the commit message be fixed in the next
> version, or will the patch go forward as it is? I ask because the stale
> sentence ("Say why a bandwidth counter is assigned for the life of the
> monitoring group...") would otherwise end up in the git history.

Will delete it. Thank you!

> 
> 
> Thanks,
> Daniel

-- 
Best regards,
Jinjie


