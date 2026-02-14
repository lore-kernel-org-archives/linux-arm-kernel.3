Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14CEF5852
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 21:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGKJib+0WITKdpI220IMwglgT6GjONiYD8yYH1MaSFg=; b=M/u0MpEeP9PxppXZRQH8L7dtie
	q/9ozR93jmRwLGUL1QCS8cRsIYwVimdFZJtRbX9CS0QGMPf9m5KUPY6gPAtJw7M2OzGQzBGIppk0O
	RSYG6kBFOKQpZ19Xwsu/Kcp5dCQpHp6uWSqc5FiYcHkazN42EhCINPOGqJ4jgBnMM80HkwB77zrip
	L/4uyJymILAm2mTex0ifTfmIeSCd4y9QuAg734eDTXSfkznEvZEu1JNUnRySmzgRDpreT04B7Gwdh
	BN4Ar7ojSU7fMHyx7bcDabW9oCWVfJztKJff6Ja0KdKfFnLMxf5Xrvft0IA2d21lH/YreekGePps9
	AoEuOIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMtD-00000004vwr-0r1u;
	Sat, 14 Feb 2026 21:09:19 +0000
Received: from mail-244122.protonmail.ch ([109.224.244.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMtA-00000004vwW-2Q8c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 21:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771103353; x=1771362553;
	bh=eGKJib+0WITKdpI220IMwglgT6GjONiYD8yYH1MaSFg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wSB7pnifFw7d637dCE6Oe2YIk+00Zdug8aP0uY805FsknyxLwXqipP774M/qiKgDc
	 JcE/14B0Vz0eF8x4bmC8rCt0qZTEP6oaO8LxfYmgVoc3BdZ57MGUHeHrRPHiKCRYHx
	 C9GmHoeMMvWyHXRCsbrdmzWZqP6ky9Vql0CEGFqiPu1rnOrZr2Yc8WwK0kg+eQE1HY
	 mhkcHaoQ5Tb4h7fo582W8NpvOwXtZmAPE5NmzCESXXG44z3lzjQFYHA5sLOlg/oueK
	 3AVc+WysGFur4NzCA+XpmwgrbBKz9E7xN+JruFvP9u5E7A2IvQgiCdSRMhL7kCRhn6
	 r9Gfn4Wnpd9gA==
Date: Sat, 14 Feb 2026 21:09:09 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <2QWRaIfoa_z-SIFIhFu37bcpZtK9jYlmk-mziAtaZMAFazmFi_7nloNxIroQ0B8gMhm_FmgptlYexUgHVQQkU6PEcmFi_6DvwwQXDycQESA=@protonmail.com>
In-Reply-To: <223c900f-e509-4c22-a3ea-3e2051ca6975@kernel.org>
References: <20260214180933.42143-1-hpausten@protonmail.com> <20260214180933.42143-2-hpausten@protonmail.com> <20260214-daffy-roadrunner-of-inquire-babdce@quoll> <NptKiK70heOFOIj9x6tz-gtS1m7ueBoa3SNCijidv1yeFPpt9OAPd-LTgBUbrEfAA2u3DTJHzlUDjv17fuddIPZ4m2YEZ1dTaMQuiXDGkD0=@protonmail.com> <223c900f-e509-4c22-a3ea-3e2051ca6975@kernel.org>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: cf7a540bc2054d661460ecfcb69c6bac455ed3f1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_130916_783459_04D89DB6 
X-CRM114-Status: GOOD (  12.76  )
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

On Saturday, 14 February 2026 at 20:59, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On 14/02/2026 21:57, Harry Austen wrote:
> >>>
> >>> +  interrupts:
> >>> +    items:
> >>> +      - description: user clock monitor interrupt
> >>> +
> >>> +  interrupt-names:
> >>> +    items:
> >>> +      - const: monitor
> >>> +
> >>>    xlnx,static-config:
> >>>      $ref: /schemas/types.yaml#/definitions/flag
> >>>      description:
> >>> @@ -66,12 +74,24 @@ required:
> >>>    - xlnx,speed-grade
> >>>    - xlnx,nr-outputs
> >>>
> >>> +if:
> >>
> >> Why isn't this in allOf? Code is fine, but why changing it?
> >
> > There is only a single if condition, so the allOf is not required. Remo=
ved
> > for simplicity and reduced indentation.
> >
>=20
> Heh, you might need to add it soon re-indenting everything on adding
> just one more if, so for me that was wrong choice. And you got a review :=
/

Very fair points. Agreed, it was definitely the wrong thing to do. Not sure
what I was thinking. Do you think it is okay as is, or would you like me to
add the allOf back again?

>=20
> Best regards,
> Krzysztof
>=20

Thanks again,
Harry

