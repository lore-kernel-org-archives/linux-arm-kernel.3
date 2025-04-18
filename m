Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254C7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSvWnI3C5tegcykknlWng3qsayJZpjRB+0TI5j6d/zU=; b=RQ7MxsmKwqln80lJpT1QBxJod6
	sk1/lLoZ7hmsmXJ5CO4hSxTuzmStySe4MlzWJw855agGXWuLGSAybw2AuPKt+dBUEI6mK83IXmiDH
	URf+dYD1w2hFAFClLb6cxjSt35mA/m/qQKf+XbYD0qVG3VCannA8Gxdte04uvjqIEMw2p+nl0oG9H
	/5F5oBiibu1tqfsxi4XCy29OWsiqd0NQPYX/BKrT+otF89KWL97vedjzoe3QqWve9549016UcZXzP
	qjlmFqXzfuTaT70Ke3UudfnxtpRC08sghW/WLqCrU3EcVb3JTLe1dFHJyBNBu2p4yLKqjpK5M+5p0
	WXorBzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iqS-0000000FqkW-1g8o;
	Fri, 18 Apr 2025 10:21:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iml-0000000FqPC-1wZs;
	Fri, 18 Apr 2025 10:17:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so2952283a12.2;
        Fri, 18 Apr 2025 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744971445; x=1745576245; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CSvWnI3C5tegcykknlWng3qsayJZpjRB+0TI5j6d/zU=;
        b=Fg0aAMUw0BqG/kyo2jxfxb0oU1s6xpOCXAEm11PYZPuPTNBbw+yLtyz3Qwcfo6DwGN
         YCtVaOPUbnj/Ks35/IdWPN0/FOHwVmxga59w+fuD0Ia3FSp5QcbdWmAV4Z23FGIrbMAO
         s8ACdHqHIEw3d53B+eQf99C3kftkpsQ7SbUNMvByWQwN6u2kXL4lfencN9QSJ1DwRNSV
         5C7GKx8Qw+fChKC3JaIjHq0fJmVOlCHGK3cYouY8YessD50AEUPggOgBsCW59flfqBig
         GWe65BSYlub/RVMOeJI1l4Lii6KOADGO4qraz5Ub1Tqw4tkoE4yf4CeAuOt/eVrSSruh
         weuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971445; x=1745576245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSvWnI3C5tegcykknlWng3qsayJZpjRB+0TI5j6d/zU=;
        b=ihtIC1xFskFqKIx+YGVciZm6aW8xXKxQiwn2kdQbtehAsP6rkeWVYGDzYj4chESg7B
         D91X5Q7oyjFvNr2Lo0sZlUWJIOfL+8Esj+IQaC5n+obCkRe1TxyduiHX695KlgD/Ur3h
         nOwh89eXN61rHpaRBSpjvXw/CMJuOrG4UUr49qOmqgDf0C6mvzAUzqNn3lP89Ipa3Sdt
         5Akp7ZGFydnu5XH0IJCYnl1eQE2uHbYSYlaRIuj/eKJrSePt7eyDn0h6GzDgPV/bC3xG
         3+5m16qE+++1YIsGaM1rq++Oz6Aukgvn7Fc7PphjiEKVskkBk9M6/GTYP96DD+zgT0PI
         A78Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQOKjOy7gRq7kI6x+6um6uYJsXHuZtaY+f1vMRSiYjYjVMAql7H0wndLPooxaELguBoyvTYEsRNlCaQHXKNiA=@lists.infradead.org, AJvYcCUd01401aSpDpdyj0G3VNoSsRNXnMyljS/2IFoiCtLWnDJ85oTODj5JY5ZTnlPSnlNGvcHITv3FSmHMSAj60Ew4@lists.infradead.org
X-Gm-Message-State: AOJu0YwRc9esjWs2+ngKrsxueiKnWR4PUJmlRSeW4v6zbqTnhvz1fVrb
	EmFf+GV0ixFIJasliEhAr3SOquCATUi8/k2HzH7D7KhxYXbsLiZsbZJZM4I2
X-Gm-Gg: ASbGncuazNIO4bopX4Ol1rSGgpARh6y0+wcDxc54iqO90EkXl1K9Kvfz8uO+Vr1S1O+
	RvUg6ImOCyAGrJrOZptLGRiDkyy+uasMegk5vHm2sOy+sYNLQ8b4F1MoURahSVGI+PkhG6VYsxf
	kUe6oFUBszBHOXFLrywrJ4cb3LhHV2w4EwGrDqbn3xqeK5e/aLKcN4xm3oza8sIYy9lL8pypeyU
	yERhKrftDvd6vB3GFQskAE7r4PLMAYTDV9l/HkR0Igmm/4H7rxz8+9q5MksdbA2rJac8ewz6uXr
	H8KROMFvcSW/6PPuzSvhVSuCtC5LrZhOZsrQtUuu8muV8D37lyMScMkvEQtj9ZQedfaTT2aZEih
	tzloQ54O7upyPOMs=
X-Google-Smtp-Source: AGHT+IHiAyPXvivjkrlHTACUGM/NMgQ1u+r/3U7mrpl/ZgbCVhByQU9psxpkQOHV5GsJ9WwVMnk2vw==
X-Received: by 2002:a5d:648c:0:b0:39c:30c9:822 with SMTP id ffacd0b85a97d-39efba6ae03mr1476935f8f.30.1744969876650;
        Fri, 18 Apr 2025 02:51:16 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5aa100sm16015785e9.7.2025.04.18.02.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:51:16 -0700 (PDT)
Message-ID: <2ac349c8dd9b7fcc86e2caae1f74943c23289921.camel@gmail.com>
Subject: Re: [PATCH 4/8] iio: chemical: pms7003: use aligned_s64 for
 timestamp
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, David Lechner
	 <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>,  Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>,  Andreas Klinger <ak@it-klinger.de>,
 Petre Rodan <petre.rodan@subdimension.ro>,  linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Fri, 18 Apr 2025 09:51:37 +0100
In-Reply-To: <20250417183535.00004d87@huawei.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
	 <20250417183535.00004d87@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_031727_501026_4E28C111 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, 2025-04-17 at 18:35 +0100, Jonathan Cameron wrote:
> On Thu, 17 Apr 2025 11:52:36 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>=20
> > Follow the pattern of other drivers and use aligned_s64 for the
> > timestamp. This will ensure that the timestamp is correctly aligned on
> > all architectures.
> >=20
> > Also move the unaligned.h header while touching this since it was the
> > only one not in alphabetical order.
> >=20
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > ---
> > =C2=A0drivers/iio/chemical/pms7003.c | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7=
003.c
> > index
> > d0bd94912e0a3492641acd955adbc2184f4a11b3..e05ce1f12065c65d14b66ab86e291=
fab47805de
> > c 100644
> > --- a/drivers/iio/chemical/pms7003.c
> > +++ b/drivers/iio/chemical/pms7003.c
> > @@ -5,7 +5,6 @@
> > =C2=A0 * Copyright (c) Tomasz Duszynski <tduszyns@gmail.com>
> > =C2=A0 */
> > =C2=A0
> > -#include <linux/unaligned.h>
> > =C2=A0#include <linux/completion.h>
> > =C2=A0#include <linux/device.h>
> > =C2=A0#include <linux/errno.h>
> > @@ -19,6 +18,8 @@
> > =C2=A0#include <linux/module.h>
> > =C2=A0#include <linux/mutex.h>
> > =C2=A0#include <linux/serdev.h>
> > +#include <linux/types.h>
> > +#include <linux/unaligned.h>
> > =C2=A0
> > =C2=A0#define PMS7003_DRIVER_NAME "pms7003"
> > =C2=A0
> > @@ -76,7 +77,7 @@ struct pms7003_state {
> > =C2=A0	/* Used to construct scan to push to the IIO buffer */
> > =C2=A0	struct {
> > =C2=A0		u16 data[3]; /* PM1, PM2P5, PM10 */
> > -		s64 ts;
> > +		aligned_s64 ts;
>=20
> Bug I think..=C2=A0 So another one that really needs a fixes tag.
> For all these we might be lucky with padding on the allocations
> but we shouldn't really rely on that.

Agreed... We're likely not that lucky for x86-32

- Nuno S=C3=A1
>=20
> > =C2=A0	} scan;
> > =C2=A0};
> > =C2=A0
> >=20
>=20


