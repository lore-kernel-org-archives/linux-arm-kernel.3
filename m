Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6482606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SDQBZWAO;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fkMTsafo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=; b=SDQBZWAOvURCKQKNVOkVakSzkM
	JRz122LzWiWYbndUtM/gc2hrfyug10dwC3vR0DueuDGTQPJX+hSoxxtGGGTL3g00djztolTYU51SM
	VtBZO2AiTW08Nvt+7N+V97cqOScHLeEJxZEOtPYFmKUyJSol1NyxYt3Zq34wkH2gu0yko3KKWPI84
	Iz6SiGU1QTFYlcF298NNN13kNM8O83AKNSKej4RPmWA6Tz+uNjxKL5buI/7lPrXdw4EonGyns/BC2
	31j4lIQ3I6AYS8bKrff6ZHXOWrtuniHRrMFoZKG7s5/OEOD10qQIRtjfxqbEWeXDWTNln0lWv18Cs
	67m4oapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGW8-0000000AcMu-0WAg;
	Tue, 20 Oct 2026 20:33:04 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGW5-0000000AcMP-38ZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 20:33:03 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5337c7b9937so83511cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792528380; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGSL2PwF/M0omdEWmhB/xn/XOwbOYc9UCIed3MOZe+S2a1lI995qC8G/xBiuCMwHCe
         +oHHRvn3Ev2YFij9cVamwn0z/9qdkdUM6atTirwKYPVPvO0gQGCnm+h55j7/U9l6MUWJ
         69rEeEDycUy8cV5um11f6YsQmf4GM73Y1IsF7uguBf9LwofFWJQUgaNwAq/CbZqqoTrK
         DkzLnLJ/M7gAGyVIoPV2OOR3tL7ifpAlsGWBXtWtwCewlX6M5Exwy+Y9k7TEot600edr
         zYe0Z61LJr58lMX/xwZVx+u9NQSLH/1SMG4TD4VKLevlg/C9lDSfT3JEBmHuwdEEBZlj
         pC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        fh=Mkx1+xk0qOsSfU6dSMnpkoGzqwOdLk38yUqSmzbLOks=;
        b=El2Mnt4C4CDD93XyHr2AMdt3dt1VcPDDVo6osaUfcSzQiV78CsHt4bTgxLA0uFUvnx
         /1oua/Vta8MgtAl/asjLqQdMKpZdVKQnT3jxsz7nv1gSi+2SxuJrU89R4DVn3ljqDXnt
         blJ1c6jS6x/9xO52x3+whGJMAavgm9wvArul34i54M2SpvkDBtA7kpKNMFQNcKV1Gksz
         RiU7+W8SASawi8a8kQcKR2EawsDK340JTlTrz9UXmpI8TFP7iVDW3vraCENkcY+0DLpM
         maDmY2MGmcZZo4cWePWnuJ4++eDcqGlgSm2gO0fqJ5cz6+HVJ6H6C0rUyurj6YxM8VAQ
         UkUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792528380; x=1793133180; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        b=fkMTsafoBLtq8DhjrvJGVHoEWwJHWomq+ic1LuLAxiLZo+PGMSg4NvGXLjART5NNUu
         sFhvQzoqYKM64WQF26CfdnvR2S8ZdqJq4hUbubN17RP00tQNMdlE5smsjC5ZO5+vS44F
         z5wg6GACwK5U6VWcsjJ7DHKQvlsajCEXIYESCXDJRkpE/RxdsJMOQZODcUpyYsEicF0o
         MR/UV9ssXp7G1KWP7We2SB8/7zwOKIpZx93wBnNxZ5KVucyGFzhKaXqT9jbJbYyjNkKl
         vbMvSbrjtMYnaOVwvnm4si5AgojUcHWMuWxkoI8fzs9GecwsgymjGrGi79LoowPoxCc1
         PtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528380; x=1793133180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        b=xgvchpJ7vCUVIwkvG9Te0euXlrYL0zqOM4SO1YyaiAfDsR5TqL+2MwX90EvkBczAN5
         axXe7/x2lcqvT/mTt3sX7Smde9+UdA3LyQRxexAiM+9guieoM2ljo3jSGEcqwFqog5kq
         oLDEG98R7nsqWS4myHAKFUxjqLRVNNp80ZKctAXUw9Zjg41+BgzfE5YL+G3E05huwfXi
         YlxmDWpkwyhoGZ21cpiT3o8ttsMu9dpDeLRbAIcTEFZfCncIH+lJJ965E7OHpOc0Hc7G
         fCrH8NloI17oGEYiu0PIoGm+FvDpP81hOJyCEZP85aKEpx4VPZ7Ua/AmK+fetkhDbzag
         YFhg==
X-Forwarded-Encrypted: i=1; AKwUvBzVkQ+MQ3zw8FhAYbV6uAXMbO/LHhNgb1ldPsaDjDAOTVnIJoVo/jdf26CZ8BlACjD594jqbQ8/umHOXYCUT05G@lists.infradead.org
X-Gm-Message-State: AFq9FYKd4knVtbCA7GBX0q1u5LAx0Rp2V6KFnG/tnmtRbmpA/GFEvRjA
	KjRaGlSB2WRqpJxPgKFvD04ZIvKf88/vU7Xa49bEcU6FZzann0bajklHpR1Vk6HJz19iOE/4tG1
	leGpDDwCnC5xpR7VYGJctK2LWj51m5V8tq1uUkHNP
X-Gm-Gg: AYBFou2QRTptfxbktVS9szGamZRRDrLgcU2ol/uc+C8WMzZRhpTb30R0HQxpneKBeVF
	emlB3x5Jmwk5L8kUstq4snbHdPRcuk7XI9pqiR2veb+NV9NiZGeFq3tGUhiMuaWTbeJdC/rLk/T
	KoLmLR2D8C+JPmwQDIYRggOj5Mnz0Jchx80hrbU25kAsJFmKvLfZUYHrO8LBsaSlK/KCEPoMO+s
	DA9xZvWklJ+kZJpPlIbXM72q0g1bJpeCkB6G8l5LVph3mfNH0ShzcKlTZi0KZirEfM6CvqDZQzO
	Eya7cppTacb1zKHxQXSwM+W8U0kCittDcI+aMpiSShTCWani8A3ixw1v5MHQdFl/bHH+Nf6QADu
	9oQe//+R5Jg==
X-Received: by 2002:a05:622a:1b9f:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-536882804d2mr9529261cf.8.1792528379608; Tue, 20 Oct 2026
 13:32:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2>
In-Reply-To: <ate93zQFkfAecIv2@x2>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 13:32:48 -0700
X-Gm-Features: AclHuK9CSuFZK-b6UAodiXJykR-dvBn1qDmPctgNXXAV69jhyRNTIACuSsADFoU
Message-ID: <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, mike.leach@arm.com, leo.yan@linux.dev, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, ctshao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_133301_796358_55658DEF 
X-CRM114-Status: GOOD (  16.29  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
> > On 19/10/2026 17:42, Besar Wicaksono wrote:
> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> > > PMUs.
>
> > Reviewed-by: James Clark <james.clark@linaro.org>
>
> Thanks, applied to perf-tools-next, for v7.4.

Hi Arnaldo,

can we not take these in v7.4 as there is unaddressed feedback:
https://lore.kernel.org/linux-perf-users/CAP-5=3DfWucvdYefDOL3Vn=3DO=3DYUPE=
XE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com/

The specific problem is that the NVidia PMUs have adopted a convention
not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'. rc
stands for root complex. What ends up happening is that aggregation is
broken as the json is claiming that pmu_name is the PMU's name while
the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name.
They've wrangled support via the json by claiming these are sys
events.

We can either:
1) support a new suffix convention of <num>_rc_<num>
2) push back and ask the driver writers to name their PMU correctly as
defined in the ABI:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-bus-event_source-devices

If we do (1) then it would be nice if the support for that could be
contained in this patch series. In any case these events don't belong
in sys.

Thanks,
Ian

> - Arnaldo

