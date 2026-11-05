Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DD606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeMu2RNa;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VVZcxHIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e+3EkuIwBIYa/pzYl4lmmZvtc2fUKvaNoTpHxcQ8xL0=; b=AeMu2RNa0gc/4y7nXk449hVMKu
	5tHMzNF5Arf00qNnEf8Z+7ORnPO2h3QszT1iskc9XHBujNMyJeSn5Y652xQloMGfrPHDy6qQzSKrK
	RfLx2caOVeNi5gfTDTvPVoIZa2MTQIsEU9nROmJeU7/P8ib5OlyEeQnsoK6OWvZyZHZErEEk0JhX2
	SQ4AatkQLCYSX+dECDQ5Faau2h7hjdHB3xjwZOOgJsrCD/wcx8J73EvhstGq/XNDHQQtyeFaaNLT6
	3IPd3m+MqWE6nayaWJEY1qaHwET531rTuGMeUCRYZjxfJUY+m/tSAxsdzAsl2useJZ5KWUFKeXdn8
	8ac4pgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsE8-000000083H5-2gWw;
	Thu, 05 Nov 2026 07:49:40 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsE1-000000083Fk-1TDl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:49:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=e+3EkuIwBIYa/pzYl4lmmZvtc2fUKvaNoTpHxcQ8xL0=;
	b=VVZcxHIM9PhL67RrigzJjiiTvnlifhcQKpZh2ZIYjbvoILjNOMHnpknk30+AUjRhECxp10Tl7
	OuNuCy8gYf2I5pyKB7WQ9O/k2zDT3SQAW8WCnBASqCopILpkVXXglmR+xtyHcor/vILUfQPO4hi
	W+bWnlp0mQxMXGmEWUeqBCo=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jKvbG10qhznTVh;
	Thu,  5 Nov 2026 15:49:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F30B40572;
	Thu,  5 Nov 2026 15:49:28 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:49:27 +0800
Message-ID: <4831fb24-85f2-4273-9cf8-9ac60dd6555f@huawei.com>
Date: Thu, 5 Nov 2026 15:49:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/15] arm64: entry: Convert to Generic Entry
To: Linus Walleij <linusw@kernel.org>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
 <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
 <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_234935_685072_CFC673B2 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, linux-kselftest@vger.kernel.org, will@kernel.org, shuah@kernel.org, peterz@infradead.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, kevin.brodsky@arm.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/4 21:38, Linus Walleij 写道:
> On Mon, Oct 26, 2026 at 9:52 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> Hi Mark and all,
>>
>> Ping.
>>
>> Are there any further review comments or new suggestions for changes?
>> I’m happy to address anything that comes up.
> 
> You're pinging in the middle of the merge window, people are busy!

Hi Linus,

Sorry for pinging during the merge window.

> 
> Now that v7.4-rc1 is out, rebase on v7.4-rc1 and resend please.

No problem. Will rebase on v7.4-rc1, retest and resend. Thank you!

> 
> Sorry that this requires constant rebasing and resending, generic
> entry is so intrusive that we need to take baby steps... maybe we

System calls path seem to be more deterministic than the interrupt path.
However, considering that arm64 is widely used and this is in a critical
system path, it is indeed necessary to think twice before proceeding.

> can merge some of the patches and not yet all? I.e. a trickle-in
> method?
Ensure there are no functional changes, a trickle-in works for me.
And it may give me more confidence to move forward 😂

> 
> Yours,
> Linus Walleij

-- 
Best regards,
Jinjie


