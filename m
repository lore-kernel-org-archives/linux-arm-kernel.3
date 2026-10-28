Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E858F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S1am5s+l;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=Wzb7NF8J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=; b=S1am5s+llfitUE
	YjqpzgHakbvdsWEdPvW/n/8mcBef1S13OzY3KigTIgv/ZaAgHaWevVNxY28Bi9o8nkiftgiP/QCoC
	LzhV/HTbSo3Gl1r22eX5IugPIzRSjy8qJBmFT/5jaYL9EX1WuJCWZKKxqNy17G9nWBTwJyPlQAoja
	w6lb4O6RJl7LmjsNtSEKltxYKz6BrWBjxF8VDdiBNsBim0OTia29vaZFywnFZ/GfyZUaoelyvWrf6
	OWGAWB2qIa9LjlHHgx41a1qvf5hQTg3kRRw0gKrcaE/rOkvDqwmtVJ0dGXDPI7uTAd2aY7VMOUqDh
	fFAtvi6eAdWLLYvmIPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMDDl-000000083xU-0Bdn;
	Wed, 28 Oct 2026 23:38:17 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMDDi-000000083x8-04Tg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 23:38:15 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b10d24345dso15191157b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 16:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793230691; cv=none;
        d=google.com; s=arc-20260327;
        b=lAuLa+xFlG2wTcaG5knhtAyvejS2xtGaJiBF02n7o32aYnoeJwJePBE7Jo13GwG8QL
         8d4hXUgur2wYjSuxblj6YGe8hJUKsk5GNW/WHxNI81j1St2/o/1jDqNKdMNxr6XmJcmz
         Q/AsMF4YKyJORV6vdKZ0eZ7ihBGIm5t968tLzKtj/dxRwHtehpWTPqemM9otZh/OLyr1
         i328UUdqnQww8MEUZGLVOj1oHjcmOgJZe9B55w9c0QdclpbmQ7Vtz1g5YeqWoph7TPmG
         WZ6t3THUgN2ORyUMdnKk6LU/oFnP0TBIu9VanbW+X04k8vec8sGEXdalQmiOmJfn8KcB
         oYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        fh=n+9LACs28Dw2RL/JOPZ/MKziq5hM9FpYVsnMfqb5EZY=;
        b=dVxK2lHSrSU3Fka3hXj7jrHaFASdp9IME5MSFcHCHzgz5xk2BNupbYdvi3McMgfuw7
         ixp7zGJICQCC4BXHJ5dyKj/TxVuQtqo13cm6dTuDjoH3ZkrabEBPksAIJWe08cNeDZmi
         Rd1NbUGWa8V2seSU/OSwNoXtWG0CBxys5ifBX/Vj410aHfB6ZDlBaNKViDyV1DSsrVYR
         586FHd9Ay5KpBgb9z8ygebYFUJL2s4z30Ljjhgg5anTcsH8eEv+waVerLgO2vK6j0Vwb
         PIOwrHa2Fda3b9i9Dm5g0ul6N2Wumg0pih28LsHm1zipLNfcmkonBVcCzRqz/eW3sVt6
         fu5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1793230691; x=1793835491; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        b=Wzb7NF8J59Rb6WU/87NTcDR+TjSTnmtga11EWPr6fJnOfA78lSID3LWZNdyI6L++Bu
         KV4Svuc0lVBDeNKbxXnF41YbGzvuaNGCPJ6AuaOtt0UyLlOu2i9WMMMr49NLy2FG4heJ
         bPDDAshZCqcvh9o0KW1aTH3UcPYLEeydtfIjwO3dPKr7sVREh2jvpT/CIdvAc2q9b/zI
         ibpZUgzSZteTqtHSXkKAgS9FMefr1l/Mn8TKHb4snoWJwcmbFhfDohd2dwqEEJlY6+jL
         UwzBf6Z9bUGJ7KZ8iH4Y4s6d64NN1qsG0wEcVqGAiJEtsF1ZUCnrlk6LT2uQp2l7MmqX
         ywtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230691; x=1793835491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        b=VXbG28cWlIGXX2vrbxGZ76u7HwVXhtv5EW3VwoPucSKdUjLPAgFFdhnaULgAR/CHFR
         clN5o6kXrt3Xq6k3JlMqAoKDiuCZvl+Wg2oqOSFdUkN1em/rHWNdSK4pnq7xgE8e4XLN
         9JsY47Fd6OUQCgwOH+WLOhrXv++Am6V7SD90CRcxXgat/GgmOVbZYzz41TNvyh7c0x4k
         97HkPa38dNiwJEUKBF4MfwGYssJI23l+5+lBupcw0L5ORM9afUqjHJ1/mA2x4jnaPqhU
         wjEihm2kzhOf/1li+gGrsuH/FD10QyMTqj3fUKEWhtNgp0k6+3FSi21+kCTKaQUJfg05
         JW4A==
X-Forwarded-Encrypted: i=1; AKwUvBzndmfySXjW6IF0gMTDt+7fI6GfnPP79L4HPZtpu8iwT8aaQi1iBOb5SFj6Ij1+hV2a9pTQoSbaF79i9Yxg6tks@lists.infradead.org
X-Gm-Message-State: AFq9FYL/9+xQFY6s0P+7Ou3Acj7xL8Ro/zNDzv+pCdl4OKjCfxXzxmwM
	7gi6PyPrhOXdHIcKsw1jfkEvoeh1NavHxXqQ6BPuLc6Z0UXXxvv+5/qIm/zDgiPhdYsOpHzFoA5
	7KZI132KcbxubBLt663RvnXMLgfiuJTDa5Z4Ew/OM6RKXHorS+Nn5Q90Nnw==
X-Gm-Gg: AYBFou2N6mmQdkNIvBMkdhqI2vnKslQRUys8tTBSEFelACYI6pyX1fj9pGRWoZKsPwG
	uSY884/t3zTpDZYhSrAIFySiEmZfIDa+YDmWSxcGOrtb2gnzbJYFboXK7WFmlIPoC7DQ+x+Eg+R
	urkgccupZTyckBw8UWXB2MsRu7Jh8rBEPoqO3yIhRIHLVmWZO7hEOVVSiDrQkrQgOX1wlLPQ78c
	cRQh1LJ2+3CaIIkwFd3V5zE5+iYoIPuBjZ+aljAhQx8GHJ3q3ARF9vpC5cjSDuhZwZHPRF/f6Si
	TkDjh1tubj/KEY/eenSawlwN0yN5bpD7NRHbhid8jCkzOwWrnnuX2HrMzMF5gdFzcFQM6NvAh03
	PkIAn7YBi2sz+iJrrXj1Ud14/d5CBMBGz4snsiJfr/9dGYF6v0F4Jun0/RFMrjUthCUReq9FOFH
	vlHX1V5Gl3wgrhvsBQKnKJPVJMgI/qAS5i46lSZ7ONoTZjt80uRsTXHEQ=
X-Received: by 2002:a05:690c:38b:b0:8ab:37e5:6678 with SMTP id
 00721157ae682-8b1b5d394a6mr28742787b3.44.1793230691387; Wed, 28 Oct 2026
 16:38:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com> <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
 <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com> <auIR2GFWZHUP5vzs@SMW015318>
In-Reply-To: <auIR2GFWZHUP5vzs@SMW015318>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Wed, 28 Oct 2026 16:38:00 -0700
X-Gm-Features: AclHuK-LKjsKCaobPjRchQyPcT15lMhGBWVE2x98cOvF9GEVC10J-zU2k9Et8_w
Message-ID: <CAHnw2UkoFcTHs7nXBBFVEZpyf8BCTs9tpkSmj5RXCsSoaQmK4w@mail.gmail.com>
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Suraj Gupta <suraj.gupta2@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Alex Bereza <alex@bereza.email>, Folker Schwesinger <dev@folker-schwesinger.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_163814_238157_D63D6260 
X-CRM114-Status: GOOD (  21.02  )
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

That makes sense. Given the cause is likely a hardware fault, and
that a timeout is generally a sufficient and common recovery, I'll
drop patch 4 from the series in v2.

On Wed, Oct 28, 2026 at 8:16=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Oct 27, 2026 at 01:36:27PM -0700, Jeff C. Jensen wrote:
> > In theory. I haven't seen a reset time out on our hardware. Every faile=
d
> > reset in my testing was injected with fail_function, as the cover lette=
r
> > notes.
> >
> > PG021 describes the soft reset as graceful: "Pending commands/transfers
> > are flushed or completed", and the Reset bit reads 1 while the reset is
> > in progress. My reading is that a transfer that must complete needs the
> > memory side to respond, so a stalled interconnect or memory port would
> > keep the reset in progress. The driver already allows for that, since
> > xilinx_dma_reset() polls the Reset bit with a timeout and returns an
> > error. It just doesn't act on the error: xilinx_dma_terminate_all()
> > frees the descriptors and returns 0 regardless, so if the engine is
> > still fetching, the next transaction reuses segments the engine owns.
> >
> > Patch 4 may be more than this series should carry as a fix. One option
> > is to drop it from the series and post it with patch 5 as a two-patch
> > RFC, scoping failed resets out of this series.
>
> Yes, reset timeout is most likely Triple fault. If timeout happen, most
> likely hardware fault and can't recover at all.
>
> We generally choose timeout value is much bigger than enough.
>
> Frank
>
> >
> > -Jeff
> >
> > On Tue, Oct 27, 2026 at 12:22=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > > > When xilinx_dma_chan_reset() times out, all the driver knows is tha=
t it
> > >
> > > Does this real happen? or just in theory
> > >
> > > Frank
> > >

