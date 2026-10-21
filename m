Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0576606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMT7raWV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRf6zhza
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJBXnCQJmXKfHRqXv0OES81MaO/XzIb/4ZDkwzt1z98=; b=uMT7raWV0tO4blN1HRdngNTcsl
	XpXHjSrxb4mf54tY6JI3rg3zPPDZQlUqRmSo696Sh7aGmEjaELaCtTfACNRbT3ja0zLtzQ4pA9TCW
	TZnVVi2WaGCyKi40c8h9JRJ7FDfWeWqdVttduNKpOL6BUt+75gPpqLghRJFEpvfj/e+yXNsSRGWdn
	lpQqVpBcItZuKAlKiANKtQ7GCqaLBZ2cUyytUjO5Qc03Geo5mOVdTeoKtjUvx/Sle3N4rr2wV1YWa
	UU5agbGc3bkHR3lYSQ05k/NOBniNZdp5ITFhiigD3Vzi2q9L1smOy1x4d06Ng4Tu4DoDYFS9NS+H7
	JFNiug2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbGe-0000000Cfue-0Rsx;
	Wed, 21 Oct 2026 18:42:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbGc-0000000CfuY-37ON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC6EC60052;
	Wed, 21 Oct 2026 18:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531141F000C1;
	Wed, 21 Oct 2026 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792608145;
	bh=SJBXnCQJmXKfHRqXv0OES81MaO/XzIb/4ZDkwzt1z98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IRf6zhzaBqHO3dtATHN8jDUEiKza6xOoSdneJiKwDzuEuhFxajEV3K0M+KttkC7VY
	 P2Vs6sO9IcS7YzgjiJGIN4l5JZvZlmuNsEFy+ISkbTJAaQGfzqh3OAz+6ZO74m+LbX
	 +6o6YKwsgTwlwNfow8W4UdS2SX17JEvXItBRldJ9rgZOlTXj+FESFez9zDS4FMbvGI
	 8Pdf75sOhbLA7QAyniXUJOn3JJNnKur6QLzsfevlumdhbxpurTgocu1YN69CaFGAtz
	 zvq2KNTgxvzJjrDgsNf8sbZt+xVvTQKJcoxBgBHGqaa/26Fr+cQfysA9dNnD5kFkIy
	 5ZHBxLPdSMAcg==
Date: Wed, 21 Oct 2026 19:42:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: =?UTF-8?B?5Zue6KaGOg==?= [PATCH v3 0/3] iio: adc: aspeed: Fix
 SCU lookup for multi-SCU AST2700
Message-ID: <20261021194216.034f348d@jic23-hlaptop>
In-Reply-To: <OSQPR06MB7252FB0EB1DCD1069E11CEF18B662@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com>
	<20261018235624.1971e7ff@jic23-hlaptop>
	<OSQPR06MB7252FB0EB1DCD1069E11CEF18B662@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 01:51:53 +0000
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> > > The ADC's reference-voltage trimming data lives in a SCU register. The
> > > driver has always located that SCU with a global, name-based
> > > device-tree search, which works as long as a platform only has a
> > > single node named "syscon". AST2700 splits its SCU into two
> > > instances, syscon0 and syscon1, that share that same node name and
> > > differ only by label and unit address, so the lookup always resolves
> > > to syscon0 even when the ADC's trimming data lives in syscon1.  
> 
> > For now I've applied 1 and 2 to the testing branch of iio.git.
> > Whilst it is a fix, there is little point in rushing it unless
> > patch 3 also goes and that one isn't tagged as a fix..  
> 
> > If you want me to move it over to the fixes-togreg branch and
> > get it in asap, then reply to this to say so.  
> 
> Patches 1 and 2 only add the mechanism; they don't change behaviour on
> AST2700 by themselves. The driver falls back to the old global
> by-name syscon lookup whenever the new "aspeed,trim-syscon" property
> is absent, and patch 3 is what actually sets that property on
> AST2700's dts. Without patch 3, 1 and 2 land but AST2700 keeps reading
> the wrong SCU exactly as before.
> 
> So yes, please move 1 and 2 to fixes-togreg, and I'd like patch 3 to
> go with them. I'll resend it on its own with a Fixes tag pointing at
> the commit that added these ADC nodes, since it's the piece that
> makes the fix actually take effect on hardware.
> 
Done and marked those two patches for stable. 



> Thanks
> Billy Tsai

