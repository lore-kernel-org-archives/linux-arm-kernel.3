Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dkq+Gl1E;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSLeQyh+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=; b=dkq+Gl1Ephp3P+
	6jCvfxYpcVEqlWy8+v2a5G5gNdw3jtqcbHG/UJurC6fFy3VdwN9vv9KpjQKofShg32FgGqeGf2NtL
	4vJ5geZfmljAX/whx6Qt4rJHH9NxVZmfwA8Cwc27+PqV3OrJZedtTLwjqdIUTpHAP+223Eq8vqA7J
	aTFM4dKk/MWnuFZYEUmpQhqFQj2ZAv/gnqIG/O+WPi5+90pIbwNV/FxlIFbG/pycC0iskTUabTyXf
	BjGRaXAAQgJCyMPbANafdkK6ollQbA3ls+l5adDcZrJc64Le0yO7TJXFoXk1VQ9VVmnhHG9gLyQdo
	k+nxfXB/k8i340mAHR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzSv-00000006bQj-1GKg;
	Wed, 28 Oct 2026 08:57:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzSu-00000006bQP-0xf0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:57:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 580D96020A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C91F1F031E2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793177819;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jSLeQyh+qbLVAO1mKWtTM/FDtPOtfpuK0/TbyiQhG6Pyhhgqbm+9yJLiA+gvtMk6Y
	 XRwh/kHVNx1E951l++GqPTOjkCGLNVRBkMg2qYwe+w/3zSirIOA/OhffiXnHrXNHMu
	 lpDhOD3tXZTGPVfzVAuViiF41Hg4tcIPRYCqFambRRjovd9Fn+xEV0drLdUpyyie4l
	 KxkIUECOIY9Kuq0JQh0GPq424UE6Vc7+ubguSS6v1/H5N1XlOlNAsGTw0NIM4q1Ant
	 sO6NFq+vSrMS7aQEBea5lv48G6CEQs4G+03u5VNMw5xEBL3yHi2nEpPGHwvXzx2L3e
	 WGqq7iHNJmNLg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab01c46697so4938331fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 01:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHAyftU/PSma77Ijb4X5d0o8WOoUR0p5oF995AqxDRsdb5vhjSeYWUDkb5E5ZdeOBqnEa+EAjDZ80tmA1snKPg@lists.infradead.org
X-Gm-Message-State: AFq9FYL+vWawz8BM7fknccFPLfk18tRHIHDn2885CzBvv11juJ2686xR
	4ITf0VTrZTl3jdVzwdrxb2CPxcm5Wvp5A08j5ypuZON+mWYVfUM4L9aVMx8v66GauJlQfaI/Va7
	mn5bLeEOqLcDkXgmNP0HnOnQq+izaUcqgbjx17eNvgQ==
X-Received: by 2002:a05:651c:150d:b0:3a6:58f7:da9a with SMTP id
 38308e7fff4ca-3ac9cfcc25emr3279141fa.27.1793177817298; Wed, 28 Oct 2026
 01:56:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Oct 2026 09:56:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
X-Gm-Features: AclHuK9mMPE05cIDjki8s1mLCHmR3I47pX_uEOr7Y0FdJXyzRik8jx1n3BBNXe0
Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/18] riscv: add initial Zhihe A210 support using
 SCMI clocks and resets
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 27, 2026 at 4:37=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> and V2 boards. It replaces the earlier series [1]. The way clocks and
> resets are handled changed completely, so I am posting it as a new RFC
> rather than as v2.
>

No, please keep the numbering. You can add the RFC tag and still post
it as v2 retaining the changelog. It makes things easier to track.

Thanks,
Bartosz

