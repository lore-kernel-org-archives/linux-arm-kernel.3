Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5887D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S6jrQH3/mYIWxfqJfOuabWpqho3FX73MIpk1SthbgU=; b=0WM+kcErDcIGYhcAe7iZ9taYAm
	VfnWElaLaQ4/0EssdSSM1pF1Twhh8SgKnQPw083viGtEJG0+kKsLrSL/ZQEX5MdPLoEsSEBBiDWhR
	SHwvKnnmA1b9RpymD9er85LZGuMKIvmeA6XcUkbWxUMKiEeSEAGzvWHzLrIbb8VBZ9eaufYoxYIF0
	J13U8puCjFGJX2vBQfgm4BgfD6FfI/0+ruc6UusJjFF2n4x9moOvTVn9b+EgZZPanJgCQlorqg0MW
	WJ2HSMy+VUJM1cagg/6ukA2MzURd/5PSJtJOhIZ+lKPf6wxq5I83Rcoh0VGsVpynt7wb/p1MgTGq6
	q9f41Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdOT-0000000DdnQ-3sqh;
	Mon, 22 Dec 2025 10:44:01 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdOQ-0000000Ddml-2Mdu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:43:59 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DA9551D000C9;
	Mon, 22 Dec 2025 05:43:54 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 22 Dec 2025 05:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766400234;
	 x=1766486634; bh=9S6jrQH3/mYIWxfqJfOuabWpqho3FX73MIpk1SthbgU=; b=
	ibQ/EW7TzjusLZOHdidLs59PQQUuFIV2OTE8MOvbcyyb4U9TULe0C/Q3ZgZwB6in
	QEv9682Uix2Q65IDsRJib0OMH/O124gQrdC2aiRFLitdt54Eo1JKGhFTB91QByse
	gQVxu03LWbYYBUTizOMH1093GW67aShgXjFjxIqlFOi5EZ62rm9vh2/XoQ6uad97
	/EreT1SrA2jlx/CjgXLMQ9jitqG3SUTPdVdNUrQxG2kerYgdSKoIFjTkp2rwDqoD
	KQtsqrppcyhEg8Kb9pJep6gNl6FULUqQxODbT/Axnpr1YI3LtyIC3P8uZnX/qUyK
	iWCrA4Z7qpc3kVPm467MZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766400234; x=
	1766486634; bh=9S6jrQH3/mYIWxfqJfOuabWpqho3FX73MIpk1SthbgU=; b=P
	jI+JSGoIG5nxoTi0N9PvAw36w2IgH8RiXKLQ5WOGPI/U9dtGVFy8TYhNeI3O6fGY
	y25veIYSbfSkne41SVDnQ31yFEQfqL6hzYVPLZ07lrhxfIRlMcQWmZRmOpIWuqBC
	4IhPnYgUMJHOq2XiTr1tjAd5qs8RWDzJ0Uf6DG0K18J/9sUCjzVGYnoKhG1md5JB
	S2S792TtLotjlJefS1JE2m1Kukb9vZJxFBkTpGKySsP2jDJmQSFlgxrxw/CTO2w8
	RF9KEDZesePUGKVhOZcWo6ZPvGNmi9EdyVhgq2uZZQEv+jEPsbe+gTV3FxCvRPgh
	zV+MV/cv9pVHusd3t706w==
X-ME-Sender: <xms:6iBJaaSZ6c8G3AGd3VGtfAaARSgT9u2WeeCRrh-KRLwIGCYyLJnWnQ>
    <xme:6iBJaamWPh2fx7rDF-AFitn0ro8w9GedW9m1PQ9U97g8kqgpq-kWx93Hf1b1HmShR
    2twJuh99LKBGe0985Dp0xA2tTZcxTh-GJv_wGTX5fiXbs5MgX3-ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehieejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpth
    htoheplhgvohdrhigrnhesrghrmhdrtghomhdprhgtphhtthhopehirhhoghgvrhhssehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehjohgvlhdqlhhinhhugiesjhhmrgihrdhush
    dprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrmhgv
    shdrtghlrghrkheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqphgvrhhfqdhushgvrhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6iBJaVRXu_jYaKbLAvVajMBeo-VTSWvgpcLdXIZAx1VT_Ar3f0-kbQ>
    <xmx:6iBJaaykYXJMLLYQ0toWXEqNfqZxCtKx0ZHNtETd_U1ZH5b-h7-lGA>
    <xmx:6iBJadD12OY2Xd3COiZvjVSZZVhDxjW0yJsR-_s9Wjmhy4Ox5xjuww>
    <xmx:6iBJaeFprWUmrPuOqlSxVdJi83uCdiSADngqFaQXx8ulZCu2X_bDgw>
    <xmx:6iBJaS_JMgOJ1QUYtPfNI0IBSx1z4n2jtKHx-jiohnj2rmSGGKaYqvsx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5FF89C40054; Mon, 22 Dec 2025 05:43:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV8M3mJaQpUZ
Date: Mon, 22 Dec 2025 11:42:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "James Clark" <james.clark@linaro.org>, "Joel May" <joel-linux@jmay.us>,
 "Leo Yan" <leo.yan@arm.com>
Cc: "Ian Rogers" <irogers@google.com>, linux-arm-kernel@lists.infradead.org,
 "Linux perf Profiling" <linux-perf-users@vger.kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <ce4e1210-94c2-4664-885b-e39106905e21@app.fastmail.com>
In-Reply-To: <a5448524-a147-4edb-9359-bcee3d780eb6@linaro.org>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
 <c8161700-ad9d-43d3-8c45-cfc110ebcd49@app.fastmail.com>
 <a5448524-a147-4edb-9359-bcee3d780eb6@linaro.org>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_024358_645757_920BBD44 
X-CRM114-Status: GOOD (  14.35  )
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

On Mon, Dec 22, 2025, at 11:05, James Clark wrote:
> On 21/12/2025 9:48 pm, Joel May wrote:
>> On Mon, Dec 15, 2025, at 03:28, Leo Yan wrote:
>> 
>> This is my first time contributing to the Linux kernel, so please bare with
>> my ignorance.  I don't know whether it's acceptable to consider patches
>> that conceptually improve something without an actual problem they're
>> solving.
>> 
>
> No worries, thanks for sending the fix. Yes I think it could be ok to 
> apply your patch anyway. I just wanted to make sure we were all on the 
> same page with both fixes fixing the same thing.

I still don't think that Leo's series is correct.

> You might want to drop the fixes tag though to avoid confusion if Leo's 
> one gets accepted, because then technically it doesn't fix anything any 
> more. Keeping Leo's fixes: tag is a bit better because it fixes 
> additional things and targets an older commit.

Before that gets applied, someone should explain why arm64 needs
any special treatment at all. A lot of work has gone into making
the syscall table handling consistent across architectures, so
whether we ship a copy of the generated header for perf, we
generate a new copy or we rely on 'make headers_install', should
should really be done the same way across every architecture.

     Arnd

