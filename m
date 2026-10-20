Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8660A2621
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nr7KDEE5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jWEB9nV7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFVAQrFmT1oDNxMyfNklZUb3FR+1d06U5iKfR+KInKQ=; b=nr7KDEE5ceUN0ja0Rm6JSk/E14
	Bz9Rqu0kvYLiwyNxMOauoe5uqW2Zk67wiZ/sxhV7zTw4VGl8Zle+IWUhCCwBdqIkP5/hMAQp/t8P7
	2BZgRj4vRiD7bMpIPXAZXm/zklt99RRh19JWDgzJv46GmMz5KG+ItAT60b88sp7/Ky9yhBE7vq2PR
	lfmbTDW9Rrfq6H2xZamxc+R6oBzIMakdzqd1iLhNwPF3MiwKx2Npr/0g0hRXk8Jni3zSLMQBkoxJq
	b5Kv9YiSZhrfqVD3ACvsPmjIFoF0xtoVMzQTj8aM9WwhlmOY9klSahNfzmNUmY0r7gvor9WtXmOin
	20IptsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJC7P-0000000A6GK-0Qye;
	Tue, 20 Oct 2026 15:51:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJC7G-0000000A6Et-1XPw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:51:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b042c0759so2291680f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511464; x=1793116264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFVAQrFmT1oDNxMyfNklZUb3FR+1d06U5iKfR+KInKQ=;
        b=jWEB9nV7bPNOA9urQjzLGADgrndNa9wAINFOWGVN7t4sjmvgstifFRFhMJDQMFzi5l
         bB/i8LA/p2QaYHCLOuovb0xISPsbiAO1za8dr9IOGToGSr9LJjDquzWzMDFVY3sy+eE6
         qI2IQe4yMV8mA54g3f296i3sr8crdWD2O0HrF5+kPUyBPV5v7QedIgxE/M0tenOJ5Z/d
         fZM9WIs87pZF8VCiJ5jweOc4DS2NX6gsEOR00DYjjJEAiAPgClCIxrFngg32u09bPRCa
         Sj4OdJY14SHpow6w/KWIFQbkjzOetIkRXTwtWEArzZtq+k5tGjMFArV4+b5ja0AkxQCY
         bUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511464; x=1793116264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFVAQrFmT1oDNxMyfNklZUb3FR+1d06U5iKfR+KInKQ=;
        b=aWJ8s+Q1Fp+e7Fqr3W0KbZ+9RbTYoB4GmvpO50xgdqtsW7awsesXzh5/xFEc5961nr
         XEWqzwj/2oTwm0NrtC2oa5MBddtJ7sPQ8YrMsaxcN4sGJsJ7p6YJuFl4o3rn+WgDtIyw
         pfgO3PgRX4W6HxT1slmnI8e8wX3wrBtj0sVYj+hJJmwh1J/X9twX1kr6QbZilFD9RlCz
         iMFvT12pVjVv6AeZ13BEduasoz1HF3R4KAHmyLc4FQOc+M4mVqreZ3KcBqJ8MFS8FgWT
         5leLW/4T+p9YjHcWlZxPUy8dn0m/G05cqgO0n8LPWbQAnZM3UBF+TsnpqS/EUK1GG+E4
         wS9w==
X-Forwarded-Encrypted: i=1; AKwUvBx4FzR8dSQ/Ww6EEqHjajtlvhBYIZchWTqZcglQseA3ancH9Pn78SUTstHMC1YhZi/0fJKhFCwGO4DM1MVgcgGB@lists.infradead.org
X-Gm-Message-State: AFq9FYK/B7nNY4LM9IQyl4tkAQRyH7XIUSxLxZwUuwclsTGhQdrt+WOA
	USVGjDkuvJ/yYjSd3PBxh+NNFQsw5JFYICWqHuqhdtpHGr6Nrv0Bk56N
X-Gm-Gg: AYBFou0pnWtk8q1YVbJfGqsX+uxNf3P151bBaqO80eysMxOVhOQvS+A6RqhGd9dhDrn
	RO21IpagyVMbgqtrKnh8qZ5k1xnNAV/WaXJ4Y0KoGmhsA3NVTIBZn61amwNqqiOhRg5dmE7/Tyw
	abwsY+iv3fw127lCEeX2FoN1MIVYiJWuMFs1HE8e64leVjzVzpWApizujI4AAU8pbAcMTIFQvGb
	AgctlZf/yiNGy203IHh5KZmyoP5xIouglPHp2Z06k90RUHdFqG9CuoTeNbtLN/KhTPhYMj5pTJr
	TtrThJXgAOxNIPzx7hzpOnN+SRp9Z4ucvRoBatE++8h/EJinaxOLFzGkGfq1OIMTSN0c2nTwvUh
	loVJj9O13TaDeOoPM+k9nWlT6kZx/YaNO9F8JeCleFMU2G/B7oNlKgoZZGAM7pSnm4QGQD5FRo0
	GkvAicRuRsvtpAz02NQgJpRmFd3MKdrtrxbnoMxVGHRsO4L12CXtTiV8p918Y8LOWQRGBeUT2mj
	NRonXR0cav+paXyEW0qG+BWuwIRAU43V94=
X-Received: by 2002:a05:600d:82e1:b0:4a1:f377:5c50 with SMTP id 5b1f17b1804b1-4a1f3775e78mr82090745e9.30.1792511464096;
        Tue, 20 Oct 2026 08:51:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817f8dsm6788859f8f.23.2026.10.20.08.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:51:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:51:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Ian Rogers <irogers@google.com>, Thomas
 Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Stefan Kerkmann
 <s.kerkmann@pengutronix.de>, Christophe Leroy <chleroy@kernel.org>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Eric Biggers <ebiggers@google.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
 for ARMv5
Message-ID: <20261020165101.5e74ab2d@pumpkin>
In-Reply-To: <20261020-nice-turquoise-dinosaur-3079bc-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
	<31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
	<20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
	<d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
	<20261020-nice-turquoise-dinosaur-3079bc-mkl@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_085106_431367_A0FF3F3D 
X-CRM114-Status: GOOD (  26.55  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 16:56:40 +0200
Marc Kleine-Budde <mkl@pengutronix.de> wrote:

> On 20.10.2026 10:24:51, Arnd Bergmann wrote:
> > > FYI: there is the kconfig Symbol HAVE_EFFICIENT_UNALIGNED_ACCESS. Can we
> > > make use of it?  
> 
> Just noticed that sashiko's review contained the same remark, but the
> bot only posts to the linux-perf-users@vger.kernel.org list, where I'm
> not subscribed:
> 
> https://lore.kernel.org/all/sashiko-outbox-178182@kernel.org/
> 
> > That would be better, but I still hope we can just get back to the
> > portable code across all architectures for the in-kernel version.
> >
> > I have one more request for you: can you check /proc/cpu/alignment
> > on the system that shows the performance regression with and without
> > the patch?  
> 
> When booted via NFS-root to the login prompt, we have about 570k System
> alignment fixups, all in the IP stack: :/
> 
> __udp4_lib_rcv+0x78/0xc6c
> icmpv6_echo_reply+0x160/0x504
> ip_send_unicast_reply+0xf0/0x3f8
> ndisc_send_skb+0x15c/0x40c
> rawv6_recvmsg+0x114/0x3b4
> tcp_rcv_established+0x3ec/0xba0
> tcp_v4_fill_cb+0x70/0xec
> tcp_validate_incoming+0x540/0x868
> 
> Comparing v7.0.12 with mainline "unaligned.h" and reverting commit
> a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to
> memcpy()") brings no difference with respect to alignment problems. But
> I see the increase in I/O performance (measured with "fio" [1]) on a
> UBIFS/NAND file system:

So the nand fs is hit by the memcpy() but there are misaligned transfers
in the network stack.
 
> - v7.0.12 NFS root
>   User:           0
>   System:         573956 (tcp_measure_rcv_mss+0xe4/0x1e0)

I can't find __udp_lib_rcv(), but that looks like it could be from expanding
tcp_flag_word(tcp_hdr(skb)).
Which would rather imply that the network driver isn't correctly aligning
all receive packets (honouring NET_IP_ALIGN).

When I were a lad the kernel just paniced and userspace core dumped :-)

David

