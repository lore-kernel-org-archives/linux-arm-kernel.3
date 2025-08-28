Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510A4CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=; b=WHB5K3aGPVBf/B3QX1JeJa0kKY
	SSiNz7RKcI7fqRZVuvTCM9K6HYvTgMFJm6foT677HGoe/TLsnMUrpJoW9vxi7AeEwHWCzFIJVNeDk
	7ZfmlmLXbKY4VsNSMB+X3GaXSdumloBGADKg+U4sGoWpx349SPOVRGAxfnCHD3ZAmMPeGVZBrwagU
	VAA6Y5ur3XEnGGdmKrhcZMJu963iX3ONa4I414Lr5tuPMufeJ2j7pUcNZyQo1WOofb7JDw+pj9mUQ
	J2tT/Rb+Nj4Hf5G6d+5TfCH1jZquiRTjWly2/lHuATZmhYCtHQswzLNZq/lkhoFdze/PoEWWvVVJ6
	E7YHVnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXD1-00000000chs-2gQF;
	Thu, 28 Aug 2025 07:38:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urX6v-00000000b7A-0Ghm;
	Thu, 28 Aug 2025 07:31:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso343871f8f.2;
        Thu, 28 Aug 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756366311; x=1756971111; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=;
        b=IVpI6ShOiuKWOvkKqLfrsAllTp4g9rcciOhEERz//jMTjMQuN28DAqJXFpuyxE/70c
         RZhyQQeYqgZ3DOrHOrUO+m9ewGn+rLoEjx8ucKtNJz0F09VFw2/dfT1FMYeqpvuO9GBL
         vDe8VpbP7fm/gi33a9Km0TO5E7xql1ODKrcghSX5muy5d7dI7ETuiaftGNPGzRbQbqhu
         v0W7xUHO+kG6JGr2pxzvUHh9n6RPSVWX8A8E718YXzQFOVFPHRWujpC10e9qNmnMmysk
         MAay7zWpgddGRT65DZLW7cX1//DdWe7cyNpYETVn8vodzZCNvWRYeLajc/pdq6Ydlxpo
         o7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366311; x=1756971111;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=;
        b=Ttjidmo+abCEo+ctcS+cFm4oe1YAeuR4EnKmSTWfEcTde0lOLpHpOqqDe5GuwRWNtG
         /pYFw7M+0UwxwSHfmLhDpIjo4NrM04XfojiV0/FluLS1b08ShJalVERwNzopRgnvoP8o
         73avefFT5dRifQT1twh0cHrb0bduF7iuVHcn78u9Ikjt8HeON4usiaHqUaRImQ9f0dzI
         37FT9MExrTnvnXyt0HJZ3Cl0LIsqBlsOFHxPMyb8//Mu7WLQ1BKg348TDnoBoznIs6SN
         A3wcDH1QnK4+h1ZTVRBXxcDe9FSyHLn53FRLSpPT3Nu84VxIgL3OuRBDO7G8FQ43dK6D
         PADg==
X-Forwarded-Encrypted: i=1; AJvYcCU4IOoD24YIUlSuyUHtAYgU8oaFwhfSXXN7thA2TRbS2grMpgkSRkRTAGpfetsPBILJ8Dg/Vr/MLAflBqo=@lists.infradead.org, AJvYcCWx19ZGFxuhMYAUCrKQ4iFqLzRrYYysDaY4y0CvjZBszSUN1QQKqYwes90YiVW544KKKn6XWgfDAB+Va+eJBg3x@lists.infradead.org
X-Gm-Message-State: AOJu0YxBBgIIADZm29HDnM+qJHc5wc6K9Zvt/O3sp9IbQ0u/P37N7Vnv
	CjoRw7JsgLGGUCeg5iqgeKDoxE1dzaDKehMRNxoWwIIpFQGIgEBriPGz
X-Gm-Gg: ASbGnct/Dv+iPQJ3TlP+uiwwjc+QDkBjk+4DydlwGT90065yw5SnuihblWf+N++U7aK
	BSoAyw/XBbjgOy3IDwzSewRxDAhFYMirSzNxzN1LsEOpb16uCSkcdS1Uyyd44ddImXDa4m5Wjn5
	7415rIFTlWZpqAUTowieMIbMBfzGrS7pu/5+lvr4KsZWVkGyPfkNJvxz4LCn4unJ27fsAy7PQkD
	2zB+s4jQEdr7u6f4AiCggK2NmagPFA9Gm/5HPLQ5BsDc1AqnMDmSvQAbWzO4GqOhqbGB1vr0eix
	Ot9LUqZ+7t+ligy0Dyjn+djkoU/nbfNVfXmhFSH1kr1pgPwjGdZ9ck/hSdsI1cH1L40XG0TfBQw
	riw/beGLZoLnE3AoJDGmlAbSwyyNjFDUqR0wh
X-Google-Smtp-Source: AGHT+IGYsCTFAB2u+mO+a+/7YQm7WCRYBnf/bqNrDbgJHuGpC+AeSLNYygCiHCIag3yJJPklKDadWQ==
X-Received: by 2002:a05:6000:2891:b0:3cd:96bb:b948 with SMTP id ffacd0b85a97d-3cd96bbc28fmr1837267f8f.47.1756366311260;
        Thu, 28 Aug 2025 00:31:51 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c9c9324dc9sm14883755f8f.3.2025.08.28.00.31.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 00:31:50 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:31:50 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
	SeongJae Park <sj@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 06/36] mm/page_alloc: reject unreasonable
 folio/compound page sizes in alloc_contig_range_noprof()
Message-ID: <20250828073150.jyafkufvkjfqwp3f@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-7-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_003153_104284_18E95F5B 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 12:01:10AM +0200, David Hildenbrand wrote:
>Let's reject them early, which in turn makes folio_alloc_gigantic() reject
>them properly.
>
>To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
>and calculate MAX_FOLIO_NR_PAGES based on that.
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Acked-by: SeongJae Park <sj@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

