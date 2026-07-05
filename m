Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 23:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffPL0UFrnUQ1Z40lCU566ipIccROYO67WvnBVyYNZdI=; b=Z/uV2MNotzuWsc/SeW9fXkFrXE
	2yoGVPJ831BVSIwR5tzyY7wdubgyDCn+DM7a3GYsJeS8uxmpkttv4bXYpmD2dsvZKGWWmEa5u0FYc
	ZLMgL11YHrafZsgcQRmKmWfuyX6rVWLoToCYAyBerZevcm3J7PmT6mK7BTscaqYzVVeGhje7E6xUP
	vavZxdgAYUXt2HpD0rJNEEO6LphCHB+ch+xtnUHb5MXoOMse0CIRSuu0AMOr2wlMmdqdKeu1Ja4uR
	dS9hW0TFJDlpW7G84b1FQk8fi/fXrwAuZcskemNPljEohfXpx9/r5qPgdNORgSLu02/1wDgS73uwX
	18L9kVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgVtM-0000000Af9J-0rnl;
	Sun, 05 Jul 2026 23:04:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgVtL-0000000Af8s-12BS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 23:04:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17F1260018;
	Sun,  5 Jul 2026 23:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DF91F000E9;
	Sun,  5 Jul 2026 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783292689;
	bh=ffPL0UFrnUQ1Z40lCU566ipIccROYO67WvnBVyYNZdI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XCydvWeY14IYadK6Q1p2izwTDC1cpJJjymXJh8NisKblE0fxFIsSZvN1AWHRjftHC
	 tsVgxfupLAr+xmdbvHmjXay8zSv/8lceEb3EZ2gsorJRDv+7e6Be9qc2XM5Rs5DqXE
	 RIzBZiepND+5Q7KEPWYdapKSpsUAuDtAi9q5lz3LqWXhc0/bbzWxd4aaln5RkXx7Ak
	 F8XUW2Hea8zvkElkW/UJvklhEmrTdvIsgHKmc9immPEEgNCN0c81Y2/l59PZvGksGQ
	 MzIaSC7Jj9sIW253ppXt6cIRHTBXs5RBP14NFkZborA1+4IaKVM0BrgOOeNX3Sq8sR
	 AtKFSzLD2NEMQ==
Date: Mon, 6 Jul 2026 00:04:43 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Maxwell Doose" <m32285159@gmail.com>
Cc: "Mikhail Lukianchikov" <avermoal@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to
 YAML
Message-ID: <20260706000443.13c3446a@jic23-huawei>
In-Reply-To: <DJQTOY88KR1E.1U2393N7KUH12@gmail.com>
References: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
	<20260705165620.9818-1-avermoal@gmail.com>
	<DJQTOY88KR1E.1U2393N7KUH12@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 05 Jul 2026 12:44:46 -0500
"Maxwell Doose" <m32285159@gmail.com> wrote:

> On Sun Jul 5, 2026 at 11:56 AM CDT
> Mikhail Lukianchikov <avermoal@gmail.com> wrote:
> 
> >>> Convert the Xilinx XADC binding documentation from .txt to YAML format.
> >>> This conversion is part of the ongoing effort to migrate all DT bindings
> >>> to a machine-verifiable schema.  
> >>
> >>Sorry, but what effort exactly? Where is this effort documented? Do you
> >>have a mentor if this is some sort of mentorship effort?
> >>
> >>And if this is ongoing effort then don't duplicate:
> >>https://lore.kernel.org/all/?q=dfn%3Axilinx-xadc.txt  
> >
> > Hello Krzyszof,
> >
> > Thank you for feedback.
> >
> > I'm the newbie at Linux kernel developers community,
> > and sorry for my mistakes in sending commits.
> >  
> 
> No worries, we've all done it at some point. If you're looking for stuff
> to do then the todo in drivers/iio/ was just recently updated. There are
> still a handful of drivers also in iio that still need conversions to
> guard()().
Tweak that to 'may benefit from'.  I don't want people doing that blindly
with assumption it is always a good idea! :)

> 
> >
> > I'll answer your questions.
> > I am not part of any official mentorship program,
> > I just decided to try to contribute to the development of the Linux kernel.
> > Yes, it's a ongoing effort, and to be honest, this effort is the general
> > community initiative to convert all DT bindings from .txt to .yaml. I didn't know that work
> > on this file was already underway.
> >
> > Tell me, should I continue working in this case?
> >  
> 
> After looking at the link Krzysztof sent you it looks like it's already
> being done, so I'd recommend dropping this one.
> 


