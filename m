Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaouCn+gVoU+eTcyNhX+f9Nv54n71MJJFoVOkqHdXiY=; b=18Omogr8mIjdin9CwJgRFDxuNo
	8NApZ6wkEEy9alrROVrDPlLZrcaT2vo3TPMVHcp2aagWdNezVr4vqe8g9RvZ7sTVx2R8OrV7vKy+T
	UYRlO5TNhu3PjI249yaDYI2FYIIgOtLg5lJ3kQAeqirmS7KRzieoiR4ocLFBNKDJe7H0uTZ2rl+P8
	x58A9HzMt3xnJKTz64tARuVQFfOGO6WvCdWzsJaRvFZsDmzHgQ1q49UHH3B9PaAMtKxNdL1daF2Gj
	tYTX1rpdsEC1zWkUn9Yi19pooHQjHEpt2YLk8gjPswcWvfMkBPc3guX7uKvnbjZ95pgYkjlJh70x5
	xom0tajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnfq-0000000CEXk-3g1P;
	Thu, 13 Mar 2025 18:52:54 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmzS-0000000C93f-1ZdU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:09:07 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaec61d0f65so239754266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 11:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741889344; x=1742494144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaouCn+gVoU+eTcyNhX+f9Nv54n71MJJFoVOkqHdXiY=;
        b=AdGqq3a5BGiZDBKjDVIdxXe0FUUnkY1qEqyHHe4Ir1e9ZC8DkKFioVjL8FyWJM9V4M
         WG8q3XXyA21I6KtxRKIKGl7jiDGtPNj28TNvu4OiWm6ebZPF0QbD65SiVPVY6CPM1HYN
         6xUt2mD7tPhS7ntVG930I1K6OpBZJeg4ceazpzieCh5qC94q9NOnHftwYXc1Pj1aDtjD
         LyF27h1DscmfJ3IfBRqZ8xWKaTxZ4cKSw2ByOaiCZL6vjJ3fSR9ABTJd1S8yiu4OzOuA
         XPVgmskb20gT3TYjslfdyJNkDLyvViBUVXxAuckD8EgoQfnOSDhqHTiStCplkG+PCEc2
         P9jA==
X-Gm-Message-State: AOJu0YwcvXiwYFkl2Cq0d3Z+tsOX3LZb4O0sZuk2kfGiAZBfS5LJ3cfp
	E2idD0Q0Rf719Q5BQvFIZNIhCvuAyW1/2kcuwufanWJ9q7IfSBky
X-Gm-Gg: ASbGncsDpEiHBy8nf2C5oP1NlvlN9rbkT5KmQJGxvh8xGv7k6o6xjFqE4MLIPKNyx7b
	iJxKebqimCym+NPBic+m9AUzzjsP3BpuNOIYaVI5FWiCloc27FTPbfpYDj3kCn/sOncQmurnxjy
	TnbFetQ0j9hEIADzZGsHXKY+4myGvocXlxi7RPWmPx1ICVYlVArK5KFZI/565875YN1RNUDDy9V
	ZNBKwu2q1qlxGofkSU1pH3Rjufp8E5em4w1QPJ0R2ccNg1rdXIp7pLnGXUgc3WCUdnd/264zt0d
	Ig6BFpO4J1GBcJ0hhe9pPB+CsHmybIBCU3Q=
X-Google-Smtp-Source: AGHT+IH9avSX5v9rVOb5M/GqkETrqEWlWjAuanfOK7yi22Ikj/OiRCa+LiNivmTskXBxpPr+KOjuBQ==
X-Received: by 2002:a17:906:da88:b0:ac1:fcda:78c1 with SMTP id a640c23a62f3a-ac3290221f0mr50851066b.34.1741889344124;
        Thu, 13 Mar 2025 11:09:04 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0bd3sm109488066b.67.2025.03.13.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:09:03 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:09:01 -0700
From: Breno Leitao <leitao@debian.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com, Suraj Jitindar Singh <surajjs@amazon.com>,
	Torsten Duwe <duwe@suse.de>
Subject: Re: [PATCH 2/2] arm64: Implement HAVE_LIVEPATCH
Message-ID: <20250313-grinning-giraffe-of-holiness-3dbda1@leitao>
References: <20250308012742.3208215-1-song@kernel.org>
 <20250308012742.3208215-3-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308012742.3208215-3-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_110906_410139_FE88FDD0 
X-CRM114-Status: UNSURE (   9.86  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 07, 2025 at 05:27:42PM -0800, Song Liu wrote:
> This is largely based on [1] by Suraj Jitindar Singh.
> 
> Test coverage:
> 
> - Passed manual tests with samples/livepatch.
> - Passed all but test-kprobe.sh in selftests/livepatch.
>   test-kprobe.sh is expected to fail, because arm64 doesn't have
>   KPROBES_ON_FTRACE.
> - Passed tests with kpatch-build [2]. (This version includes commits that
>   are not merged to upstream kpatch yet).
> 
> [1] https://lore.kernel.org/all/20210604235930.603-1-surajjs@amazon.com/
> [2] https://github.com/liu-song-6/kpatch/tree/fb-6.13
> Cc: Suraj Jitindar Singh <surajjs@amazon.com>
> Cc: Torsten Duwe <duwe@suse.de>
> Signed-off-by: Song Liu <song@kernel.org>

Tested-by: Breno Leitao <leitao@debian.org>

PS: I've tested this patchset with the examples from samples/ on a arm64
host, and they worked as expected.

Thanks
--breno

