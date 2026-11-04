Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9CE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 00:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qt/odofu;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=QUGb8K8u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=; b=qt/odofutUoCif
	T6O/rKFXgT16WFckDmdz/Vx7Ry54bnPSefMAprbzy+glaOtlzGuC4Xm4BRqs6ncag1aMORZLJBdZk
	D8u9HNbdAUWczMTpNuQLZCoOuv/tGgcUoidslSrKw7BoZlKUKuPjbee5p2MblBtpFH+lp3zJkb7pq
	X++uTpXdDoQlL+ZeITqNI9K2PKxw+vWbBrbriBcwFjfnMdz3uFqWBz6E0XEBCFUsobgadbltBOSzJ
	jJD0qDoW+FzJjFIPLD1SyIlxKpP/vypD7uJUOWmleP+RNhGU0m2fFyUk1U9/qhmY8e7nbwYYJH+SR
	+dGFeNoPlYzHdttR6BXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOP3s-000000040Uk-0pq6;
	Wed, 04 Nov 2026 00:41:08 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOP3o-000000040Ts-3Biq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 00:41:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8a05b210703so114374b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 16:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752863; cv=none;
        d=google.com; s=arc-20260327;
        b=ABvlNIYGOJ8PCTscAjhnGBDy9DLd+lEv2wgDO8DiQJI3h4txCzJ+2erUpY2cj3daw5
         MaMhbB0y1dZC6sFEQvmPrN2KaR0bU2c/5E8xGTX+Mp8IAfXNJxYm6BJ0nHgKCmtz220i
         /r/7xviRVuSyRC9Qxn6fR0F72F7aJL4JdoPM2npnSoIrgZIHsOvCBlFN+pGbl+CmZow6
         /RIqCLzfzottYc1Rgjg+5vYfdgzvUc/4JRNIAzIO4Sln2bo4EuLffMfu7sZJRqy5gZya
         Pvq+X6dnTB/kQ4Xi2lxJfKL+dOJ89GS3v3WP9NpSRh/th4wMiuVi58TSqySlq6Wp/AeB
         4LwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        fh=cGcnt7dew1eaqi4ijpIL8EbbqgOLqYDMizJI51Milag=;
        b=HMbS0ebBIwXAnWZh3wmUbCEAgyYORzwecPHbNvS5xy+mqtg5z0dwoErr5Q39OcQ0t6
         kXBabT4feq6Cj7pJyLtu8AtTl0NWhHi2qGFbT6EXiAlPBkK0geYPmV4raOFMhvJcUpBB
         yJwKQCbDfnjtdYfQnwwobIWlrhcB/2xMJ4vsGthvbneUB2pMLauf6+cXB2d/v6nWWyd+
         nyQfr+FR1Jn69tRIny+0byDEUe+Uf6LqgXDUa1AW9cO5tURnzwRuB3XyAfYBlDT1jfPi
         7Mx9pp0dW3nnY3DFROYwTq6qfvHF/ojLcF+bltxmtdpYql7app8exaAm5ymsE+caXqNC
         l/cQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793752863; x=1794357663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=QUGb8K8umTn2hWfFZYytEB+qhak/mfmfyIHYnpbI9DKFoFmzq1DZWmx7rScW2aEaCn
         YBWm/DuOHGdfK8p3p8+n466BrY5PZBo+nC+dKIjhHuk8A/jF/GpQK/gA7JF8DraTmAqc
         mQBuGfqxkcoxkM8jLKU+0dBQ9MeVKY3QbnWWR03eBVQkxuxQjF/J5iKuNJwyjFe16Jic
         pjQYAJsuD8WyvcnNMPXF2bgJb37ebs/Sb6KJFf71AvDIEbWfHeNIulOgwymq+yBOc/yE
         ojMbDaZS+Ul16aOXuosa16i4sOredb30MAJyCmSIuB93cTM872a75TLumx8zJ51OC8Nc
         mmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752863; x=1794357663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=SAUUr1TdldXjH5ZJdfnv0ZC+9tCPr9A/ppG/ju12b/o4+CfrH6dkT15d0FuptyqOqY
         Ux1y8sMdh1NE3XmIVUEshQutwaol7lx9OplcU7j4kC+AEYNl+/BYlZRulBZN+Se5vCnE
         wUvfn+k4RA8EyIr9mL5ekNis4w7wx4g0GnvLcE122Bw0edqHplfGWsuABJPe0yFZvVhf
         BYZG+BxAJIKzS5IRYoc6LXmPlVtaXfniHDHmM8Mqbz7YpKx0deteUFv+muW4YC5mB6Oy
         Oaq6ESq8tZ/gvPkMgrZm55b7LP6Mp6XGWDcWfuPuRIdNIqDasp3vDeNXH3zPcQgOz++2
         YJHA==
X-Forwarded-Encrypted: i=1; AKwUvBw2jBs5WFOyewJF0jO8Hs0gPtBKKMxY+qJtbPiUxzdZEDYyxT+K/tNqhG3c7IGtwN1hpBGygWxX3OQx8jykoIzm@lists.infradead.org
X-Gm-Message-State: APuU4Z/OQvAiQNUlzXVu8Kkjfw0JSlc13NMJkouQLta4vSI5RLqgF7Pi
	pfet/5FggymjbBHxtpLGSvo2CkEHi8DG5KP+AyzwddH7IsaSLz+ytlARMgfGK6AwnTyL1mtZoMq
	cVfbbcAtU8hpctZZ5lAwDoLfwpA0SvJw3YBI50Pjy
X-Gm-Gg: AYBFou2GIq72ls4w0zb0u1/o3TAuwgIoOJr7NiuVxfVhvo4sKbGkiaMPHoJdmCh0Osk
	K1zC7+XqKHuOSKo6QyOgBjAdWkgcPZ8X+GEb2jWTsB2XTK4pAswUQiGKCDR9oLKHdWJv0ZdXOIM
	zwUHSiawl1YhEH7FPh+R3K7o340yST1SB4ABYQm2vrHWtOkqFdmHgsKjCXKydy6e5vloxfQLCg9
	jXrWoOxGTm8HnZwwSbWZoDTTiV6LdKfOZa4HBpM4V5PIazctkQ5xTl9577ZYULmN5bs5GSXX2jG
	hAui3CwUr1nX24GBNzJzAarG7oP2yAnrbAXfEhyzBMkx0zuSeZXJZEdTDt3x23ZvPGPx1MNF6pC
	UUzBQ2gF14vk0JY+xVCijlC9kls95UcfNuYDyHU61B9XYNoSmFEBYZC2t/wJYccyFcRn1
X-Received: by 2002:a05:6a00:2d96:b0:88d:4b30:1c11 with SMTP id
 d2e1a72fcca58-8a9ba703bc9mr11394030b3a.6.1793752863107; Tue, 03 Nov 2026
 16:41:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com> <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
In-Reply-To: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 19:40:51 -0500
X-Gm-Features: AclHuK_mzIhdjHPxjnkTYRthyfMgrzjS55JZuNf6mZPYYsQQvO81kKGlvJUv8_0
Message-ID: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_164104_796157_AE4E1C76 
X-CRM114-Status: GOOD (  25.60  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redha=
t.com> wrote:
> > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@r=
edhat.com> wrote:
> >
> > ...
> >
> > > > * As pointed out by Sashiko, when you were converting all of the
> > > > arches, it looks like you missed alpha.  I took a quick look and it
> > > > appears that it should be a pretty straightforward conversion like
> > > > most of the others.
> > >
> > > I've actually dropped the alpha patch as per Magnus's request [1].
> > >
> > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phd=
BKy4BLWOvDTt92t5Eg@mail.gmail.com/
> >
> > The problem is that as things stand, this patchset breaks the build on
> > Alpha.  Perhaps this gets resolved during the current merge window,
> > but as you know we can't break the kernel build ...
> >
> > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.c=
om
>
> Of course, you're absolutely right that we can't break the build. I
> was afraid that this dependency might cause trouble.
>
> I noticed Magnus posted a pull request a few days ago containing the
> "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> resolved during the current merge window.

... and it has, or at least it appears to me to be resolved.  I
rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
indeed appear to be using the generic syscall entry/exit code in v7.4.
I think we should be all set here wrt Alpha, thanks.

> For future reference, what's the best way to handle dependencies on
> other subsystem changes like this?

Generally speaking communication and coordination :)  Talk with the
subsystem devs/maintainers to understand what they are doing, let them
know what you want to do, and find the best way to order things so
that it all lands in Linus' tree without making a mess.  In this
particular case, with the syscall arg audit patchset not being ready
(missing maintainer ACKs) and the Alpha changes going into v7.4 it
turns out to be quite easy, which is an important lesson: sometimes it
is better to defer a new feature for a release just to ease the
coordination burden, enable better testing, etc.

--=20
paul-moore.com

