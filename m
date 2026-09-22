Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BBDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=; b=Gvb6Zbyi/8782f/cv5sb1BS4+a
	64MPeIiszAA2nRvmXXrm+M6Zbyscg4HL03OvBhh9SawYItM6znZ+snDFfW/fxqJGe3jGWlkHF7+C+
	I1P+ruqZftzjYemXWyDOGa8foEFbEq0e38ifwRkho3Y8azYXp2U+Hz0feCMr//KMmZrGnKVnEeYhP
	UW9dfhYLfgs7TAOxs0Xy4PAWe3/+sbM98qHH6wEHMW1tXVYcY1+S3OrGtoLZpjSvEzKkADGfBAMN6
	cX2/E0wIosKErcAUKDCyuLaKKAJgb0u/7/4yeEfO1QEnkGCbl/J6U2Mr22E5F8lOLXCRY8UAFRZo3
	z4pdVM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w0-00000005yUE-1ZjQ;
	Tue, 22 Sep 2026 16:01:32 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92vy-00000005yTs-1WEa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:31 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so3856899e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790092888; x=1790697688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=;
        b=Ry2OkSLGd3WWe6vnyNWFuDEkWC25lUXtqHPl1xIM2SSIl5kwxX2a1tB24A83BLSvgJ
         9fArjZG32rvfuNn/7Li6w6XxmDTQ5go2Fxtum67j+XXejwN3LB1eQON2A2nBrhfbVeJf
         UyKtt8Yq0zLo3DYsax9K25VYycNnwxfeH1uP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092888; x=1790697688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=;
        b=AdTYfIdGkFt92jLobvMTJoX3IYbKTGShE3LQTaJ0WBsPppWtTThBnMkiAqYd5cIHPh
         PyrSXAZsTWjnrv2TDvEeqBAJmSSQq+iuGvaIEmu5RSQTSKML2kg5gV3DMc8PH+5nnf+1
         3yCOaqfm9shX+XXWGlXu7SNT1McKYzhTNIVHXtOfcbfuPsPFhEeyupls/jy9QllSFyyY
         6PDrJUl+wp1+NBVq+kMqJcsBbS3CpIDWeYWxNCk88gS4tN2VO3VAjEFMRSXCWSu4Jzyp
         lmymnDJITh6VyU1qgcDEo6FsE5pzxtJwPikTkkxpkAS8mVwsTaaBajXsN3Dsl6LCM50X
         epgA==
X-Forwarded-Encrypted: i=1; AKwUvByPQfS3IiW58/wLOIZWBQBTSWNMA8hkOPFqxOwM++JKpl/8MEw4czHdXKeviJDr2vOkMqlfylKJKGUR89uTwNes@lists.infradead.org
X-Gm-Message-State: AFuF++kdOqShfq1GuiuksAY3cEmddenv//6ev2u4nCYrSS1mNbPAIPAN
	4aLG5pT3zrovwX1MvkqxVvRdm/bLNG7zyz3wb2OV+Q/XqOB8Kj15HIOlKD3hhXZXluS0CjjKL/F
	ILtY=
X-Gm-Gg: AYBFou2EdPXOTv0Bza4tCyoO+24bkbkKvMhJKzcZtRpOIF0YzlSeAH90YbhZ5MAdeIg
	evXZa+djNlC2SkT1SKQvGcHLQqoaYwk/wQvBRSsMhMp+rt04FoRXH+XzMqbwOSoK8M4qhsGfu3F
	bw1dqsoGJDHCnjEnDKvrZssM4s+9BqsA4IkljMhj1oDBCPC9M3jBKPRCII7UT466+p0cDBMLTp/
	FnUu51U5fXJvnp2XMlj2+MGMVuCrEJLJRifY0ZxSRlo/TnqJ+fBBaH+KOZr0JRbmWEs/DTJ3iuF
	7tyHoTg6TxsuN1g3HHVZsyV3ZJ5+anjhB8g9Rvn6GZgPLVSpsW7eihpM+RT3hxaW0iDHJFfAxcl
	eRYBCkXYSGzA4sp5Ch+ekKULGZgCK3sby50qsx2//MWWDZzCS0/Sj5QjQie0QPqMx5LX8htXQmv
	zAnuQ9d9iZO/nJ9zzFSUGoQiMpywfvkFWJ0yngutkTRdklzyEvOTH7STutKL9vPVLZXJsrHG+EG
	/PrUmiFEAR84u61cC/156+lFpMGf/hPnllfdNw=
X-Received: by 2002:a05:6512:2511:b0:5b8:bc5e:b589 with SMTP id 2adb3069b0e04-5b8c19660a9mr4504483e87.65.1790092887808;
        Tue, 22 Sep 2026 09:01:27 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d85788f6sm4131e87.20.2026.09.22.09.01.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:26 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso3135530e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGu0nfdrQAOLhMIjeNA6zaaX16iw8G5R/OYVr+9BWYc5Fs8adoPkTFKD1PYHuCwgOcSjwzzQ1D1dUco7/R6W6q@lists.infradead.org
X-Received: by 2002:a05:6512:33c6:b0:5b8:bc5e:b577 with SMTP id
 2adb3069b0e04-5b8c18524cfmr4607284e87.47.1790092884382; Tue, 22 Sep 2026
 09:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com> <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
In-Reply-To: <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Sep 2026 09:01:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
X-Gm-Features: AclHuK9ya1QMn_ceGlLKarlnG-Ztmeo8rReIvHR5PtOBYGFh5F04B9XoOov-3rs
Message-ID: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090130_495436_1EF9EA33 
X-CRM114-Status: GOOD (  48.97  )
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

Hi,

On Mon, Sep 21, 2026 at 5:11=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> > > If you do have some real numbers and think it is worth it on your
> > > platform, then maybe expose each doorbell/shm-slot as a generic
> > > channel. clk_mailbox will request a generic channel, do the request
> > > and free it. The same effect but without inventing a new api. I can
> > > share a draft if you want, but I suggest let's not make things
> > > complicated without proven benefit.
> >
> > FWIW, the downstream code in Pixel does what I think you're
> > suggesting. I can confidently say that, while it doesn't require
> > changes to the mailbox core, it is much more convoluted and
> > complicated. It also bleeds into the device-tree representation, which
> > doesn't feel great.
> >
> > Just to be concrete, I'll document how the downstream driver works. If
> > this isn't what you were thinking, please correct me.
> >
> > Back to our simplified "clk_mailbox" driver. We'll say that our
> > "clk_mailbox" driver talks over a single mailbox to the remote
> > processor. Let's say each message is 4 words big. The message space is
> > 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> > queue slots. Downstream represents each of these queue slots as a
> > generic channel. That means that, in the device tree, our
> > "clk_mailbox" driver looks looks like this:
> >
> > mboxes =3D <&cpm_tx_mba 0>,
> >          <&cpm_tx_mba 1>,
> >          <&cpm_tx_mba 2>,
> >          <&cpm_tx_mba 3>,
> >          <&cpm_tx_mba 4>,
> >          <&cpm_tx_mba 5>,
> >          <&cpm_tx_mba 6>,
> >          <&cpm_tx_mba 7>;
> >
> > Then the "clk_mailbox" driver is in charge of rotating through each of
> > the channels. First it writes to channel 0, then it writes to channel
> > 1, etc. This works with no changes to the core, but...
> >
> I was thinking something like   mboxes =3D <&cpm_tx_mba>
> clk_mailbox simply asks for some channel, gets allocated the next free
> slot. The mailbox controller driver keeps track of the channel-slot
> map locally and is responsible for managing contiguous slots and
> completing the tx upon receiving ack.

Hmmm. OK, so I guess you're saying that every time "clk_mailbox" wants
to send a message, it calls mbox_request_channel(). It always requests
the same channel over and over again, but underneath the mailbox's
fw_xlate() function returns the next distinct channel? Then once
"clk_mailbox" sees the tx_done then it calls mbox_free_channel()? I
guess it would need to fork the mbox_free_channel() into a delayed
work function since mbox_free_channel() requires grabbing a mutex and
tx_done() is called from atomic context. It would be up to
"clk_mailbox" to ensure that it used the interface properly: always
send the message on the next allocated mailbox, always free the
channels in order, etc. Also, "clk_mailbox" would still need to
implement its own queue to handle the case where there were no more
free channels.

One thing that is important is that "clk_mailbox" needs to know when
"tx_done". If we didn't need that, everything would be vastly simpler:
just allocate the channel, send the message, and free it right away.

Did I understand your suggestion correctly this time, or am I still
not getting it?

Assuming I understood correctly, my thoughts would be:
1. At least this doesn't bleed into the device tree, which is great.
2. I'm a little worried about all the overhead involved in constantly
requesting / freeing channels. Maybe it's not as bad as I fear, but
those functions don't seem intended for constant calls. Even if the
overhead isn't that bad, the extra overhead needed to fork the free
call to delayed work doesn't seem great.
3. It feels like trying to manage this from "clk_mailbox" is going to
be a bunch of complicated code, including managing our own queue since
we still can't use the mailbox core's queue.

Overall, it feels like an bunch of awkward code. It feels like a hack
that a downstream kernel module would do simply because they didn't
want to improve the mailbox core...


> > I'm also a little confused about the resistance. I don't feel like the
> > mailbox core change is that complicated. The diffstat shows 58
> > insertions and 17 deletions. 14 of those added lines are comments.
> > While we certainly don't want to add useless APIs, to me this truly
> > seems like the correct way to add the functionality. It also doesn't
> > seem absurd to me that some future mailbox controller out there will
> > also support queuing like this.
> >
> It is not the diff stat but about inserting a flag in the api to
> introduce special case behavior. It is like adding one person to the
> party introduces N-1 handshakes -

Sure, it's new core code for a single client. ...but some client has
to be the first. The idea of a mailbox controller being able to queue
data doesn't feel like an absurd feature that nobody would ever need
again. Heck, once the core supports the feature it seems like someone
out there will figure out how to make their existing hardware work in
"queue-mode" and improve its performance.


> the has_queue flag doesn't play well
> with other configurations and may allow future platforms to abuse
> has_queue to implement hacks.

I don't really understand this part. Can you give any examples? How
does "has_queue" not play well with other configurations? You mean the
fact that my code right now only works with "MBOX_TXDONE_BY_IRQ"? I
don't think relaxing that would be very hard. ...and sure, people will
implement hacks no matter what API you give them (the "allocate a new
channel for each message" might qualify as one such hack?), but it
doesn't feel like "has_queue" is especially prone to abuse, is it?

-Doug

