Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACE0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 20:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=664LabPHOiNvimtsi/IFnBJfHn2xokuoEExuJfQJL7I=; b=LEaG8UPLloMxqPMS4HjIWxtvJ/
	/Kw4F8/9cDdFJ2Os8o0sTAJeTSQr37ozTX/GuclUK2UHONfMWmtgYNI8bZ+UdLpf3U8AymYwkK7vj
	wXtAQ3Z+wABiEK/wR8yUxyOOfDGdDW72tsawpbxoL99WJekyaCVRmOLvHDGEA86EXvVBbPN7CYqyu
	rTNrZAifVMqeRIIm9VjNCaIePJaluFqTwTp00FmVzHgvaaBtv4umym9da80MIdvi37ygR0OkNPEEJ
	eF/VFpKl1Kxbo2pPyMC4wQ7UFbb41Pge0V4aWJEglyNOwh6bcr9HmIsjtfBTCsKAo5Dcb3V5gGJc6
	vF5/JM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QpL-00000008ArT-3A2J;
	Sun, 21 Sep 2025 20:38:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QpK-00000008ArH-2UqC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 20:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0555601E2;
	Sun, 21 Sep 2025 20:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59247C4CEE7;
	Sun, 21 Sep 2025 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758487109;
	bh=664LabPHOiNvimtsi/IFnBJfHn2xokuoEExuJfQJL7I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q6j3ObP6TW154twM40m9wHw5PjCCgK6yRKrCXOqEW6g6oLVAGrf54tkDoaBPw4pyd
	 63B7o2KrcCh+sRjLxBjxt9uYu4WKeGsthUk44e0TR2uE1MPyaabhF+Hj4TAQEQgp9W
	 S/vRV9j4OgzrzAFX8E0cAw/rcQ1ERnA9UNRrp4iqoYCt1vaZkzDjE3MwciKBkEyS6p
	 y2WuFXzqxWFY/4k4IzDchRidSJoYNzSSbHBVH9JFXHQzvTrzLL75p6Kn32fKSAmIHp
	 /Fg0Ezyz4Zr8W+6Pgz7zbhSsrMGkMlkIjrcF8BkVQzYNtpkrFp+ttCEdtILZyqtHCQ
	 6gsJXiDfA41Vg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175848567705.4354.18321442549280624891@lazor>
References: <20250917020539.3690324-1-ryan_chen@aspeedtech.com> <20250917020539.3690324-4-ryan_chen@aspeedtech.com> <175848567705.4354.18321442549280624891@lazor>
Subject: Re: [PATCH v14 3/3] clk: aspeed: add AST2700 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mo Elbadry <elbadrym@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Rom Lemarchand <romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, devicetree@vger.kernel.org, dkodihalli@nvidia.com, leohu@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_chen <ryan_chen@aspeedtech.com>, spuranik@nvidia.com, wthai@nvidia.com
Date: Sun, 21 Sep 2025 13:38:27 -0700
Message-ID: <175848710791.4354.5032800251620826265@lazor>
User-Agent: alot/0.11
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

Quoting Stephen Boyd (2025-09-21 13:14:37)
> Quoting Ryan Chen (2025-09-16 19:05:39)
> > Add AST2700 clock controller driver and also use axiliary
> > device framework register the reset controller driver.
> > Due to clock and reset using the same register region.
> >=20
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> > ---
>=20
> Applied to clk-next

Unapplied. Found some problems.

