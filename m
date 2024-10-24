Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9748FD0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 00:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtnDx7HtpgMGToc67LvWVCZkY6l3tklYm20D0ZsZQYU=; b=uJfA9qvvZbOqycXAdRud46+CG9
	gra40MmI2pQ2ozBPqfbE+cEtSTjkDaHgDieOlO+lWwj7r/LS07guSmm6ENYzlTPgWSNqu+JM6JRSt
	XeRkv8p3jIuXC1VmZk/4kuBiIX41X/Sv0MXS/ctmkT616fiqYypCzT+aifP0ZcPewSD/+AX+w3Uqg
	FV3m8i3RPsx8td8yDr2azaXoUhdqYR7GLC4FQREC0Ee/nVMCSpfl257N+5bGuXHlssEtRvpRRH1/J
	aoJa2IwKCLOHMAmXVUPSvGFgRg9u3Xw1/ZYVOU+wdKwzMsXKphVqgQ+nyWkHpNPzmJ8LYwQu+Ofe1
	cRZzL0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3la6-0000000GJC7-3nSe;
	Thu, 24 Oct 2024 00:20:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lYY-0000000GJ31-2HjT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 00:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729729104;
	bh=WtnDx7HtpgMGToc67LvWVCZkY6l3tklYm20D0ZsZQYU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YDAmSUvBbl4YtLfaeZNLAXebR7kAnuQTy9tN79E1k/JZOhQi6XQiS2LcvGdpxqdxc
	 qCjFi/DwBiL1/H8TCjOtcAPJLLeirRckkhJn6NL/g1sC2qxbYSv3Q5jmq+Iis+V8a2
	 Qcv7FYFwhXXiVJhX5dZq1Wk5I0mGUzRoRjsefxJHALCE2TJbpjHx7CPEblHa6Qzfxi
	 xgXWPT/hXrUKzIiBOSkosHGsLBX8O/kYmiWHokoIiH1zTPiPNC3lywBchKq0ihIQiS
	 IMJgA31Yv6T/oYVrMUYKWiQOo1CLfMxo1h50yEqyP2TIf0imLC1DiBJtdOvBUe6mIf
	 TNBOQ3pxVoYbQ==
Received: from [192.168.68.112] (ppp118-210-190-208.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.208])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 815BB6494E;
	Thu, 24 Oct 2024 08:18:23 +0800 (AWST)
Message-ID: <32cb6d9388fb136f7cd7ad1ab0d60d83ae387982.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?UTF-8?Q?=E5=BE=90=E5=82=91=E7=94=9F?= <jasonhell19@gmail.com>
Cc: yang.chen@quantatw.com, jerry.lin@quantatw.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, patrick@stwcx.xyz,
  devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 10:48:22 +1030
In-Reply-To: <CAFGtgY3BJcpC=Q0cYZQa01D5BFAQTt6GEr=0_mrPGUntHYVioA@mail.gmail.com>
References: <20241022021230.2322132-1-jasonhell19@gmail.com>
	 <de478e5f56bb67a9babe59afa6ad53c8dd4542ee.camel@codeconstruct.com.au>
	 <CAFGtgY3BJcpC=Q0cYZQa01D5BFAQTt6GEr=0_mrPGUntHYVioA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_171826_814309_67AE52E6 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, 2024-10-23 at 16:32 +0800, =E5=BE=90=E5=82=91=E7=94=9F wrote:
> Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2024=E5=B9=B410=E6=
=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:15=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >=20
> > On Tue, 2024-10-22 at 10:12 +0800, Jason-Hsu wrote:
> > > Add Linux device tree entry related to Meta(Facebook) Ventura specifi=
c
> > > devices connected to BMC(AST2600) SoC.
> > >=20
> > > Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>
> >=20
> > What commands are you running to generate and send your patch series?
> >=20
> > The patches must be threaded properly.
> >=20
> > `git send-email` or `b4` both do what is expected without any effort
> > required. Please consider using them, particularly b4, if you're not
> > already.
> >=20
> > Andrew
>=20
> We use `git format-patch` and `git send-email` command to generate and
> send patch series as below, could you help to check?  Thank you.
>=20
> git format-patch -2 --cover-letter
>=20
> git send-email --smtp-debug --to=3Drobh@kernel.org
> --to=3Dkrzk+dt@kernel.org --to=3Dconor+dt@kernel.org --to=3Djoel@jms.id.a=
u
> --to=3Dandrew@codeconstruct.com.au --to=3Dpatrick@stwcx.xyz
> --to=3Ddevicetree@vger.kernel.org
> --to=3Dlinux-arm-kernel@lists.infradead.org
> --to=3Dlinux-aspeed@lists.ozlabs.org --to=3Dlinux-kernel@vger.kernel.org
> --cc=3Dyang.chen@quantatw.com --cc=3Djerry.lin@quantatw.com *.patch
>=20

So from the details in the cover letter I'm guessing that you're using
Ubuntu 22.04 LTS (Jammy). At least, Jammy ships git-2.34.1, which is
what is mentioned in the cover letter.

The --thread option in the man-page for git-format-patch[1] says:

   The default is --no-thread, unless the format.thread configuration is
   set. If --thread is specified without a style, it defaults to the style
   specified by format.thread if any, or else shallow.
  =20
   Beware that the default for git send-email is to thread emails itself.
   If you want git format-patch to take care of threading, you will want
   to ensure that threading is disabled for git send-email.

[1]: https://manpages.ubuntu.com/manpages/jammy/en/man1/git-format-patch.1.=
html

The --thread option in the man-page for git-send-email[2] says:

   If disabled with "--no-thread", those headers will not be added (unless
   specified with --in-reply-to). Default is the value of the
   sendemail.thread configuration value; if that is unspecified, default
   to --thread.

[2]: https://manpages.ubuntu.com/manpages/jammy/en/man1/git-send-email.1.ht=
ml

Since you're not supplying any thread-related arguments in either case,
I wonder if you have thread values set in your git config. What's the
output of the following two commands for you?

   $ git config --show-scope --get format.thread
   $ git config --show-scope --get sendemail.thread

Regardless, you may want to try passing `--thread` in your `git send-
email` invocation.

Finally, please pass `-v $X` to `git format-patch` to version your
series (the value for X is how many times you've sent revisions of the
series). Currently I count 3 distinct attempts, so next time you send
out the patches you should pass `-v 4`. However, the b4 tool is helpful
here, as it largely automates the process for you.

Andrew

