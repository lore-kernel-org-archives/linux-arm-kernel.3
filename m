Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C8BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvO6U5e3ou7cohuaaLtiVKLu/0FNfSOPql7f4CQNZ20=; b=s1FLHl1ldDRhoDQ3l0gnEehQ1D
	8ftd4dIERl2hAATTtyI4rtMKpMRQUzaz3sdmqJCK5EWUh2srovus5RN+fWvXZoi+LTfGwT12Hijmn
	/NLht9Q/sV/I+WNyulYb1vSCRgoYEr3OoOcvKKdOTKVhlrbsgVSEUTPx5Uaz5jzGhfHCTTkqs9BaQ
	tNZSupDlUB6HIBdA1WFBvHiQVxhaIDk+EZS4Yyj0cEg/hbgGksIzkYV6IlApDlWWi83YwfGfW015m
	/jRKHQflodmMVdpR7QQskNiwY7D2Lc3GF6JPuPNSqSuhRJwOe7wuxlliH/UsrNxASoEKSZ06csRyC
	Mm7idJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDiw-0000000BuDr-1NMH;
	Thu, 20 Mar 2025 11:06:06 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDhD-0000000Bu1Z-0kik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 11:04:21 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742468646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvO6U5e3ou7cohuaaLtiVKLu/0FNfSOPql7f4CQNZ20=;
	b=Y/wumE1iWwGTzwcOYHCaxujevsLP2sVF0WD0JCoz2y6HfR5rRs0AGGm47M+kkVy047HPVX
	WugwszOrVFVU9ySFiHnHRQz1EZsIz5gNxS63sDEH6qyenzgbEQj6WuCqqacEKHM26sRpSo
	RmcAb8zo+DJtS3dtY0/S0h4g6jayJlpU7mt/fU1/vpj8EWA+M1UvFXy4oW91TwJtWH/bdi
	s080GE/cSXSw2J9UENTHlmLfLtDKOYBLVF4acbnbuL/PGcHrSabeMDBK4V+rDhBIGIBqGW
	VWcRzLT/7q7secuqVx0Whe2UUvZVQSmGK5rGspeTCAKiE7lX3EiWgChPDnhINA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 11:03:38 +0000
Message-Id: <D8L1KOJC0NJD.3QJBLQ0Z1FI62@postmarketos.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
 <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
In-Reply-To: <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_040419_847659_7756C52E 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed Mar 19, 2025 at 10:36 PM UTC, Martin Blumenstingl wrote:
> Hello,
>
> thanks for your contribution and sorry for the late reply!
>
> On Wed, Mar 19, 2025 at 8:02=E2=80=AFPM Ferass El Hafidi
> <funderscore@postmarketos.org> wrote:
> [...]
> > +       au2: analog-amplifier {
> > +               compatible =3D "simple-audio-amplifier";
> > +               sound-name-prefix =3D "AU2";
> > +               VCC-supply =3D <&vcc_5v>;
> > +               enable-gpios =3D <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> > +       };
> I couldn't find any pictures online that show an analog audio output
> (typically a 3.5mm socket).
> Can you confirm that this is really present?
>
> [...]
> > +       sound {
> > +               compatible =3D "amlogic,gx-sound-card";
> > +               model =3D "XIAOMI-AQUAMAN";
> > +               audio-aux-devs =3D <&au2>;
> > +               audio-widgets =3D "Line", "Lineout";
> > +               audio-routing =3D "AU2 INL", "ACODEC LOLN",
> > +                               "AU2 INR", "ACODEC LORN",
> > +                               "Lineout", "AU2 OUTL",
> > +                               "Lineout", "AU2 OUTR";
> If there's no analog audio in/out then this section can be cleaned up
> as well - together with the references to acodec in the dai-links
> below.

Oops, completely overlooked those.  Will fix in v6.  There indeed is no=20
analog audio output.

>
> [...]
> > +/* Wireless SDIO Module (Amlogic W155S1 / Realtek RTL8821CS) */
> > +&sd_emmc_b {
> question to Neil: since we know that there's two board variants out
> there (with different wifi chipsets) - are dt overlays down the road
> enough (to enable Bluetooth / wifi - depending on the chipset or board
> revision) or do we need to split the whole .dts?
>

So far W155S1 and RTL8821CS are the *known* chipsets used, but there may=20
be others.  Right now it's not my main concern, as W155S1 is not
supported in Mainline, as far as I know, and I can't test RTL8821CS
because my variant seems to have the former.

>
> Best regards,
> Martin

Regards.

