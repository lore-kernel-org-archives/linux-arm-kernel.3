Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336D7CF2567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHL7eo/SH1vVrlJeUomLTfMZkXO7/asB01967/MEOyk=; b=3YUxVYzcnWEu1r3ZAkT0mQZ9Yq
	qsQ13+ZKCM9dNgIEb98Or1qwunNJ8YebIAcVZD5+vivSj/PSQzFJyXkooKR0BDpZjeFc2hDhA8+ZB
	h3RvtsbsvDVQqxZY8jY6PCgm9HC9Hw/3h1zAyLPzvVgMoJkHvqLh0dpjc0RA8WExavV1PN96ARg9h
	cqR9J9q9F3VrsYkzxlLEjUjxBm9K/i6pOykqJCmPKiuodQiTRhj4G0pfqwBP8xOut/yMEf1bqsXIj
	Ej8ffz7OndQoJEWFGFyjYxqeoR3OtbrWlL8p8inJQlTX/szEHNS2AxJK7K+myoAMf38fNsveuJyZv
	Hb9o8srw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcnX-00000002j30-3qcN;
	Wed, 19 Nov 2025 07:40:15 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcnV-00000002j2W-1Gj4;
	Wed, 19 Nov 2025 07:40:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 98D3141281;
	Wed, 19 Nov 2025 08:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763538010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bHL7eo/SH1vVrlJeUomLTfMZkXO7/asB01967/MEOyk=;
	b=BqDnSO1TgLNgi1MTOeK6jE37g/xBRtiEK+I8b1ovYKV3A5u6cCFKb9jb3xd0AnTLw+ZCyT
	HDD0of+eIB9ktPyVamRAeFWTFdMY9xLtVDWBtayUpvl/h3ofg3bM3JquQwgALXTVzjJpI1
	ug8QL0sX0CAEiw54AFJ02BHP/62upnkx05VE5Sdwjnyd6gtrFcWczzTB7d4+7eWWtk/iN8
	f8lnTNtS05flOTKpS19WXd2i7vG0IquKNWV0hoCVrB7zZ/73pIXFHt5wQInJyOeb6WyG7P
	IgUOrUcmUwocpkoF2jEqd7c2OuuXAijq8ANSH/3Qa3jlQud9oHAYkddkl6J50g==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <5bc642d3-fe05-4654-88c3-11c6534c5aa4@kernel.org>
Content-Type: text/plain; charset="utf-8"
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
 <20251118-tinker3-v3-1-2903693f2ebb@rootcommit.com>
 <155d3d05-49f8-a000-6939-1411917745bb@manjaro.org>
 <e7417a6e-3824-48f7-af56-eaf4bf097cb9@kernel.org>
 <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org> <5bc642d3-fe05-4654-88c3-11c6534c5aa4@kernel.org>
Date: Wed, 19 Nov 2025 08:40:09 +0100
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
MIME-Version: 1.0
Message-ID: <b98e53ce-9c8c-c505-6097-0d22d0416e8e@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 1/2] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_arm=3A?==?utf-8?q?_rockchip=3A?= Add Asus Tinker Board 3/3S
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Rspamd-Fuzzy: 59ae499b27e71afc2d1ea7166d8557de11ba77a2a9462162b51c9360d97075de69720eafea670ab93a7e54d871410dd71a6e2cd16e7d6fba51a127e9f31828f7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_234013_661814_C26E6B7D 
X-CRM114-Status: GOOD (  21.44  )
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

On Wednesday, November 19, 2025 08:31 CET, Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> On 19/11/2025 08:23, Dragan Simic wrote:
> > On Wednesday, November 19, 2025 08:09 CET, Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> >> On 19/11/2025 08:00, Dragan Simic wrote:
> >>> On Tuesday, November 18, 2025 16:56 CET, Michael Opdenacker <mich=
ael.opdenacker@rootcommit.com> wrote:
> >>>> Document the compatible strings for Asus Tinker Board 3 [1] and =
3S [2],
> >>>> which are SBCs based on the Rockchip 3566 SoC.
> >>>>
> >>>> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
> >>>> and a "mask ROM" DIP switch to the "3" version.
> >>>>
> >>>> [1] https://tinker-board.asus.com/series/tinker-board-3.html
> >>>> [2] https://tinker-board.asus.com/series/tinker-board-3s.html
> >>>>
> >>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit=
.com>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes in V3:
> >>>>
> >>>> - Remove this Acked-by as the binding code changed substantially=
:
> >>>>   Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
> >>>>  1 file changed, 7 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml=
 b/Documentation/devicetree/bindings/arm/rockchip.yaml
> >>>> index 6aceaa8acbb2..800c11323a4f 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> >>>> @@ -86,6 +86,13 @@ properties:
> >>>>            - const: asus,rk3288-tinker-s
> >>>>            - const: rockchip,rk3288
> >>>> =20
> >>>> +      - description: Asus Tinker Board 3/3S
> >>>> +        items:
> >>>> +          - enum:
> >>>> +              - asus,rk3566-tinker-board-3
> >>>> +              - asus,rk3566-tinker-board-3s
> >>>> +          - const: rockchip,rk3566
> >>>> +
> >>>>        - description: Beelink A1
> >>>>          items:
> >>>>            - const: azw,beelink-a1
> >>>
> >>> Please see my delayed response in the v2. [1]  I think that would=
 be
> >>> a better approach.
> >>>
> >>> [1] https://lore.kernel.org/linux-rockchip/3c96ee6b-dca7-1a0a-792=
b-f8c165ec997d@manjaro.org/
> >>
> >> Your reviews are not helpful. You nitpick irrelevant things and pr=
opose
> >> solutions which later reverse leading to wasted effort on contribu=
tors side.
> >>
> >> Michael implemented what you asked here:
> >>
> >> https://lore.kernel.org/linux-rockchip/e4cd11d0-463c-e707-5110-6b9=
2899b1ba3@manjaro.org/
> >=20
> > Not exactly, because I didn't ask for any compatibles to be removed
> > from the new board dts files.
>=20
> Read your answer again. You wanted ENTIRE bindings, to be like this:
>=20
>      - description: Asus Tinker Board 3/3S
>        items:
>          - enum:
> 	   - asus,rk3566-tinker-board-3
>            - asus,rk3566-tinker-board-3s
>          - const: rockchip,rk3566
>=20
> (skipping obvious indentation fixup)
> There are exactly like this.
>=20
> >=20
> > In this case, we could also say that it was Michael's fault not to
> > give enough time for the reviewers to respond.
>=20
> Michael implemented EXACTLY what you asked. Now, you ask to change it=
 to
> what Michael did BEFORE.

Not really, because it wasn't some kind of a request from my side,
but merely a suggestion that was intended to be discussed further
so the best possible solution is reached before v3 is submitted.

> Your reviews are completely irresponsible and incorrect.

Calling my reviews irresponsible hurts me a lot, really, but I'm
unfortunately already used to hear hurtful things from your side.


