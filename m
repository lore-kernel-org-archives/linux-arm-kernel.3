Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1548EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueVYBf/vvIdXw8MFHMMhsOsTsQ52WkYR53FawATwmKc=; b=Yw2vdf8rBsFhm9JrjtTCc5tXgM
	kFPSXmzB7gWMp27iIG0uZlQG4m12F7zk6cGQfMzFjrZmKUKmePKD14s+9whfoAblvsMlXP+z38m9O
	BEr4K5agM+qNf+kg/0I4ahE4ELQvzDpqqDLvXJUnvLeWqGCDMznGpNotEyEWbYBVCKpHU4IFtxag7
	TfJ0Io5l00LyNkkndAizcHqXgsCiOwk5zUrgwgdfnbMUMXwqeHd34JkJ9sXdl/Wmm8MDUxDQoNTwX
	VZlhN81uXVlNfM8jN5hDKzs0sS3TRSgQiXfH6By42qgJ/omlFU8we/NuDYpkFB/31iG/44d4+ZZPm
	Mw7i+u1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4Zr-00000009YRM-2kNo;
	Wed, 02 Jul 2025 21:01:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4WV-00000009Y5N-09so;
	Wed, 02 Jul 2025 20:57:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23526264386so44748915ad.2;
        Wed, 02 Jul 2025 13:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751489862; x=1752094662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueVYBf/vvIdXw8MFHMMhsOsTsQ52WkYR53FawATwmKc=;
        b=gyQriaoIP0eSsTl6XhQkynrvK1TubZV7VxduRX0Vqe/Rkto/5SVFhCwVnYD4oUh9WI
         k3r9veAvl4Pl6CH6r72uwr4p8T8idIlJkervm6fDA7QXPI5PWuZ2Ait5LIYFyxceA7rN
         7HvbHaZPRODaUto8pplGaFtVBH0k6WvytLiSZSPAMdlJ7tUs7Y+KM59pX7KGSm2SC1uG
         cDwJYFQfnl1tvDiGJhUV3UMA0D6XnLad5ZfjhPCYEzTAd6qpC8yepHzTrFccUxtvoiwV
         jdNDUQFAgsKkAVbeKH2eq9LthVUUSCK3qiV0OHe6XGXMrVulSK6QAMjIp14+Mr5eOyet
         jM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489862; x=1752094662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueVYBf/vvIdXw8MFHMMhsOsTsQ52WkYR53FawATwmKc=;
        b=P8x/h8CFcyoGdRS310Oc4qRvYtoRKwwRzAXpS12VSjVaqExIMeQhkS1mfzAY7cW0q5
         0/aQfFUw+4zCS7EFN7LOUUDGLmMo9M9Ftd9SRP6ZxRSzEsQzLw6qi2vZ9V9SqqdXGxxr
         NKdB9BbbiUYwbsxhwpTj2Z19qts9I9D+E8gLHFWp+sUZxsdjSJnIDh5NVx4F8BWZ0jSx
         EooH33dDX6k8gKvdbX+iBJAjGCB/O5BJYKsLzVvmWvXyKHhnCNEY+cKtO/uueU8CuIm6
         MruG6bLShrZuE8czFJY2pZHGEbLDlSlzxcK5Xtfi1DZMBXU+Mx1hts7soR6LFsVMgVLT
         dmpA==
X-Forwarded-Encrypted: i=1; AJvYcCUAd7rzVUvDo4QhrPz0k/jwmZORZWohC+HEj27J7u5muS9oTPa1cALCqISIBNXsFV7fqYo8xlMBelqTKUek@lists.infradead.org, AJvYcCWFfdgypk7fCNS6T+Vsgx7oarX4Cwaf5AtiUL+oeAn8SvRfxQQEq5q/Kto0Pl82P8EU0REkLviml0ZV3qj5ySh2Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkLStF08byD9YWgpsIBs1w/6W/pxnO8Qg73bIUTcbCg9bhHDqA
	GRhIx0qy2aEIkBxxCSpn9MrU2zBAjERCmicYEd9EEcNqe7fUlUxOAWd3km9MT+UI/qvamZwHPXt
	dPuGd2wfurSXe3y6oaTxDyJSzQqaGZAo=
X-Gm-Gg: ASbGncu57KHFScl2l74rhR7BEYs8wgkPeYQrbE5jLjbQy+cvkZavZwetlYPqSFmgz7A
	/a6pVyKhMJaNBvkP0jX0/K+Y0rFL5zI5Fc/cowa3ysl9+GyqMfMsbpOF4Non7ke65bQ8xyxIIIY
	bL7/ZN/nmvYoDcvgJYLapsDbZ2Gyr0QkjHWzurLx2ypl41FbiOHQmhKQ7J4jXh0b0CBduVD9+7v
	8Cj
X-Google-Smtp-Source: AGHT+IGjgIPfifmbYpcB2lF3QfBA5zuc6wFJQKxRY4/yEEmq/VYap82lAwrs8+bzvEScw/tJQqdROF0TMX1gsfJcQ+g=
X-Received: by 2002:a17:902:d481:b0:235:f078:473e with SMTP id
 d9443c01a7336-23c6e5cade9mr66917995ad.43.1751489862178; Wed, 02 Jul 2025
 13:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com> <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
In-Reply-To: <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jul 2025 22:57:31 +0200
X-Gm-Features: Ac12FXz6XZtGm-3ti_MXvq5_F1onfeA5_tjNx4dcE-d4NTCOTzJlhlVHJUTnayc
Message-ID: <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_135743_093643_8C71DF24 
X-CRM114-Status: GOOD (  22.09  )
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

On Wed, Jul 2, 2025 at 9:07=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> On Wed, Jul 2, 2025 at 2:40=E2=80=AFPM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> wrote=
:
> > >
> > > On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> > > ...
> > > > If, as the description suggest, the regulator framework somehow ign=
ore
> > > > the timing set in DT, maybe this is what needs to be checked ?
> > >
> > > The regulator framework only cares about timing for regulator on.
> > > Regulator off just turns off the regulator and returns without delay.
> > There's an exception to this: gpio-regulators without an enable-gpios
> > property. My understanding is that regulator_disable() is a no-op in
> > that case (meson_mmc_set_ios() even has a comment above the
> > switch/case statement), see [0].
> >
> > > The code makes incorrect assumptions. Then the kernel resets the boar=
d
> > > without having enough time.
> > Can you please name the board you're testing? I'm worried that I'll be
> > looking at one .dts but you're looking at another one.
>
> https://github.com/libre-computer-project/libretech-linux/blob/master/arc=
h/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi#L481
>
> vcc_card is a gpio regulator that gets toggled on->off->on.
Thanks, that clears things up as I was indeed looking at a gpio
regulator while this is a fixed regulator!

> I traced the regulator framework a few weeks ago and forgot the final
> regulator disable function call, but that call basically returned
> immediately while the regulator-enable function complement had delays
> implemented.
Yep, for fixed regulators there's an "off-on-delay-us" device-tree
property (which translates to "off_on_delay" in the code).
Its implementation is smart enough to not waste time by adding delays
at runtime by implementing: on -> off + remember time -> wait
remaining time + on (meaning: if there was enough time between off and
the second on there's no additional wait) [0]. On system shutdown it
will not add any delay unfortunately (where Linux loses control over
time-keeping), meaning we can end up with too little waiting time.

Also my understanding is that it's not something that can be fixed in
u-boot or TF-A. This is because bootrom already has trouble reading
the next stage from an SD card (which is a valid boot media).


[0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/core.c#=
L2754

