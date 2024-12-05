Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7739BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS4E65byXasH63nw7XWyV1kv5nRvT19nS2OJkpP32N8=; b=bN9XXie/xImst41QfYH4/1Lr91
	pgjmdBOu+JJDHV/3PyBbUfkLxf4Rsc+4S/z58xD4Ya1CIkPwf7m2T1L1c7Qy0VA6RbvvHgluhLiFG
	CafvVouerWg5Xluawkcq4u1pORHmmNpQpZbBfNqkPwdXEeppXQA4bE84zCvgpanJAhUJ55zfJLArj
	osxwXykVdoNwRMJNLi9ykTAM/S5ZojJza91UV/NbxLnW8Rx4j4it7Dm0zhKVh317bWRMjwfjwYPOX
	T8Wrdhv//BGtPuwpieiozZLPfw7VgovagrULPDCcG04D8NUyDg4vAyy1YaWsnVnhWvZJOnLOjFWRz
	qMT9IuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBLX-0000000G1Yr-2Y29;
	Thu, 05 Dec 2024 12:52:43 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBKX-0000000G1QV-00Ja;
	Thu, 05 Dec 2024 12:51:42 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e396e33d47dso967211276.0;
        Thu, 05 Dec 2024 04:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733403099; x=1734007899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS4E65byXasH63nw7XWyV1kv5nRvT19nS2OJkpP32N8=;
        b=LUJBWFnDNEkfTYwLML2wuVkrgQcQY/3VWNSfS1mMk9vsf++ERE3I8LCdqQJGdvQiji
         0MGDVNoL5Tz5SxuisPU93ejnDANWGDzD2xJQOnVTfYZbHiYF2Q8RM/abbC7WEF9wjIpZ
         M4PdNrZz1Z9gYThCwKoyW3wAbDOKVPWwKkZ5YkFtRXgm31QHaT1C5SNFDPYRqwHht+eP
         tDhTg69nio40ohZ1zt7h5LOsqsE6DwKj+D8FcLinbaJIpRZO2rUqhsLO505wvOQch0G3
         qQpecWKwKl5bgYgmEeP8mSSvwT0nYu+MQPKuNg2Z9PwHWcCGsQWv3GjvOebQIfvi8aix
         USSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403099; x=1734007899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS4E65byXasH63nw7XWyV1kv5nRvT19nS2OJkpP32N8=;
        b=q2pg2Q4b7nGANYHWRjzoOmztaV7sZ5PmBtJPeSGTaeeTajXPpqMgL/DbAWuzoOIiw2
         zEpJkJaZECO5Zr3sI3u6FKOa5z5jaq6P/FY4vWVfHXlhVxQjpS1q2usvh0RgTshilUzh
         nhw9IX/+v1Psl6SLmujAJfRgxNPWWuGc+Cj4pLRS5sYv6XL2/u+i/fCzfrhLD8H2tnBO
         gAGBGCst5vGwD+XDQe6RRDxkbtQW4Kopthh9lbsNN/+U4m9xs8CIbxbTPwtnbyyud4c3
         aXcV+cTdB+18qiUxUMVn37ohVOzj597NobmUEQC45jKzxa1eKqTPMhXT4B+7AUd9hIlw
         XVsw==
X-Forwarded-Encrypted: i=1; AJvYcCU9YdhpDj0UgMqZkdLwVPGxAa0x/hAXc6BRJqlpmBy2YyJtoTFNNzJqjYt00n00ddLsr5u9Pof1JJRk58opmAzS@lists.infradead.org, AJvYcCXb5ehr8glScykcWqO8UYXcMe/1a0H6bkZ0n2Sf7HTZdW0JORPXriM/KZM9+sLFpZI+uvRDnes1v1FvKdHnS9M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/wi1qutiQAtWWwVrJt+MSNwxCwnBnSQne5omVa9+Ygv/j82dB
	vbzVIr7ZECNpdOgOOHN6jQUC3n+kqeIsbf8HP9XerGilaegPQsVQ2LfvS4qry0G2io909mECKtk
	7P4Q14sZgZA1qF0pWcFxOQE/EBtI=
X-Gm-Gg: ASbGncutO4t6DSGVeVZPtr5lnnKkzARrVTrNYNfUg5UT1Itp/na4v0ImIn19Smo804l
	V6ccJlVYOhyxMHikv8R/U2emSFAZy/w==
X-Google-Smtp-Source: AGHT+IHX0v+XaBJaQPFuk/qhOCAUGBnokLL70FRyDWpxKkVmlHChQDq7qhPmvE6TqRld9vHwDAhCRVKa0tsQqMwHWhg=
X-Received: by 2002:a05:6902:2407:b0:e39:976e:cdae with SMTP id
 3f1490d57ef6-e39d3c22c53mr10848927276.12.1733403099483; Thu, 05 Dec 2024
 04:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20241202090408.201662-1-jakob.unterwurzacher@cherry.de>
 <63b3be80-cb6c-49e5-858f-70fd826140c5@cherry.de> <2578458.4XsnlVU6TS@diego> <CAMdYzYr9bULWou5gf43G-AywREWRCOhHmJ-fOQ1cEDWJSmGSdQ@mail.gmail.com>
In-Reply-To: <CAMdYzYr9bULWou5gf43G-AywREWRCOhHmJ-fOQ1cEDWJSmGSdQ@mail.gmail.com>
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 5 Dec 2024 13:51:28 +0100
Message-ID: <CAPv9Zmmz2W6aU16n1NYZvCrMcsXL8QK3d-mtfWy6d0vsTaNYQw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: increase gmac rx_delay to 0x11 on rk3399-puma
To: Peter Geis <pgwipeout@gmail.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, Iskander Amara <iskander.amara@theobroma-systems.com>, 
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
	Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045141_039613_66BF0050 
X-CRM114-Status: GOOD (  19.73  )
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

On Thu, Dec 5, 2024 at 2:33=E2=80=AFAM Peter Geis <pgwipeout@gmail.com> wro=
te:
> > > > Cycling through the rx_delay range on two boards shows that is a la=
rge
> > > > "good" region from 0x11 to 0x35 (see below for details).
> > > >
> > >
> > > Is this missing a "there" after that? "that there is a large good reg=
ion"?
>
> That large good region is actually an eye that you are aligning to the
> clock signal. The board is on the tail end of the eye where it is
> barely working. This value is supposed to be tuned to be in the middle
> of that eye. You may want to test the old boards against the new
> boards, because if the original board was tuned correctly something
> may have changed in hardware that caused a significant shift in the
> eye location. Examples of this would be changing to a new phy,
> enabling phy delays, or changes in the trace length. If this is the
> case, you'll probably want to make a new variant of the dts to cover
> this.

Thanks for the comment.

Nothing should have changed on the board, and I dug out a really old
one to verify. It behaves the same.
0x10 seems to be the lower edge of things still working.

I will put rx_delay in the center of the eye with the v3 patch.

I also checked tx_delay, and we already seem to be in the middle of
the eye, so I won't touch it.

Best regards,
Jakob

