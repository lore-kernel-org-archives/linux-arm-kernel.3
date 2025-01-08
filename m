Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CC1E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSdUqdwrauCyORBsaipaRx5uPIDRCF7bNyQAUTlnqs8=; b=luQM5c0uddqZYh1fci/PamkeDV
	RE3IEmZYFhKbzuEJpBbJE/mbm9vyVovaluBvj29QFN2w9SjSWTZ9E2Jr6Sw/o1+5fhA1zxp5OKqEj
	MFItmoGk/u1o4ZXuZd/SnrZGvxeufA2u6V8VJqdahpm91e/eVQzYfiUOEG9qmp6aF+OTV244FdVat
	kgw/enqoIrycr3/YhhzBjq3Z1Yp/2EV2upQvQd3nepfuN32LloutCf6lg/fIO+350Rk0EnwgxMz0m
	kM5sm1VGWXij6Z1w4QMof+4ey8+UW699XMmmU4XtEyUMjcUBfM+RyGZtA0OS0Hw5WdknYVkmdA6uy
	i6wcuawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVd7w-00000009pyn-0jZA;
	Wed, 08 Jan 2025 20:58:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVd6g-00000009pqi-2iAV;
	Wed, 08 Jan 2025 20:56:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215770613dbso1940695ad.2;
        Wed, 08 Jan 2025 12:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736369809; x=1736974609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSdUqdwrauCyORBsaipaRx5uPIDRCF7bNyQAUTlnqs8=;
        b=Nhp5o7FZ87kIpp5IpwQRLvpo3xcjicOngK3ruaQ9/1HlDJMxNBa6k1Yh5hK3AoJi97
         cbio+hcpjtIcY5rFyYLNTtV5dH87igmy1CpON6qV5Xpafts9/MFBOGRuypO7E26R41PX
         aMXs72c78z4TRbbH7KvEcbjmJRBDLzX11MBojsohDrVWCmSWSCp9cqQH+UGD/qr6H4q2
         04A/DGgab15HH7UJTLvzMHkI4+xN4AGJyoZrlg6Gw2zb4I/W2J+LKF+A4XdIX/qq7nlZ
         EoQCzQjchM0Sum2PBpX9Vlc0TDGZG+YZrjevcbghKEl2fpjayDfjk/Ldq+avPcCZU8af
         4kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736369809; x=1736974609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSdUqdwrauCyORBsaipaRx5uPIDRCF7bNyQAUTlnqs8=;
        b=OUXSu+UkmD3TkGTnppP25vVBA+gyzUi/QP/ejo80xZcWXC1JSZrZ0lMnfdAWvb4u7W
         rEc+3GxLE7QKaCynH0KjD0faPsS+JQ6rInEHtpMK6KQXKD2cEIcHkagy8sWPss5rQP+y
         hZxppZAEjalFnk6POTm5f0W18X3RG+/m7TdezZlgFF2xtS2U8Ymdm5UDtg8zbrXkD6hS
         4gZ6e0nALPH9FyK47hOtCsqKdArPYXceEK7Dyeyr4SQ3tuR4chn1XANOhZZJ6OiztfW1
         4bisETDwO4Wg5y9aEKwHwATeLgY3L7ZhZEWbLlMj4ir0mcUxNQfh+fw5dYy85wih9W44
         HYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm8Kko1vG3H2UqXY5iZVQ6nh0TxI4qV0rN88k1S1oGSY0pwwvKBvxDFHqomnxbvKWiymM9zAGAduouuiTxB6sRXg==@lists.infradead.org, AJvYcCWVClvwI5QMS0W8ZTYIS+SXnHKA4DmtG0SwvtChVZFJh0rrxmLRzHgYdSPw1ULTVSYMk5QQ5n1pJmoH78wb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz05IVrXKV+5OcrvY0bR/gQZi17WpnyQWCTZ8qMPgt4qYTBhz7L
	/icw+37KzyzLxIK5+LV+wNo5PySmKfGMlD1Ma4QtJABNZnhY9EOvnHPMf6VMB9fLNtycsgEYO9a
	rZtec2YcIuYXzhMnMH4XjdxxkRdc=
X-Gm-Gg: ASbGncugwlraKDrnB1Ji5Vl/VHaZO0PTRgGv+wLRaiIGUHv7F2sW+xhhNz+poKFMpVt
	GS/zSnqOaw7e3qDxUOriy8pEyPJyYyOM1nUfMmdbKCQF/+DuUAur66FOeIZvmBd3xIl/t/Zg=
X-Google-Smtp-Source: AGHT+IGOW27FHokf8sgObdZCgih5wBSNSIeA7bOubCTLpiyN4Z4nB0G4BwyHZiUuJKOgDby83TB0PieIAwmC2MWNzz0=
X-Received: by 2002:a17:903:41c3:b0:216:6590:d472 with SMTP id
 d9443c01a7336-21a83f4e4f8mr59615275ad.21.1736369808857; Wed, 08 Jan 2025
 12:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
 <20241219-scenic-revision-17da9231d61a@spud> <91dfdd42-6ddb-490f-acda-41ce55782959@microchip.com>
 <CAFBinCCxZjuXL0duy3ePPDtL1oJS_GZiX3=djXpHR+-6gLkN_w@mail.gmail.com> <39be0bea-c207-4bcd-b464-ca93e91cec93@microchip.com>
In-Reply-To: <39be0bea-c207-4bcd-b464-ca93e91cec93@microchip.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jan 2025 21:56:37 +0100
X-Gm-Features: AbW1kvb98S1fSQRIIu1Gd-WnPy0Ge9shDwipgShzVZZxxYskdFEoJKeN27AkIW0
Message-ID: <CAFBinCAO0bpd7PXaVJWMby4Mqj1On5DaqNZua4V3gPUDms8=LA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: move compatible property to its
 specific binding
To: Dharma.B@microchip.com
Cc: conor@kernel.org, ulf.hansson@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_125650_684614_873F3576 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Dharma,

On Wed, Jan 8, 2025 at 4:11=E2=80=AFAM <Dharma.B@microchip.com> wrote:
[...]
> "One issue is 'compatible' is required. Either that would have to be
> dropped as required."
>
> Instead of just dropping it from "required:", I removed the property
> itself and moved it to another binding.
>
> I will send a v2 by removing it from the required, will it be fine?
For me this is fine.

My understanding is that if we drop the compatible property completely
then any compatible string will be allowed (for example: compatible =3D
"random,name"). This is because mmc-slot.yaml inherits the properties
from mmc-controller-common.yaml which itself has
"additionalProperties: true".
However, if we allow it but make it optional it means that there's
only two valid states:
- no compatible property (on the Atmel / Microchip SoCs)
- a compatible property with the value "mmc-slot" (as used on Amlogic
Meson and Cavium Thunder SoCs)
- (anything else is considered invalid)

Rob, Conor: can confirm this or correct me wherever I got something wrong.
I hope that your feedback will help Dharma write a good patch
description for v2.


Best regards,
Martin

