Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49CFCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VylDR1oWkJ0EiX1c8eLC+dJ8zDkBar7+OrlY7elEsc=; b=ejg68GM1Enkh7koK+U1HWtuns6
	HnKfXmxGZWpXzvnJOettf2C0mafYr8cmILAAuZPWTH769ZlxpcxnX6st26nEIOUMA3+IADgDROdlo
	JhfpBiCcgs5u7VEMBgxiQ19B7ZHf4fywcVDxae4i/rttSnBtVZIWDuPNkh4t7KBGkb665UunX4ydc
	lKrmTczEZIXLzPOr5Vxad8WQOVwVKQGUNphL7iwepMLgUqtvekXDCRC/AoUNgLXLJ0jYQlgzxsVVB
	+mbtMYdRrS8U76cLyMVY04gm3sv+IRhENDdsxiZ90ME3Eh05ZEqfQOAqS5yPShk0AvpcCkrPQPeyO
	TAxz1yhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hN-000000088lc-1yUJ;
	Mon, 18 Aug 2025 17:31:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo13u-00000007moe-2xIV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:42:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b9d41baedeso2231462f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755528133; x=1756132933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VylDR1oWkJ0EiX1c8eLC+dJ8zDkBar7+OrlY7elEsc=;
        b=NTYUswumgqVmfr0ECFVizOkBs1wvrHEyvG5rKcQ9jWIM1T2k7s/2wRrmh+1f2Vua9w
         0IP8yB7s3fsU0dV+XREjGmJ2ES00LuP4tbn7kPyksdpKeZyzMVU79jTcQqdx8bStXxHe
         5z6ZXYPoPepJIiyxKCvznLGf9FRAsrXtxnOtoiSeW8mrkVGfIi5oujvJisJWaLgwUKam
         C+S05hmjVyUDwVy2OPkCTvi6EGeADCJrGLPCzZ4mWuZt1bchOWM7+SuK+GmJ/xmgtOPi
         o5/wkY4yFh/wnbtwFzisuOip9GXwJmfJdq0zYBnvoHdLa+Pvbqaj4coDnGi8BRWJO5Pt
         ss1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755528133; x=1756132933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VylDR1oWkJ0EiX1c8eLC+dJ8zDkBar7+OrlY7elEsc=;
        b=v2BydnstlHJ4nvLRTmCdiRnA/p/Hys08NPKUYakMfSVJCSHSGmOtr9TZb8wr0d7ed2
         7nIut4g827/ks1Co8SnFotPHk13CNeeRP8cKlwuds+cyanEQeTLyf/hmzs37XFI5dTS+
         KsUfIgncKrac07zjsL7VPsKZBjszfmAw7Ma/+A8G9HGWpo18h6/XAkiTr1hiq4cRa3DC
         XbrTRqkENUxRLaL1ZNdNyG86QEhaE4wTEmzFDiABW1R1soJgASgFQTXO43zGBumkBmX/
         pZmM9jIPmfbvoclvMTbZKT8uz7jIH265CHBdqoWzt33ecGnWQ06bDgo3ne4hYNo7H5B4
         i7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOhoi+YjxjBeK7nbkNaguisUcfk03sVneg8jSK3n4bj7c0PCHk1YbGEVvYbE/BitBmyf1NQyJvN8sbwCFOnVGw@lists.infradead.org
X-Gm-Message-State: AOJu0YxbJ6edPXNx8b5N3ZvJT8i6eOmx13dkIBOjBnWcfXpL85M+O0fr
	sPh3zOOaJXomXlEanzwI+Kpy0gP9AjfOKyCbfQVAM3KPj1F+QG7eBWXKzcz7Vf6Po95Zm3UEbRc
	2EvTXVh8xxygdzTVw+VNBGkXdRMzYOWM=
X-Gm-Gg: ASbGncsQvI/G4f3JFuo4mYsOrXIDi5CSUE+AwTsZIvDt+SutV/87ZjnGSzB9RrxNfRO
	pWe1ugRxKA47sihNRjYydRbbMAQVVxOEBad7+o3K0vbGBgKJySnx0pedUoWJO6d10FO6hIrtF+H
	XYDLgw4/SxuvKsXKXW3jN6c5Qa1MNkU4Z88SS2pO6R3Yz5VVOHKPXhJf+rDUbQeWlXA7grBqcA7
	SLOO2Yz9g==
X-Google-Smtp-Source: AGHT+IF6uyFUGlyDCHbyGxLbiebW15nl1dAN+7KqllTQkgQUSLDjBnckdQ4PrtuCjAiIJxTGaqJ/sn4x3b+8l/vlLUI=
X-Received: by 2002:a05:6000:24c5:b0:3a4:f50b:ca2 with SMTP id
 ffacd0b85a97d-3bb6636cb19mr9221513f8f.8.1755528132931; Mon, 18 Aug 2025
 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250818075051.996764-1-yeoreum.yun@arm.com> <20250818075051.996764-2-yeoreum.yun@arm.com>
 <CA+fCnZcce88Sj=oAe-cwydu7Ums=wk2Ps=JZkz0RwO-M_DjfVQ@mail.gmail.com> <aKMmcPR8ordnn1AG@e129823.arm.com>
In-Reply-To: <aKMmcPR8ordnn1AG@e129823.arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 18 Aug 2025 16:42:02 +0200
X-Gm-Features: Ac12FXwekbsyapeljRABB8AE1hyjZDIfFB0HZbnsKW56XSmgXNqVbJdHAoiUZKU
Message-ID: <CA+fCnZd9m3WBPimikuxSMNar-xbDaNFNQEJ9Bn=8uCMe-uYHeQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] kasan/hw-tags: introduce kasan.write_only option
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, scott@os.amperecomputing.com, 
	jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org, 
	kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org, 
	oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org, 
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com, 
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_074214_743377_AA537FC3 
X-CRM114-Status: GOOD (  18.24  )
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

On Mon, Aug 18, 2025 at 3:11=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
>
> > > +           hw_enable_tag_checks_write_only()) {
> > > +               kasan_arg_write_only =3D=3D KASAN_ARG_WRITE_ONLY_OFF;
> >
> > Typo in =3D=3D in the line above. But also I think we can just drop the
> > line: kasan_arg_write_only is KASAN_ARG_WRITE_ONLY_ON after all, it's
> > just not supported and thus kasan_flag_write_only is set to false to
> > reflect that.
>
> Sorry :\ I've missed this fix from patch 3... this should be =3D=3D to =
=3D.
>
> However, we couldn't remove kasan_arg_write_only check in condition.
> If one of cpu get failed to hw_enable_tag_checks_write_only() then
> By changing this with KASAN_ARG_WRITE_ONLY_OFF, It prevent to call
> hw_eanble_tag_checks_write_only() in other cpu.

Is it possible that the write-only mode will fail to be enabled on one
CPU but then get enabled successfully for another?

What would happen with the current code if the first CPU succeeds in
enabling the write-only mode, and the second one fails?

> As you said, kasan_flag_write_only reflects the state.
> But like other option, I keep the condition to call the hw_enable_xxx()
> by checking the "argments" and keep the "hw enable state" with
> kasan_flag_write_only.

Assuming we keep this behavior, please add a comment explaining all this.

