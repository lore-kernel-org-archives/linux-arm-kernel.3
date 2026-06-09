Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECCECD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmfA3ihkZI70+QmKMUq3GShPQIuZGsmDmch0QrGM1yw=; b=WouiSRdmlo+duSIxQf4pxNLWGV
	m7cSFjXB9KPYCakLiwRYhWH+BshvaPI50Q4Sl2jZT+PQScWRZaDxPLiKY/OvMBsGYV5qKyahVuVi0
	2/Jd5NBRIN0p3jQKfttzPDkdFR3HHf5aMfpXkZQjHcYzWPQxfbVcbz7gygGHkDjXGTkvywsAPMhSX
	6mIjdCtOgmQu6aJ76HSt5V5hPV9erL9CsJN3EaZRhQlpvPBGmB5oaoFmpVW8YfQu1KlRAROvlp5aW
	l6kI069QIMHyHG3cL/iChwiZon2NRZTRFZmqwAJLmgXg5d8f+SX3MhtUI882bGWeOQA61de3CQPxQ
	yU6OMw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtRb-00000005JIu-2qaX;
	Tue, 09 Jun 2026 10:12:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtRY-00000005JIH-2VpT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:12:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0b1a48855so493455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780999944; x=1781604744; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmfA3ihkZI70+QmKMUq3GShPQIuZGsmDmch0QrGM1yw=;
        b=WyeyPQ/z5z+rGhzreV94Xm9me9cpP97eOwd5RcfjDWJB+lTQCt5N7qZwrUNI0TWdZl
         Z++FwOMAF8zW88NyNix4np9rFWFnHV/qARB93Ao/ubqejQUTG7TKm+imIK3Sqcb1eyFR
         hNDQwMztCKCOVljbfwLRQ5YaoGmft9EgzlXw/Y2aSDXe3U7+pdLi55H2zWACHWqSfq7c
         ofhuKrEt7ESGWguTwpv1KGaExm55GPMq7h4VzgUCh/fzBhpMRSaDJU5NJULhgfByWYWY
         kUgElgs7tRJg168pgL+g5+Prtj/SmmS6nwtJxjv/KVnXHvF4+lnUeOJJ9zsKIoeU1T0H
         +HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999944; x=1781604744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmfA3ihkZI70+QmKMUq3GShPQIuZGsmDmch0QrGM1yw=;
        b=NRJbOQlkSZwHZTlI6ZEVXB2wCjAWqByCZ67dzNXfHHVgLp+qacVkY0CqgUgqeqBOjU
         ACYsFD33y2j2h3lsp7lzClJnQFC7sJlXK6oM53AeyVE/h5zCjONiJjKjkOip1DqvewLG
         S/Bh+lQMBxbNcL023hMh5bkSqaDJeBH0eccE5VgTgwzK8JKLRqjc1Tq2pvL4IQ/3VLX8
         +Dpui2As02KU2JlbjnO2UUpgjVwxwjiCU+aUF69ehFzmMA77yhTCwMaxHrjKc2/Mems6
         OcbihBYo6zpjSrmrGRRSyWQa1upAnYU9k7Un9BLKG3/HIy4HT01rF/PjiVW1MKa0dXU5
         GeMA==
X-Forwarded-Encrypted: i=1; AFNElJ8pScyWiHxQ3Z36WufE5IUwexM/EUvig1j59D5FZtI7j0NhS7EnMqio3iQq9TrAda+qMQUCLI2wIql7lYlIU66h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ThjfCa3y+/Wr4RWSl/e7PEXmbeghWyqFb617LppElcyAtSia
	wJ49SP9dKVmygcVCRbrFaXASnAubgdwxI2zX9nwT27V5bJV8N9R6LhM6JFYrKWDaHQ==
X-Gm-Gg: Acq92OEKj2ZJFRuujdKRZsBNSgS/DLGgqH+6OkyRSoXqnmJzOGq8esNKdj26zBUdYkx
	SHKRxCM3MouMRWIJup10Kvx2KrS5PBr5wsAjqprMGu0sjcpinZ8w3qF59RosvSMHSN4VWflwe2p
	QuJiAGRLcKi+T2jAHBM1rF93xc02A5SfY4sMHO5ARvBeyEsbRsmuKofXvBAa7jpjby1NhOLX88x
	ASfheqeWTbS6AP2DM4WcBNMdi6OjGvBgW7vHHUbJYjwOboHk+sI32TU4QOS8ShcwymmSq7q9pEC
	hONGgfyo8LiUH29Cf5to6GoA7DaP9yDOIdpSdR5QAbpNIKzDtBOmN8Leu/adZn80EtOGTWfAg8h
	ZxTOtGAuFjG/JvISLqj0JKoBEqOkdQu9cC96mlJb0D5+70jfNk7qkisxkvTkxOmdQ2Kn8YYJ5Ay
	NJHQuqjsUFB99bpmAgM1m6LI4WY5hxJpM1bfD9kzlz2jiz3ShnjSTr5Wf49Zn0kbFkKllQnHE=
X-Received: by 2002:a17:903:110f:b0:2c1:ee6e:be1f with SMTP id d9443c01a7336-2c1ee6ec559mr7525515ad.29.1780999943339;
        Tue, 09 Jun 2026 03:12:23 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d042sm216609875ad.60.2026.06.09.03.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:12:22 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:12:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <aifnATxVw0k-yxqx@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-10-praan@google.com>
 <CAE2F3rDjFwacP0_TA8tv5_p7ZJejsXAKEb=juNaXgPcMPag+Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDjFwacP0_TA8tv5_p7ZJejsXAKEb=juNaXgPcMPag+Eg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031224_641462_C79EF2C1 
X-CRM114-Status: GOOD (  20.60  )
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

On Sun, Jun 07, 2026 at 02:53:24PM -0700, Daniel Mentz wrote:
> On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> > @@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >         if (is_kdump_kernel())
> >                 enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> >
> > +       /*
> > +        * While the SMMU was suspended, concurrent CPU threads may have
> > +        * updated in-memory structures (such as STEs, CDs, and PTEs).
> > +        * Any invalidations corresponding to those updates were safely
> > +        * elided because the command queue was stopped (STOP_FLAG == 1).
> > +        *
> > +        * Since the reset invalidate-all commands above have fully cleared
> > +        * the HW TLBs and config caches, the SMMU will fetch these descriptors
> > +        * directly from RAM as soon as translation is enabled.
> > +        *
> > +        * Add a memory barrier to collect all prior RAM writes to ensure the
> > +        * SMMU sees a consistent view of memory before translation is enabled.
> > +        */
> > +       smp_mb();
> 
> I'm not convinced that this is necessary. I understand that the write
> to smmu->cmdq.q.llq.atomic.prod needs to be ordered before setting
> CR0_SMMUEN in ARM_SMMU_CR0. However, this ordering requirement appears
> to already be met by the dma_wmb() in arm_smmu_cmdq_issue_cmdlist.
> Could you provide an example of a scenario that might fail if this
> smp_mb() were removed?

Agreed. The first dma_wmb() in the issue_cmdlist will handle this. We
don't need this smp_mb(); I'll add a note as specified in [1]

Thanks,
Praan

[1] https://lore.kernel.org/all/aiflaI4svEJvZbsC@google.com/

