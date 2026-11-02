Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Ldst8GW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDSDVjsB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6OMMDQTVoFYMkW/indxgds3s7rWaF3OYRrED5RcBC8A=; b=2Ldst8GWKOwG2CGpJBLR4tIuZe
	mV5bQZQ/uneczFitQYaSbPnNoF4yrzA9LiRfyMHSNUjD9ht/SObzqLWBOZjqTkFPhMc81cPwGjcx3
	iIU4xbLpaSQOKB3Aj8Nj60yjqAVA5UMOsJ+BRsjkSHSskhAtroEiatmKmLoWmHo0Atvvq+7bTXKIa
	3i2KPR9mZFSeKF74/POYiyvTa55MjrB3duV5JwPwLoNwV/mUd2nTTgiswjbnpzdvvkwwrDHk8Jh8+
	4u66zYNaEgMPViVE+CbQOvjuKnCCY1HcDiLoQnP+FIHnIVGo/PlVIcS22TdVpWGHmvIB/xgGBHGlY
	f1r5PT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnyG-0000000FvJM-0ykn;
	Mon, 02 Nov 2026 09:04:52 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnyE-0000000FvJ0-1XUJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:04:51 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c41bc914672so177309766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610288; x=1794215088; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OMMDQTVoFYMkW/indxgds3s7rWaF3OYRrED5RcBC8A=;
        b=NDSDVjsBXLR+w+cWvbEBk3bzmRsryWzm4BfrocQpD2Ce3ieOoic/PtjjeDHAkCHrgY
         OsVORssZur0s/sKUu+1ZNxvNYGsnY6wr53G8Iek3vcD+puCOioMi6McvEM5fy395uUPV
         vZWN1BdPWilugt9E1mHvcFDqtI0iNDzFjpb4+AdV+Z8W2SmbdSfGz3m5m0rKnwN/s916
         W8U4DUt08JO2GiLRcz4DeLhkalUyq910PY0bDdzshHA3gCzv5dLLeCbUcPiJYLjxFWPb
         rLYjG/15hK66oIpwMwRGQFwbbvwF5Y9u1Ql8vThyG67llOs4zRqLC6Im5qRwNKAxFOiY
         BNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610288; x=1794215088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OMMDQTVoFYMkW/indxgds3s7rWaF3OYRrED5RcBC8A=;
        b=rhvYP8iud/+5iiV070VtLHl4XdK1lHqHjhBre/5361P3dezV/E9LQGVcPIaUOqNRGY
         NHM92CXyCy3qXDieAZWqyhGudkoPSeGw77bZnKXwVnt8FCqOR4l+cz2E8zfp2VFAhCmK
         t5rwsXL4GG1yv/8e4o/IsdlMh20zsetQnjVi3PL2K3VxNRj3pqpccWDOlh386ZLUyJym
         J9Qd3rltbXkehxdR9yy3wlatFulCFyIGlToKFH0Jeyi/UAOUKVkNyMbhPXWoCkTCBmgZ
         pvShFOPY3AlgTZpPlOb+kd9W6V61/UnvTdciy8RyH5NFUB9DiUL0X8RaP9ITmn9WDlMx
         huZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuBU71q6/si1CLYbFPHiZuFAYwZ0TZ9ATRcMHe4bD8tKiEH1SIvk5IyckALlgkFuP+8AMstC/x61kk6U4BbzFz@lists.infradead.org
X-Gm-Message-State: AFq9FYL5BOgKm6O3kqW2Zyp0DGKv6z78enEYgs32LnHq798FrQf8/ws2
	v8qegpgrFJdo43KWAqPeSBQzrMO2xQWpmEnwvlpmkL9M++iDT/Rh8JaE
X-Gm-Gg: AYBFou0235voqIYZRhufdbuHmQa1muxx1OVEi200/ZFw68PxpZZRtgRWQMhynWGCT9Y
	9aPLjWQXXHDYYhhV+SbK4wVeqsjhEEkiOqX4dr5MdcDOvQ0P/pnzUkRgNe4qvD7NhkY4m2/NFOc
	gu0g877bTGYPvqoWXbQdfbceCfR/CXoSOCW7v2Iqi8FYXyuC2xtMZ1i4XhKmsuxN8N9Np4uS7/A
	93C6ktbyg5TeNteCA3sv52Ydu3egz7yt9+2Tv5cr1OE6IFwRql3SKyX/rr3Rn4bkhfTgAZFLRbn
	V5xZ7m55Ij1hFHUdSJHt/fNevUzvqqs0DsltCKp54TKS25buI9CsfCJPe9BhOVbvbPMSeCUhmQe
	69Ze4iJlyfsGYABkmDT5OI/oNRFL/kdnZh/9LDGckfWux1J0HRavOY9rdFEL7NvtwpR990OaaEe
	FTCcjJpNSuZc9//7s+M7fDbC5Ku0/kWvKfacBQpOQ+ZgdYhguqEnYzWtlkEc5IHREyCA5c32fCs
	VTThUg/YaRVpD32TlyS66FFdyFIPC+0LjiEwchn33/pH7NCPYpBxZDxUvTK319Nt5mp0XnzsdeG
	eULqjZM0/wjdyPh0c/zB9BOYg2WR9Jztj14nfcMiiGp+V8miwy8gGYV4ALf1WXAgoZvIhntKaW+
	otlUIErai+OtgseT7zWiVYIuJ5mgXNN5EbISTYUq9JBRfNFHQFnUOIrk=
X-Received: by 2002:a17:907:7212:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c4ca793bcd1mr730834266b.1.1793610287846;
        Mon, 02 Nov 2026 01:04:47 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf15694sm358429266b.81.2026.11.02.01.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:04:47 -0800 (PST)
Date: Mon, 2 Nov 2026 10:04:45 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Message-ID: <auhSLVHIh8mv-KUA@thi-server.fritz.box>
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
 <20261016125229.1798791-3-thi.zirnstein@gmail.com>
 <CAKfKVtEOOGsJSV0_im=-0u=N=fxkDuCMnAzt=1ZfBs4A4rg_0g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfKVtEOOGsJSV0_im=-0u=N=fxkDuCMnAzt=1ZfBs4A4rg_0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010450_421515_C456DCB5 
X-CRM114-Status: GOOD (  19.15  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shubhrajyoti, 

Thanks for your review.

On Fri, Oct 30, 2026 at 08:16:34PM +0530, Shubhrajyoti Datta wrote:
> On Fri, Oct 16, 2026 at 6:24 PM Thilo Zirnstein <thi.zirnstein@gmail.com> wrote:
> >
> > Use non jiffies based waiting functions,
> > if in atomic context.
> >
> > Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> > Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++++++++++++++-----
> >  1 file changed, 23 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index e68e17bdf0ba..fc9a0628cb67 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -359,16 +359,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
> >         xiic_irq_en(i2c, mask);
> >  }
> >
> > +static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
> > +{
> > +       if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
> > +           XIIC_SR_RX_FIFO_EMPTY_MASK)
> > +               return 1;
> > +
> > +       xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> > +       return 0;
> > +}
> > +
> >  static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
> >  {
> > -       u8 sr;
> > +       int rx_empty;
> >         unsigned long timeout;
> >
> > +       if (i2c->atomic)
> > +               return read_poll_timeout_atomic(xiic_poll_rx_empty,
> > +                               rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT,
> > +                               0, i2c);
> > +
> read_poll_timeout_atomic() expects its timeout argument in
> microseconds  the current one is jiffies. Can you check it.

Ack

kind regards, 

Thilo


