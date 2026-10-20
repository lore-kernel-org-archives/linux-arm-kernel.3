Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683A8606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLJhpTRA;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=PQDkfIrn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=; b=CLJhpTRAud/30wMWu3fN9m3Xfz
	K7SgenHnZkFQsSs4esmyxISSUIBF0ZIB5+wsWQ/1tTSBM54kdbyh+v0kYHnTJcsdqF8jP9tDNZPj0
	jBo4whaua9lhN+ekyiZduM/aH3/zwG4HfN5y2svWk5+bAA5QN8F7/CX2fg6tzQLl6LzSlM+/2sCr8
	IWFlAa6/NpP5urqRit6Mtw4rFfacQhftma4I3uv2EeBW6JMdf2LnAT2od8W++fqQ+l5FdbuwZ0hMA
	nl+2QlGImIEKn7OwbWYKJy4iP9p/LQuxrVTZZ/5kdGCp3/i+ACtIzo2+bspQbPeTgRo1S9tE9B3mB
	6HB5u8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCrf-0000000ACkr-3R6H;
	Tue, 20 Oct 2026 16:39:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCrZ-0000000ACi6-3QA9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:39:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e8b20a899fso17227935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 09:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514336; cv=none;
        d=google.com; s=arc-20260327;
        b=SU9S85CBAy2BOZmurqy+UnvkkxVBdctL4uOepjA8f8UMGsvhVcxEtWqQiERqUZB66K
         Bu/jlHQwZc/kB8Y+CF4jcGcMrAoFeXZ96DEFJ7AhHrARJ9p6MpxB1p1TeFzvXOgvvwjG
         8Mnz0E1OOo2ad4H5gIhE6kOpU26YouO8MAbj+OGirlMWXP0M3Ow3ChtkIC9rr/WEpeh0
         TlTIwXibeiyE9GmGCcn1bKbCqFK/AgXqyA4UIww6qoXT48D7DsOkQwpt0OWbMQ7rkCfi
         gX8Fia1sWP+RYKt3ZszPFeRri/DdADMffyiAtBwAFw7a5Sn8tpGBx39axPK9qXSSpiUy
         crXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        fh=nZOuEKfqSYqCvX9wiFTVTmwAwj2ywWsMVnRS8Ujfk+I=;
        b=AARZXoIE6JXdOI+aB21Vink/YU2kQk/6G+pfHLsIgm8loM/JUTyjRHE6Xju07bWUDj
         NRqi/sjGjBpXsMmvl2WXD6QCLEXPqTe9XewSwJa4fBYmYnBPBVL3QByNaHe4xjnPAZ5F
         2hjCX56dGkH5te9N2TpO9o8KjEGNVkVond/dQkEhY2pORUAVDFf3zq55tniyLyJauFR3
         bwNaMOeyQnU92bfH+VjoHQutgWLrDUaJsoT3Gw2ZMgi+w0q4VIU06Twcdb4nDv15fFrL
         ea2RmNkon9/XGMh+5AAMLQyRcUfg4XNnKYS+BsiV3kjaZ/6yah0V8IrXECzhCEJatHaM
         qqSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792514336; x=1793119136; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=PQDkfIrn/4QN4BfHfGId0N78PCb4K4m/3V+BIXSNEcXa2Ewa4K3XKjvKiP/dReHfLZ
         aUc4t/ge7NzAOwwzg4tLPEnyPziR284exZtXDdm49CxUG5In2O3NwqDfmFeU6OK5giHd
         6qplIo3brwYYFT/ysDElS+KQE3aOwhiDds9sP9rpOiJZ9EEeST/3ezhHW8pu0mmzcr4R
         1nUfRPyP0UX3LmODdsMkdHkkmVtBASnZXbHRp4Fuc9ZMmYLCjC9Dq+T0w+it6zYjBE3P
         0J/B9Di3nduVmUK0xhgN/9y13ID2c5IKKCU4jkRQfYXltRW3pI1DU+cXGgIdQQHhwUuO
         vvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514336; x=1793119136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=L9WAThgF5lJpfO1KJuloeceMaXeQ9a2GKon+SXvjYGjjcY1Sn4WNnfAN9M7bPnZ4cg
         0XIC9JBskW6Uvl05ScbDpbiVvVR7G+GrzjCnK0tV24lcy5aHqIPFQzTExxLeUUvk788u
         MrE+yv+7lcWA2xXKBR7keBIyoBglVftu14mS23JWQkL8wSqYruBfZCpnD6MEnOEvcmBP
         8ST1t45TAnJWk0UOg+GKlp7NKxSMWtdgh8GItveE3blNU4MVJ9p9hvmsWy2SOygWtR2y
         l7ijXHDAYD1uKMu/XH2/ml375cbrvUdGUrDDxA/+2vClYloRg0UsAP/82jhNZeLeAnff
         IIKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC/YWsmeOSiFVMzgUYsJFoSLADr+66XWCYaI7twqn3BoqWJefo5zFRGMXLCrUlQLs9wQ7AtGhPqb9YLCiUQoE0@lists.infradead.org
X-Gm-Message-State: AFq9FYK1fIS478HYMJQEbjuykuyDOR/GDjca1pk+vL4la97EQZB8QyUd
	vXwOeTh72SP7Nco84Ga1BfMlspvL/RCIKlEPZgJb63ne6Tq5ccmEuoYeg84pFo3q6nqxRtqHJLv
	qrzyIu3TdcXG1kkK6KvsF1b6sKO6U0jilKxZSbfst
X-Gm-Gg: AYBFou0BhQAMPNP14Ijo/LQtkYtdLMgfSjFz3GQTxosUsfzjP2EqipZdFbxH8dyOke3
	p/jqOoP5XvLuiZM+cs5tLeGfFg2eZYshcMC//Ksnle3uUbuGu17MuIYwrKw4Kbw4owKyrln3c1V
	7L54E8FoF9bHCJ7asmgUiZzMU5cOJEkNk2dLS+/6ZRyoWkZn9qMmkoVNzoIrss/CTWpTHh/Ni74
	RLTvGB+hQpxcVohb78emcWFDMu5Y2OrTuBcUa3WM14ahdEeRiwIPaRjkUeRttf9Gj3hBFtcb7sW
	/1GfpD5kX8+QXs5wSrZKp4aqoNksaglni0dGZff1L+ObpVDyOj+J1X0rkqsjKA/7/gn+HhNSj89
	XAJDnABLVrKY=
X-Received: by 2002:a17:903:1111:b0:2e6:dcce:8227 with SMTP id
 d9443c01a7336-2e9a6c1a30dmr99034965ad.37.1792514336247; Tue, 20 Oct 2026
 09:38:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
In-Reply-To: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Oct 2026 12:38:41 -0400
X-Gm-Features: AclHuK9ZakV6IFm9eD67kaqUic0iU1MgVPLS7VN6RgjPgTRZmZP6_X_XOYOX9ZU
Message-ID: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261020_093858_238481_A0846DE3 
X-CRM114-Status: GOOD (  15.80  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redha=
t.com> wrote:

...

> > * As pointed out by Sashiko, when you were converting all of the
> > arches, it looks like you missed alpha.  I took a quick look and it
> > appears that it should be a pretty straightforward conversion like
> > most of the others.
>
> I've actually dropped the alpha patch as per Magnus's request [1].
>
> [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4=
BLWOvDTt92t5Eg@mail.gmail.com/

The problem is that as things stand, this patchset breaks the build on
Alpha.  Perhaps this gets resolved during the current merge window,
but as you know we can't break the kernel build ...

https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

--=20
paul-moore.com

