Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E1C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM4P1drWzjMjfg/pk0Xn1FWtYJygertGpkbq/ASGuqg=; b=WSEua1gIvSfZvYV/C1q1I1e/eL
	mOUuK3YPo8LMnHpUBITRmhZHFad9F8Rk2c7dpJNN+eMDDsBirRjflSMgVQqhMiIFJIOOozk3Hr9Lu
	3WYnb/Zi13eRSuiJigatqdQ1pUfYlkMB2SUgB28DsoB2qGG1aZerb4McAnfaz8hCl24JAntRP1yKh
	5euDFJKFeh/wufvuZ7wmSd9gaI4mNruAWhHcGFfPQlb6lVd1lq9TX0oYS6e3HsKZrXlFK9rDW0bDG
	x9A9/npsgsrPhGdPjx24ZBu0e/9jRwEwbAB6aeydvMaNvHGd16oqUGCyIKGa3yS4jxo2wc3ULfg/u
	YK4DrScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbRO-00000004afI-3pdX;
	Tue, 15 Jul 2025 08:55:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubatG-00000004UuD-2qPd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06F0A5C5BB0;
	Tue, 15 Jul 2025 08:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24862C4CEE3;
	Tue, 15 Jul 2025 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752567593;
	bh=BM4P1drWzjMjfg/pk0Xn1FWtYJygertGpkbq/ASGuqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0m7zk3C0jSevJgK6jHj+8KsagqEKqsohNFNjyxuUufAK0FsT7yJNCNpaFOU4qIx9
	 u5U9AJpnkIbaI8iC8Dg4oZAecD5oub8zKKyVtM16y5Qs2D5okcKbPp5PQ8IKt9Mnrd
	 FUFZCnQ4p6IvkvCBWBTUgxF3w+A3Ri2VqbA0DuzPsHnsN6kywA88NMDdZGek85OLA1
	 yygBzAIe+X6glhbwR0mkYgosi0w9Rzx8T88TxgNpPWzn8IdAhtJxkJopO2XixHkdwu
	 tMo8uetR18UQcRZ8q52L5tdNT1W3eE/qPrDItMRTCW13sGPEVEo0ID28KDRWTsRwqn
	 ayjlkQsVSjg4g==
Date: Tue, 15 Jul 2025 10:19:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 02/16] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
Message-ID: <20250715-belligerent-savvy-marten-fbd1a5@krzk-bin>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
 <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011954_759562_4497B068 
X-CRM114-Status: GOOD (  15.43  )
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

On Tue, Jul 15, 2025 at 09:37:00AM +0200, Gatien CHEVALLIER wrote:
> Hello Rob,
>=20
> On 7/15/25 05:17, Rob Herring wrote:
> > On Fri, Jul 11, 2025 at 04:48:54PM +0200, Cl=C3=A9ment Le Goffic wrote:
> > > RCC is able to check the availability of a clock.
> > > Allow to query the RCC with a firewall ID.
> >=20
> > If it is tied to a clock, do we need another provider? We have the
> > "protected clocks" thing, but that might be a bit different.
> >=20
>=20
> I couldn't find any reference to "protected-clocks" outside of qcom
> related code, is there a documentation? (Couldn't find it in
> clocks.yaml).

Huh? protected-clocks is in clocks.yaml... It is there with an explanation.

Best regards,
Krzysztof


