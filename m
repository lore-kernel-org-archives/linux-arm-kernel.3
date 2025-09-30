Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB404CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej8+t/v5mQyQZp57f2hlXxPelYNwXcOIgQlGLkUSidA=; b=j51J7n549Hspyxm8TLRoweqzUx
	oA2kE8V1L/f8FOq6bBjQzOijnK3Otl6y7dA+FNZrrRg04Io42auImq3hwZZzaun8gITn5nR7pbGRO
	W5RV7AeZEbcwevuq59Efwude8NNjXe+fv+bYKhfpHWJecANJaEQjq3LZCW4GiKgW1TDWR7o1RD5dD
	tz0O6Ltfs/ngwpN3cbpAnyBx6Q7KGnfpHkVIv0QBZY2pRW8Udo/ZW7pp/5GrUlUNsjPWdpJMr1f6K
	8qb0v5WmGsw/zWhx0gUGRAgPjKVMyQYB0nSJlW/aB+q+loLcY8aTvw8IAWhdfnxSPSPQKe7IOHN3p
	syJVHp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YOY-000000057h6-3S58;
	Tue, 30 Sep 2025 11:19:46 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YOW-000000057eZ-1kCn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:19:45 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1759231171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ej8+t/v5mQyQZp57f2hlXxPelYNwXcOIgQlGLkUSidA=;
	b=IYU/Oitnx44deO3YQ4pvsUrf3cs72AmxSOTbghOPYUWNQlr+n/xP/l2HkqnuOORt6jwhNa
	WlRxsrBk0tsqQxmx6fCdxGGYZSUj1zv4M4auOOALhYVuuCRtxoN5uAi6NROsn1yEhm6j2q
	9iN0MKsaxUcw94CxbGxM+bu2VJKmRBh4X5Wj5pPiS59OWYrLUn8VRpmKxGpsc1hrfH36dO
	Hp0X25gak0x8LCJ2/hlncT/efUkp24464O7mCQHrcubDrwYM2h7DNL5uJXl846y4UAc05S
	+2t36F46/1/pvWfidpXKcYLta/n13xuNVx2wbZGHfswkiMn29vTyZD1ttOHiBA==
Content-Type: multipart/signed;
 boundary=64945f9999df6ed87a915ea31fa1d9d40eebd6aa48ba7de803956238b27e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 30 Sep 2025 13:19:21 +0200
Message-Id: <DD63EEOKPWNV.3IK12D6CFPTQZ@cknow.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <heiko@sntech.de>, <quentin.schulz@cherry.de>, <kever.yang@rock-chips.com>,
 <naoki@radxa.com>, <honyuenkwun@gmail.com>, <inindev@gmail.com>,
 <ivan8215145640@gmail.com>, <neil.armstrong@linaro.org>, <mani@kernel.org>,
 <dsimic@manjaro.org>, <pbrobinson@gmail.com>, <alchark@gmail.com>,
 <jbx6244@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: introduce LinkEase EasePi
 R1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "jjm2473" <jjm2473@gmail.com>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <DD57IZJQ4FQM.3T5791FLUQ8KQ@cknow.org>
 <CAP_9mL6+uoeG7LX8YCcUFjoU13De1CdPFqxNNfoJvOdsOrYo5Q@mail.gmail.com>
In-Reply-To: <CAP_9mL6+uoeG7LX8YCcUFjoU13De1CdPFqxNNfoJvOdsOrYo5Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_041944_614650_522469F5 
X-CRM114-Status: GOOD (  21.51  )
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

--64945f9999df6ed87a915ea31fa1d9d40eebd6aa48ba7de803956238b27e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 29, 2025 at 8:09 PM CEST, jjm2473 wrote:
> I have another question. If there are reviewers or co-authors later,
> do I need to add it to the commit message and send it again?
> Or should the reviewer or co-author add the message and
> continue to deliver the patch?

When you get a Reviewed-by tag, you should add that tag too to a new
version. But there's no need to send a new version to just add those
tags, the tooling used by maintainers picks those up themselves.

If you 'just' get review comments, then you'd usually just
improve the patch and you could reference it in a changelog item (to
indicate you addressed it, ttboyk).
If you think a reviewer helped you 'significantly', you could choose to
add an Helped-by tag, but whether you think someone deserves some
credits that way, is up to you(r judgement).

(Co-)authors are usually known upon first submission. If you later find
out that that list was incorrect/incomplete, then you would add
Co-developed-by + Signed-off-by tags on a new version.

HTH,
  Diederik

> Diederik de Haas <didi.debian@cknow.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=88=
29=E6=97=A5=E5=91=A8=E4=B8=80 18:20=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Mon Sep 29, 2025 at 8:57 AM CEST, Liangbin Lian wrote:
>> > LinkEase EasePi R1 [1] is a high-performance mini router.
>> > ...
>> > [1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html
>> >
>> > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
>> > ---
>> >
>> > Changes in v2:
>> > - Change deprecated "rockchip,system-power-controller" to "system-powe=
r-controller"
>> > - Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473=
@gmail.com/
>>
>> You received an Acked-by on patch 1 and 2 in v1 of this patch set.
>> You're supposed to add that to the next/new version(s) or explain why
>> you choose not to do that (bc f.e. there was a major change, but that
>> does not seem applicable to those patches).
>>
>> Cheers,
>>   Diederik
>>
>> > Changes in v3:
>> > - Fix typo ('status =3D "disable"' -> 'status =3D "disabled"') found b=
y kernel test robot https://lore.kernel.org/all/202509261328.Grjhp029-lkp@i=
ntel.com/
>> > - Link to v2: https://lore.kernel.org/r/20250925092037.13582-1-jjm2473=
@gmail.com/
>> >
>> > ---
>> >
>> > Liangbin Lian (3):
>> >   dt-bindings: vendor-prefixes: Document LinkEase
>> >   dt-bindings: arm: rockchip: Add LinkEase EasePi R1
>> >   arm64: dts: rockchip: add LinkEase EasePi R1
>> >
>> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>> >  .../boot/dts/rockchip/rk3568-easepi-r1.dts    | 692 +++++++++++++++++=
+
>> >  4 files changed, 700 insertions(+)
>> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
>> >
>> >
>> > base-commit: d0ca0df179c4b21e2a6c4a4fb637aa8fa14575cb
>>


--64945f9999df6ed87a915ea31fa1d9d40eebd6aa48ba7de803956238b27e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaNu8vAAKCRDXblvOeH7b
bopkAP4rp6hLo5Z1qfCotr2jDcY3qNpOaylNLYkGskxNmYniSwEAuy5jnsnlFxQS
vg8YfzULofUE/R68RoD9NpsXx8PQogU=
=QlYj
-----END PGP SIGNATURE-----

--64945f9999df6ed87a915ea31fa1d9d40eebd6aa48ba7de803956238b27e--

