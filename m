Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42438C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=; b=4aDCs6ptRb7jRtQ/BX1w9coMQW
	Vh3jDeG03BnutZcz7mWIZG/xKMEH0sdzch91DmF9Dqk7svAAQbuR2DAaW5E9gfQ9JX6CnywIS6GFN
	AoA7XtwWLo/6yme+CBo+JF9yN/zlCSd+mhOrhmlRe72rjMIzS4yDnPJ1mPXncQyrjZhvMTQUxwqoj
	XHGBc2A8X9fI852vSizP0ETv78SnRpdZfcjarp9qvEKIVATJLQnAtR6dv8Zx90ok3Goy0Qtx8z53S
	bMc0nC+lw1tCDXsgmOoaWsaF9va4UAIa10FxT28DZ1npRzvxpHEaaBbgQtMiKbu3salmL9KTZSm9Z
	UFDDa7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EZX-0000000Au4a-2FO8;
	Tue, 01 Sep 2026 02:50:03 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EZU-0000000Au3q-2sbG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:50:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3377863a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 19:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788230999; cv=none;
        d=google.com; s=arc-20260327;
        b=X3VYHlxaM5s4gHNKM2Fej5cQ5Wz7sJqqVX6iTb5l0XHI8SoDeWXMUFvZztYrNRK5Wj
         9A+QVa3OvZk/QF0IqmmWEQF2ivUl4HEGWvo9JZZgTJHvaWvaC/+5zDnGLFKiV1fxmPph
         svQSF9094DoOLXaKx4qo3bb+Je1DQLi9vlpw3IpkO4fQzyMaz2IlVDjp2r4zDRcHUg9E
         WR5lzCWPJNYIiSliMMbShopW4pNHLj1b0Yh0BZgw57JvSnNDqciPjaVFbhyT+2YO8Crm
         GAxf8yHc8qQtelSHhn7SPF5jU7276OrkjUbcvj3GfjUL3E3K4XsmeflR3E8XqSwpb3DX
         StUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        fh=UrijCGnDLFjUQxuV6E6o8Qz1KUL3elc0XMM0mva6hTU=;
        b=jVGef3lYVuC2b5O04dYpDKrhfqdogaI+sl/+7tHE3Z7FUBC6swJx0/9S7U/xBigJ4D
         f+l8dAPukqJvxoxlhyFmpxEKxuGs4iubJOteRUApyq9kNQe2NoM+3fBUNEg6MRYFEf/+
         U+BhH6BKj6gp8m8Tzu+Dq2C/ZTtxQojbsqhQEy7vPv7QsE5xSuVQNiClapbEHEvhxtEl
         0IQI8zA9VZ9/Ir/xtmHuTFMJntL5VfJaDNAITog0+cTh2+5T5YpMMnRF1S6drR77MdRm
         zfZLCYSWkBllPL21OsA3CvSwkfcHyeObuunYziYv5zPLHx1yDqkU0Y0cDJupV40BP1f8
         /wZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230999; x=1788835799; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        b=sAoI37QE/VM3573eLZ3tDbX/mcbI1PopRfSfh/9iNNEdJlC3TD/0g036oGzzPeGeHb
         toJtD4E6Id9N5fbVhzbH0Mz7wm69i6i7MVf/ccRJmk1tzqLOEherKX+izNd5lueI1oZB
         jmmCdFlN98cCXWtnWUEseA4P1vctg9r+61kepg/WZArUyorcEG/WsS0gZ4Iy2GHlieED
         bHM4pQQ6+euOtvjWPFvV6xhiEGaMAzZODltGPGJ1gYw2qG3HAS4xCYkBuJrUJOLgAruC
         KTi4O1EIuxTltEgZTuMQHw82tprHgbCQoV1ub8Y53B7mDWsmN64W55nclE+pZLOoUUC3
         NNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230999; x=1788835799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        b=aejPR7WPB4bB3aFdFJEvZLUNbfm+sWPOH3kr51P+25w8lbrowvaos93Lxw/7Sc94EB
         ST1b7iqZq5S4Gd4dWriltz2L/ID/5VyOzZc4YEMmIdmC2mEjXrgPY4sOWbAosRVrZGpW
         LQRZGm+bEpmOIsTzXItt5ILI0a77H+DNg/Dwb02pvdfMgvL33wsBpwdOpL5U163QWtmb
         sY0WZQSx+ATAxMMhbUYkHzjvpRPjx4XohUZFSJ/Ke8z0EO8Qe2mwPDaiveB2Z0TnpZM2
         tgnD6lOJsGJPK/CT0uogqWVWejGMtmmLb45xQLopAQZImWrCfdiitxUHdefxjhfgolLV
         ZnHA==
X-Forwarded-Encrypted: i=1; AKwUvBx/aKLwpbFxfMkdrnL5cC7PbgcKmnyMJ42ZqKJ4oxnUameluWP7AdbF6kCDisPQmSmXfwe+sSkxMo2Ofefyy+ds@lists.infradead.org
X-Gm-Message-State: AFuF++l1k2J90pbg+I3kkvQXr2GqGDpjQcO3peEL6Wqb+wdYlddQvejT
	x7fbDJVCZ5Q9GxtqIA1m+a+5QO5aOm/2BJiGoQllJ45xcpf0lObHsYrI+Fr38MOQc42tCSznU19
	FQ0E17IBtBuHRtJLbjIhVElFhKi4qZbU=
X-Gm-Gg: AYBFou2t8dJ9WqY1lvS9WUicd8OnlsYnwWyvT3BZ1MLZHUHXLKKKbzWZfjF4F/OXOiC
	MYtgv9Po05mGiES6IMSCsYNoskTsiUcvnUETdX3aiWJ+ULeCShAZTCGqyyzI2g4BUHXdH8liqmh
	/iBJOMCCfT6ityIgwt+nWpTUEGduMrf5kuCSjslfFHfpZMVYoDbHfBgLvnu2DebvXo9jbBagtKG
	ye/MZiiRc0uVBlB9yzgYvZJuFxbNIDgq2FmeqU6ZGD0n/EqLEGVbmmvqzdroxnQjs03xfPMLzCl
	NexgW5FTWPYXOZ1+E0YDdMjNRae0C2Q0AkFnOEl7uzQ2QeepwWOwloAPnJz0gtKLHvJW5JgYf7l
	Y4zJh1t+KIyqK4qroBPqm1NJ/4qjWlaUn0YbBS9S5fXxIYO8fj2RE2enLmGSnQDJn4wc1ZE0ydD
	JN7WsULlS4sfnvPBILBUiZqAcWPf1uf7s3jL1yRLqdQCUjrN+B4W0k8e+3Ygh6kI64ZA==
X-Received: by 2002:a05:6402:1ecb:b0:6a6:32fa:cac with SMTP id
 4fb4d7f45d1cf-6a663b43846mr2830056a12.17.1788230998708; Mon, 31 Aug 2026
 19:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260831233653.14232-1-rosenp@gmail.com>
In-Reply-To: <20260831233653.14232-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 31 Aug 2026 19:49:47 -0700
X-Gm-Features: AcwNN1WtBJgmoVyxxnr1GxEJ1-2nuIjkP_fAURpv3voSdGn5BCgrhOsGs_1n4Pw
Message-ID: <CAKxU2N-qwFSPzLT1j1Bmo3-S8m+H5xaxGH5iHiACqHbj1+fiBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: helios4: drop unused phy0 pin group
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_195000_762666_61563B00 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, Aug 31, 2026 at 4:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The microsom_phy0_int_pins group muxes mpp18 to gpio, but nothing
> references it: no PHY interrupt, GPIO user or consumer pins it in,
> and the sibling ClearFog board does not define it either. It has
> been dead config since the board file was first added, so drop it.
This is wrong. I have a separate patch that uses it.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index ae03d42f92a0..e63b8b5e632d 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -284,10 +284,6 @@ pca0_pins: pca0-pins {
>                                         marvell,pins =3D "mpp23";
>                                         marvell,function =3D "gpio";
>                                 };
> -                               microsom_phy0_int_pins: microsom-phy0-int=
-pins {
> -                                       marvell,pins =3D "mpp18";
> -                                       marvell,function =3D "gpio";
> -                               };
>                                 helios_i2c1_pins: i2c1-pins {
>                                         marvell,pins =3D "mpp26", "mpp27"=
;
>                                         marvell,function =3D "i2c1";
> --
> 2.55.0
>

