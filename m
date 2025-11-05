Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5FECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvAiRx3uwEuD8DW8gu/kdX/dizLums2NJ7ZQAKbtM/0=; b=hOh/YIFIHgrQT4f8Ki0WD2EYCj
	PzLauOsuwoF2MgubMKboQgeeXZzoxup/4fKRMskQhJZEbxJfaqgBcNZ/ni8XyuLGIw/qKdWC19fYT
	Bqf2i5wF83x3YP4LIIWxMUToRIizfhlynYuhc7N+F+h2otAWsc+oGSZNzWK21MiI0dGlrA0Qb7QPJ
	sPijXNayR35X0Afalh6IXuBqNXRXsuxhf94M75JxIvmHPMH9H3Wow7wbrmQoTHbSlGX4FthLA9l0t
	V/DlK2YkInm9N+uJ9sgLQEkUTdzcIBEn4XkTz9sZySyEEiMJ/HvP/PGpDni9OYD/6Lif7zGCDIX2d
	6RsqUuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaxA-0000000DUqd-0sG5;
	Wed, 05 Nov 2025 10:41:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGax7-0000000DUqQ-3j94
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Nov 2025 10:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bvAiRx3uwEuD8DW8gu/kdX/dizLums2NJ7ZQAKbtM/0=; b=dgoMslaWBw1PJbnmTLw0DRC90j
	jikWdt1UwwHjDiqbCB197m+ip82bQGxexQHkh+VsiHaAE0Iuwd37h7VZYY/0ZUizLVjLysr2l4Fug
	Aibt3GOjEE67Cx+IzduooxWQO6bk+XYQHvAYd+XYEHYLitH4NzfNWY+1hLVR71gbjDaHotH54d8av
	50oP2Lp2QG6Yr55nj+/YOzp9YeTYLncrk1b/zwuPzJzHx7ZJwDry6i4FkA2MzF8vqbybIp3oVXHVL
	YnyfeJRCupP8HcDuhNxhYC6uvL0ec9tHHLix2W2dUwu3w7csFjF8YLYYxKWKJzd2pPUpHLa7OaDHR
	pr7elDHw==;
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa5M-00000001sXl-2plo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:45:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 0FD941D0004A;
	Wed,  5 Nov 2025 05:41:11 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 05 Nov 2025 05:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762339270;
	 x=1762425670; bh=bvAiRx3uwEuD8DW8gu/kdX/dizLums2NJ7ZQAKbtM/0=; b=
	JucRCD8lPjgEyVrwbCPlnHfTNrcK89CLE+B4DoVqD805L2CoDH/s3hIRZCn9vnK8
	crLgpagyHHqYjJ57aUYyuvoUz8rs/lL+avjn/f383RyeVLSRdAjvqez98RzJcgf7
	7MZeXgVOsT2B7EXFwa/XX79SJz1s3r4MuXOdaJW1larpxpwF74jrFFlWALLqWI8w
	Qz0ObY6i/1lEkq17Nte+CxpT1NDrXGT6cEzx21Br5Y6AKy0QO2t0G41bIlSEEHE1
	AT21eTg8uLXWRHJLAthAgU2S+vaBlFMq0ue+a7Jh2K2dtkCK4/tehFeH/soCwFTO
	ISCctO/A2PwOuMhIV2cL/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762339270; x=
	1762425670; bh=bvAiRx3uwEuD8DW8gu/kdX/dizLums2NJ7ZQAKbtM/0=; b=u
	XXCqiE5JdhnpTngrIvGHAzSQZ0+Zvt5fSYSrvC+xAV8Mnr+TzG1FdV/dP4hBP5td
	HyU6GZ0b9/dUo7e79WmGgNIq6vZKyVqMTe3P1o/TnfzVL92HaTqC1+V6TtYKcGlA
	g/RJlxxzxXKUwaoLj4IGSOYnqTAPyxJjpnm5btwi0hzlt0Y5EHJAQMSC72JfmZ0z
	VkZv2G8zdAMGMfYA8jB8Gyq9sNHu5cN1/hVnIpY90JDIPqGW1+WfdEQTFFoEarun
	x50s0Xfw6YtkcbQaWYagL9HcnpAne0iDuPj+UI1z3q3AO7wuy4vfAjJlCwwVJ1Q0
	2pRC9iJKPJwImxSQivDOA==
X-ME-Sender: <xms:xCkLadjqEgqBmmzaP9fGmrS18GGfJ3L9DQGuiRytSCSKL9SRhkCWnQ>
    <xme:xCkLac3huvP4wJSMYLLwLftnuZYkZoFvQGR3p7ArHMLx4XjnxlZZr2M5BiQ7mRd2D
    CZzjYlza5RJjn0fNhmpTav7G42lo0MdanwEJO6QkOP-6Phm7Jld4zvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeefieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgrrhhishhokh
    hnsegrmhgriihonhdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghlsehgvghnthifohdrohhrghdprhgtphhtthhopehmvghmgiho
    rhesghhmrghilhdrtghomhdprhgtphhtthhopeiihhgvnhhglhhifhgvnhhgudeshhhurg
    ifvghirdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrfhgrvg
    hlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xSkLaSdibJWgIc9pb8TUJorGV9-b-GctbUSl5sYnAAlsGK-XDPGmEA>
    <xmx:xSkLaXx7WhMnGyDxJDZTHgtU6UC-C6GxsXeQAGN0VLrskLOXpfdYPg>
    <xmx:xSkLaTiYwrQXcuyWD-VR2oQCgAl7qFatxaBgtu8MJtIDmDhS6xPYqA>
    <xmx:xSkLaU4TjrGy1u3JxXs6wZPNv9GVqWPraa4QvE557TLEo0_JBj0Omg>
    <xmx:xikLaRd1VkHsvtAqk77tkfzl9M4ryinSq5T-ScnKLetKMA17SPWyrhGp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DFAFE700063; Wed,  5 Nov 2025 05:41:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ab2ZwGVH8-qs
Date: Wed, 05 Nov 2025 11:37:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ankur Arora" <ankur.a.arora@oracle.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Haris Okanovic" <harisokn@amazon.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, "Joao Martins" <joao.m.martins@oracle.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>
Message-Id: <d087f250-daf1-429f-8ce0-c4f4332d0469@app.fastmail.com>
In-Reply-To: <87jz04anq1.fsf@oracle.com>
References: <20251028053136.692462-1-ankur.a.arora@oracle.com>
 <20251028053136.692462-3-ankur.a.arora@oracle.com>
 <3642cfd1-7da6-4a75-80b7-00c21ab6955f@app.fastmail.com>
 <87qzumq51p.fsf@oracle.com> <aQEy6ObvE0s2Gfbg@arm.com>
 <746c2de4-7613-4f13-911c-c2c4e071ed73@app.fastmail.com>
 <87ikfqesr2.fsf@oracle.com> <aQoF1-uKTgJo89W8@arm.com>
 <87jz04anq1.fsf@oracle.com>
Subject: Re: [RESEND PATCH v7 2/7] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_094549_309376_A1F42095 
X-CRM114-Status: GOOD (  18.42  )
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

On Wed, Nov 5, 2025, at 09:27, Ankur Arora wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
>> On Mon, Nov 03, 2025 at 01:00:33PM -0800, Ankur Arora wrote:
>> With time_end_ns being passed to cpu_poll_relax(), we assume that this
>> is always the absolute time. Do we still need time_expr in this case?
>> It works for WFET as long as we can map this time_end_ns onto the
>> hardware CNTVCT.
>>
>> Alternatively, we could pass something like remaining_ns, though not
>> sure how smp_cond_load_relaxed_timeout() can decide to spin before
>> checking time_expr again (we probably went over this in the past two
>> years ;)).
>
> I'm sure it is in there somewhere :).
> This one?: https://lore.kernel.org/lkml/aJy414YufthzC1nv@arm.com/.
> Though the whole wait_policy thing confused the issue somewhat there.
>
> Though that problem exists for both remaining_ns and for time_end_ns
> with WFE. I think we are fine so long as SMP_TIMEOUT_POLL_COUNT is
> defined to be 1.

We need to be careful with the definition of the time_expr() if
cpu_poll_relax requires the absolute time in CNTVCT domain.
We're probably fine here, but it feels like a bit of a layering
violation. I think passing relative time into it would be cleaner
because it avoids the ambiguity it but probably requires an extra
access to the timer register that is hopefully fast on arm64.

I'm ok with either way.

> For now, I think it makes sense to always pass the absolute deadline
> even if the caller uses remaining_ns. So:
>
> #define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_expr, remaining_ns)	\
> ({									\
> 	typeof(ptr) __PTR = (ptr);					\
> 	__unqual_scalar_typeof(*ptr) VAL;				\
> 	u32 __n = 0, __spin = SMP_TIMEOUT_POLL_COUNT;			\
> 	u64 __time_start_ns = (time_expr);				\
> 	s64 __time_end_ns = __time_start_ns + (remaining_ns);		\
> 									\
> 	for (;;) {							\
> 		VAL = READ_ONCE(*__PTR);				\
> 		if (cond_expr)						\
> 			break;						\
> 		cpu_poll_relax(__PTR, VAL, __time_end_ns);		\

This looks perfectly fine to me, thanks for the update!

    Arnd

