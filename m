Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E6C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdhaeJqfbS7XTi7Yh7qXJU0hfpdJW1G4IDZCyJB+Plw=; b=J48ziQd47UfEUFzw0me7B+/AWE
	nwTfpvtrKA79GcrMea+SpouYb1QS+05g9xCEKg4umQUlwLypmfom+DLy3DyopN69EfXRK6dHIGdlL
	dD/uW5T8/mwsFHW9J//CM8TaH1mn1LcMISZ9C513NNw740Il1N1zJhE246viUSAQMoicfI+o/uc13
	92jG+PMdqnFB8CxtdSIDrBfJLW87T1AJRQu0rIL9g1fMFkpAjhm7CNcGZT3lZRe9+ukPdwR20R1SS
	u4iB/adGlvmLqPflvt00NyFM7IU1FqanUXmbMQQAhcs+hujWrjsabCRBmj9WkUUJuByBLC526Kkaa
	auPjQiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA2w-0000000FexU-3M2H;
	Fri, 24 Jul 2026 07:10:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA2v-0000000FexC-3A4q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:10:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 20826409B7;
	Fri, 24 Jul 2026 07:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048DA1F00A3A;
	Fri, 24 Jul 2026 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877013;
	bh=wdhaeJqfbS7XTi7Yh7qXJU0hfpdJW1G4IDZCyJB+Plw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SiAGAq/VS8R1Vjv74wc9t91LlHRev9LO02zppziwhtPzWTTRlIIOlZ1Tb0ODKwVB6
	 hwaMY+dJUXVDE77UEr5Ao0LpKCQqaNh/R3svqCD1f7FiprBmlYgjjtkfgBjf3HVu8V
	 oAmXATGOORyantt0coXMrbSX4qu+v2dHSe1kLGBMsBHR2WZ8M+fiSuJbuYgkU+/Gxc
	 Q4z6Pff6M6Ip2g+jpd/PXZPp2EQhZ/ek8STpnFY4pxITjtyDxUilL1ghJII3ggbrms
	 Og1w0OPHhlbBycFQx83N6CxMXNNfcCX0Dg7x1Fvmn2uAsxaZSqOfkgFEevA1LBqxqu
	 kTj3OILRSbYmA==
Date: Fri, 24 Jul 2026 09:10:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?U8O2cmVu?= Hantel <fugininsane@gmail.com>
Cc: linux-pm@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Rossak <embed3d@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	FuginInsanE <FuginInsanE@googlemail.com>
Subject: Re: [PATCH v2 0/3] thermal/drivers/sun8i: Add support for the
 Allwinner A80 thermal sensor
Message-ID: <20260724-rigorous-ambitious-dachshund-dfaddc@quoll>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722210046.2932498-1-fugininsane@googlemail.com>
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

On Wed, Jul 22, 2026 at 11:00:43PM +0200, S=C3=B6ren Hantel wrote:
> From: FuginInsanE <FuginInsanE@googlemail.com>
>=20
> This series adds support for the thermal sensor of the Allwinner A80
> (sun9i), the last SoC of the family with an in-tree DT but no THS
> support.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830

Best regards,
Krzysztof


