Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF07CC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olHXb2geGlzeL9y04Jg6NOhgFWnbCV9DjEXTlnJrZf8=; b=deEIw18tIHitIEyH9IAt1vMgbE
	qbhqXnWK1vgmtkzvyEOhIvP1zUqxUHFWEObWmPN8bLLKmbRYS/3G2kdf3+L47vhJT6uzKk/926hRW
	VuhS3PrZ4mKbXA2Og6aD436mAC54JaQnrKVKnqjoc4ky6Uq6+2FHRlWJQ85xDYDWjlm7mttVDroTz
	bvnZELRgzSs83RIej61O1U8dFsT8oTVm9a8exD5Hns0QqZRfoY0oeuhQEqr9HwIAf2qPey7q6bS9x
	wkmihTKfGs/Lz+dc2hdJztnAcWdsMDWbXQ9A8LlTzBZS7zearUoxMEpEu2i/kCzTzAUlQeaSnlGmN
	yr9A/BxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGxs-00000002CLG-2QDy;
	Tue, 04 Aug 2026 15:22:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGxq-00000002CKc-0gjX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:21:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so8189152a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785856915; x=1786461715; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olHXb2geGlzeL9y04Jg6NOhgFWnbCV9DjEXTlnJrZf8=;
        b=Arj+E8qoaV3fQmugepKBTlHGoDEZ+W8/Mez+eEVpIi5YaAKu4hTS9R1llyeS44M4Nb
         7/wrRkqsLYPw0v6KmBm/lxG531yJv54dk+kLPyjhk8ydqwZIaSMT0AKdrgtMeXBXnTXh
         gqylXll4IySRsEET0iAMPYkia+l6eWQ/ZNakw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856915; x=1786461715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=olHXb2geGlzeL9y04Jg6NOhgFWnbCV9DjEXTlnJrZf8=;
        b=Rey5kfblWaV2c1v+sv5Sm2IXIiffX4b7bLpRxWZhQLynWM3xZ5pKkJQJIujxl6dMj2
         Oh0aEtEvQdFAiXYO7NuC8dIfjKfS5/Qp9CZdtE3Wq5fd437p7QaElhqTjkTbPAyjx8mX
         erNZ4TRXrqqFzSOY0bMPsD0Kuk86oMrL8hATKLP1wkURr6mBUWZK4Cxk265jptZQH7rD
         Tx1JMUJA6X9sIpKEJnaXDwrWjESzG7Iu6ZL756QBhGWMNDLOLfBeCzZ0iaiqyhn98uTR
         JoYvw8NORC3RWl0sSH0iZf1eU1z7StsE1owOWU+fSYRlAszlRyGOwSt00fRHFhUJfAz3
         FkZQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0BYPoELWwsZDakxOF9x9C4iDb3ySj7sUhSA9bAKgtUnUxIUgO1G8lX6Nq5LRS+PuC7dLMbK9DRzed17y77EL0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp3Exq3Gx8kNgD5eQpkmYs4sGPK6Dx3RJhOKBPDdA6Yg9RdLk5
	E1BuThF8HjALjB9NOBpKPD2pGNiPiPMQtQqF7SKnsPVBnt0ftBLrLlFXWjwcoz18SdMgtquv1EU
	/c9154ck=
X-Gm-Gg: AR+sD12pWH0Zyu3upJz24/Bp5TzH/g50TUdq+u2jwbk5wciHYg7TAPklJm5Sx+e9b4h
	++Yb0lL5jKAu5fQLDD20uXtP98SGTtysKFsbLujkeM4q1bRY2C40Ut25ZPOK1YzK3adJ74JWKq7
	m9JXZb+1eo3KYuTvp1Fx27pJYRxToS0vVYyra283Nr0EpmlFSG5Kt0QImxQwetCYhGiIWn4tbel
	EPm4GOLEkyDk+SK1y5Eb7FfAPaEYJZCDXfIiigIULe4CN7w/uJ+Sk4J6QRQLaggFk+ammqYtp4k
	mWzDywTxiE2bPT8OLO7cAwl6fIXlO+yIjebr8eKSufYpRmZZKkh1P71HrWVfVPSkLpsaTUScDqp
	m7i5PqHj5dVFyqP0qvg9RlbHlXJGud7atUowCygpyrV64jGukf6zIRcqEbK7IzlcfuMnowhp01p
	tRuqqSqoK9sHLxLBtpZ6933AUEWaLEeWYjHSnmlk0uRSihTh/bpvy1mBF57zhKa/Uo8QkuChFHW
	1avqvFbaFQdL81OPrlPL1GNoApPXnzaXFpl/g==
X-Received: by 2002:a17:907:3cc2:b0:c16:3074:6593 with SMTP id a640c23a62f3a-c1fe7ec89f6mr1420778866b.12.1785856915381;
        Tue, 04 Aug 2026 08:21:55 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036428ed3sm26264166b.46.2026.08.04.08.21.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 08:21:54 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c167aa9500dso1297366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 08:21:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro9bG7Of1LB7sslwTwdA7T1+kTeEmqVTZskdMjv9zsIkzLFBJQif9Fts1NLoYeUb1EsFZx+CY4eRlXFh/s7vym3@lists.infradead.org
X-Received: by 2002:a17:906:b17:b0:beb:133d:cf02 with SMTP id
 a640c23a62f3a-c1fe7f4820emr985414366b.26.1785856914199; Tue, 04 Aug 2026
 08:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
In-Reply-To: <anHuLy52o5S9Nlwp@lucifer>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Aug 2026 08:21:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
X-Gm-Features: AUfX_mwOSZaa8-SU_wYYQrsqsCtSQEpSAzadouc4bRT6EdTnltAB_HFZw_konW0
Message-ID: <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, 
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_082158_315179_FAC723B1 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, 4 Aug 2026 at 07:15, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Linus - I assume you still find per-cpu page tables totally unacceptable? (had a
> look around to see your take on this recently and found [0] which seems to
> confirm it :)

Yes, I still think that per-cpu page tables as some kind of
architectural design is a horrible idea, because it paints us into a
corner where you have intentional duplication and then end up having
to have coherency issues where you need to lock for updates just to
keep things in sync - and may need to do extra work on hardware that
may otherwise already have hardware coherency support.

I honestly think that people who think that cache coherency in
software is a great idea in general are misguided and should not work
on kernels, but should go back to eating crayons and decide if purple
tastes better than yellow.

That said - per-cpu page tables as some kind of internal architecture
choice that limits the damage to some simpler case is not necessarily
wrong. We've obviously done things like that for page table isolation
etc. It can be horribly expensive, but sometimes that is the price you
are willing to pay - and sometimes you can avoid the expense entirely
by knowing how the particular hardware works.

Very specific example: on 32-bit x86 with PAE, the top-level page
table directory is fundamentally per-cpu in nature. It's just four
entries that get loaded into the CPU on page table load, but it means
that you can do things like having one quarter of the page tables be
per-cpu, and the rest be shared. Several other architectures have
similar "regions". So it can be an architectural choice to have some
kind of per-cpu TLB. But I absolutely do *not* want to see a model
where the general MM layer dictates that design.

And there are historical reasons to really hate it. Plan-9 had a
completely broken threading model that depended on per-thread page
tables. It was literal garbage. It was broken beyond words exactly due
to coherency issues, and I still do not understand how otherwise very
smart people ever came up with such a stupid idea.

We are not making _that_ mistake. We have made enough other ones to
not neet to shoot ourselves in the head that badly.

               Linus

