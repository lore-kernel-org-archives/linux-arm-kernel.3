Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61345C56207
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZIEzN2V2JqjGXOQM9wZT4ytUqP9hz4ZNtjjZVESahM=; b=CVVX3HaOK9m5olZ+dbwJvDrSLc
	wurweL4wsDl3veB4esddfsoBi7wm5PMzqqw0v0mpXMPRbM6fTSfraZJxAXEyYo8mAzQGo3C3hcNHc
	g/HQelEPsEiO06/JpDzm/S7WbHgKX/2Lz0G+IrbABEyjJIFo1t0U3mnO7To7Zbk3w741Wtb2QUmpo
	dn6mnkulqSi02B2+lMDwV817WRz147bZFxY/fYuvJ2dooMq3LXrTvQTInIMX+mlPM+8v1up/IGjpg
	To+GKsTYoHHbZSqUaV6xWjqSfKB6et7fRPeW6VaPtj6KD6HCIGIq3edzkP+TtHCUdLQPsXNlucivO
	7ya7wbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzHB-000000060mm-3r3w;
	Thu, 06 Aug 2026 14:40:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzH9-000000060lf-1skV;
	Thu, 06 Aug 2026 14:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FZIEzN2V2JqjGXOQM9wZT4ytUqP9hz4ZNtjjZVESahM=; b=whXNjc2ucP2u5Ow+eZETz+en0+
	bm7YJhpm2Vmh9ZlHytuQIpEb22PB7PBNlEo4Dsso+seWS96A4vfhgaH3AH+2i8f4mvPtg5esLvBVs
	9vt8EXEsu0zvu6UxxCFU5iLUqiECzPAJXNOJWIOHera45DHSMr6AS2VupOOJQgLW0uroACAibh6tA
	5VVuAQaqDitKveo+TK0bbCN1Jt8dfd6QnAeyqWEHkWzx7/Q6ML7kMiEjkjZF1sQlSEJDQe/x72DVF
	I0vSS9e3r7RUgcWdL7jXplqevUE5AZZb+BjIGPMx6GX6K38K3LTRG4/WSINe5sDCKQeFIHEavt7vv
	VLZ0BHwg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Date: Thu, 06 Aug 2026 16:40:42 +0200
Message-ID: <7021768.R56niFO833@diego>
In-Reply-To: <20260806143849.GP2869284@google.com>
References: <20260711192842.845048-3-samuel@sholland.org> <1954916.R1toDxpfAE@diego>
 <20260806143849.GP2869284@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074051_501227_5DBB926C 
X-CRM114-Status: GOOD (  11.33  )
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

Am Donnerstag, 6. August 2026, 16:38:49 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Lee Jones:
> On Wed, 29 Jul 2026, Heiko St=C3=BCbner wrote:
>=20
> > Hi Lee,
> >=20
> > Am Donnerstag, 16. Juli 2026, 12:41:59 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Lee Jones:
> > > On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> > > > Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> > > > Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> > > > computers.
> > >=20
> > > Applied, thanks!
> > >=20
> > > [2/4] dt-bindings: vendor-prefixes: Add techvision
> > >       commit: f0e0417373ca55d07cba596e8afe081c078843ad
> >=20
> > I can't find neither patch1 nor patch2 in neither the LEDs git nor
> > linux-next. Is there a git push missing somewhere?
>=20
> I pushed this a while ago.  Let me know if you still can't find it.

all good now ... it appeared a day or two after that mail on git.kernel.org


Heiko



