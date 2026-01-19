Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C0FD29C28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jljzdrq4r/rY5hYR5tbzegDR66TZ8LKmWCEKANj2q0M=; b=fHQx6HsS10lN0nbcroIiiwfgnJ
	2d///FK4mF4v9feaiL03M1fAXfMCvUBW1k2wy+TPxWzCx1cv5R8yvOqdMzUPnsGnt9U9ADVtFBwrt
	HTj0RacSjGZ6dyYkTocE9nNYR2GkqAKXjYfAlK0O9ukEmXlMwyKcNsckiTIwFCgwtTUe6JktS86Jm
	RfBqTXt7vDtumGPg/EuZiWSfxQuuJgbJlhEBeQNsqmCis33eWRqcIp4RzLZQXVj8Nev5Y4ctHuQgn
	NeK6+zXdCLIXp4abnwPbaM6lbLc4Z17KxdNCJL+vM82wtR26Ji2XAmcjaHPYbM0O3YpoyeWZwI2k8
	mE+La/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpBP-000000029Ni-2IxA;
	Mon, 19 Jan 2026 13:20:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpBL-000000029NC-0tUd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B90043724;
	Mon, 19 Jan 2026 13:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5023C116C6;
	Mon, 19 Jan 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768828834;
	bh=Jljzdrq4r/rY5hYR5tbzegDR66TZ8LKmWCEKANj2q0M=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=LYqOMNv6K//ghc3wg6xqGAnjEk9y7lgkxB77d8PfRJZ0NgwDf4IdMzIiF2CM+pZTr
	 tp+dNB2zzIvG6F85ubonr1U8Z9HLFwm2La8nG088JaBLNRCnd+oN7MYgTCL/FvpB4z
	 8ZSc4pYJvGyoRhwQsYZYC6fPhbHnH6OFx2mLiCVzliYTY0U5V/z8j4R7oviRAvL35g
	 4dRcVJIVx7nxlu7YPz2cwPbUO1vCu4+J7IpIt+Q6Q8KAqOXPB14fi0nUDP7Eu3bLYg
	 oxfXosJm8l1f6KyAoM0Ufa3ANpnn246RhC+8beVyM1R39hIWt3Ivm926qthW+w2Iz2
	 RDepxu4iYp6Qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:20:28 +0100
Message-Id: <DFSLHM2ZBRE8.1JDMK08LNYYKT@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Rob
 Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-renesas-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
 <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
 <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
In-Reply-To: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_052036_248577_C41530F7 
X-CRM114-Status: UNSURE (   4.26  )
X-CRM114-Notice: Please train this message.
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

On Mon Jan 19, 2026 at 2:00 PM CET, Bartosz Golaszewski wrote:
> How about of_machine_read_compatible()?

SGTM.

