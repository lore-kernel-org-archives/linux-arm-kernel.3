Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD011061B08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqDe0mpotmsAvE79bgGVvINxrQOgyYBSlNWyRCUcuGw=; b=p5wjtx6XKDsTPRZn9J7LHcA1oP
	07DXMJaJvAEwa/aXRrrWveW+7Mgx1JjPwjeRE9r+4O2Ca8ZXWCzPwXAU7HChAFgZmHalQ79Yxb2R+
	OsxBPCZogTbOghmVAHZu1Ir0BbiCoOCUR2UmyzRhpwtm1yZ+PV02dGaGADNQiGO3cyiQ2YFsJp8/0
	qXhOR4Ld4rMUlHWCX7779I6VUQr+oa12WdBkYLlfz3WI0bhyYw1u55NsPbS5Xebi73bvO/ZN46GCg
	HfQjpTmZn2UqfsYoar+9T0KkZo2Y2TPe7hqF+42HXa/tBg+h7xdAWm0wc9wfXmiA7yfe5VrsM51Vh
	WJxfuAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jnr-0000000Bsq9-0iwf;
	Mon, 30 Mar 2026 21:05:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jnp-0000000BspM-07jG;
	Mon, 30 Mar 2026 21:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6B154077E;
	Mon, 30 Mar 2026 21:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093D0C4CEF7;
	Mon, 30 Mar 2026 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774904739;
	bh=jNiz7z/SeZ4TL5aaqPZSVcUIWnCHYFd0G4Vg82weJ3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPMX6IhuQrL3rE7n3clMOsUEV0ZZVlSatKWHVfTm/PPpu2vBva5OWxLplM7HssEK1
	 Uht8IP/edANfbkd1Y7n3Rjfkbk3R7yBDhLTrZhECHz3VnZsKQwwxMC+Ttw5kirbXnW
	 J8fTz3adPTJaftT4K7NpAEDlJ8ECRsgajOpVoGs12rX+qd0+YfRUxdVDj2k3y372NI
	 4aHNsfcYOXMK6kG/37ug2drqzPlvTWxBBWkALIAZqo3WHtsAjk8hDa6oxHNYG89Vt1
	 PbGKjDKCMsrp8LXIUJ6AprcSIO9BpEY27SYrMVC84iaTvmg3xqbrK0OCQqdvCpaLqo
	 W8XyELKgPoFTg==
Date: Mon, 30 Mar 2026 18:05:35 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com,
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org,
	yuzhuo@google.com
Subject: Re: [PATCH v2 2/8] perf build loongarch: Remove reference to missing
 file
Message-ID: <acrln3IwOebvb6yj@x1>
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
 <20260305221927.3237145-3-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305221927.3237145-3-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_140541_097311_4CB2590E 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, Mar 05, 2026 at 02:19:21PM -0800, Ian Rogers wrote:
> The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
> cross-arch unwinding bug") but the Build file not updated.
> 
> Fixes: commit e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")

Removing the 'commit' part.

- Arnaldo

> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/arch/loongarch/util/Build | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
> index 3ad73d0289f3..8d91e78d31c9 100644
> --- a/tools/perf/arch/loongarch/util/Build
> +++ b/tools/perf/arch/loongarch/util/Build
> @@ -1,4 +1,3 @@
>  perf-util-y += header.o
>  
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> -- 
> 2.53.0.473.g4a7958ca14-goog

