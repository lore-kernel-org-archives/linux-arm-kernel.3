Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D3606B0F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vFJN8eb1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGE3mooZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=; b=vFJN8eb1fJGMgA
	N3qAYtIgZ9ajvqj3M0fH2H1HYhLVsCzB3f5J8pFI+Fe9KvIe8tTdARsMgr9HFUm/p++hGUQqO8KGm
	Rjxl8HwS+6APqSrUtEer/uXuEOvaqFECfMe7AshtBNv31MhfTpUROBoiA0jwME8jNe8VjrchPmLJn
	Y9abIOa3FvXuQnoRrA5tjvEeNsYfYUHwwjWXDHofUB7pBGlB3zqOlu9YbQQ4F88cpQJPNk8kP5C2K
	lZ4aBpXk4EbsWZCAijJ3qdACt8wlYTPrCgN1UoSSao5OZv1GyjhWTCK21qDa7FN5q/d+biFunIxL6
	4YO32PXmLQr+pWENqchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvfa-0000000HQKT-2Oav;
	Mon, 02 Nov 2026 17:18:07 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvfW-0000000HQJI-2NGg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:18:04 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c46c4bbb06fso185151066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639880; cv=none;
        d=google.com; s=arc-20260327;
        b=r0+dn2TuXkyM3pgF0kz6wZ33SszvQh4nK5TMZHkWF0OLg3+5tmJdei0Od8ElZXGmpA
         ijksoKpfBaOQsmgwESMG6VlFwrSunFAhNCAviVv9f8CXYl3N6D14pIF8larxDseqdYkj
         3RzAwTzKg6KFwqB2ERqddWHKEvEp5NeaQ+ZGJXYjWCBzeRBaITT1WhKJStPK3/+/61S/
         H+LBsmAkWLf9hrFUcM2aMCMgporW1oEXmb11EwXgvz27q72JNnVVRBzIA6DtuFE03qiP
         qg0xkpud00W/7CvlZFj2AoLlMIBJTzneG21lxwdmF2f6Nh5SRLuzqMRttKkKO2sH8lWe
         p94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        fh=PUNZI80GtK3Y/fOD+OYpgZtcBFY8PYiUouWLGuyN1E0=;
        b=MHQQs5XH7b+JHI6qnGWN7mgZlnU7Kf00s7gh7OnCMpv+oA5M6BxTuV76zITjECEcLo
         32/bop9YOdX20QjRcvS0JIOwizfqNogTju/bmwwX0RAPqlWO13rWW+yEUareh1o7Y2ht
         hAGlx/UNcIqG2PtRiQpjbqPx+LM0ONrPkfC+msZb47YCjMWnUWkhWdHfceW/VSolR4YL
         wKLzcvZ7TrX9x3qNsR2OB+w3qwvqvWUpY/str/IKRIuiY3HIACEoMNZSdlVfXzdgaRZd
         DBJicu3WqlbFepjbp5mJ2251lq11kS7u0Umg+4PedwMyzwAQMyqF3gANeRW2It92vDNF
         yQUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639880; x=1794244680; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        b=TGE3mooZRWlDz3h/GALcg2LlTFZz+BckCizXqm1wgO86Pz6TuzKfoRFjYz4kNF6R9T
         uu/XRV9lTGJ2OW64fhhPMDhezi69O1zoszwgN8oLVAgl9uBtw7kQBrmjtdBQ3dRFKpOs
         WnRwIiO6KFgsvxuN578RIDqo6IeHznBNud8pzF5YorIwPWLRYxYob8zVMrrNYSdZElWR
         iU1z1YO/HhVMAPd4aXppOJhohqbfRrRkghdhPqw2yy51fWQDA+rM8d6beTjr6Ohdehfb
         Z0qk8CER/oGNv0CTeS1Ru6DPvUf8lEllcy70HhQgT1gVIsKYqaKKKOBJUJ1YrVfeXbUk
         tFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639880; x=1794244680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        b=Oq9Hw41D3Eq82OIKU3+xWOQ0PUHZ7SysPrDbMHY+33xWs4rb5xkpRY1yI/+uzykQ73
         OOCzAF+Kk3VvpFfz81duy0ZI8J5JzcaqeP31UDgeOP9FrVSbahiSOSuZ8wsPWFWXLPTA
         NIL+cW1yBWMhZkI/Ae0QJIEQ1oKHiisUPOGSXzbnSYDaZW8oct2bBPmGjbvpWr77cLd0
         DN5bMp6jZjinz8Av9bI9S2aU0PvZ4OJGB/6dJQitgus3z+pb/fWGluR6NCprDx0EwM1F
         z6WQIq0rybXmF6pCq4QQOQcRuVP7cIk7pDzxUN8fWOMq3j7IA6DTy9rsCMzhggiL9AYN
         cRsg==
X-Forwarded-Encrypted: i=1; AKwUvBxuUouP09r4FnMJm0btJDHq85PhmtvDVHQkEWNtTfbxwLLYpsh4hNlBxRvNUZAJPrIJmPiUa4wv+yw4uriC18h4@lists.infradead.org
X-Gm-Message-State: APuU4Z87tZqOuj4fukWeKEvIqPu7B5zx2DVkXLPmL3Dx4QsRldQc1jlB
	F8ZJN1uMxxdw+tisVUomdRnYLsrzkMIro1hQa1e6qSBFI+D5lO+VBA2pU7pgvL/HfOKlRlVUwhc
	NIlEhyUcCJ4lJyLL/HgimBYphNe7HgFo=
X-Gm-Gg: AYBFou1xqx58YZOIqCrq+vWxihJNtAr1Uei3qMqBFGjznvNTArMrD5zMp+3qHZfo3T5
	/CMNzd35IdfkyKiNp5Afu6PSwDuoRRzVjTnIlduZi7wrONXHkH5OK8hLRGk5PgnrMASBG1wAF4I
	SPDAiC5ffy/rQdeKI92ZwiR7OgGy1FQuLXwMVkIhGhtFxXlYDUbt1101gMwg+nLRWp5RYNYKZnS
	mgoc+1/yYpjo6483g6FbGB+9//b/ORvvIVrXrsrql+poxxblMKV51ztX67YYF+O5VK8nY9GUxfT
	FrP7TKoQYyOlz5NSMzHLUTwMqyc9em6iz2MfsFh0qmW2bkHT4Mhl8f19Lrlmje56Pf028NiQnLi
	Tfbse+s9VLqPRGr1rQMIOxu0GwRzAXB41greIhK4=
X-Received: by 2002:a17:906:7309:b0:c41:c718:f5c5 with SMTP id
 a640c23a62f3a-c4ca7a15633mr908428966b.13.1793639880351; Mon, 02 Nov 2026
 09:18:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101192807.897562-6-coiaprant@gmail.com> <20261102115001.1820171-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261102115001.1820171-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 3 Nov 2026 01:17:48 +0800
X-Gm-Features: AclHuK-cq2cybZ_qtRU2eWVJYfCWRlRj-h4oQeg1rwA7i6-MdCUq3glp_F28zcs
Message-ID: <CALj3r0hU-n_c0QSw8frG3j0bHenDa35-c=WbnYU5QTGS8rOZsQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat
 in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091802_641676_DF1AF718 
X-CRM114-Status: GOOD (  13.90  )
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=882=E6=97=A5=
=E5=91=A8=E4=B8=80 19:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > +     /* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
> > +     vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {
>
> This is incorrect from the schematic:
>
> VBAT -> 5V_BOOST / 5V_OUT regulator
>                  |
> Boost_EN ---------
>
> 5V_OUT -----
>             |-> VCC5V0_USB30_OTG0 -> USB3 VBUS
> VCCIN_5V ---            |
>                         |
> USB_HOST_PWREN_H -------
>
> So you should modify the vin-supply of vcc5v0_usb30_otg0.
>
> > +             regulator-name =3D "vcc5v0_boost";
>
> vcc5v_boost
>
> > +             vin-supply =3D <&vcc5v0_usb30_otg0>;
> > +     };
>
> vccin_5v: vbat: regulator-vccin-5v {
> vin-supply =3D <&vbat>;
>
> > +             vcc5v0_boost_en: vcc5v0-boost-en {
>
> boost_en

Hi,

Thanks for the schematic pointers. While reworking the USB power path, I
also noticed an issue with the modem power supply.

For the USB fix, I've reworked it according to the schematic:
- Added a `vbat` fixed-regulator node.
- Added `5v_boost` (VBAT -> 5V_BOOST via U16 and BOOST_EN).
- Added `5v_out` to represent the OR-ed 5V_OUT rail (Boost via D5002 +
VCCIN_5V via D16).
- Changed `vcc5v0_usb30_otg0` (USB VBUS load switch) to use `5v_out`
as its `vin-supply`.

For the modem, the `vcc3v4_rf` regulator was incorrectly supplied by
`vccin_5v`, which means the M.2 B-Key modem would lose power in
battery mode. The schematic shows it is actually derived from
`vcc_syson` via a ferrite bead (B1). I've changed its `vin-supply` to
`<&vcc_syson>`.

I'll send out a v2 with both fixes shortly.

Thanks,
Coia

