Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF8FF34C62
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ShgF/BpsS7cAVnwA77xlwKbX+t0sp7V8xBcXlbEXIY=; b=JKo8R3B0Ocd87jUjpkVSziC+qr
	Igg8fnqumlmUFTz+qgmI8FjoLBBtvxN3YAbGKjsPV1blD2QhFLzBO4/sZ+RpdLdViAqx0fA0RBlFL
	CdJX4pPB1+kWkQkiYGVlE4h1cXJ+Gkt/aCiA+HxLb+t4Jxo9upI+kKiDLGfD2k4e1BL+Hgugd292V
	wcFKZ3XpLON9mUD0qmRAeuUDS//zPdTOWo/XMaHNQO5oJ5jo1xbgFLmpUQYRUVjXlx7uMVjSuyueC
	pEoKiq7YS1DTN2nb4CkQV/xQCwS+6R2DV1eX2MPUhRNFhaNMs0BmPie8ZiHuZZYMLemlNQypnLbwb
	jlOGfo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJIB-0000000FyUL-2r1v;
	Mon, 13 Apr 2026 15:33:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJI9-0000000FySw-3O5x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:33:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso43630725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776094414; x=1776699214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ShgF/BpsS7cAVnwA77xlwKbX+t0sp7V8xBcXlbEXIY=;
        b=nk5wNsTAWBedUo4DYplLvuwauMORlcH66W59rsiBa99xIaNPi3e/Co2gfAdlpXRAbW
         NXqmGw8G7GKx+uT7tL9WzCPWBQ3Q4Wn8Ny5kabh3sVIEQVp4iWI96tJIyiUM/rsi/dOH
         laQgtqBZvG8xMANEHXnONuLj3zgcnzVgXzmiA6Lnjh9N6G95+03yHAobmNQ2IeljDBYw
         YldyJhBWA/UYTEObNEi9h6zYG4y+6dzxx//Nqc12nJjt1lMsVmnQ+doWk85fvTYDhfOv
         LhJ/IQtXuVDpj1JyBZdF+D4zBQNmvjIB2+XNvCIfpiEIPhvw0AoqFzpeqPWIZoIO0aeC
         DwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094414; x=1776699214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ShgF/BpsS7cAVnwA77xlwKbX+t0sp7V8xBcXlbEXIY=;
        b=BkjJF21btee9Ib2eLgwSvW1b4pUj/8NVuALpIMtrpvHfj8cAohHXeY5zfrFa2p5dAR
         RsFKgb1Jvff1O1udHoFCwyuyzGv5XHabJxNNjqhJ5M6U/LrTPiVLwSPKZ4rWZ17zu64u
         oiWPbyQYeYMGOWLpBl0rgwwvNqUpKJef07FgretpeT0XKrZStmhvxkyt5EcPbCgNPoHs
         RySjgXNYpcar0EVHxMd4Bp7wwJGY4T94wwHe7jB8uA8cFK2j07OtVRIcFZaGKhawr+TN
         9W4laBl2xWIpr2zmhPJS6UTrgt0du1o0Jt3uFIHQRcCbwfqlkEld+AEIJNaygvCOvIkU
         MP8A==
X-Forwarded-Encrypted: i=1; AFNElJ+v47jdAJz8IGaINx9btWzdjOLRav/smUZE9k20y1VXbB8dp9w3IgZOjC4dWgtW8pQAejuM+KMhAiCX6MJTjmp4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4mIoJdDKnMPT1bmIoew1/6XKEPHzaMNKGQIPWx0ttd0pRVL3A
	Qti4SfSgTLrOJaG+Uj4ftpllxkO/3PvEpOugyPLGYP8NuSDoTHANrWHX
X-Gm-Gg: AeBDievnzayalI1uHfJD02ufem+pkz/AuFoW5rI+a36sqOO7Zzl0rGzZ0cLMTmR67Tr
	hignVwe1IJ7eBDQTBk+4dBXxaFjRhlemoEvtcEMfHCwvxazpja828dO7l/S0mKJDRdc9pUW5YXL
	l3Oo7neQ3VeZl2xl/U/M2avajuD3Op7m43/Er332HLKhsNuGooASJuCse2VqRmy8ompJigQizaq
	JurYxQCt0U17WWxqPa3sxlp0VaRz0/8nhnfgzuKOwbrn76bN5FIO4eA5+IqGNDMfqJWq1MXWak9
	rOzEls5sOJrQ9QcT7uuq3d+ROd3uXKjR956ppgAET2clfEwBQQhe+aYi+/wCJP8pAap5pee6gCz
	nPCsLBcC5A2D/lwX3rrfugL0kxRTvIkTa8ehmedVnLiIARbfd5owfDCj+tUxmLLQkzsjVSxbRvR
	98fNkz9pmggWC5M2MoI0vdL7Bkk+cC/aodmXMn9+oBCc2ZLMtu6bQrM+QYIqW+xC6kGpDuFK0=
X-Received: by 2002:a05:600c:314b:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488d687c076mr159606435e9.26.1776094413364;
        Mon, 13 Apr 2026 08:33:33 -0700 (PDT)
Received: from f (cst-prg-89-171.cust.vodafone.cz. [46.135.89.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684406bsm94248555e9.24.2026.04.13.08.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:33:31 -0700 (PDT)
Date: Mon, 13 Apr 2026 17:33:21 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Huang Shijie <huangsj@hygon.cn>
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, muchun.song@linux.dev, 
	osalvador@suse.de, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-parisc@vger.kernel.org, nvdimm@lists.linux.dev, 
	zhongyuan@hygon.cn, fangbaoshun@hygon.cn, yingzhiwei@hygon.cn
Subject: Re: [PATCH 0/3] mm: split the file's i_mmap tree for NUMA
Message-ID: <76pfiwabdgsej6q2yxfh3efuqvsyg7mt7rvl5itzzjyhdrto5r@53viaxsackzv>
References: <20260413062042.804-1-huangsj@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413062042.804-1-huangsj@hygon.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083337_861546_E0882D4A 
X-CRM114-Status: GOOD (  22.38  )
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

On Mon, Apr 13, 2026 at 02:20:39PM +0800, Huang Shijie wrote:
>   In NUMA, there are maybe many NUMA nodes and many CPUs.
> For example, a Hygon's server has 12 NUMA nodes, and 384 CPUs.
> In the UnixBench tests, there is a test "execl" which tests
> the execve system call.
> 
>   When we test our server with "./Run -c 384 execl",
> the test result is not good enough. The i_mmap locks contended heavily on
> "libc.so" and "ld.so". For example, the i_mmap tree for "libc.so" can have 
> over 6000 VMAs, all the VMAs can be in different NUMA mode.
> The insert/remove operations do not run quickly enough.
> 
> patch 1 & patch 2 are try to hide the direct access of i_mmap.
> patch 3 splits the i_mmap into sibling trees, and we can get better 
> performance with this patch set:
>     we can get 77% performance improvement(10 times average)
> 

To my reading you kept the lock as-is and only distributed the protected
state.

While I don't doubt the improvement, I'm confident should you take a
look at the profile you are going to find this still does not scale with
rwsem being one of the problems (there are other global locks, some of
which have experimental patches for).

Apart from that this does nothing to help high core systems which are
all one node, which imo puts another question mark on this specific
proposal.

Of course one may question whether a RB tree is the right choice here,
it may be the lock-protected cost can go way down with merely a better
data structure.

Regardless of that, for actual scalability, there will be no way around
decentralazing locking around this and partitioning per some core count
(not just by numa awareness).

Decentralizing locking is definitely possible, but I have not looked
into specifics of how problematic it is. Best case scenario it will
merely with separate locks. Worst case scenario something needs a fully
stabilized state for traversal, in that case another rw lock can be
slapped around this, creating locking order read lock -> per-subset
write lock -- this will suffer scalability due to the read locking, but
it will still scale drastically better as apart from that there will be
no serialization. In this setting the problematic consumer will write
lock the new thing to stabilize the state.

So my non-maintainer opinion is that the patchset is not worth it as it
fails to address anything for significantly more common and already
affected setups.

Have you looked into splitting the lock?

