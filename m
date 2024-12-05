Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73685E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrc3UpuakJcFgb/UbMRnmhpcR0lLQfX1M9NMNlfNaog=; b=UdeM+JWH/7OTJCZuKf3pd8+0W9
	heZM5d/l4TYcSwoFj7cPFxp402M+3UeFqtbLbEYOGHjwjGMP1uXMJKibcNhRhSfQHSXPJZGngh16V
	RnjNsu/hJ3LjSuglD9+6e//Co9ckOUrFs3gkoHO1T0TFNNOCkKdjzwePLvEcM0OJAlyAyFrFIbdh/
	WHPL0uMVxUJtN9a+mwgye77nOnYKZrDDAyrTBCUKsXiA1aNxF8xcurKu59YoJUHXdF3nSjFjk3gpL
	OyVRkOKpLIEeFCLAJxVWiGp221GMkmnQyFudCdXLSsiGVgcN1sluFXcZ05+kWR0VKQ5bvWoBPVWxO
	s1BRXh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEII-0000000GfEm-2aWM;
	Thu, 05 Dec 2024 16:01:34 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEH9-0000000Gen5-1J2F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:00:26 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-279-lmsYNeUrOlaLvsVDlHEuig-1; Thu, 05 Dec 2024 16:00:19 +0000
X-MC-Unique: lmsYNeUrOlaLvsVDlHEuig-1
X-Mimecast-MFC-AGG-ID: lmsYNeUrOlaLvsVDlHEuig
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 5 Dec
 2024 15:59:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 5 Dec 2024 15:59:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@linaro.org>, Naresh Kamboju
	<naresh.kamboju@linaro.org>
CC: open list <linux-kernel@vger.kernel.org>, "lkft-triage@lists.linaro.org"
	<lkft-triage@lists.linaro.org>, Linux Regressions
	<regressions@lists.linux.dev>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, "netfilter-devel@vger.kernel.org"
	<netfilter-devel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Anders
 Roxell" <anders.roxell@linaro.org>, Johannes Berg <johannes.berg@intel.com>,
	"toke@kernel.org" <toke@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	"kernel@jfarr.cc" <kernel@jfarr.cc>, "kees@kernel.org" <kees@kernel.org>
Subject: RE: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Thread-Topic: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Thread-Index: AQHbRyiOROIHG94lCEKLQVwMYBVLZbLXxsYA
Date: Thu, 5 Dec 2024 15:59:36 +0000
Message-ID: <68a3ca49c2644af5b2995038ca88a51b@AcuMS.aculab.com>
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
In-Reply-To: <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hEwrLR5E4wy8PzoAsPs1MeP6qaD_AE9mivUePwi9C_o_1733414417
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_080023_620365_C60B58C2 
X-CRM114-Status: GOOD (  12.40  )
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

From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: 05 December 2024 15:16
>=20
> Add David to the CC list.

I've been forwarded this one before.
It is not unreasonable really.

Is all stems from order_base_2(totalram_pages()).
order_base_2(n) is 'n > 1 ? ilog2(n - 1) + 1 : 0'.
And the compiler is generating two copies of the code.
(Basically optimising for the zero case.)
And the one for totalram_pages() being zero hits the check in clamp().

Flipping to clamp(max_avail, min, max) will stop it bleating.

More interesting would be 'launder' the 0 in order_base_2().
By adding something like:
#define optimiser_hide_val(x) ({ \
=09__auto_type(_x) =3D (x); \
=09optimiser_hide_var(_x); \
=09_x; \
})
and change order_base_2() to be:
=09n > 1 ? ilog2(n - 1) + 1 : optimiser_hide_val(0);
(ISTR there is a split for constant v non-constant before then.)

=09David

>=20
> regards,
> dan carpenter
>=20
> On Thu, Dec 05, 2024 at 08:15:13PM +0530, Naresh Kamboju wrote:
> > The arm64 build started failing from Linux next-20241203 tag with gcc-8
> > due to following build warnings / errors.
> >
> > First seen on Linux next-20241203 tag
> > GOOD: Linux next-20241128 tag
> > BAD: Linux next-20241203 tag and next-20241205 tag
> >
> > * arm64, build
> >   - gcc-8-defconfig
> >   - gcc-8-defconfig-40bc7ee5
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Build log:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > net/netfilter/ipvs/ip_vs_conn.c: In function 'ip_vs_conn_init':
> > include/linux/compiler_types.h:542:38: error: call to
> > '__compiletime_assert_1050' declared with attribute error: clamp() low
> > limit min greater than high limit max_avail
> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER_=
_)
> >                                       ^
> > include/linux/compiler_types.h:523:4: note: in definition of macro
> > '__compiletime_assert'
> >     prefix ## suffix();    \
> >     ^~~~~~
> > include/linux/compiler_types.h:542:2: note: in expansion of macro
> > '_compiletime_assert'
> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER_=
_)
> >   ^~~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:39:37: note: in expansion of macro
> > 'compiletime_assert'
> >  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >                                      ^~~~~~~~~~~~~~~~~~
> > include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
> >   BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
> >   ^~~~~~~~~~~~~~~~
> > include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once=
'
> >   __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_),
> > __UNIQUE_ID(h_))
> >   ^~~~~~~~~~~~
> > include/linux/minmax.h:206:28: note: in expansion of macro '__careful_c=
lamp'
> >  #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
> >                             ^~~~~~~~~~~~~~~
> > net/netfilter/ipvs/ip_vs_conn.c:1498:8: note: in expansion of macro 'cl=
amp'
> >   max =3D clamp(max, min, max_avail);
> >         ^~~~~
> >
> > Links:
> > ---
> > - https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gR=
ywrldKTyaXQoT/
> > - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-
> 20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/log
> > - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-
> 20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/details/
> > - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-
> 20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/history/
> >
> > Steps to reproduce:
> > ------------
> > # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
> > --kconfig defconfig
> >
> > metadata:
> > ----
> >   git describe: next-20241203
> >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
> >   git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
> >   kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRyw=
rldKTyaXQoT/config
> >   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pj=
AOE9K3Dz9gRywrldKTyaXQoT/
> >   toolchain: gcc-8
> >   config: gcc-8-defconfig
> >   arch: arm64
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


