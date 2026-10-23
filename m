Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E87606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XB5RIrq+;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JFCilMtk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=; b=XB5RIrq++FllSv
	1s6p/DgFLeWLdzH/T7R8ANCjLnP5CS3G+f/Br5lNQKOJqfI7bRcC6mjFLhl8xPhHJL/usw5nM4PJi
	sP2NYQ775DatTdWWQMiz/p3f/oZJCQK1R3sl9ifFmVAvclIW0ysOvXkLhZsbw1ijBX74E6lbeKE7A
	4KwNgBRkB5SIkB2Pxwgs6R0xRXgU8H8KXf9dyoMXNtdHroIAKe6heje4sF8mN3YAS0gNxLesLAR1m
	tW2D2hkutoAS2oAeRMY8hwZFXr6v6wdkS0nSqrAB/hw07246O3AwKGP4ajffK3dFx8auoTRZpdNtW
	2nuyWnCguM/a4rAqAFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEeT-0000000GJbZ-3Agg;
	Fri, 23 Oct 2026 12:45:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEeP-0000000GJaW-0Uej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792759534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=JFCilMtkUblpG0se/OsDP8XQNcS0g5CbxN4al/yDpGmYxsKAuaBflAG9Ot1vUdjN4LK9kx
	6KihEPKO+lHEjYmLhUHLQBXjHW8sH5zxS6puIxjSFzPEXhebnff8clkn5/qJZVNpLCKzd4
	ANALi0his2JyaJHN1lr2Y9JnHEvtemw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-md3drGbxMrOB-yhu9tovmw-1; Fri, 23 Oct 2026 08:45:33 -0400
X-MC-Unique: md3drGbxMrOB-yhu9tovmw-1
X-Mimecast-MFC-AGG-ID: md3drGbxMrOB-yhu9tovmw_1792759532
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c42394d1e41so70589666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759532; x=1793364332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=YNcxmGz/K2u74vJoC+AVDutW+s71/UeH6u2X2t0ScVqMqpgapNm53u/c0MCCWhiqfC
         Mq3zCU+X96Emox0vSc62JMKJ42VVXgx4KYZo6X1tWpl9Y2gXXEQr1IzAkDfSNr5pZLlp
         iRdbhL9DzpsD7Q+FOSiMR+VeBlDa3pIt2zJ65rRc7UiejKqSKYk3l5gpuUnEI8P04emR
         TLt8es8jZ3Bnu9SSCvR104qxPLrb9jbdGU+kFrXI71h1xzdChrShvxNL8jzkRxDZaqVf
         TP9FdN6FE9lmJUBL/6R7kgLsO2O3v+YQIJasKMAEeyQLDl+wQSKhpFd1UaQix7661wps
         MYDQ==
X-Forwarded-Encrypted: i=1; AKwUvByaASc6XgyQ4jgjIg4su6hyAcJoeu6y0i/E4my7CPoVnmi88G4fPb9ZJVAUXqrXTuZVdln+XS3J5mCj9t3LSVzX@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9Kqk0MmO3LvGi8LAa7MUX8IY9RaEcsiNeO4Foh+/S7RJJ0Doy
	2ncnE1/ylFlMsZiJjPH2/W4eB5e4qF5UEdpzlllmy8UtegBbzRFkUI89Rp/x3pWlx0v8kYwY2vo
	MO9Mu4y3skLQZbByUsLKl7qRXjbB/F8PEBJyASsH/DPKBaWzjvgNa7bjMayOpL+4pfFarRSY138
	KOYS3hnKibMF5gyC5mNOMvn/dU6SrjGHXS+d7pMhPhSfGJOoOm4zo=
X-Gm-Gg: AYBFou3YyqQ4TxyNwGEDe4czcSAEe5K+vJak5Y1O4nfMKfGlaAM/iOofpcH2lGxcu5c
	dM9z/Rh5S74eHKpssK0rkvl4gsDgPk0LhAjoYgZ+IxRgCwny62+4mw2XFvxt6WX09r7/0cUQnt1
	Irg/d50jDe3ZYR72r+c2flfN3KXK1jWPKW+DpnLhL7q2vHN2x3cIUiQha8BBBo4BT3MloqU+bzf
	bxV5lO7lsiJppVyRdQuPPidmVEbYAyCXebx0rstg3Km2ujNS4KM/5oBzjrpIjVdHBN83Rm/uX/+
	TUw=
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46a92ae6c0mr328360366b.40.1792759531939;
        Fri, 23 Oct 2026 05:45:31 -0700 (PDT)
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46a92ae6c0mr328354266b.40.1792759531460; Fri, 23 Oct 2026
 05:45:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com> <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
In-Reply-To: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 23 Oct 2026 09:45:20 -0300
X-Gm-Features: AclHuK-AKUESe6iHVc-VzwOYib6sgRKlK0BCnAtM6wg5S60Ozyo0oOLLHvDr8CI
Message-ID: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y8KEqOU0DkWdm3gGw9eVBp4uPJegyPEt5U8kCFT4Jhw_1792759532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_054537_239474_3582E7FD 
X-CRM114-Status: GOOD (  18.72  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
>
> ...
>
> > > * As pointed out by Sashiko, when you were converting all of the
> > > arches, it looks like you missed alpha.  I took a quick look and it
> > > appears that it should be a pretty straightforward conversion like
> > > most of the others.
> >
> > I've actually dropped the alpha patch as per Magnus's request [1].
> >
> > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBK=
y4BLWOvDTt92t5Eg@mail.gmail.com/
>
> The problem is that as things stand, this patchset breaks the build on
> Alpha.  Perhaps this gets resolved during the current merge window,
> but as you know we can't break the kernel build ...
>
> https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

Of course, you're absolutely right that we can't break the build. I
was afraid that this dependency might cause trouble.

I noticed Magnus posted a pull request a few days ago containing the
"alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
resolved during the current merge window.

For future reference, what's the best way to handle dependencies on
other subsystem changes like this?

[1] https://lore.kernel.org/linux-alpha/ataJlL6L7TrS3gWs@z440.darklands.se/

>
> --
> paul-moore.com
>

-Ricardo


