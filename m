Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TaUUZa2w;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CxWAd3v5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=; b=TaUUZa2w+lMxyi
	gbl8+EDxhCz5jJ74O5Z+G4dP5pbXMmcUzIa9r8hDhZ3oPVBOnR7EW48eJUbvfETQLKxoizZ5ulYub
	+PsHX0Vqod4HsqbVtifILpNWt+EG+q1fDcSQRnvGMb1nt6O/TBvS9jlAPLNDGUXXHV3U2IJZgEgGf
	YDqx+/4lJpNH0fD4EYpSDlDx9cWPoj1dJUiETGnwXVolRWixtz0d64+L5b57eGJVwTcaDr1U3mTzx
	PY9E2LJ4bQnlcNZ2DmT0XCc61nrmeU3n3Pb2CTLWIOgLGFQazgzI/MkBTd7sCfcnZ/CAxkEQetzrs
	KmxhtFGq0IciwEQT8U0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIes-00000003L9E-0CyX;
	Tue, 03 Nov 2026 17:50:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIep-00000003L8S-3xiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:50:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728248; cv=none;
        d=google.com; s=arc-20260327;
        b=HE3ZA6Hu+AZreFBAyBwa4dq9DMgeBtXpVa/bql/THiv5jsAKrlZzKXPQ3l1z6yvKsf
         cIu9zdXcPMvxriTXrv/pvzqXLu87ELDp6pbyMReHVFVYmsItN3K2BVm6wGpS9T58LcLY
         HHlroYaYRg6bOA+G1k+OteSS8lzLIYHAr3Y3LQmCh7e6IPaao05k0Xb6jj1rkfT5qGGD
         aZmnR/nEFRWSod6z7kL3nl0MUsdGV7ep1rW3alM3gRuowPQhkN4OdiKxk5k7DaOYX58w
         mSBiiv4Oi5UiWTsoxOp1rOITuxB7l7nuO/RPBigdnwEz1AleS525KZQuNfIslUFDHQ6c
         ptXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
        fh=Q/9/pEf/9fDg1hsj5lDfS3ThCTKFExTjacQpgYLESnw=;
        b=E9eu3Dmg/4SNEf0OjRae8+j8ixnKGZ3/CG7O/DTUCzChuje+506M1ZpTmH4v+cF95e
         Ek9TkYYt4uj8K1z4aDvF4AHoYOMAh3arDTurO9tLeO56Tc4nmXZsotE6zJH/kFuTsEpe
         uoi9ZXMtkU9woiMPr0adenMwVZH8HvW0yAc7jza1Y0iyFJFXx06DL9hz0GoJWG4o7oAw
         1lc4pJbxn64cD1i32p3YxeB0BgYxVzpZxgsnMXtmhIDkT6EEv913pBHhrRJN6aL9BwPV
         sjOrqUDbb/v1O73yTX3M4GpbAghQq/b4YUNACfBBLQHXX8+IOlkUAMWLWdbUF0H9e6z9
         ZjXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728248; x=1794333048; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
        b=CxWAd3v55RL+UCgi76uuylhj3ZMMFJ4TQyzHlb48vS5JEXsF6os3jK0+ykuSo7sayl
         wzfKY2/+Uxfn2wtY/U3opip0nWCwtngXpVNos9064n7huLexsbuqUH7psc/1gNLXPXlz
         /EWyAHSpGWqXZVBRWSbt9BqKTwD7cTNyngxRfhO6tXUPcywvcnTBhDgshQ2IRa63isPy
         gk3L4vMAi0XaFkYdx+9HmzKyAX57ERX+gCx7uekb9CwWSusyxSbnKGl5uOSdQb/3iLhU
         Y04sZUa3/lX4kdaPB4xHyKDThxGk4nMFE9Lto6G3ol4MTfkr3x5h9Z6ExOH2vaUJaTFe
         WBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728248; x=1794333048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
        b=mC5/LN6pFYGL5/gLc3G9wkKPu/qhZzhqersk2KFVnxIKEWoQflnXsvtxT2/MUPatdk
         TBDf+/jF1I7M+nPWztl4ilYIEhDtiJuLx6oykeoqB9j4uAlNN33nLAFAnG16RIc3VfKi
         e3j+PJDiWtjr1o55mVo3NDTY21A4uvTcO6+OADnMsKmVO5r+PQ1WNBCY+/tWIqYPKOPd
         rXXJhn5AmjxO0BN0LH2k8cX0n5DhcN0GTMMDtNsL7PXlq1wuzthkhSymoI+WHRtziJJs
         nAqgEu9W4GOaBLSt3C0ouUB5jGw9qGkXrI1NdUvwxk/9jr6sHTfs0o2AXXuu6gFelm01
         /0cQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8Cr0uw4s2QK+wzYGddfuoRW4uDFXoB+ZLOsdyYUYLMIlToHNI/0Z+EDokkD2CIcRic788SXSYqezzbU9T7uAR@lists.infradead.org
X-Gm-Message-State: APuU4Z/1MLCrJsqWqlz6OwcQhYxPCwXx7WsRYS3OJanqnSdPjFWxm2/T
	TZXOxEXB+sgxhBnl/z7OyN5WFz9qpWcEDag+1PKcciR2ACGYHE3R+QS7qqe/XOprHPPPnwoFfrF
	vj+EDJa7EsWH4jRrPTf4Zopq0c0PATzJKeHHpaqPu
X-Gm-Gg: AYBFou33KqaRAl2lDKOp5NV7pbnB1BIx3HeVU7ADUHCdZx2zDwb/m8WXupXOENEcUmI
	z390bRzJmbHqmIAOddfkugNWB1j6rJkcSULuGE9AtJ+hEB5oaThZgCPgOqSArNRCkzOW8WUx4AA
	yb365IhEopA0b6TwAI8+xrBaDhh+hRydUvXITJr30rwznkq/ZoB9jGfgznmzhUs135wFmYQ5Qmb
	SgLzSnQeEMGg5Ox1yPBT68+eNFxc4AzE6HIUitG/lbRePGf83/9X6gpbIAcHt+lmil/IOuVgeX7
	K3/eq7Jx6AYrrGehtI/eiK0msLQ2numgi8tiDbRwkrBnoUaN3Fu7jhBjJjMORHV8pRr8Yy8v1en
	zfTUbkIn2AR2a3Huf530Yrdhf/TUbHYjQ6OVgaYBo2qevq/S5qINbdfDgreEYQ234AdOonp2p49
	Ap0PV6Yyr09u0PEpK0WShLOywj2uTgXaNh7wW62Wu9
X-Received: by 2002:a05:600d:848e:10b0:4a1:eb02:37c with SMTP id
 5b1f17b1804b1-4b2c55b2b1fmr867185e9.6.1793728247764; Tue, 03 Nov 2026
 09:50:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102234813.1069156-1-wvw@google.com> <aunKa8uBZJTCzVjd@willie-the-truck>
 <auoCjmMnzRE8c1cN@arm.com>
In-Reply-To: <auoCjmMnzRE8c1cN@arm.com>
From: Wei Wang <wvw@google.com>
Date: Tue, 3 Nov 2026 09:50:34 -0800
X-Gm-Features: AclHuK9_lwqQICSBvCDQ12EV2wMp0iVdU4Jo-z-GyS8-J8k5xR21p5bgCHg2xk4
Message-ID: <CAGXk5yq0Abvr3LvJLTaRoBFJSE+45LznsMGge3n3fU6hB3MiGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	wei.vince.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_095051_997817_1E486EC9 
X-CRM114-Status: GOOD (  22.12  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 7:49=E2=80=AFAM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Tue, Nov 03, 2026 at 11:50:03AM +0000, Will Deacon wrote:
> > On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:
> > > On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread stat=
e:
> > > the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kern=
el
> > > context-switches it eagerly in tls_thread_switch(). While a task is
> > > running, the live register is the only copy of its value.
>
> [...]
>
> > There's a lot of unnecessary (AI-generated?) detail in here. Please can
> > you trim this down a bit? I don't think we care about the firmware part=
,
> > the stuff about idle or the bionic crash. The bottom line is that we're
> > not saving/restoring a live EL0 register across suspend/resume.
>
> I should get an LLM to trim it down when applying ;).
>

Fair point, I'll send a v2 with a trimmed commit message.

> > > diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > > index 7afbece885a3..c7b7fa6491c3 100644
> > > --- a/arch/arm64/mm/proc.S
> > > +++ b/arch/arm64/mm/proc.S
> > > @@ -103,6 +103,10 @@ SYM_FUNC_START(cpu_do_suspend)
> > >  alternative_if ARM64_HAS_TCR2
> > >     mrs     x2, REG_TCR2_EL1
> > >     str     x2, [x0, #104]
> > > +alternative_else_nop_endif
> > > +alternative_if ARM64_SME
> > > +   mrs_s   x2, SYS_TPIDR2_EL0
> > > +   str     x2, [x0, #112]
> > >  alternative_else_nop_endif
> > >     ret
> > >  SYM_FUNC_END(cpu_do_suspend)
> > > @@ -142,6 +146,10 @@ alternative_if ARM64_HAS_TCR2
> > >     ldr     x2, [x0, #104]
> > >     msr     REG_TCR2_EL1, x2
> > >  alternative_else_nop_endif
> > > +alternative_if ARM64_SME
> > > +   ldr     x2, [x0, #112]
> > > +   msr_s   SYS_TPIDR2_EL0, x2
> > > +alternative_else_nop_endif
> >
> > nit: We use msr and REG_* for TCR2, so it would be more consistent to d=
o
> > the same for TPIDR2_EL0 if the assembler is happy with it.
>
> TPIDR2 is not defined in arch/arm64/tools/sysreg yet (for some reason,
> only TPIDR_EL1 is). Since this is a cc stable, I think we can leave it
> as is and do a TPIDR* cleanup going forward.
>
> --
> Catalin

