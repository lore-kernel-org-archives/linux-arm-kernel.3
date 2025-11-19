Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EEBCF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaTLec8G/tdq48a4ePD3y5fymHb9xAhxUjH/LW9f5a4=; b=oZ8pvAtEjsoXvdwZtlLwneX3db
	5UM2fvf4R1qqpOSClE8mn5pfMfvsc6GkzGu4GrGG6Fw9ntvnKKd+oF8XbhWJInnE4KhsDTyWXgVnG
	sNP27boa4TnpTHhuPgeSaN80lzYfKKT+IfTTtTI04X/MpV6jCDiC10QSXBH8v52YMsTv7g+x2iQXL
	9lnslbGL49DqvoR5iNPKNEKWudhWcDzHbMX8wZU9ONsZkh+89Tz8oEg4OCiYP4ninFIIQa+jewNn8
	zZzRveHn1IzpHkKf3LoCP3CEBHLWKZsGoXCgLDTTXwXSm9UTXFUdKTNmKE0avzNwZQBobytQEO+Tm
	DffL5cUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcWz-00000002grw-47Br;
	Wed, 19 Nov 2025 07:23:09 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcWw-00000002grQ-3MQV;
	Wed, 19 Nov 2025 07:23:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id AAD5741286;
	Wed, 19 Nov 2025 08:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763536983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zaTLec8G/tdq48a4ePD3y5fymHb9xAhxUjH/LW9f5a4=;
	b=LNvejL1ViQufqD4meHwkjC+JFnLLQD53Icu8sSsa+mBLtchgTM2QEAfky1JU9OAIssxhAR
	gmJpZKIw5SaMBmBKGDX/sVECrkh/wYQTtKoICTBIubE7uddeMISxPqM/jKXIn+Bsh+q5iM
	J//3SEtT6M68kx7IkgVT08kJgtGcj8+CWeTzz3C1IWbt/VaGSdLYRTIjI5hjriDZi11aC6
	J1/Yow+3Thk8xJrIjEkpBxi+J62ktXCCz2W2qhPet5FrXxUF0w5harmSf0GiRWGsqQlTbw
	yz3v6Q2xUG4/jNF1M0vBgcJGAt8/91KwKO8jDqEYb41LvgDInWLMAaByu5fO8Q==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <e7417a6e-3824-48f7-af56-eaf4bf097cb9@kernel.org>
Content-Type: text/plain; charset="utf-8"
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
 <20251118-tinker3-v3-1-2903693f2ebb@rootcommit.com>
 <155d3d05-49f8-a000-6939-1411917745bb@manjaro.org> <e7417a6e-3824-48f7-af56-eaf4bf097cb9@kernel.org>
Date: Wed, 19 Nov 2025 08:23:02 +0100
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
MIME-Version: 1.0
Message-ID: <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 1/2] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_arm=3A?==?utf-8?q?_rockchip=3A?= Add Asus Tinker Board 3/3S
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232307_056967_F6ABA69C 
X-CRM114-Status: GOOD (  22.48  )
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

Hello Krzysztof,

On Wednesday, November 19, 2025 08:09 CET, Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> On 19/11/2025 08:00, Dragan Simic wrote:
> > On Tuesday, November 18, 2025 16:56 CET, Michael Opdenacker <michae=
l.opdenacker@rootcommit.com> wrote:
> >> Document the compatible strings for Asus Tinker Board 3 [1] and 3S=
 [2],
> >> which are SBCs based on the Rockchip 3566 SoC.
> >>
> >> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
> >> and a "mask ROM" DIP switch to the "3" version.
> >>
> >> [1] https://tinker-board.asus.com/series/tinker-board-3.html
> >> [2] https://tinker-board.asus.com/series/tinker-board-3s.html
> >>
> >> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.c=
om>
> >>
> >> ---
> >>
> >> Changes in V3:
> >>
> >> - Remove this Acked-by as the binding code changed substantially:
> >>   Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b=
/Documentation/devicetree/bindings/arm/rockchip.yaml
> >> index 6aceaa8acbb2..800c11323a4f 100644
> >> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> >> @@ -86,6 +86,13 @@ properties:
> >>            - const: asus,rk3288-tinker-s
> >>            - const: rockchip,rk3288
> >> =20
> >> +      - description: Asus Tinker Board 3/3S
> >> +        items:
> >> +          - enum:
> >> +              - asus,rk3566-tinker-board-3
> >> +              - asus,rk3566-tinker-board-3s
> >> +          - const: rockchip,rk3566
> >> +
> >>        - description: Beelink A1
> >>          items:
> >>            - const: azw,beelink-a1
> >=20
> > Please see my delayed response in the v2. [1]  I think that would b=
e
> > a better approach.
> >=20
> > [1] https://lore.kernel.org/linux-rockchip/3c96ee6b-dca7-1a0a-792b-=
f8c165ec997d@manjaro.org/
>=20
> Your reviews are not helpful. You nitpick irrelevant things and propo=
se
> solutions which later reverse leading to wasted effort on contributor=
s side.
>=20
> Michael implemented what you asked here:
>=20
> https://lore.kernel.org/linux-rockchip/e4cd11d0-463c-e707-5110-6b9289=
9b1ba3@manjaro.org/

Not exactly, because I didn't ask for any compatibles to be removed
from the new board dts files.

In this case, we could also say that it was Michael's fault not to
give enough time for the reviewers to respond.

> This patch implements exactly what you wanted. On v4 you will ask to
> reverse back to v1?

No, I will not, and please note this version doesn't exactly implement
what I suggested, as already explained above.

> Now you claim that you want back v2. Really, you are NOT HELPING. It =
is
> clear you do not understand what you are proposing and this is not
> helping ion the process. Please refrain from such confusing reviews.

No, I'm not suggesting that the series goes back to v2, but Michael
failed to give me enough time to respond.  If that were the case,
the v3 would've been in nicer shape, with, from my point of view, no
need for further adjustments.


