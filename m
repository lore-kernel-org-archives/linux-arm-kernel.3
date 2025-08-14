Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C89CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZheZJ/toQQKQqa5gxAgbjscdso3xZ7CnKFaNw4NAno=; b=u31+nYGvZVBNSDnsn3sDLdtkqk
	dhuR/GaGzdxWE7zssc47hSvqH5uOX6Jk7xbzojILHipeChGagD9pPsYEW+RrGNC2LC81UtwTOQbUm
	P4f4UKGYjIqIhTH/JlJccvCIw+S5oO+Rzg6Yh6ACBUjiI5y0BQJJiCxWm15eO2rWspD9RcFaBQMkR
	vtEJgaXZ8jpw9evhF/viqw30OeJlKNbH3fR1dtGpNJzL2IDs+Vwr13kqEoqDKSo4QX5WdnzIncw5B
	tPUTB28L8X/Vjj0cEtfkeOugWEF+pLKAXWHRc2TGIqTP55j24euzgadOVLaFC9M1sOwXVietTeGo0
	6FNOSi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVON-0000000GcmR-1ud3;
	Thu, 14 Aug 2025 10:41:07 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUHs-0000000GPVM-27RJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:30:23 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-323266d74b0so657075a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163819; x=1755768619; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KZheZJ/toQQKQqa5gxAgbjscdso3xZ7CnKFaNw4NAno=;
        b=G0I6/mNwN1SwrHYaijL68B46djmLmcUZYvqPSn5YhabrlEYtquN82poUuC7UrZTkh1
         RxyyRBzVArQjRtd7HCJ5lV5uBMbo//7sc2kh7LxMO611BTk6RfnG3jr4v9JBMSGdJLmt
         BMWSrRctBBbZYkpGKi2aP4cymLhKhBB8fUr1Ns/hJs5IW1YT0zVvr9QlA5NX6lWMD5U2
         yEhXekzJBo0BVFHO020riYyYvx3q/9k50XMmDGoa0DXORrM+/IcLRhHokZwstkhtttBh
         qr5efQbNrg6BSpkYi9JMOXuORZQ7WFJ/GnQ2I99y6aZeUmax61VG8mWFSCvVp+7hxGQN
         ALEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163819; x=1755768619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZheZJ/toQQKQqa5gxAgbjscdso3xZ7CnKFaNw4NAno=;
        b=HgspeDbIZmC0Ny0kvwS4Ag4vVIWV7M2NccEInWqindhdV9JNumg2fADIuVcnXzUm0W
         mdnip15oj2E1NEgbhDq8FCR7fxW+q5DCohxdKqROAkngTHHBa4gn0HJy4K+fkF/eVUOP
         yRiARWLMToqk2sSwblag/g2BkngXRQ9C4K4IxzzIeYNKNdN6hFIZsqhGkRhEx8lqiFAt
         fKPKtgr28bT0ID8g84osFhGdxiaKlmJnhID1HgU0NLRyW0WPj2rBAxEY8jzPIEWVEfKo
         TqT1kcm/9ZqYTTsVkC004rZx82ciMEpn5Si+HGsupMgkt3fB14U1YSDCx67umadJYiKx
         TCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2N/kGpbRowuysvQPMbGnaZrt3bpDGGGVRtBwc00jjZ0XJkbJH7hpVvz35lqApOba8KeavsxXqGQEtIDjx5mJD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Xj6T5pvrxdHWbKzclzOyIlFlGfoxw2jlpjMdjISjYdZlN2iy
	GiU4oiGvZ+57LqBg3b/1G19SCfwKHbBu2edIptlHi044uZBhf1PSm3b45FmFM+BcZJkA46MAKD1
	60OuEjvDo8CAJPItglAu9/lgMqMvcjPPS4PznDg2E8Q==
X-Gm-Gg: ASbGnctxOeEtVXeu/FTAutMcMKY6uxK4Nr9bj1CxTm693osFj9YJJg7fYcubFMgUY/v
	zsPcLSvC/dKL3gbknQ60UmdH+UW1W57OpmmtWhPoxyMQTVN0fmALZzbQB3THLVJqf8ZVkrcEcsE
	V1bPYwRUlKfd7KS3LtktjPSishDY+8EKfE3BN3rYO96wJ73/EuypZ0zJRkWQF8+Uc50cADYUvUv
	qsCOuH8
X-Google-Smtp-Source: AGHT+IGOEqxYvsZ6H2SOjQLeUOjLeH+SKmTZgQK2TnpiOHHbyuDOiYjZUePXxVEDxPdfZaKLRMmpjuASbcHKjV/COxA=
X-Received: by 2002:a17:90a:e7d2:b0:312:639:a06a with SMTP id
 98e67ed59e1d1-32327ad1145mr3548617a91.31.1755163819089; Thu, 14 Aug 2025
 02:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com> <c527e86c-916e-45bc-b469-8d5c94e980d2@linaro.org>
In-Reply-To: <c527e86c-916e-45bc-b469-8d5c94e980d2@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 14 Aug 2025 10:30:06 +0100
X-Gm-Features: Ac12FXxe_gY7LdhKZY-w6V0xhWNAIM3JBVo50HcJRl7rKeWflM4wJgRrEwiAOXM
Message-ID: <CAJ9a7ViMZoLUwuvseqRi+mNhfsxq8RVRT=s7ZWkSXZiq=QmJ7w@mail.gmail.com>
Subject: Re: [PATCH v2] coresight-etm4x: Conditionally access register TRCEXTINSELR
To: James Clark <james.clark@linaro.org>
Cc: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_023020_543008_6480377F 
X-CRM114-Status: GOOD (  22.27  )
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

On Tue, 12 Aug 2025 at 10:30, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 12/08/2025 9:24 am, Yuanfang Zhang wrote:
> > The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
> > To avoid invalid accesses, introduce a check on numextinsel
> > (derived from TRCIDR5[11:9]) before reading or writing to this register.
> >
> > Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")
> > Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Add fixes tag.
> > - Replace "if (drvdata->nrseqstate)" with "if (drvdata->numextinsel)"
> > - Link to v1: https://lore.kernel.org/r/20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
> >   drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
> >   2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 42e5d37403addc6ec81f2e3184522d67d1677c04..4e411427303981104d11720d3c73af91030f8df3 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -528,7 +528,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >               etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
> >               etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
> >       }
> > -     etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
> > +     if (drvdata->numextinsel)
> > +             etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
> >       for (i = 0; i < drvdata->nr_cntr; i++) {
> >               etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
> >               etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
> > @@ -1423,6 +1424,7 @@ static void etm4_init_arch_data(void *info)
> >       etmidr5 = etm4x_relaxed_read32(csa, TRCIDR5);
> >       /* NUMEXTIN, bits[8:0] number of external inputs implemented */
> >       drvdata->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
> > +     drvdata->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
> >       /* TRACEIDSIZE, bits[21:16] indicates the trace ID width */
> >       drvdata->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
> >       /* ATBTRIG, bit[22] implementation can support ATB triggers? */
> > @@ -1852,7 +1854,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
> >               state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> >               state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> >       }
> > -     state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> > +
> > +     if (drvdata->numextinsel)
> > +             state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> >
> >       for (i = 0; i < drvdata->nr_cntr; i++) {
> >               state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
> > @@ -1984,7 +1988,8 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> >               etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
> >               etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
> >       }
> > -     etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> > +     if (drvdata->numextinsel)
> > +             etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> >
> >       for (i = 0; i < drvdata->nr_cntr; i++) {
> >               etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> > index ac649515054d905fa365203bd35f1d839b03292f..823914fefa90a36a328b652b0dc3828b9bddd990 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -162,6 +162,7 @@
> >   #define TRCIDR4_NUMVMIDC_MASK                       GENMASK(31, 28)
> >
> >   #define TRCIDR5_NUMEXTIN_MASK                       GENMASK(8, 0)
> > +#define TRCIDR5_NUMEXTINSEL_MASK               GENMASK(11, 9)
> >   #define TRCIDR5_TRACEIDSIZE_MASK            GENMASK(21, 16)
> >   #define TRCIDR5_ATBTRIG                             BIT(22)
> >   #define TRCIDR5_LPOVERRIDE                  BIT(23)
> > @@ -999,6 +1000,7 @@ struct etmv4_drvdata {
> >       u8                              nr_cntr;
> >       u8                              nr_ext_inp;
> >       u8                              numcidc;
> > +     u8                              numextinsel;
> >       u8                              numvmidc;
> >       u8                              nrseqstate;
> >       u8                              nr_event;
> >
> > ---
> > base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> > change-id: 20250811-trcextinselr_issue-f267afa0e5ed
> >
> > Best regards,
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

