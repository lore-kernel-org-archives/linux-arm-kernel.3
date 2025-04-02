Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A349DC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=; b=iW/N0+FCI+WkipJNXxMPHeXdiw
	RDK7FNML/uBOw4JYusta2npKgjqaUGmkvvD8oyh1n3yEJCG6Lla9AQecsaqLogoMDMvXivTFnRu9r
	pUezj7ZP7W8LFC5uZ+qGxPwaP+02xgLt6Tp0cFqv6j+ki462Y9uqVU/ixBGQPVCA/Fv07eTypUxEB
	Nj5SYyHDDoRQ5YXJ90qpEdJseEl9gCD8MeawUV9BuhKjhas3OgK+AK0nl+wHRwANKpjsSBiaco88t
	UZ0eUu9XwaVGk+u4pAI40424cC4UoSyNWPQnNZ88yW0My2osPJ+69EVvC3cUIpTXWaamtSOIQz5Av
	z628KVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztJv-00000005Vim-0NKf;
	Wed, 02 Apr 2025 08:19:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztIA-00000005VVo-0owy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 08:17:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223f4c06e9fso12203055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581865; x=1744186665; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=;
        b=lvxbCE7Qo4E62H6jad9eWffQI6/AL9HHiNqJHsMno9Sla9jViGVchzM2kQlK7G22qD
         Zguj4jj8r5Ivixr393TlW8Ce/S1PxxBNlaVDo9P2FWByWoJgUZ+7TP8rADYCX7Dyi38X
         qbTsk8HAEH0YyJl5QisxtPrf1s0CpNsom8TCyxC9SU/wnkjwlwwHZJ/3V8jeuEECbDWH
         Z1bEeTnyeDxc7dokTBfFmSvdtQH0J/fOcGh0LSzl7msXAEOp33rZS/O8hEX+1AU9Vfqe
         JJF3SNGYNfbQsuk+5aO6YLDe1WGGoZhUcLOKvjS2LCPhSmbuSRXWf6ZuwQtUCgXVxdGd
         PnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581865; x=1744186665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=;
        b=HLnKa58kQz2GK6Jc9xoCyAvinZ+odjS/UI5lgaFUjRtvb39jMhEYO4gV48hjiC0/Mf
         Ll+rx5d+2Sotzi9vqrUNgZnNwxZGJ9pnyqLz18Tt31ms1Y/yp0aXY8RnvNc8M3N6iQoW
         unu64QBT7mWU/By+H1B7Nq/KarhWwN8AzuTrVBltJE5d6bZ32ztTDix8Ewzj38P6M07s
         kb6bjsKJgNUtMmis/p8VgwwPXW3AfHCphhhOMv2cMusBrv2Q0S+uO153YkEJTT/Uok7k
         u9ix7eOQ59ClC2RwYyBN0vSQnkQI0XX6976dGcYaCpouI6s7O6CDSN/HDDe1g01h6mJc
         lGLg==
X-Forwarded-Encrypted: i=1; AJvYcCVEpZ3G0HCD/bBof4QVxY30X0BNCKiV4Ffmu78Mw6qnKqbSPkjLuuaNdSZkBrTEqxDk9a3A1wEYxAYpIJ8wud2o@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+SZbadovEbyC/L3j458WQjsYYuMctF5mFrTb1tS2+Sok9DKEB
	w8LQa3dW3WKBwNDv4sZvz/yRu7aGa4MSwrGGWnLBEf9jVIoQ5+h4vbq3N0oHf4SI7/Lj26mKNTK
	3AqOdbBNtFSSfLh677Vjwg+eBAzIuKE2GhYGQRg==
X-Gm-Gg: ASbGnct8IFIxMTeRwpWlk92t2jCD0hrz2xgGflfigc+iNmY4mFXubk8nBRlytqduk6A
	sNZQKCpxPAKZ7tejEWoTGtkcPsiNIf+kfV/4f/N8wPdsQsDb/iaDI6HlzXeafXm+V0ZbzcFA9S5
	M1jeRlKdY1kTmIZFp8qqBU4CuWB/Y=
X-Google-Smtp-Source: AGHT+IEuDyAtb3J035y+ewvbAOiSkrMUX4Bvbz2hxthwagxAZwB2X+VCBgOccBZJT6A84W8a4x1DNPMed8dqnvNjtK4=
X-Received: by 2002:a17:903:41cc:b0:223:517a:d5a9 with SMTP id
 d9443c01a7336-2296df23507mr15163485ad.15.1743581865407; Wed, 02 Apr 2025
 01:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
 <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com> <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
 <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
In-Reply-To: <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 09:17:31 +0100
X-Gm-Features: AQ5f1JqACQ7YzdMw4Wc1Q8A3QYmI1HCNj3Ligt1dvD-z-qjoAaOVowy7RgvRkgY
Message-ID: <CAJ9a7Vjhm5B=3mDHQpuRj2JSE1hfYzOx5wq-yQcC3k+QqEcvAQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_011746_263320_DA2408C5 
X-CRM114-Status: GOOD (  33.96  )
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

Hi,

On Wed, 2 Apr 2025 at 01:50, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 4/1/2025 5:56 PM, Mike Leach wrote:
> > Hi,
> >
> > On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >> On 4/1/25 07:12, Jie Gan wrote:
> >>> The trace_id in coresight_path may contain an error number which means a
> >>> negative integer, but the current type of the trace_id is u8. Change the
> >>> type to int to fix it.
> >>>
> >>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >>> Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> >>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> >>
> >> LGTM
> >>
> >> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >>
> >>> ---
> >>>   include/linux/coresight.h | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> >>> index d79a242b271d..c2bf10c43e7c 100644
> >>> --- a/include/linux/coresight.h
> >>> +++ b/include/linux/coresight.h
> >>> @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
> >>>    */
> >>>   struct coresight_path {
> >>>        struct list_head        path_list;
> >>> -     u8                      trace_id;
> >>> +     int                     trace_id;
> >>>   };
> >>>
> >>>   enum cs_mode {
> >
> > There are many places in the Coresight drivers that assign a u8
> > traceid from the path trace ID.
> >
> > e.g.
> > In coresight-etm4x-core.c : etm4_enable_perf()
> >
> > drvdata->trcid = path->trace_id;
> >
> > drvdata->trcid is defined as a u8  - the reason being trace IDs are
> > 128 bits wide with some reserved values.
> >
> > Will this not just trigger the same issue if path->trace_id is changed
> > to an int? Even if not it is inconsistent handling of the trace ID
> > values.
> >
> > Trace ID errors should be handled by returning an invalid trace ID
> > value - were the trace ID value will fail the macro
> > IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
> > error return in a function.
> >
>
> Hi Mike,
>
> The path->trace_id is verified after it has been assigned with the logic
> you mentioned:
>
> if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>         goto err_path;
>
> So it should be safe to assign to another u8 parameter, like you mentioned:
>
> In coresight-etm4x-core.c : etm4_enable_perf()
>
> drvdata->trcid = path->trace_id;
>

It is safe but will it not trigger a warning just like the one you are
trying to fix as the types are mismatched?

Mike

> Thanks,
> Jie
>
>
> > Regards
> >
> > Mike
> >
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

