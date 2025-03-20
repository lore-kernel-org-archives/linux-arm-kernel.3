Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8CEC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 02:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/A2xQj+3TioBaE+xpRQvQnfFKywYOJNCGmwwcvlrZUc=; b=h5fn5JEpUpWQQ/Mx5SjtDW98Gt
	j8MSa5xQb1W9FbM8T4NBzmmO0NBAy/r6Wnmib9SoYoAvqJzv4XxYHMeDFoFmrIuZrMaJOgkdMvNQs
	pIu9ivTJ1hxvnypzAQuLPmNBmV/YCH/bLX7GQZXMwpDpaC6utERJzAUjb833WMF7CwFg8x1+SqHN7
	6vqqU1j0hq6ApqRsNQlomYb5GYDU93VSY8O1MrNARhgvsZEfPknsJ+jGAlztqO/zTtUQnrmPCcS36
	+PGXsGtrRasdRsKLJaLO7zDMP25ZFWc0nnLYwwhSYhYOpCKA/sFq2IQoOoQZ6OMoW7wG+AYGxJS7G
	D9r7VbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5gD-0000000Au6i-0kZe;
	Thu, 20 Mar 2025 02:30:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5WS-0000000AraD-3Hz9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 02:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B44E5C6707
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 02:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B0DC4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742437239;
	bh=B5xAUVdyEBI5NL4o0X34PUirmR2TMscmcGA1yOiYol8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VzUjHydgqjH1fNZlmVcYri/7HKzDk2PNpb3Y2DbiKDMBFuKC+1NFmZjsDI4xwl5Vv
	 tQpofyQKeRCKA+v0mtOhIaut90aBaJ/d2tAckjaluyVPD9ci5HkwixZXJLWNu8zg3m
	 xq1vpORen7R4F3DegPqXkd8GpdvV1C1DIp1GbIwxaxwgwWu9FQQju7hTVATv1RjoLv
	 zceW8XcfhfdhUiyFNy2aczvXddaJ2BhMhQTUkFs4WPg7sfDs6Em5Rhhdun2FoqFRo8
	 88Hxd35WsFB/Q9AKmpzeQ9iY2xRQkhomckKggnxejPgnEgiF0x+IzIpn69SB721zdR
	 /QPlAQv4vBsaQ==
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85db7a3da71so24009439f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 19:20:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx/KyluhSshcltbtHqTcj60HjEzGf0IzPwFXzjr9BX6zctUtWaD
	zGYzdGDDY/E4/32gRV88jpSsXosXVkggC2TWIJD2taOqmBA/llJ+sMldc/zCN11o7OJZHA1S/ZC
	yZs+igDxYfPp95ZIy9KuY1NDv6Xo=
X-Google-Smtp-Source: AGHT+IGhOnhAnh34kZ+zv/L2skY/lReqXGHns8jGUDumOrwPKhbRTO/xpPIr4I5A0Xo+tU3bg7S05AvFMM4K1Vc/JgM=
X-Received: by 2002:a05:6e02:2183:b0:3d4:244b:db1d with SMTP id
 e9e14a558f8ab-3d58ebc0388mr17890885ab.6.1742437239151; Wed, 19 Mar 2025
 19:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250319213707.1784775-1-song@kernel.org> <20250319213707.1784775-2-song@kernel.org>
 <yrqgoc66te54tuffkrc74clsosiid2giw3gpc3kd3ddl4662tb@kiqh3ncfxwnl>
In-Reply-To: <yrqgoc66te54tuffkrc74clsosiid2giw3gpc3kd3ddl4662tb@kiqh3ncfxwnl>
From: Song Liu <song@kernel.org>
Date: Wed, 19 Mar 2025 19:20:28 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6AUiu4CryCkskHxe=BEX=LA9P81MWX1aGSN4j0bqTFXw@mail.gmail.com>
X-Gm-Features: AQ5f1Jri4qNGn9AAXiMELLGeAwcxC9xcx-0pWMyucSXtztpkXO4sg_80Fiu2hAc
Message-ID: <CAPhsuW6AUiu4CryCkskHxe=BEX=LA9P81MWX1aGSN4j0bqTFXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: Implement arch_stack_walk_reliable
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, mark.rutland@arm.com, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_192040_859031_F88AF53F 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, Mar 19, 2025 at 3:35=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Wed, Mar 19, 2025 at 02:37:06PM -0700, Song Liu wrote:
> > +noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn c=
onsume_entry,
> > +                     void *cookie, struct task_struct *task)
> > +{
> > +     struct kunwind_consume_entry_data data =3D {
> > +             .consume_entry =3D consume_entry,
> > +             .cookie =3D cookie,
> > +     };
> > +     int ret;
> > +
> > +     ret =3D kunwind_stack_walk(arch_kunwind_consume_entry, &data, tas=
k, NULL, true);
> > +     if (ret =3D=3D -ENOENT)
> > +             ret =3D 0;
>
> Is this check redundant with the -ENOENT check in do_kunwind() which
> already converts ret to zero?

Indeed. This check is redundant.

Thanks,
Song

