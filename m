Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367D2CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=; b=ZTqHMBkofuXHpF1ZGm/QN/+kNQ
	YmOLCWb9eKSSbq6xF2Sc7drQIKP48VIe3FG4YnwZV2MTi0A3v2y7z+sqAf/zG1BwSiybD31qn+e9X
	4Fzpfqcy2pvkzWGtzZA0WNeceo4V/cKyFI9iRKsOWEC19TPkVQif19s7O1GXepGvnjE1PK4z1wiUx
	axrx38BWkXRMPSWembwLZsoJ8QgxGnV06C/oc/d2FUcGJ1m6CN53pUgj1V4UucOb0vqhqO3DY566f
	Umumo2sKU8o5AX2c6dJty88e6E+uBExMYGS+YTa14DIgKQiS9q4FM+EY3JgW9YpZYlCZBBD6HqHbk
	F/aC6yBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ08-00000001gN6-0Mxd;
	Mon, 28 Sep 2026 21:35:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ04-00000001gLs-3VXA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 21:35:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6aae37d33cbso399971a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 14:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790631301; x=1791236101; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=;
        b=fDW+D5mEQTw/aWC6+pMaIXFmNr/0+Ra10LWkDqNkt+GSronBRGuo9ipi6POR45CV9k
         ZFeiNWWC0nk+vMUaVcACGSccO0rbNVJApgWLbPukv31l6DKlTzB2beEhUYwSlnCMUlKl
         pdJ4Z5tLfu+RLeyOdnJiwIBjHfIp5toAlTwHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631301; x=1791236101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=;
        b=phiel/Z/yKOIN9eaZTXgcRIZcHyt8o7vL1/SRoW4Bxr7zebBng7KX7eq7JYQAUmVcX
         srs6lYBYwimWzdqrTxvQRBEKqE4FEo02ZBC19LU1mgF8zVMuBwK/oa6W+g2dFaqM4W07
         MvxJ6/OlviEdKkIaQ/n57UriWB8OaRfm9rXfMtErXWrC08YBRFzzNOxsUZXN+Az4qXp8
         DYCEIrsdR6ljDgTyYvBIkmZnpxz9gDeQgkWOUfIh1mkrHqR8NB44k/byQK2k7SYnAryc
         X1bZLkZtpDtG+S5AL9EAfX/uOtXgykTmFfcKpLecgIVtA/4RAOEkjKs/a3KtbKPCeFNY
         xWRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEoBTjktob2ESWuq/AWtcxz0etlzJS2Sgn8tAqvwFDwxVKYCKbeXnRyXuM3ee/+G9QIxHhHQdwsO4jFPRR6UHt@lists.infradead.org
X-Gm-Message-State: AFuF++l5NDFMJ0GorDfQUg3astYqMOxKusuBWIY/2SF4YqURbYb5x+s5
	i2SlE1zX+TkX1zmbK39gxmu9R93hFTHdE0pLeqqB0jvTL6eHNLOa0EdRCQphafWTg63gSfOAwBM
	LkxM=
X-Gm-Gg: AYBFou0PiNBrctr/Yi7WWRTrI5oMIjNnfA+2/j783qAfe5JXPck5v+ehxZ6hsdrF1gg
	nN6CoRDciveAnwxarSdFrB0NgPskKQYyMIm2IjKeROQb3m4/0upMCNR2KvrXXp2vNKAjTp5ZDS2
	Nfi4K8jCa6JsfAr0S9RCZ7/wQtXMUbEFliGH9El7OLVPHp8+fDIh9NiBBIexNvhyHo63jxsFpxs
	rEDn9ajXTYxGv8Cjtd+a7EwXq3MLAmLioPGZNJckogQt/lTpi/48gm4pIEb71QOpjSeBFadRmVp
	bkggUeWqe9FWX3LBQDj0wDmLG7o/M+WtsNJUiZe7MLKMGNwyXZ8+WpZX4li7aU/KnhXulhSM6bG
	/3SQdPQ0MYbGiC7xGK9iWG97U7VKQU5SOVVOv57uSN6wuB0+2PHSXTNTlTsziJLN2Eo7G1bqCu6
	3K30jTMfMWYPVdyvcvirP6jb+r6LBVVSkRERwyWQP217nawZyS0mA09Ud3F0rVeZyhYheaEwK2q
	7uIxM7CqjVs9T1qFfFQMfEbe07187Ay0XuMlQ==
X-Received: by 2002:a17:907:9717:b0:c2d:be57:f742 with SMTP id a640c23a62f3a-c2df4dd4144mr37494366b.32.1790631301278;
        Mon, 28 Sep 2026 14:35:01 -0700 (PDT)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com. [74.125.225.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc1034sm4830789a12.15.2026.09.28.14.34.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:34:58 -0700 (PDT)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af0707d41so143595f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 14:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDIB3C9oBNeg/aGA7kwCg76AwLVg1PARqPzNbvc6TP3Xj2+rpNlkAAjMPIkJT17LCFTKDpPeaPAyU2TKO1O9DJ@lists.infradead.org
X-Received: by 2002:a05:6000:1788:b0:486:e60f:a4e3 with SMTP id
 ffacd0b85a97d-48af1a8f107mr814148f8f.1.1790631294826; Mon, 28 Sep 2026
 14:34:54 -0700 (PDT)
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
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com> <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
In-Reply-To: <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 14:34:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
X-Gm-Features: AclHuK-jZYMHfBS5WdwcZpWCPaLhVSXzZ0R6bURtHTy1RcWpghu0fszYS6_LsfU
Message-ID: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_143504_945853_FDC0A179 
X-CRM114-Status: GOOD (  31.80  )
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

On Tue, Sep 22, 2026 at 5:23=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> So I think clk_mailbox can acquire all 8 channels during probe and
> maintain a list of idle channels from which it picks one and uses it
> for an incoming clk_prepare(). If all channels are busy, the
> clk_prepare() will sleep/block on a wait-queue which is nudged by
> tx_done of a transfer after the channel is added back to the idle
> list.

Sorry for the delay in responding. I wanted to prototype the change
and needed time to look at it.

So I think the crux of your current suggestion is that we have a
non-idempotent "fw_xlate" function, right? We call it multiple times
with the same arguments and it returns a different channel each time?
In my prototype, it looked like this:

```C
static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox,
                                      const struct fwnode_reference_args *s=
p)
{
  int i;

  if (sp->nargs)
    return ERR_PTR(-EINVAL);

  for (i =3D 0; i < mbox->num_chans; i++) {
    if (!mbox->chans[i].cl)
      return &mbox->chans[i];
  }

  return ERR_PTR(-EBUSY);
}
```

Then the client loops around and requests the same channel over and
over again until it gets -EBUSY? Like:

```C
for (i =3D 0; i < FIFO_MAX; i++) {
  client
  chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
  if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
    break;
}
fifo_depth =3D i;
```

I _guess_ that works, but it still feels like a bit of a hack to me.
You said you were worried about people abusing the "has_queue" API.
The above feels like it's abusing the "fw_xlate" API, turning it from
something that is normally a "lookup" into an allocator function.

+Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
something that looks right to you?


I researched whether other upstream drivers use of_xlate() /
fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
which appears to be doing something similar. However, upon deeper
digging it seems like "exynos-mailbox" isn't using this dynamic
allocation for any compelling reason. It looks like, really,
"exynos-mailbox" should just be returning one channel. The client
(exynos-acpm) could just use the same channel for everything since:
* It actually gets the _real_ channel ID out of the data.
* It doesn't care about txdone.
* All it does is ring a doorbell and there's no queueing.


In any case, if using fw_xlate() as an allocator is truly the only way
to proceed, I'll finish my prototype and send a v2, but I'm still
skeptical that this is better than just adding queuing into the core.
Speaking of which, I actually want to go back to something you said
earlier. I asked a bit about this but I don't think I saw a response
(sorry if I missed it!):

> It is not the diff stat but about inserting a flag in the api to
> introduce special case behavior. It is like adding one person to the
> party introduces N-1 handshakes - the has_queue flag doesn't play well
> with other configurations and may allow future platforms to abuse
> has_queue to implement hacks.

Can you elaborate more on this?

1. How does "has_queue" not play well with other configurations?
Everything should behave the same if "has_queue" isn't set, right? Are
you saying that it will make the code too hard to understand, or
something?

2. How does this allow future programs to abuse "has_queue"? Won't
they need to submit mailbox controllers to the mailbox subsystem,
meaning they'll have to go through you? If someone is using
"has_queue" to do a hack, can't you just NAK them?


One other thing that my prototype turned up: If I do the "fw_xlate()
as an allocator" solution, I believe I need to change the DT bindings
by adding a "tx-payload-size" attribute, or I need to jump through a
pile of awkward hoops. The reason is that I suddenly need to know the
number of FIFO entries much earlier. The v1 of my patch simply figured
out the "tx-payload-size" based on the first message sent, but now we
need it earlier.

While that's maybe not the end of the world, it's always unfortunate
when we have to change the DT bindings to accommodate the software
design.

-Doug

