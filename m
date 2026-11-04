Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B52606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EkaMX+FV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LB8/E1FT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=; b=EkaMX+FVCV6BVz0fFUaRjTOi2W
	lJV9gsyFxPEpVVKDrE/Eyfiv/POB1XOGcp2Uk+FzNtn6RiLlVZJsHZ2bcnfOcrgz/8wuaBFVB9ZyC
	QqFiFLOgX+9QiY08crTSNMWub+bvkOxcMpEIyv0DZ/9wucEQLJs9U2m75dmY6hWexhe+2aWOvP3SX
	1XHxdyD+vwTYshLJufH5gi1yLO/ZyFBl8LghTBmYrLk7PajnLvV5IUwRZ7QNJeIhtFHXiUtUkE82/
	vfkrN2c/gBtE5fwa3eBxFoF4OOqf1ys3bqSrGxKYnFfVRNT+B/7CmGyJtpM4mjla8itUVmUcPX3hh
	dGDwAxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYhu-000000054fL-1Z9n;
	Wed, 04 Nov 2026 10:59:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYhs-000000054ef-2LFm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:59:05 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd3310348d2so768202a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789943; x=1794394743; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=LB8/E1FTsQawSfxjuOS+lD18I0Oc8DmORKxFnHS64mDrb4JUhydAvZcoAKl2YylYIc
         MOlhDY47FO8SAjRYdxBdHPC6O1rk1LAsn4+Z0v+1JOwYhP22qO5mLWMYXQn+qTVpPHcY
         wDcar6MkDT1dTZ72v3zu1Jk5Y1i1haQey0WUT8lGbJnBR/1pBZhFqvLrMOCIB7ED0hda
         M1AAU9enp3dgUdzZJGQQghdzxf0KltSwnXH3Kn+MVQHs1uJmCWKJJRnnWOHYi36U6RUx
         ItKPaclll/eCb/vp4Iwk1U3osHlE4cjQ2yHKNnIAoJWlPTwDrsQH7sKcZFX14Igm/BhB
         IFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789943; x=1794394743;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=JmAsoxZdOqd2/2nLUoTeaz5FDsIBJBX1g1PULpFzc1fM5sxSyoXEJIE73iAYyM9piq
         f9YIcRwaDwVIbxiyXuGM/HxIryv7f90KuCUkhR8s622q7B8y5LTt9F0BHQ98lpx8zeVM
         RI9t3V2KplNKPhf4EW1qPdv4WIcaJ0AKTeVziSpsOKCQHhMM+vnrJ8t+AhwWsLYdN80P
         51Sx3CDft9H2ob3HBgP7gICew+MLL8115S7eO/sbNwW0lKiqV5SPOrIQWOVpwnhyvtwi
         VQVxHqWO8rEnjUswFrvErLDwO7Xp47B5j0eDmKujEg/3TkMI+ogxWywXBuaMp42l6g23
         057A==
X-Forwarded-Encrypted: i=1; AKwUvBzYYZxIcVHFqhCdFMOVAkNtcHXd/YnqLbUsG87vai3oPAr+CH7ptL1eaL32kb4G/KEqubzSI2LKjNAUkUdRekYp@lists.infradead.org
X-Gm-Message-State: APuU4Z8GFs3oCurCVim0Z2p2oYXFedgFb5SrTmPTqFGGZGYp4eC3Xfhv
	S1dHzNE+GypluWJSrj4HQDWKak7ji3A7bhOHtTdiNI6iXZZv3rMHQ8qE
X-Gm-Gg: AYBFou2WVmeEyAMa2jfjQswoPpjUDl1KUyxYxr52ub4RNWD36AbvQslnG31oKCqBxMz
	W15RXX37uozt7iejm1/clzu42FotBlS/c7aqrag2iJ066XTyCUOGQEW/umJD0HRgNQobzs1m7Wu
	XQ7HJfILf8lvXOsCiJjFqp1G9ZFlOEpxyPstE9kr1jryBynbcdG0ZJaT9b2dUWHh3grZw2R4oIT
	nkesG95doRNUIOYJjCnm2WejUZFG30M7Wtv3OXBeuCT0sNacHbav7vhbSle7pVwUeZCDJAhLk+Y
	31QcCxSNF0QQAp9sCaMLbbyO8r2C3LNmdHM9jOUXS2JQgR0F4sL3s4fuZhtlbX9CFsfEDoqGWqn
	1wJg+hs8iGHv2f1tyxFgPKnHpUlvPLRqcJO4QQBnxWF3JM9QSDb+fi/beJYA3XUekGeBUInbx2O
	Kk4MT2TsJM8NyvwvUZ0cT75ONsSsT73OE6Ir7xBv6REYYux3D3iwmYDEyq/+IzTuL/gskZeJCmv
	rW2+BP0gsfyKMIxow1d2nyDBtRs3QIpfGWJCcTxNpf6DaBiCt1dLSI3QlU8O4FKWFLixM6bWTYF
	EdVuf1vRgoJPPCVqORSSStcELZ0eP/EbhFsox/j10CoqJjQA4NitfIxraaksnvKbRFxhI8NbFPj
	P/dr/camJHScWY7SkZ7Q/li74k4Iz/xCLxZpFB7OCfYfQnYqSvmJAHVd7gT+Lw+//mND7KnxnVU
	sdrztZ
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr9431934a91.0.1793789942970;
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm3304868a91.15.2026.11.04.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:58:53 +1000
Message-ID: <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
In-Reply-To: <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261104-strict-precise-mouflon-85cbad@quoll>
 <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_025904_636737_1F0C886C 
X-CRM114-Status: GOOD (  20.93  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wednesday, 4 November 2026 8:52:38=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On 04/11/2026 11:49, Krzysztof Kozlowski wrote:
> > On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> >> We may need to define both #sound-dai-cells and sound-name-prefix on s=
ome
> >> machines where this codec is part of a simple DAI. Allow this by
> >> refrencing
> >> dai-common.yaml and allowing its properties to be used.
> >>=20
> >> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> >> ---
> >>=20
> >>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.ya=
ml
> >> b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml index
> >> ab4c7d22dc0e..4ac0af34c464 100644
> >> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
> >>=20
> >>  maintainers:
> >>    - patches@opensource.cirrus.com
> >>=20
> >> +allOf:
> >> +  - $ref: dai-common.yaml#
> >> +
> >>=20
> >>  description:
> >>    The CS42L42 is a low-power audio codec designed for portable
> >>    applications.
> >>    It provides a high-dynamic range, stereo DAC for audio playback and=
 a
> >>    mono
> >>=20
> >> @@ -193,7 +196,7 @@ required:
> >>    - VL-supply
> >>    - VA-supply
> >=20
> > Missing dai-cells constraint
>=20
> Heh, I already asked for this two weeks ago.
>=20
> I do not see how you responded to my comment, dropping everything from
> DT patchwork.
>=20
> Best regards,
> Krzysztof

Given that the binding did not have a constraint for this originally, it
was my impression that adding one would best go in another patch unrelated
to this series. If you think it's fine to add here then I can simply fix th=
is
for v5.



