Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BC0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyIY9+7qRYH18QG3yHqvpWY8fQNePxyU0Y1cLmmOWtc=; b=VfCw9x58QPBXo2hJSpbuVtUNHf
	9nI/gdfsqUca3ORWFjHsHE43mJEgbYynQ+1z5ta2YhOCi7PvdZ5a8CgCcl/Vu7bhGAWsDg/AVVkrp
	zPJCORPRBYhMURz5RN4PN9ze0suwbq2osI0kkThW6oG55jqzYVYj4+SuLrMa2NCRPvdgnQyoA/Peo
	ZNln/qWJuHRyt25Nkj/st/TUURXMtq9CwTxySB1a4v+oF7X7Kv/SK6KKfNUjfbIUKfEuudQfonukc
	BjCvTFZ1QpYZq7lhltH3eqmGXKxmMHlLBdOI7VXuKqIueK164pq2ZYxN/rc9EIm0i9VqjqmHWkF0/
	otT45Mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhv1E-00000006fBN-0bnA;
	Fri, 01 Aug 2025 19:02:16 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhuyb-00000006evP-0fLr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 18:59:34 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4aeea691687so13754251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 11:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754074772; x=1754679572; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyIY9+7qRYH18QG3yHqvpWY8fQNePxyU0Y1cLmmOWtc=;
        b=QTIAF2qBWlCCLIugPIx39PhlM+Gbp0IujKxXBBWBUhxaXX1zX+A1EtM2dV0kxRWEnZ
         lYQQ/pDbHUGVbshghIM0aV6pjLUcqpxfrgTzlLiARxM8YRl0mUkxwgc7zF4jnJhDTCXY
         nGtcftXnVx6c96gae1PSNG/30ksy2DA6G308dEZjKW1Hr+eTmrNZoylo3AiqxN8B7pUZ
         7nyiDQ3VHRJJjQ5TtdEXj8XsJy8r6BHdzX4+X779/Aysgfen0KZg0LZQ+vJqsynIWmEE
         fn9m95DuveyJPDwmcO6BQpauCHTCTpP1xTY2DAyxq1Mf1Y6EYLYHOp9oedZ6SCHdg4Qf
         pFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754074772; x=1754679572;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyIY9+7qRYH18QG3yHqvpWY8fQNePxyU0Y1cLmmOWtc=;
        b=G9f3DZ7PLUaOJkhs45wXeLU7rTVuMkUGixyaWuXboi2C3HfWER8PQhvSwfgUFReR+E
         WMUVn/bRNVfaBI4gKA2CCzhOZgsH+2nz1ZApdSQlgZ4wKt9GYFlVYkVNX56elvBznFFN
         Nv0wzKU/kj1drwin3jvSKiXPooX5UGnyj7eeTbDUfoc28KnSMhpSczRet3cYGKSyWMYB
         jcGsk7y4KvbUvMozMoP5/lJ5dCGH2UbQCAu4ibQxdmXur/cAKe/ehzddztoEp5WfF4In
         Gsz9xm6cfg30TCmr6FnkCymunGedtlgTZpbTildpAMrxNRvTKr5KC/akG9TVC4Lmtaww
         9wzA==
X-Forwarded-Encrypted: i=1; AJvYcCV4bt6pZ/dLffGYMZfum+Fj7dwqLkuTL8Lz/9vmLeNCxbYlHZGyqrit9kE6B1j6vAy1QWraiareaHw6NKAIQwFA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt0x3BWVjK+Dtk/TGDPFdmfs0LqvxAdyDgS0YSSnt0CHDptj51
	ky8u8Hbxi6PCzSgQSeD9xG9uRfSD8VVUUQJuAMFlJWCEfRJ6Eb6vg/dBajry28oUUQs=
X-Gm-Gg: ASbGncuFgkGcEeRAubmzmjmJxLX5/uZaVc9rpprZ0lfLcLCYtWty7G9t8MlkU1vi+xW
	B57wDgbQGHx9+vHNasIYHaSRVwptFHMOOiCLvaEusaMigYGNVczpJOVPwtZi/uGkX3jQc4jpE2z
	kbkmu1Ly43dazvFCoiYIuZ5SWb9HlSCE3RF57j/4Cg6OVLM5ZHNbj7uG0HGjcNWD3hTjGBPsHXe
	qiSHjckFhTL74j8GeE7cVphB5v2k/WSxpwwm8FgCU4peShD2NolJXG08GSKGF9dEtZBuDZ95gyj
	1dGeWLnD2oSi+iq0AFsxUd+nebbpoiSEqDkDB/v9pfDsw9OH2StCpg+xodc3J+ZXXJZCDXma7yK
	91uH/7yFsTcEL3olXAKUKUn76aLcbBo8X2KAntbDp6e+1iF7EasGAM/AmUwxRVqp3peC3
X-Google-Smtp-Source: AGHT+IHvW1P/vYfLuQdieKRLav2sj0iL8HcBFcWOObvqQ/GoW+Jjhx1hxhp1NE0qHlpxeA4ab2Hb6w==
X-Received: by 2002:a05:622a:15c2:b0:4ab:887c:8b with SMTP id d75a77b69052e-4af10a88ee3mr13217181cf.42.1754074771752;
        Fri, 01 Aug 2025 11:59:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aeeed670c6sm24010891cf.37.2025.08.01.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:59:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uhuyY-000000014Fy-2vCk;
	Fri, 01 Aug 2025 15:59:30 -0300
Date: Fri, 1 Aug 2025 15:59:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250801185930.GH26511@ziepe.ca>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIurlx5QzEtjpFLd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_115933_307005_A2049FE9 
X-CRM114-Status: GOOD (  30.50  )
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

On Thu, Jul 31, 2025 at 05:44:55PM +0000, Mostafa Saleh wrote:
> > > They are not random, as part of this series the SMMUv3 driver is split
> > > where some of the code goes to “arm-smmu-v3-common.c” which is used by
> > > both drivers, this reduces a lot of duplication.
> > 
> > I find it very confusing.
> > 
> > It made sense to factor some of the code out so that pKVM can have
> > it's own smmv3 HW driver, sure.
> > 
> > But I don't understand why a paravirtualized iommu driver for pKVM has
> > any relation to smmuv3. Shouldn't it just be calling some hypercalls
> > to set IDENTITY/BLOCKING?
> 
> Well it’s not really “paravirtualized” as virtio-iommu, this is an SMMUv3
> driver (it uses the same binding a the smmu-v3)

> It re-use the same probe code, fw/hw parsing and so on (inside the kernel),
> also re-use the same structs to make that possible. 

I think this is not quite true, I think you have some part of the smmu driver
bootstrap the pkvm protected driver.

But then the pkvm takes over all the registers and the command queue.

Are you saying the event queue is left behind for the kernel? How does
that work if it doesn't have access to the registers?

So what is left of the actual *iommu subsystem* driver is just some
pkvm hypercalls?

It seems more sensible to me to have a pkvm HW driver for SMMUv3 that
is split between pkvm and kernel, that operates the HW - but is NOT an
iommu subsystem driver

Then an iommu subsystem driver that does the hypercalls, that is NOT
connected to SMMUv3 at all.

In other words you have two cleanly seperate concerns here, an "pkvm
iommu subsystem" that lets pkvm control iommu HW - and the current
"iommu subsystem" that lets the kernel control iommu HW. The same
driver should not register to both.

> As mentioned in the cover letter, we can also still build nesting on top of
> this driver, and I plan to post an RFC for that, once this one is sorted.

I would expect nesting to present an actual paravirtualized SMMUv3
though, with a proper normal SMMUv3 IOMMU subystem driver. This is how
ARM architecture is built to work, why mess it up?

So my advice above seems cleaner, you have the pkvm iommu HW driver
that turns around and presents a completely normal SMMUv3 HW API which
is bound by the ordinately SMMUv3 iommu subsystem driver.

Jason

