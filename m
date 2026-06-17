Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF1BCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 03:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKMvxmzWdS3ilWkE9VoEtw0e2IYGWSUEtrr2tn3P3Fk=; b=hz5fcfvYNNI4MH/9t06aqwuHvi
	F7vGFMvXWcRB2J/BlBHwlyl+iBN3CqpSAHRrhgXpZnsDN6NKGa5znXazkKoSW/Jc1mEtSCo23mfgU
	02DNzIBru9T79/NAz9CPPH20f+MoHCbMxdRHqK8204cw7Gh6cR0i68sR2zmIh+SKcBorn7IkY54Aq
	BsKsOCA1WRnu7F+6j2mWNXbHL4NGficLWJdDvX3prYw9rtBqpT+8i64scziWai6JCQD7kZDSVp/6Z
	R8KF8Y8ahqn77Mgs3hVSFY30B/KNammvQXDQhziJ+eOEQ/pyhU0KvRKeMzrD9PgeILqVgbXKNd51B
	8G5k3fkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhBQ-0000000GZNr-34m5;
	Wed, 17 Jun 2026 03:43:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhBN-0000000GZMq-1dYH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 03:43:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf1f074a12so52846865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 20:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781667796; x=1782272596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKMvxmzWdS3ilWkE9VoEtw0e2IYGWSUEtrr2tn3P3Fk=;
        b=geca1lOQInU9HPzLm/uy/v4bzIs1ZbTxed6LwbI3YF0rycmGV/Lqt+1mmSBS3At0jQ
         lqnJWJJaADS2DjwYBVdQ4T/Kyu5A61KKsaaGJ1iwXrCKEgY0vynqhzcH4vtC/kaX9Swo
         xxfWcppH3E9SnjlQeQEMxsCVKfVQUnsfAyL2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781667796; x=1782272596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKMvxmzWdS3ilWkE9VoEtw0e2IYGWSUEtrr2tn3P3Fk=;
        b=qV0qlzRSOI6u471nhVf4Y0I5xr6TpiQJFVxo2k6mtvtjdjem+nZOyKYYkmUUxZWMpv
         bMnISVmN99XHNN1Ch09AhJdKzBujKNHOSa3BcMbn7gPvViKHqf7X8DB9buaUh3ka+S7K
         5iQTchgTwq7X7IGKgiqoobRj2eznkJSU8pcViGB0x5gIPC4+6n8zWoruUO5lHEInf/MW
         xfY00e5DXSosqqHDyUnkAkaSoWYUlk5J5df8OJuIARvp5CzRjxfNmZdNxd7HMiO9OPoe
         Dh+7JL9cI1EGdmjwMFdFjfIuf7RwOHFljh/SP+9BXwI8iPmBgOSkGWE8n4fsnrrLb9TV
         EMrw==
X-Forwarded-Encrypted: i=1; AFNElJ+kdNuF2CZAc2Oy40yrjFJGCdmMWBziIVHQaxxnxvlBazgpWH3yKwmXPyiWBiJcBRrFjTgYXjRl7gGsR62P755W@lists.infradead.org
X-Gm-Message-State: AOJu0YyxOPihqlF003JxeVb0qIexJv9q6UZdoP+1UKSSuS6xp+U8fjg2
	InXHhKGKvcR2uGmgtRM7sju0urGY0Uy3z2wGQRFlvgtz421qSVX2oDtSVDvpV26Ewg==
X-Gm-Gg: AfdE7cmwc5aa5qp++OQrGmqq5A6ceCuErK9pNSYLk/nXkvH1A4nCh0XD/X4QTC7etm5
	dmPs30aJTi8kP86BRL8n6ZOj9aTFR/aSenVp1CsU7DhuqedcVN+HjY7aki8iVmSL7T3f63eKvYJ
	CmJtDtzbKumuA6UvdR1TnfV9hSQi7wdWjehU7mCdTMJjxBioHumA1wqWlwAGPajF/qc4syHrBQn
	gp8kRn9lLZk9h4G/se+SBYVgjXAgcLQJ+oZAKZvBXKab0+OZtTSLesyc6xMKqzago2u+BjviwiK
	KxshIrIpsSnf2jgWP3qnUWY2xJKhaP8c9uywE03qLC7Z8Uoow7gVflCzGBDlHBocFkrpo829GWP
	ve2me3fdxH2vfq0575/vwn5YAsvSlanIzofp11puilHzWjdgAkAdwFHiPRlX6W7YfVpqwvRkwo4
	g5BCA7wWlf/cPyB4fBc2NO2OLaUB2QyUTckX1cRVwAZstpH1Ua6Zw=
X-Received: by 2002:a17:903:3847:b0:2bf:379b:53f4 with SMTP id d9443c01a7336-2c6bc21f206mr19662105ad.19.1781667796535;
        Tue, 16 Jun 2026 20:43:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm31639145ad.64.2026.06.16.20.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 20:43:16 -0700 (PDT)
Date: Wed, 17 Jun 2026 12:43:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Bluetooth: btmtksdio: correct
 btmtksdio_txrx_work() loop timeout check
Message-ID: <ajIXcLmdakMsDEMY@google.com>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
 <20260616111224.152140-2-senozhatsky@chromium.org>
 <CAGp9LzpCMGr2hyVJRMehs_BD4Rk6mS2jAifWuCgBaANdqgtvqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp9LzpCMGr2hyVJRMehs_BD4Rk6mS2jAifWuCgBaANdqgtvqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_204317_487365_B0C5C98D 
X-CRM114-Status: GOOD (  23.64  )
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

On (26/06/16 19:40), Sean Wang wrote:
> > The btmtksdio_txrx_work() loop is expected to be terminated if running
> > for longer than 5*HZ.  However the timeout check is reversed:
> > time_is_before_jiffies(old_jiffies + 5*HZ) evaluates to true when
> > old_jiffies + 5*HZ is in the past i.e. when a timeout has occurred.
> > Using OR with time_is_before_jiffies(txrx_timeout) means that:
> > - before the 5-second timeout: the condition is `int_status || false`,
> >   so it loops as long as there are pending interrupts.
> > - after the 5-second timeout: the condition becomes `int_status || true`,
> >   which is always true.
> >
> > Fix loop termination condition to actually enforce a 5*HZ timeout.
> >
> > Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  drivers/bluetooth/btmtksdio.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> > index 5b0fab7b89b5..c6f80c419e90 100644
> > --- a/drivers/bluetooth/btmtksdio.c
> > +++ b/drivers/bluetooth/btmtksdio.c
> > @@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
> >                         if (btmtksdio_rx_packet(bdev, rx_size) < 0)
> >                                 bdev->hdev->stat.err_rx++;
> >                 }
> > -       } while (int_status || time_is_before_jiffies(txrx_timeout));
> > +       } while (int_status && time_is_after_jiffies(txrx_timeout));
> >
> 
> This patch has already been merged, so I think the series should be
> respun based on the latest code.

Oh, I see.  Any chance it can be dropped from the tree or updated?
The patch is identical it's the commit message that has changed.
Otherwise, I can drop it from a v3 re-spin.

