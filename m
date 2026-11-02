Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF842606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IS0WbALX;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d2vsOGFh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=; b=IS0WbALXSZ4bU2
	w/2KBLU9gPTIcbyKBaGOXkSA04WuCGRr1mKUCZUBoGpOxiCVmuxsIDsxRxVs/TWeXnFp+KGzPaaJr
	dgVWUYqNRCyq4osleFROiYlr3Y+PbZFMKAbnsYulWiC87Ju6VD9uwfeINjhqRKm5ikel5uoxGpEoa
	54HCTDpUk18ufhtiOUJ1TTLr9/XZbOYNH34FbLs4IXEpMIOz1a1KRQ9UChCZ4FDCdAa/RSLjROHsx
	huJEWBlwTCEreZXSCb+EBexzL6NmeETquwz9LR9HD6dFErcf/STPz03TLQkplSoCjh+L9DWOV/w6v
	qsLR32lnzz0q+/j3xZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwMD-0000000HY8c-0rIy;
	Mon, 02 Nov 2026 18:02:09 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwM8-0000000HY8C-3Hvd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:02:07 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-533202fe429so582751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 10:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793642522; cv=none;
        d=google.com; s=arc-20260327;
        b=bW4agDBbnzaXuVKETLIuAsn3I168Mq5LOun8Rt9R4Yrq9TEHok6HHtWd0rjarPORQe
         FwayWlUtSxxAqozUkhcqUD8jR7NHQaC/DsUBcJCz3s+NyzHMignXLDBXAOgLE+FgdWnb
         K9wzA8YDlwfS45FSXAZorLjS1sO7dzOyPSBkiOQKb/bZBEPVzBdsqCP8YtIcJq1dzTjy
         JNGIK539zyftIUuNzMqI9brihcFdX/d0Di2kwoJNNcQwpQkHpDRMbMinHPn6sgLCUJ/B
         UFWvdpt4EWNjWG2KaNr74fV5r+zIKbc027ONbd8l0d65HXb873DMJct6RQ9ok1RQW0On
         O4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        fh=di+QEa5y8/HXI587YUuOWVzWItbpnswSqvsJjJTKjoI=;
        b=NbLt3x9z67Iv8rOW1KPS/SzbGhDLXXHR6u0V8r+QaLDbIsnpZciN4hXwcWCDOQAxhp
         tNCJAliE9VLue1MbRYZIRl0GdIheX2srro4qHJ6DccnhFXO9CYmyldUm0RZrA1v6kRZe
         cfSx4+HExh/bAGVmVtt6kpZ8jfeR5wZ8oIlrlFU4Bg8Dc1upEz6rd6C79j1LsbGy0n2Z
         D/UjJAC9RU0vyomRCbPRKMARk6iOx8eRZckGanG3AUjcWf9tFi0r+xui2ZhfOtmGYwSF
         GYGR63x+p3bMNIXe6GlRRgRbyyDFqaFN5+MIL8WGIUrQVAkAou8QD7k9xbVoo9Ex5lKc
         dSIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793642522; x=1794247322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        b=d2vsOGFh2OmwRCoXzOyZmN22ifQGUhTJnKKOrcwqS8te34ZMGzME59a27BwmEyRUwP
         DR5KjqeCcw/w1EModWvg0uL2mbz217z5MXNv5HVaWAsgzXxN48nlq7ED1P/cGaROpM/4
         oRDKydH5wyOMbVX3hRXCrp5YkjMcmO2YhEIivma4I8MK2faBvaaWX7sjFWUowGuyGPN7
         X5KttThBrxfvhzkvyfP3MhUUlAlICaCL8D/GrU0L5ufGQlxSuZuE9zV+MdF9/34ZdVCo
         lwjwxpv3BKSZ97+QZf9YOl/CzQA1025bmIzkJjkyLfSCsLk2ar9iYm9qbDIquvSjUU6q
         DiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642522; x=1794247322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        b=V9JqzHSMLF5YIfm8HD00EaqusWXS/J3gQz9R3VmvA8WUhEW7QPuvwmXCNGY4eBELM/
         uYn4xIE1S2XKkHGlOc/rkjDvgvsGEt17E+KylR4pGUlI5sVpikGJ5tpFh4+5gxMO44+g
         IpHNyHkIbfQkRFOfNF95lxOz8huaiH89KYwtlRlQmW+zo7Vy5UIytl/AxpF9hz3jfWEm
         8Vil/U1eTv8DwCgXznNw/KOnT6XJoxnbH6YsERiPZOkULrWN6ZPmxrHjb3990CikbzNe
         N6SF7/MTX8hSmv4A4S5sfxapfoBS8mc7NMsbRA7I1bcwPyPY2SY+lF7sGgPJ7yD34gMR
         Dsrw==
X-Forwarded-Encrypted: i=1; AKwUvByv6GxA3iGMe5voUwd0D1RzA1s1fyJq/ee+Ma0+07vmsHrhXlE2jDgb1G11TgnqViIcItHlEguX0pXlFaxyHnYv@lists.infradead.org
X-Gm-Message-State: APuU4Z8MPLNSxvs2bsEnKlsCOHNcFElqNC8mGzWkYTBJNtAo8CQv29f3
	6Uj6/ODlhfM59JWRPoyt3236bzncozdIz6UF2SXZyLU9Nd/DfY+vyfrvzIXE2oQIm01AdK4IrZE
	0KtQ/6RDVAxPBWf9yrZ+cG80ZxfGbLuxRvhzyXdqs
X-Gm-Gg: AYBFou0NAwsxSNfJOvfEqAlmgAtGozsmaMukwAfYXZjSADpmLAqM70JbW/iBHzk8dNb
	kwwfVFZc+8en+JzgjRck4X3dfUeHeFdngGw4ikJVjiKayEtYPDWxrG6EybyKNRRrhTj0QqAhrAV
	ItJbvGqHLLII8E2Jz1OeFoQhVvnr5adAdHwm4OfrrnPMaVFjSTwABeW7vqwxRKtNta/5VA6T+AC
	iruA7JkWyO9kNvOR28GpD1GbE9BvfioBMLpb1j7AH73tiUsMRccB9wovXEnxVaSigsa7C/uWbHh
	E5OFXFOIeIN/aJ5LGBhJGg1090lNMtx7rTgwYloXXwSfG/F42eZ4Ryh+U02JaqU/HjRAcTt8z/5
	gi/weD9vmOqAKBqc1orwutgq2XfTD/ujzhsnB2Q==
X-Received: by 2002:a05:622a:4a8e:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-5412cc33acamr89708631cf.4.1793642521680; Mon, 02 Nov 2026
 10:02:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028183137.537812-1-colin.i.king@gmail.com> <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
In-Reply-To: <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 2 Nov 2026 10:01:50 -0800
X-Gm-Features: AclHuK_6VTP6biNXJIrrQGQQoebrT5vhbNV4kO_dw17paAXmuHsQGGvuUXwy-oE
Message-ID: <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" -> "shouldn't"
To: James Clark <james.clark@linaro.org>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_100204_852862_42A301FB 
X-CRM114-Status: GOOD (  17.83  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 2:52=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 28/10/2026 18:31, Colin Ian King wrote:
> > There is a spelling mistake in a pr_err error message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   tools/perf/util/cs-etm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> > index bdcf94813129..65bce2450549 100644
> > --- a/tools/perf/util/cs-etm.c
> > +++ b/tools/perf/util/cs-etm.c
> > @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct=
 cs_etm_auxtrace *etm)
> >                       continue;
> >
> >               if (!intlist__empty(etmq->traceid_list)) {
> > -                     pr_err("CS_ETM: Unformatted queue should't have t=
race ID\n");
> > +                     pr_err("CS_ETM: Unformatted queue shouldn't have =
trace ID\n");
> >                       return -EINVAL;
> >               }
> >
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>

I was curious how this passed Sashiko's review. Did Sashiko flag the
spelling mistake but the fix was missed, or did Sashiko not flag it at
all?

Thanks!
Ian

