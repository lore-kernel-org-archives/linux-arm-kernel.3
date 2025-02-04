Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85816C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=; b=og7lVhMDH6FXcX6ZrlFL1SgI82
	/VDJhLo0oAVS1AihBIUKuOVObPSSOtRu8S1brcTOBLMrvVB5XgDK2GSmuIS5H3nWAIo4WsY4WF5zx
	gEVDXCrR/aQGxDnC903PDFK5woW18wIUrctv10SwzQJQ/FjA9A+itrjSiFt47so9oIwKtgAFyNHBv
	IcIWxQE9F9oSsZL8XC2PsxhEfIELgTc+Oa0jwbwpl4sx+e7qzxexSx+gZQPE66BKN1z+XISazXIes
	rfW6N8VasKdk3JtNN75K8TZeA2xhyESZKDKIhzjHYX5ynKhcZUBgcgn6Q5RmniFUl9m7KSc9o92Bu
	aHW+l6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOVR-00000001Lc9-11N1;
	Tue, 04 Feb 2025 19:22:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOEz-00000001Jdh-30Sd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 19:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=; b=TA1Cw0+79Y6j3Pe/+cq91OrsrQ
	rDfW6TnlgaPI/lx4pwdEZ3LWwDY9wNbxaJZIJ1ghzM8r7V+Sb0/NxUJsFU3m22Ct41EzkBJHmErbe
	8JTFnx8aF+wMehHfRKW0y+Keg0A28QC8pnsrJJQZ8w7q7xUgax3xvGYBFkrBFTvWPzBHiLYxxryYu
	7S41+35zPpUUlj86im6pUfBlwfto/FClSzgUbC1dAWBGYbTEpzBeI/jP9FR+FmKhmhSW3yNMHQeMK
	EuEqBxvyWk20UR9Xqib+bCeeqlwFri2MAYY2sybLT9aSZ4QTaG6I2UXlPPp6mAbAieA2OsDs+5zp/
	Atm2BhVQ==;
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOEu-0000000GONY-2abA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:05:44 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso45518055ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 11:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738695938; x=1739300738; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=;
        b=DHd2XtzKnL6L/FLItM9ZWuRENZpgagPPyoTBGjLmVQvqmd6GbA2cgSPAQhu7IdIKSG
         eaRbxnMOJ1ltYZG7rB/wf3mphuibRWdRuot2BZONaa02IAEUEUbT84CkRybtyBEZPkeI
         C6BabGUC5oO4emfYFJOwlz+Dkou5iaO2V9uC7QPj6ooc52JAiGQrfs8wEoSHSYGdC2jV
         PgS7rzHGl5+1GBOX+LBPqeoHGuyIQOtcZGblUt65H7kd3/VKSWfFfEGCpW/mzfABGUWa
         ScodPTY5COQzhnTjyues7IRlh1Uh52i6y6x5qyYLjq2LvT1eyiwcdzyqt0xCvPkqwwhQ
         O2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695938; x=1739300738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=;
        b=cnGzf9yNfhZfvn+C84HKe4YGdwL0bKgUKoCeTT+uTgnMdPXtI4aeKqBKdjrpVsIYZz
         4ai7FujHp+5z4oBEEtzRracxPS+K3ETOKJLTtmM9AnhKgJpV/zfuxCPBJKSE4ca529Ab
         8MX7qpoXpjAN85OoWKZwA4t1kWa1EryIG8h2dFHh8PBHPDBm98bu5ZztDDh/PUAJSE01
         JZWrOh6qcfR9TUiZO+6wP8Q93i4B6kMGtAZjvcUN54X2uttsmIs/8in9hoRUpCljMEeF
         RELnRAUcBoUVsN3MnY8kvNryJCQKP3j1Z52X3MzGFW8SByLAsxYCWsGjLvrn/Y9wHkLi
         aYkA==
X-Forwarded-Encrypted: i=1; AJvYcCUVrv80q1jt8mzGbxWT8wLSANiiCO0E6ddPdlZpXdSS6OVyThsKUL1siRObGh8RXCzrbCXF+zcpfNE6li6iA6Mg@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOVq11NLnoqT9UABu/P6SxDE9C0euigLiAwm8FQn4DsCV/X5a
	0X8XB4Yx7+jEL3V2qZK4JSYnW22Bej/2NnVYdKiImbaoQnVK0Pp+INLDkU3vVJ0=
X-Gm-Gg: ASbGnctLnlWRg7M1f2ItopD+3YKWplc8Mhunn2SOQablEI5iRhv7oGIjJ1HIE/NEnPj
	zfLE8WvL6h+qqjiLZW+An38tyyZyIj7DBVNK8GSKqPWAsgE4OSMSWzuZ3c+197auNZ6wRivxLYT
	J17K+qbKXfEuxqlbI2tF19nsPkiTaZ8pwe6GbZQIhLl1arViTEHmpUWs6SvAURK0AF8m5jLeIx2
	P3zadP+qZs7o5YZ43DxHOkkN/cBEq8iAfwCJrYyCOJEsotHFwV8J1oJtXOjFF1ec0cFSQWfX7Rm
	UsPesA==
X-Google-Smtp-Source: AGHT+IGX0H3nuw7h5Pjn1noXiepBaQQUopjt9QfDVUMZhCxuDfrTzW15XFUboTC/O2xCeIBQM6sASg==
X-Received: by 2002:a05:6e02:1945:b0:3cf:bb11:a3a4 with SMTP id e9e14a558f8ab-3d04f6e596emr607745ab.15.1738695937767;
        Tue, 04 Feb 2025 11:05:37 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7469eee7sm2833134173.91.2025.02.04.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:05:36 -0800 (PST)
Date: Tue, 4 Feb 2025 11:05:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the
 build
Message-ID: <Z6Jk_UN9i69QGqUj@ghost>
References: <20250201071455.718247-1-irogers@google.com>
 <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
 <Z6EVwaOVYaKtaK1j@ghost>
 <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
 <Z6Eh1QLuqTbUKLCc@ghost>
 <CAP-5=fXZr8L4Z=Lb28QDZF8cbv2eJJEHSb0H9zcqSOB9cn5-9g@mail.gmail.com>
 <Z6FLDHz6V5L-HGR7@ghost>
 <CAP-5=fVk6N=FVXsJ9xRJZhYSh2sbmUkEPr5HqRd-pR7mbGts+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVk6N=FVXsJ9xRJZhYSh2sbmUkEPr5HqRd-pR7mbGts+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_190540_952921_2670C2F4 
X-CRM114-Status: GOOD (  58.11  )
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

On Mon, Feb 03, 2025 at 05:58:29PM -0800, Ian Rogers wrote:
> On Mon, Feb 3, 2025 at 3:02 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > On Mon, Feb 03, 2025 at 12:54:59PM -0800, Ian Rogers wrote:
> [snip]
> > > I think it makes sense in the kernel, as the built binary doesn't have
> > > cross-platform concerns. This is probably also the reason why the perf
> > > tool has an arch directory. Let me know what you think is the right
> > > direction for the perf tool syscall table code.
> >
> > I am hesitant about moving all of the arch-specific syscall generation
> > flags into a single file.
> 
> In these changes I had a single file to build up a mapping from ELF
> machine to syscall table in an array and I wanted to keep the logic to
> build the array alongside the logic to build up the components of the
> array - so the ifdefs were visually the same. As the scope is a single
> file and the variables are static, this can give useful C compiler
> "unused definition" warnings. You can trick the linker to give similar
> warnings at the scope of a file, so this isn't a deal breaker.
> 
> > There is currently a really clean separation
> > between the architectures and it's possible to generate all of the
> > syscall tables for all of the architecutures based on the paths to the
> > syscall table.
> 
> This doesn't happen currently as the build of the arch directory is to
> add in $(SRCARCH) only. So
> tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls will only be
> included into the build if SRCARCH==arm64. As I've said I'm against
> the idea of the arch directory as it nearly always causes cross
> platform problems - not an issue in a Linux kernel build. We recently
> eliminated dwarf-regs for this reason (and hopefully fixing up cross
> platform disassembly issues as a consequence):
> https://lore.kernel.org/all/20241108234606.429459-1-irogers@google.com/
> We could have the syscall table logic not under arch and generate
> multiple files, but we'd be adding extra logic to pull things apart to
> then pull things back together again, which feels like unnecessary
> complexity.
> 
> It seems in your changes the Kbuild and Makefile.syscalls are running
> in the arch directory - this feels like a lot of peculiar and
> separated build logic for just iterating over a bunch of arch
> directory names and calling a shell function on them - albeit with
> some arch specific parameters. There's also an extra C helper
> executable in your code. 

Yes, I can understand why you be opposed to that and I don't have a good
counterargument.

> I kind of like that I get a single header
> that is the same across all architectures and with no more build
> system requirements than to support ifdefs - in fact the ifdefs are
> just there to keep the code size down there is a #define to make them
> all have no effect. I hear your "clean separation" but I also think
> separation across files can make things harder to read, state is in >1
> place. I've tried to cleanly separate within the script.
> 
> I do think there is some tech debt in both changes. My:
> ```
> #if defined(ALL_SYSCALLTBL) || defined(__riscv)
> #if __BITS_PER_LONG != 64
> EOF
> build_tables "$tools_dir/scripts/syscall.tbl" "$outfile"
> common,32,riscv,memfd_secret EM_RISCV
> echo "#else" >> "$outfile"
> build_tables "$tools_dir/scripts/syscall.tbl" "$outfile"
> common,64,riscv,rlimit,memfd_secret EM_RISC
> V
> cat >> "$outfile" <<EOF
> #endif //__BITS_PER_LONG != 64
> ```
> means the perf binary word size determines the syscall table support.
> This is because the e_machine in the ELF header isn't unique in these
> two cases and having both tables would have no effect. You've moved
> this into the env arch name handling, but I think having >1 way to
> encode a binary type is suboptimal. There are some ELF flag ABI bits
> that resolve disassembler things on csky, so perhaps a resolution is
> to pass ELF flags along with the machine type. I'm not clear in your
> change how "32_riscv" is generated to solve the same problem. Imo,
> it'd kind of be nice not to introduce notions like "64_arm64" as we
> seem to be always mapping/normalizing/... these different notions and
> they feel inherently brittle.

Maybe it is brittle? It could be mapped to e_machine, but that just
might not be reasonable to work into the method from my patch.

> 
> > What causes the arch directory to be a pain for Bazel? I
> > guess I am mostly confused why it makes sense to change the kernel
> > Makefiles in order to accomidate a rewrite of the build system in Bazel
> > that isn't planned to be used upstream.
> 
> It's just software and so the issues are resolvable, ie I don't think
> bazel should be determining what happens upstream - it motivates me to
> some extent. For the bazel build I need to match the Makefile behavior
> with bits of script called genrule, the scope and quantity of these
> increase with the arch directory model, extra executables to have in
> the build etc. I also imagine cross platform stuff will add
> complexity, like mapping blaze's notions of machine type to those
> introduced in your change. It is all a lot of stuff and I think what's
> in these changes keeps things about as simple as they can be. It'd be
> nice to integrate the best features of both changes and I think some
> of the e_machine stuff here can be added onto your change to get the
> i386/x86-64 case to work. I'm not sold on the complexity of the build
> in your changes though, multiple files, Kbuild and Makefile.syscalls,
> the arch directory not optionally being built, helper executables.
> Ultimately it is the same shell logic in both changes, and your
> previous work laid out all the ground work for this (I'm very grateful
> for it :-) ).

Thanks for elaborating on this! I do wish we had more of this
conversation on the original patch so we could have molded the original
patch closer to what this one is doing. I know you did mention you would
like to get rid of the arch directory as feedback on that patch but I
hadn't realized that this was the direction you were hoping to take
this. It does seem like the changes you have made in this patch will
lead to a something that is more robust and simpler to maintain, so we
can move forward with reviewing this patch and stop reviewing the one I
wrote.

- Charlie

> 
> Thanks,
> Ian

