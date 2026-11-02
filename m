Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A211A6093D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A36x4XR8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PxSnsToW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFzyKJem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=; b=A36x4XR8u2PFaQ
	EXsuzgC7HtpTkPwiQ1rdJvGoQEgPsVCbG4AB9lweU4yKfaj4MgWDWUHskIe/Q85VfhabNupk19dkn
	Dxif3KfsbJYkirANgBmSdZVJYiDhkfSToSE1vYh1DXyvLomf6yOAd03zPpDgkG2VGtmUyTYQlRmeu
	bZF48ldMMCLq2v4jyIPcVp+1nqJ5xCcn3WuBu2bni/yz6jpPf0KKP64NN2W17lnXwuKa362ngHJHT
	yV+pnSyZRW292/FI4BFfs03qN9GaUdeQDpSFaOqCy+wE8dNx4zKh2YrXEAfxMUz7aFlno9sDgA5lm
	mhvvKJUJhzG5pbuUJ+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtjt-0000000H1K7-1TWs;
	Mon, 02 Nov 2026 15:14:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtjr-0000000H1IP-3kfV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 15:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=; b=PxSnsToWqvMuisnDbz1PBfjhCd
	B0dW6GPJzSFLJfNbaan52JKWrPcupbjLBCzpeeJuF9VkpjG5xORYELMrc/r8QSsx8Agr4zRra/fww
	JHoXPK7defiWtMRvZkGYIUS2A2CgyXu+8+DvM7DS2AItGFYFrW6nFc9Buyh8KWSo0gelvJHV6kbnV
	3hXLKAOs82Cwa57mD5/H5RQouhG700N90GkYVuFkfG5BfsdbCKHx0oGht6MBa9XvqHK5WEyW8tzVk
	hLKkhKLaKiraU0rjqDzbDQR3mT6SzHutPsHdKu7cEG+j/zWp9SYsJq+keHtQ9Z99SmLUOUEdyi4dd
	lKslLa/Q==;
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtjp-00000003MyW-0AMc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:14:22 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-14394530ec6so3873426c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632458; cv=none;
        d=google.com; s=arc-20260327;
        b=fPJbTsbtZk+9tiA3Wt7vCowcNdCSK9hmXiWvrSlQQUjtqplkw18l5Zqx4rcljSpvhQ
         72lZj/d9UYnxNK3oV0xLOByzxazhhw7Ghl7tj3KF3Ef08kebURUl7EW+4EApf18zxc+R
         OUnTbl4AoA+Ma+KHDlydj7EeZagnfHKbdOLmnQE2fOUlkHnf4z2t6q3qR87QyxHzuVtN
         qs0vh4q+PbWNtXFSy8+Im1fLxPc0lRQMMw6ZG84gyhXHbEFchN1tDIRRXcO9VdmF9P3y
         VXYZqAKkQanquB38HnFEysHsl/VOzg1pRcUFnHXhctwpQ0zTTKAXk7tKmj5qau14PWlE
         R/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        fh=KK18517UMcvAKPLm1HUMMGqrm41xV0q+EAXlxQKBuJ8=;
        b=Bj5cX+VESIY7I9yRayl4kezvyMWt9CqZuLGKOokt/gO/1Nsjx4uaubmz6VTnihvcBO
         RigOplPWfcQ3RxH2exguLW8fv4v8KXjvT8zADoB6SU7fL3lkhm2yo3XJgVGWR8nhz97k
         6H2pN6NJqPVOLoKZhYf/ejP/Y+hcaeuT9X/9AgTYCzUf9RpiCsfmBrap+X26MJnRjzjp
         FvpmayX6asBQTVcDbatBAURFNzlgrwbdE7D9WoiaWX0ViVOx1vCqn8h2iakDxfq78dWp
         jbKLav6eqgabT7IzsJK6WIKlQJGdBPF6GyVV+JgVPyKd73MwMf6lYNeOfyDET6cyb7I4
         DlMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632458; x=1794237258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        b=bFzyKJemr25twpVzKPEzq0B8kgyVQpDDGtIw4kLus/OYjTO+ZPsxFW+1hu30IplfMg
         U/8RkxGulmOvtwaa1dshsBwlwus9wa7Lu4X8SKLMuHBo1QClIiOCngySqFgP5QJDTRLS
         Yt+jicKTTgLoZsRObOLGpQsq+y6uGrljC5BLQXx4e6jqmf1kW6/2Jiz2XQjj2EsqT/os
         O7RQVOSAOXWU+1JVn39OMnzXsBd7+IbHmyZqB5CTUJ/q+RDwZX9QZlRxEmSXEYuKACBu
         C8XBTQkAPl6PezGD70t5zfbwYXaZtD/9/Hx01YMxX3N47Y/No8JbZkqhLpeKeXNN3rAj
         cO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632458; x=1794237258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        b=TUQE8f5jUrsfvW8PRORwN6Wat5aY/jkzQuaKzE68lKy297+o3Q1k+fLhSSHN8pI3mY
         VqaIx1W4V+mKxsXqypYOg9CyYdKAlB6I8/LAI9DQtd/KbiNEKdZjTuzFXFVkRtS119TQ
         wteBYNYhL23OBgNScYCQE00Ea+Bapp1rPIG0tGkTCTRv8Ygis0c2g3R7ck62gE/7mFqW
         WJBXfLB4cx1i87kOQK6hwmpw/ZiR7Tn22/UM88+Sj64nODdMJr3Lx/lAr4KUprCaxgRt
         l5Wfo192IjJ5HKx56jTJMA4uMZLMOqJRZjuezAzHlO33lTxTA8SKWj/BYk8ioKsRnrvn
         ovKA==
X-Forwarded-Encrypted: i=1; AKwUvBx256ukoJyxXRiO7lPZ/pczIiNPLeD/rAWUVaqaJO/w/eLUDcG1s7HyzVFoBrGih1Ba+Lp6RGw6zo0IjD2eFQXL@lists.infradead.org
X-Gm-Message-State: AFq9FYIFdWB/myoOh+UsLu/k+VA/Nd8FPKBCJNNAsLNmk+KHzaO+naJ6
	vREQXjxKx3NzGzzBN3QcfwOJAivEJUZp3zDbOrvoMF2NsvIg2sauBObNaJHRgONPO8k2Q6Ygh5h
	5bBvUJXA+KXOWrE58BbN7T0oVs2svBTWHK04bC2k=
X-Gm-Gg: AYBFou1AvceqxaxvITBG4CAK2VW12Ft69x559e58eeYt12cLHTPB2ZPjv7d7LObNxZA
	oUKGnv1L76NEfcogx/DcSimHqT+pDoIH4KD3IKIEt8fUJEFFfaWhdKXOxHAE2niVPAc7hwbKyKI
	nTi0MseKK0KjBanelJbInGxxT2uDR+A6nEGW6ggxmfc4y9qJqKSCeSnilFrnc/N/MMDnwF7gEgs
	0GYMNUNq7AVBh9S9g2zVcQXikQSX9BZJ0LC/zb4vz0WoXL9Txyf+ErXnx/+u550+eAhAcvLpaEI
	BZzO+b0DwqvZqk7lqJEldpMIXyxRPv2LAQ1hmB5DNZWAnVWnClybwZiC112H1WqorGt9o1S1JEl
	PNxbJKeGYj5mMBu/hao2wx6viZKm5XyCQrQXjTNUM6mkDJqpSppiKRvOLd9BOfuXqBlZtYiUw61
	IWufAwbYh9xjBN
X-Received: by 2002:a05:7022:88:b0:144:fb31:a597 with SMTP id
 a92af1059eb24-1ac6069cebdmr14582009c88.47.1793632457694; Mon, 02 Nov 2026
 07:14:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com> <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
In-Reply-To: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Mon, 2 Nov 2026 16:14:06 +0100
X-Gm-Features: AclHuK9s_qVGMHFu-dL36Q48-lWDPnNvO_Yb6GHSTKkiWePXFsWruUJSaC8neac
Message-ID: <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151421_096342_5A2FDF64 
X-CRM114-Status: GOOD (  15.58  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.
Depends. I think __builtin_addcll() is needed to get roughly the same
performance as the asm version. In my tests GCC on arm64 turns it
into adds + cset instead of adcs like on x86.
But I will look at it, thanks!

=D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:44=
 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com=
> wrote:
> >
> > I would prefer to keep only the scalar version of the fused copy+csum.
> > It reads the data once instead of twice, and on real Armv9 hardware it
> > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > depending on the core (+6-8% throughput). It uses only general-purpose
> > registers, so there is no FPSIMD state to save and it is safe in any
> > context.
> >
> > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > the scalar path only, and the KUnit fix for the x86 zero-length case
> > Jakub reported.
> >
> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.
> saeed

