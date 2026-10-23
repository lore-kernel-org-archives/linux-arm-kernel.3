Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MpXq18HV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FZgskZkB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=; b=MpXq18HV/voqPx
	S93PnTh+DVP2PVCRgs06V2lVNvysJkGZqz170eji5BCtSFKB7vjO4Kt3bTI1bDLKg0/yb4tH+JooA
	OaEbc0O5U9cRcbCwnzYqTK2SAkKDBHHHw+SUXIkOUX0gETefOfAwoN6CU6hi1a4EiClR9OUVaVJE4
	lxSEa+OylLnQrK9eUlWSUO4jeOAfzy1+kzEc53oAl7XVDiVl1Ktx+4LsYKjqXc8WAWUUwu4NniCvo
	z/Uqg2Zj9oeJMt40zd0BTtjWhcLqlWs/dWjuP4ie9udf3WBoXT4CO4yjfK8cccIMdT4tWLIeNlcVx
	rSaH+X2Ivl3v+8k8hTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNGw-0000000H1c9-0rPX;
	Fri, 23 Oct 2026 21:57:58 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNGt-0000000H1bK-2wL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:57:57 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so41021137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 14:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792792674; cv=none;
        d=google.com; s=arc-20260327;
        b=RD78iWLv9RPnec3sGzbXFJ4/jeidBQYmVej4wVyrPHZmtTU7A4VCjLU2MkhwyaNR13
         O3xHeHp47AH+cFC+s6pa9jzbnmYlUjGIYFk+qyfTqLTgSJAhYcKRqXO6QVknTvm7XsOS
         oL+Qb62jJpVcBHmFfqquBTUYVZme0StyMV+f1ar3tdvQlGgOLRR8PvE7l2M2GTdorcxh
         N3zGZo9QJhWGuY2jky0HG8OWWMoXTI8lJo+H7IXtmy/sNIoI99uzvV4Lu2jv8BT4MIUQ
         cP2dUpathgUBo7gqZBKwe2YRPlp9vWYdWdduJf8qEr4dimurzUiskeHrF/M19IcLmHPf
         ev9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        fh=LZpgqPdN87xk6bXulWa0ALez0ghvssJSBpuWQGCYP0M=;
        b=srONOppQikbzf79MtItRMckYMLNLXjJ/KNc4o6RgR+4/Ux7CaFs2ciQ95zen8WF6Hm
         M1Ps3i1pp/xPpWYV46Rl6eymfImbZYnCb2V+rU2gx4x+VStrxs2jq/Q22FKK9qTD8NzE
         lHwpAg7XHsZm6/Frh9ovQ00zJHipDS5ZD/1VgNfcTiGNEhhmiLTrZHHxegKffJG9xiYi
         vXReW081sWmsq/uRTVmfYun2T9it1UdN9VRQNYbkDb0O3Wn1GevLdRZ1Af4xpFmu1Sgs
         RC5Qj/l2q766dQhLwwNxUPSxV23W0IE8GvWhg4ts0NCsGzNuyaXAeCmmV3qEk9QhUUKa
         DGlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792792674; x=1793397474; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=FZgskZkBCHWLM2o0Xsg+WXQlttOKP28UxUJEPqtH+hXOzPQV6Nu3lSzlTJuRf+MhG8
         Npb3WPmsMBxp5znb27q297Liqmk58RJc2pg4K4r5RI2ETVPqKBd0FbfY/IDfUm4yNgYh
         sXvvLncOgEQvCjBnIYpOI4gp7Q15GnGZ2c4ZCzrOBnHb8A9XDgYb+jOeeQyDVJUQCs5l
         HDaf8O8qpiobwBjA15kYPnLTELZViS+MDdeZ2Y+sBp9dzDKl3Rhl5Ib7PRYWVKGr4kmk
         PEy8mCnPJvzY3XLPnwU8KaDUNL7pWuAYMi/mHsN/DxiGywzp6Z2WaMXvVX0UKqwI+DlP
         YPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792674; x=1793397474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=DRvyIsKKaaVeOetgg5XcqmvNsufMMknhX+oAjRNdvZcPJ7ExBPDPLgLPb/5iIGJel0
         gtCm5lid43Y3+OMltzKtagFI1p/Yd4KV5CukP/iD5TyxNl8SD5N/SZgmebgYzc8WrYEX
         6qM/xB0AMtrN09MDuQCJRPvHgmaV9MAeGr8TH77wNXxLX2beUTfxzdLq2XIiHVVI4ynO
         Y9sCBtzw7JnpZKcd8e7ZSBDHhtkvhqCAkQuhady1vCY6R9G+Ntcrnjkgbc0XyqcoT9ej
         6oE4MeJ60ZGb2tm37E79vvs6FP7RSaIFFjt52jhWENvSS0gnVqwt+ueBIRpn179dJT8z
         wk6w==
X-Forwarded-Encrypted: i=1; AKwUvBz55/PnHZhPbSeJZ7TQi+TAmJ7lzhHb+pCuYSFNfd1cCDFeB1zdgSiAGaIRTKjskvYH5Qo5+z1RNwUzXAMggDJz@lists.infradead.org
X-Gm-Message-State: AFq9FYK6lSK+wsSaE0/KI9vOqZJGPcjFJY3cUs/SithfiOf5HldqLU1j
	52aEpOL/mjFMicyHehGILhR1a1AyU1sP1vNN/Aadz7eMji/u86y6cX+koOx6V3EKFgXSjFpTtlh
	khYeL26CKKSVU5l6ndDr5QGXCP1ik9zw=
X-Gm-Gg: AYBFou3JA+3Rcg/Q+Szx4YvJO7bpioI6BCRBlKdcnvQAejy0Hmwz8kvStsHUEQv2Tcl
	Hk2foy+OtdeEyF2xQVwqiCXrVZypRbkjgfmCWP6Qtho6ePCgkYE/sw1otcyOQwHT/rXxjA9AldP
	8JFiFnOYfZyEwK0Rub9Or7vf4ffkYq6aEvk4JPFlzBV6uy3XA0ihIcP4IQ98D39GlrHw4jWOJsX
	S7C4IJpiJ708/cMSwEP3uUtPS4/te8emq/qf/EAKmtAe+lDMg8nS+/jVWRxnH7/oA8eSjkTv7Wh
	pzWwBi+aVg8mL4Tc2MguwAPz1aQRKCkC37DGCoVM1yQ08GZ2HdATQO+4i0qQLg/coLf4XWrQYrG
	W5zuHqfG8EvmiN/wfl4C8mvquHvoEos/EsbUoUApjyF6/K5xFlBtsgCnfEbL5RXFw01LsZ4V1nG
	2AN7UIdcu0pK42fMiXDoTh5U9XW7+miBNPYIgKdrjEpQXJWZ+XFpnWeqsZeVr475nO1M6g0fNmI
	lnx5qX+KSi57bkJKuCmL18ie1c2e2TaUj6ygT9XUwqJTwybPNA=
X-Received: by 2002:a05:6102:915:b0:7cc:9d82:61e2 with SMTP id
 ada2fe7eead31-7ce5ccddc23mr173507137.13.1792792674222; Fri, 23 Oct 2026
 14:57:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com> <atvEczwQ8Xh9vcAI@SMW015318>
In-Reply-To: <atvEczwQ8Xh9vcAI@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:57:43 -0600
X-Gm-Features: AclHuK-L8Ck-SoXzjLhjbFwPtYn7ao_X3XL7jMPxi73vlDBLmOhNQMuoUPfGIac
Message-ID: <CADvTj4oF7ENRHQRk5VHVN2nuqxV-+4ss5BrwDvijmcS_HZ_fRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_145755_773462_AB2F0455 
X-CRM114-Status: GOOD (  21.19  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 2:33=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 12:42:37PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an owner snapshot without protecting it. Termination
> > can therefore miss a new assignment or detach an owner while an interru=
pt
> > is about to complete its descriptor. An IRQ status snapshot can survive
> > reassignment and be applied to the next transfer.
> >
> > Use sdev->lock for physical-channel ownership, pending channels and the
> > shared interrupt registers, nesting vc.lock inside it for descriptor
> > lists and cookie updates. Allocate and start each pending channel in on=
e
> > critical section. Read and acknowledge IRQ status under the same outer
> > lock, and protect cyclic notifications as well as ordinary completions.
> >
> > Clear the active descriptor pointer before publishing finite completion
> > to virt-dma, whose tasklet may free it independently of the allocator.
> > An assigned channel without an active descriptor is ready for the
> > allocator to start its next transfer or release it. This replaces the
> > completed-descriptor pointer and keeps residue queries and termination
> > from consulting a descriptor already handed to virt-dma.
> >
> > Mask and clear a stopped channel's IRQs before releasing its ownership,
> > and clear pending status before starting a new descriptor. Schedule the
> > allocator after termination so other pending channels can use the relea=
sed
> > physical channel without depending on another device interrupt.
> >
> > This also keeps process-context acquisitions IRQ-safe. Client callbacks
> > remain outside these locks in the virtual-channel completion tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> Is it possible split to more small change? And you almost add sdev->lock,
> any place only use vc.lock without sdev->lock?

Yes. virt-dma takes vc.lock alone in vchan_tx_prep(), vchan_tx_submit()
and vchan_complete() to protect its descriptor lists and cookies.

sdev->lock protects physical-channel ownership and shared registers.
The sun6i paths need both locks when updating that state together with
the virt-dma lists and cookies.

>
> Frank

