Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2AACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMjZjSk/NUdEuGMznjuRyqqZQEGpcR7yIi0JJqqV7h8=; b=eELi+PZ5Hqph23gF6NdsG7PU34
	9UVcIhvkMtHDeIHM5nxoW0JrNZAQSbF/95ZYwKpOm43vbbYfO6SjP5gT2bWVt6q7lAktkVcF4XArP
	wPA+o8+8sFPEfP8uGwagZjKCfRfFISBs7q/c4Uj6BkcO7/OkQ8CNBxol3y2jTzIF4P5Jp4b3OByd6
	Spx6P6c9wvUu+xBLq8d+5EFQqvujLP5Lv/XQ9pmAThoye+TQ74es1mkab5O7LpPHC05c1keZNn/qK
	0wf73w+0rjdCNszq92BlYnErB/hCqkv0KUsCkhzAoKBVFIZRdeG8UNPufiBRS07bmG0j0PUJ8BxnE
	6bSdjGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3KIp-00000003Quw-1oWQ;
	Mon, 29 Sep 2025 20:16:55 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3KIm-00000003QuX-0TMl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1759176995; x=1759781795; i=j.neuschaefer@gmx.net;
	bh=QMjZjSk/NUdEuGMznjuRyqqZQEGpcR7yIi0JJqqV7h8=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pYj3N+T4IN7ZiCP6twpcc0jCgYyisyQu/E1wNIL27K/bN3C1UvcA6dW0ej1aMf+8
	 1/CpOdnh2Yz9XpLMH2tKrJTverdK5cFV6SZaW//sBclbk7Au9UoQlD+5CuqCbW0t9
	 fCtOh1PwU3qvIEZnWl6Al1ZY+qhhsi9R7bjNZfohAO8h8KDhuvI/udtQ1///F0MnS
	 hcqenVqFaCUyPyh3Ff7q2F2pNZGN1eBTJscI1pp6aywhI26vxp6H+93CoaxIjuhkU
	 zbavl4dYnI8aiSO2muGpmo86mbc0SIISFqjpcoVzkQAva/+jC2c3CCZw5bLohmZ8Y
	 56xs2undk0tFBmuLgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.211.158]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9G2-1uYvkz0OYQ-00ngiw; Mon, 29
 Sep 2025 22:16:35 +0200
Date: Mon, 29 Sep 2025 22:16:33 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jens Reidel <adrian@mainlining.org>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Message-ID: <aNrpIY4_2bfJm5XK@probook>
References: <20250919184025.15416-1-will@kernel.org>
 <aNnQb9gH8pzwfRJ5@probook>
 <aNplAOAzJKOUigPC@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aNplAOAzJKOUigPC@arm.com>
X-Provags-ID: V03:K1:ynWIxZ1tNUOtNq3OpSo1gVYFL39JkXSxaiKX8oqOFqkEVgtpz8J
 9qNFZMZwwKaLfnPzISwqX7SOCwRnvVq7/RTq5mA0hTQdVxjvtTVvcTCQ3hBsFarzVbwBHHX
 bZPewIyvfR1/jNJAF9YAgeuYhXfMszO9H/kMAX6GMjgZttOcO3+CL/CNgnHeJ5VC5QYWQzE
 VitCpmWnvJpXJ8fg71/5A==
UI-OutboundReport: notjunk:1;M01:P0:18xmb1yJEfk=;DTU36Y/5P/nHrDyN1sYEg89YYrG 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_131652_525264_825E7BB4 
X-CRM114-Status: GOOD (  26.04  )
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

On Mon, Sep 29, 2025 at 11:52:48AM +0100, Catalin Marinas wrote:
> On Mon, Sep 29, 2025 at 02:18:55AM +0200, J. Neusch=C3=A4fer wrote:
> > On Fri, Sep 19, 2025 at 07:40:25PM +0100, Will Deacon wrote:
> > > Big-endian arm64 configurations are vanishingly rare, yet we still c=
laim
> > > to support them in Linux despite very limited testing or visible
> > > interest. Supporting big-endian adds unnecessary burden to reviewers=
 and
> > > contributors which, without any known active users, is hard to justi=
fy.
> > > For example, recent work to improve our futex routines and to implem=
ent
> > > nested virtualisation support is non-trivially complicated by having=
 to
> > > support both big- and little-endianness.
> > >=20
> > > Back in 2019 [1], it was claimed that Huawei were using arm64 big-en=
dian
> > > machines in their telecommunication products but I don't know whethe=
r
> > > that's still the case and certainly haven't seen any patch contribut=
ions
> > > to help support or maintain it.
> > >=20
> > > Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> > > towards its removal.
> >=20
> > As of this month (September 2025) there's a new community project [1,2=
]
> > to revive aarch64_be. Jens Reidel (CC'd) and I are involved in it. We'=
ve
> > been fixing several aarch64_be-related bugs, but mostly[3] in userspac=
e,
> > because the kernel support is pretty solid.
> >=20
> > So, just so it doesn't go unmentioned, there is interest in keeping
> > big-endian ARM64 alive.
>=20
> It's nice to see it gets testing but is there any actual beyond you and
> Jens (i.e. in production somewhere like Huawei's case)? We want to
> assess whether it's worth the kernel maintenance and testing hassle and
> for how long.

We don't have any commercial or large deployments, no. It's currently
one build host and manual testing on additional machines.

I'd be sad to see big-endian arm64 support removed because it's an
opportunity to test for endian-related bugs (in various packages, not
just the kernel) on widely available and reasonably fast hardware.

I understand the maintenance cost argument, and I'm fine with the
CONFIG_BROKEN dependency, even if it might be applied to features that
cause problems in the future (such as nested virt) =E2=80=94 it's easy to =
work
around, and features can be fixed as needed. A complete removal will
likely be harder to revert, though, especially once code simplifications
are made based on supporting only little-endian. That's my concern.


Best regards,
J. Neusch=C3=A4fer

