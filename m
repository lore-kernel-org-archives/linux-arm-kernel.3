Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCFAC02184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NItoc+EQdtom9/DPCya8gK3neybR0v9zV0/uNtgIaE8=; b=JI1gmkghNMSUridEXwZeb33anm
	ToZvuP3FrgRWatxGCadvrRqqtwsrdXo7dC66zFO9X593af8pHHGNjv0CW60Mn3ubSAeEJMTq2rM6d
	JEy02RznX1Lml4TU29OPN8Z5WcuHOKnLm+SDwY1ofsAH8PrPHSAjn6/jz0exvZEXjcucczs/j5tZg
	L+iUaJXFrOGt6iCmIs9aIS5FP0TWSK+fkHumCjRqOJQNdmH++tQCeSVLgqKKjifDwO4T1HTol7VZq
	U1nwRyuETgC7yeO4cGXTkcBpMFdwEc6RjfruCPHjjz4vi0Z88JGliO9wUw9LJZ3br0eVQVzcyKQ5F
	N704Y1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSYT-00000006lVO-0JVi;
	Mon, 13 Jan 2025 22:05:05 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSQB-00000006kIA-2Vzs;
	Mon, 13 Jan 2025 21:56:32 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4b63d564e13so1241191137.1;
        Mon, 13 Jan 2025 13:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736805390; x=1737410190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NItoc+EQdtom9/DPCya8gK3neybR0v9zV0/uNtgIaE8=;
        b=DQQjsZ5pNSGrpMp5Q1tAEk/dEIh25CKJmj9918R29P7l5pe8Ei4BSqYqijOM7eUIqC
         L9gv6N0Qss4UN5c1I2ZIh4JEq68v4RQu2yKd8gGdWqgYJ/4BYa85UuNFknEgEz1RLWoV
         vGz5yuVz+a1oENAcIWJVLVpqVfpkVislmN4esIhvBb9rE1AZxndkEbn/GgJSjFATNdbv
         HUOn/u9bO3u+6tJKdfdAhrkpYu6aRNbiIQnBVyhSODup8frWNB1LYphbAkaMrSrjd92U
         8j2wwuyqRIhB07XHx06Pg+ppBdw83q5Q0CuN1MTviHcaAsneHe2bdQcAb+HxqBNrEMth
         IS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736805390; x=1737410190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NItoc+EQdtom9/DPCya8gK3neybR0v9zV0/uNtgIaE8=;
        b=OOTxTncJJTIEUj73WyJsE3iCKjI/FyvDDHfP13dj/U/O0Fsn78BrAJGMmOvmVq284a
         9CTh+UwgKj//OjKYTVZen/WXIVOYjhCaxMXcfVkpaSEEuyuccoCkUoM/miYywre9f6l1
         AxqqXxbiUICD7zFjsKpEr2F1XDB2AAS5Ry/JcDjo+pgm/fLN2Jl/UiGyJ1Bf1UJRTzFT
         UsKjGbU5HACbOul7lBkitwru3z32MMVwRA/lQ4dtf08N/8V8te1cHKUqHxbbvRLA1MAS
         sQI3OGR3nAnyi+vME7Dh3GGMBbts5RmXaccG2OyqXSTfjltEY5yeiT0WNKOKlT81jtef
         UO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKbc6lgdzJzEuwErotzZq2fU2ynGQaiUUyn0TCxOJ2sx8uC+LwwpZPMD6N+ShzQeH9L6lwGesUi5cwyXI=@lists.infradead.org, AJvYcCUzl8cQKUpPCMw99CBMQ9jBE5yhiEhNTLsdh2zXeLlQPko5uOrmvi/wjPipZ79X3PiZoV0WCm033VOlJdoZfpLf@lists.infradead.org
X-Gm-Message-State: AOJu0YywQQb0yTb0fVO7mJgyOAoQyCH0PuzpwJ7WIKGfvkHE078WDw2z
	XuW+zX+ElugmDTJgB5rLFQo1ZHVbJ3/RYt1fXhMK8qVuHUYm5aUov+ijm9xo9jkQn+eR4Xp/pNG
	iQm+41MGZdmT5br/E3afdPjWJ+j4=
X-Gm-Gg: ASbGncs0DxED3t431EPfnIGKqMfamv0CcPm9hf09gW38rdQcJ5mnu0kn23RtO1hTWFW
	WgWhw/bbyCqp/XFZghIt/zIQZ9BkIUBEodIgxd5gR5ctnCH4xEnydm5pnyA9uRvInd0dWZKif
X-Google-Smtp-Source: AGHT+IFmdfZVLHFm0DOdvRjOe5yeGt4ONJkezdk7eWCtSqnsJVeDh8+x0oC6m6z5E96lL9tvfWmOeuAn2d9TrcwzTFM=
X-Received: by 2002:a05:6102:5716:b0:4b6:15fa:565e with SMTP id
 ada2fe7eead31-4b615fa5b5emr17893878137.11.1736805390315; Mon, 13 Jan 2025
 13:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20250113033901.68951-1-21cnbao@gmail.com> <20250113033901.68951-2-21cnbao@gmail.com>
 <296b04db-9524-48f1-9fa1-0b028bc939a6@redhat.com> <e36243bb-5a6f-4ef7-ae3e-99d204009afb@redhat.com>
In-Reply-To: <e36243bb-5a6f-4ef7-ae3e-99d204009afb@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 14 Jan 2025 10:56:19 +1300
X-Gm-Features: AbW1kvYSn8pVt_GuaD4XsZAWlpumqtc0Gw1qVob3xu_doT5JcAUKe0qvWh_LHms
Message-ID: <CAGsJ_4yQhOTguZZWk_AeggxhJLD99TTT1nLmC6MoftinSSHt1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com, 
	zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com, mfo@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_135631_658548_1D73E583 
X-CRM114-Status: GOOD (  15.72  )
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

On Tue, Jan 14, 2025 at 2:21=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 13.01.25 14:19, David Hildenbrand wrote:
> > On 13.01.25 04:38, Barry Song wrote:
> >> From: Barry Song <v-songbaohua@oppo.com>
> >>
> >> The refcount may be temporarily or long-term increased, but this does
> >> not change the fundamental nature of the folio already being lazy-
> >> freed. Therefore, we only reset 'swapbacked' when we are certain the
> >> folio is dirty and not droppable.
> >>
> >> Suggested-by: David Hildenbrand <david@redhat.com>
> >> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> >> ---
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> >

Thanks!

>
> Ah, should this have a Fixes: ?

That makes sense to me.

>
> Because of a speculative reference, we might not reclaim MADV_FREE
> folios as we silently mark them as swapbacked again, which sounds fairly
> wrong.
>

I assume the tag should be applied to Mauricio's commit 6c8e2a256915a2 ("mm=
:
fix race between MADV_FREE reclaim and blkdev direct IO read") and  also
Mauricio is CC'ed.

> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry

