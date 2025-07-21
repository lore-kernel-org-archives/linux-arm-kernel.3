Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEA6C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0fClDVkYwW5hRsu6g/EtGYpZi+CTZWAkLNpxX3G14c=; b=C1TarcKlD4n0EvRZhs8qgvemCv
	c8shNJDbpOkVcJpO+WnvKvfcmx26etDqNdySCIjykYVdKgrj7ULQUIy6a9y9hS19Wc8NZCVwm2ywJ
	Q5kdxl7ku8i12k6LI0umKCV3U+jot8N8KOGbAiPJqmmpjSPDrjneAHg5JmQKJ9JdaufDbG8gxV2DP
	1Bk3R9Snn72TE2nbCYuTLp0nja/Uvb097y+bd8OGLlI5t0oarBLWcRT82lsEQqA09k0Za/4/C/s9k
	o+FGVqOdut+INNINiO8I2ScPrfu35JROG/4pFAO9SPrnHgT1BQmNABYJAheYN9z0ZmWlotVjRWQIP
	1SK2erPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmt4-0000000Gop0-4AL7;
	Mon, 21 Jul 2025 09:32:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmAJ-0000000Ghu6-1IG2;
	Mon, 21 Jul 2025 08:46:33 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c17b:e5e2:6e10:a471])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 148A67928;
	Mon, 21 Jul 2025 10:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753087550;
	bh=31IBqqE1Ag+vgKp9PT7MGd+rJ3pmoTBb2Ubw46Y8TBI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G7rf+ZOicJ8LO6QLyDLra9qXAyetCExNk5XfhboXnO6Wux8h5cwM71UCClYkZhJ9A
	 J1cnNr2zLf+4okgSrH6E7joOjieoZ0QXrlVRXamL+M/ZBSov0qTazvBamyszxGbFSc
	 q3Kj7E6DT48Abz2Nq6M21t4o6ymC7+zbmgYTtKi4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m38qknx939.fsf@t19.piap.pl>
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Dafna Hirschfeld <dafna@fastmail.com>, Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Mon, 21 Jul 2025 10:46:23 +0200
Message-ID: <175308758352.3134829.9472501038683860006@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_014631_776632_0858F564 
X-CRM114-Status: GOOD (  18.95  )
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

Hi Krzysztof,

Thanks for your investigations. This is all quite worrisome to say the
least.

Quoting Krzysztof Ha=C5=82asa (2025-07-17 15:03:54)
> > The "reference" (NXP) VVCam driver simply does the operations twice
> > (i.e., reads twice with the first result discarded, and writes twice).
> > This fixes the problem on most accesses, but the problems still persist.
>=20
> It appears the corruptions are quite frequent, though.
> Using "ldp qXX, qYY, [x0]" (2 * 128-bit load pair) I get results like
> this (each data row is a result of a single ldp):
>=20
> addr:  32E21400 32E21404 32E21408 32E2140C 32E21410 32E21414 32E21418 32E=
2141C
> -------------------------------------------------------------------------=
-------
> values 3D000007       20 3C300000   1FA400        0        0        0 3C3=
80000 count 99993097
> values        0       20 3C300000   1FA400        0        0        0 3C3=
80000 count 5930
> values    7E900       20 3C300000   1FA400        0        0        0 3C3=
80000 count 338
> values    FD200       20 3C300000   1FA400        0        0        0 3C3=
80000 count 223
> values 3C380000       20 3C300000   1FA400        0        0        0 3C3=
80000 count 220
> values       40       20 3C300000   1FA400        0        0        0 3C3=
80000 count 192
>=20
> The valid value (in 0x32E21400 register) is 3D000007 only, the rest are
> corruptions: ca. 6 errors per 100k reads. With other registers, 15 errors
> per 100k reads etc.
>=20
> I also got this:
> addr:  32E213F0 32E213F4 32E213F8 32E213FC 32E21400 32E21404 32E21408 32E=
2140C
> -------------------------------------------------------------------------=
-------
> values        0        0        0        0 3D000007       20 3C300000   1=
FA400 count 98638773
> values        0        0        0        0        0       20 3C300000   1=
FA400 count 1330227
> values        0        0        0        0       40       20 3C300000   1=
FA400 count 3721
> values        0        0        0        0 3C380000       20 3C300000   1=
FA400 count 314
> values        0        0        0        0    7E900       20 3C300000   1=
FA400 count 572
> values        0        0        0        0    FD200       20 3C300000   1=
FA400 count 428
> values        0        0        0        0    4C010       20 3C300000   1=
FA400 count 25965
>=20
> which is ca. 14 errors per 1k reads, though maybe it's special -
> non-MI/MI boundary (at 0x32E21400), reserved addresses (0x32E213Fx) etc.
>=20
> > The problems show themselves maybe in 5% or 10% of boots.

How do you detect if the current boot was a "faulty" one?

>=20
> Well, now it appears more like 20%: e.g. in 41 system runs (soft reboots
> only, no power-downs), I got problems 8 times.
>=20
> Obviously I can post the tester source if anyone is interested.

I'd like to have a look there. I'm doing a lot of work on the imx8mp at
the moment. I didn't have too many issues other than the ones caused by
myself. There were however a few start/stop issues that are still on my
list for further investigations. But I didn't observe bigger memory
corruptions. So I think this ties into my earlier question of how you
observe that the device is in a bad state.

I'm mostly using the debix boards right now, so I could test if I can
replicate the behavior there.

Can you also share the kernel you are using?

Best regards,
Stefan

>=20
>=20
> Generally ISP MI register read accesses which can be corrupted are:
> - first 32 bits read in a given transfer, and additionally
> - every 32 bits on a 32-byte boundary (addresses 0x....00, ...20 etc.).
>=20
> This means, in practice, on i.MX8MP only, RKISP1_CIF_MI_CTRL and
> RKISP1_CIF_MI_MP_CB_SIZE_INIT (with the workaround).
>=20
> What is this 32-byte boundary?
>=20
> Writing is a bigger problem, though.
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
>

