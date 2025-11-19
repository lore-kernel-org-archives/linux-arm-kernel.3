Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E837CCF2594
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO6i4EJtflzh+RBm1bIZwxR02OjHW1gnYtKm7qHscDY=; b=sec9mhkRjYIcYwHHuiNMvXqoYX
	mGXscsJo/BeHH2+cDzx/aw5UFpKdNtJpw9+PmkiXCIRFUlCwhFay73iMK7MjowdCKrYtn7bwmx7G7
	1yFxM5bIIX4QZ1c6GM0dRENZHQJRkTQhZIKaA0T00fzox5kp21/tzpwbS13AAbnehm44Y6EVpCl/u
	LNiLVjFO2zI7r6zZB+z/wQgG1Qx97/tK3dMUylXRUQpwPdfoG9p9JprMr+43KIT0vlTTwW59/NMq3
	ykFg0cE97IZ01yAEGfNIbshX0UxIXt7rpub3wZ0Fj1oDi0Dd3E0V4SK5DEfWQhEDUhvDbfEJUyszq
	x8hTqTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLd17-00000002kJd-3Cp6;
	Wed, 19 Nov 2025 07:54:17 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLd15-00000002kJ5-0cPN;
	Wed, 19 Nov 2025 07:54:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 272CA41286;
	Wed, 19 Nov 2025 08:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763538852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FO6i4EJtflzh+RBm1bIZwxR02OjHW1gnYtKm7qHscDY=;
	b=qOk6EkKfspC043mosDKndlKCCI3kXANFZl783HE31sunZP+QhGfBP8qIyFbH+hmGa/16cC
	f7ocVn++TitoxWQeUNDhy7oqha2Wytdi0IKpN6dexNBlcecI3pCr3BTCCsNmfdlnABGbpD
	KC7D8Cofr9MQT4me7EjdghgPKjB3NZqL2HbsrShu8tgWXOwm4pQNNaQ4C0X6Dkr+hqDUPh
	WNNT1TeOtWKdhWJE+gzrcZ4lXadhmyJg5MAeUMfuQyaSBqKBDiDfjSAOPFD+DwZ/4Y+aW6
	+EMFIfx+RlYP0gsTosQbF5l0V8OWkQNF2slXc1Q6k/sBIEw8a1O9EAoGj71oxA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <e1598abe-7a66-4808-82c7-2389ee2ea279@kernel.org>
Content-Type: text/plain; charset="utf-8"
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
 <20251118-tinker3-v3-1-2903693f2ebb@rootcommit.com>
 <155d3d05-49f8-a000-6939-1411917745bb@manjaro.org>
 <e7417a6e-3824-48f7-af56-eaf4bf097cb9@kernel.org>
 <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org>
 <5bc642d3-fe05-4654-88c3-11c6534c5aa4@kernel.org>
 <b98e53ce-9c8c-c505-6097-0d22d0416e8e@manjaro.org> <e1598abe-7a66-4808-82c7-2389ee2ea279@kernel.org>
Date: Wed, 19 Nov 2025 08:54:10 +0100
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
MIME-Version: 1.0
Message-ID: <69de292c-af43-d202-72da-c7d3769d1799@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 1/2] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_arm=3A?==?utf-8?q?_rockchip=3A?= Add Asus Tinker Board 3/3S
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_235415_435354_C57F7658 
X-CRM114-Status: GOOD (  16.16  )
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

On Wednesday, November 19, 2025 08:48 CET, Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> On 19/11/2025 08:40, Dragan Simic wrote:
> > On Wednesday, November 19, 2025 08:31 CET, Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> >> On 19/11/2025 08:23, Dragan Simic wrote:
> >>> On Wednesday, November 19, 2025 08:09 CET, Krzysztof Kozlowski <k=
rzk@kernel.org> wrote:
> >>>> Your reviews are not helpful. You nitpick irrelevant things and =
propose
> >>>> solutions which later reverse leading to wasted effort on contri=
butors side.
> >>>>
> >>>> Michael implemented what you asked here:
> >>>>
> >>>> https://lore.kernel.org/linux-rockchip/e4cd11d0-463c-e707-5110-6=
b92899b1ba3@manjaro.org/
> >>>
> >>> Not exactly, because I didn't ask for any compatibles to be remov=
ed
> >>> from the new board dts files.
> >>
> >> Read your answer again. You wanted ENTIRE bindings, to be like thi=
s:
> >>
> >>      - description: Asus Tinker Board 3/3S
> >>        items:
> >>          - enum:
> >> 	   - asus,rk3566-tinker-board-3
> >>            - asus,rk3566-tinker-board-3s
> >>          - const: rockchip,rk3566
> >>
> >> (skipping obvious indentation fixup)
> >> There are exactly like this.
> >>>
> >>> In this case, we could also say that it was Michael's fault not t=
o
> >>> give enough time for the reviewers to respond.
> >>
> >> Michael implemented EXACTLY what you asked. Now, you ask to change=
 it to
> >> what Michael did BEFORE.
> >=20
> > Not really, because it wasn't some kind of a request from my side,
> > but merely a suggestion that was intended to be discussed further
> > so the best possible solution is reached before v3 is submitted.
> >=20
> >> Your reviews are completely irresponsible and incorrect.
> >=20
> > Calling my reviews irresponsible hurts me a lot, really, but I'm
> > unfortunately already used to hear hurtful things from your side.
>=20
> You do not bear the cost of your reviews, so maybe that's why you thi=
nk
> nitpicking, poking around, pin pointing irrelevant things and adding =
2
> cents is okay, but that leads to additional effort on contributors an=
d
> reviewers. And not respecting total effort is irresponsible.

Thank you very much for finding additional ways to hurt my feelings.
However, please think about how your unfriendly approach may or may
not contribute to the overall effort.


