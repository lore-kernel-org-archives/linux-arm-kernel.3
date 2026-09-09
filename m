Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D6AC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CR/xuPBfJUaIkIrsi5gmAz0JqvQr7Lu6iPE454B+34=; b=rJzoksDSRff81ghVzRZS6bE7O6
	f2y/6dsHx+KQ98xizY+J6hfuFW+uAzyACXdqsG5XnFGljxxKS72bqRAltGf9+gbtt9UDyDfBTmSCi
	UIstNN4QxXBTeYXw+AD3XDsfZnSUUnNgmPajjOt+UbkOzm7Z1rYGcFUamEILpZuzyodeqF8cPJKLV
	qj7Ic0AV/0ixDC1EFpA01PnFB3dXuKkcb1NUoyEQoMZNCX9ifFtn3m56lQP0mWFfDuklff2W51vRJ
	kdGpFd49D8LxZ7ENldQbBBwm6VctvPEYO71V7p/fSrq444ijUlDcr6SS4QbQ1gEk6FHe/P6WPco7m
	pQ2hTwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lbi-0000000CPN3-2b3p;
	Wed, 09 Sep 2026 16:57:10 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lbg-0000000CPMa-1cOc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:57:09 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so3905473e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788973026; x=1789577826; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2CR/xuPBfJUaIkIrsi5gmAz0JqvQr7Lu6iPE454B+34=;
        b=RjqGOALUKKDdw/zFtR+48Iykco3+QDQytJPCHIfi+guXxqdolzysfJcS/KofPt7WIA
         4LLcVAa7dOgqJpsMOwknDatGV2TGLGKoGOOwwmlYUoazJGFRZeIOPIIEa3++PnU5fKdz
         IKEUl8kB0kHRr8vRLuT5qCG8R64PummCS56fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973026; x=1789577826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CR/xuPBfJUaIkIrsi5gmAz0JqvQr7Lu6iPE454B+34=;
        b=gCIIw9FmJl2Ok3BrDdoUOjsFJ9wzsDlN0cW8G7hsCrW/iWa41oiME34segjrZXuJcC
         /m9/nlpVhW4B8zYx8ym1zEsfnboGiu3ZSto6/A1dANikcCCY+YSAXhHCXRaHHg9Hux0K
         UYHu2UJQVdgtFDKdXjntDzuI2IZ6OWdZLG1BBO35lnhW4kmuYuVovSZhezkXrClecr3v
         f7Sf9P7mIfYft1+aeXbd0c9hf+O16s1N8tuZA/8e1bBoaRG7EIgIpL7fNnhs3h6P6IFv
         08zl0me9VoVWp/tdHKshKEpmpyWDSoeiZaOwSWJUXPlOvueBcwnpHQ9RPVv8ScXpXd30
         0www==
X-Forwarded-Encrypted: i=1; AKwUvBzgSTbM2JeJcoeRpJsLn34m3AUKryULKg3eNbMmnt1T5tR1kWRpwkXVG7byggGMXJyjSvonjgKU3tITOkZgpl7Y@lists.infradead.org
X-Gm-Message-State: AFuF++m0RAzmnNk8dtQFTpNGEtZJYJgHyIFomchxEWqdexmjxoGLhj3l
	1a5S0a9J+OqKeAek58yHGc3MPY+YGbWZwIDOs/9+NJIAzya5vo+7AwNZNzbFTySK9c0olHKAo+l
	JxT4z6g==
X-Gm-Gg: AYBFou2T2xGwjgo9pTEBfZzKHh5x3teBlzKxrybeRlC5bft8WjBPmGEeQeMwyexISmP
	y8Dw+6nAztQol/Gd/cVc2GqNtXhlSiXhaIgajH3b8Gl8p55NzHvSbIQR81jdzKi4oXxPD2ErG7E
	QSdweohlwgjB7peuSVDSWFfXb8xROqE1llSJC57aWeMEaeR2MpvxfDgGug0z+Ai40UtywvR0ph3
	rjJrsBpiwvzsxKonaxv1MDwvG1NAoQI3SEAk0H9tp30BHR3Qku/CnhVJ+tUkvEk+swuNTMwB2i0
	wKGZDlWHrwWa33ZEakfnDWYozccAl3zEEEwaIyLAFZPKcVUaYFfr2b6F5Louq07KcI+Vh24kB85
	RSYYXw67OEI4aHIZD8ef+KQb7/Cx39BJHYHZmGFEyK0ELFKndRSMhRcDs+41cl37kRcriXbtL8w
	vvG6++NP0s0zfZUhZhIlCpRGSXE/tW20ES57oOxHMXcTkTO8fmJ0Qmaxhqh/BkXXbmCtLSLmmaR
	XT1ii14ftCkYXjwBGV4qWE/lGlX06jikUL/WA==
X-Received: by 2002:a05:6512:114c:b0:5b6:184c:7d9b with SMTP id 2adb3069b0e04-5b6184c7efbmr5835336e87.36.1788973026229;
        Wed, 09 Sep 2026 09:57:06 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b7500b52bbsm3192105e87.6.2026.09.09.09.57.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 09:57:05 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441fa5c37so4455331f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiSR/SwJMu3/Vtp57QA5Fqg2AoziOPjsXKJe9ITAqyZtEX5thS6d2erp/6ZdHcSOV9e2x0p8nolQt6Y4d3QLZ9@lists.infradead.org
X-Received: by 2002:a05:6000:41d8:b0:485:8a46:b3cd with SMTP id
 ffacd0b85a97d-4858a46b548mr36544508f8f.53.1788973024061; Wed, 09 Sep 2026
 09:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com> <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
In-Reply-To: <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 09:56:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
X-Gm-Features: AcwNN1WrrHTviMXpNF4XGy-eLDipuRr6WDvDf1_K-q05FH7VVpPgr4KG1SIBOUQ
Message-ID: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260909_095708_506682_DE544573 
X-CRM114-Status: GOOD (  35.68  )
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

On Wed, Sep 9, 2026 at 9:34=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> On Wed, Sep 9, 2026 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail=
.com> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@ch=
romium.org> wrote:
> > > ....
> > > > +
> > > > +/**
> > > > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote A=
cked our msg.
> > > > + * @goog_mbox: The mailbox info.
> > > > + */
> > > > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *go=
og_mbox)
> > > > +{
> > > > +       unsigned int reqs_completed;
> > > > +       int i;
> > > > +
> > > > +       /*
> > > > +        * ACK interrupt needs to be cleared before reading CLIENT_=
OUTSTANDING_MSG.
> > > > +        * Then if a "race" happens and another message gets Acked =
after we clear
> > > > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst=
 that will
> > > > +        * happen is we'll get a followup interrupt that will show =
0 reqs_completed.
> > > > +        */
> > > > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT=
_IRQ_STATUS_OFFSET);
> > > > +
> > > > +       if (goog_mbox->queue_mode) {
> > > > +               u32 outstanding_msgs;
> > > > +
> > > > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIEN=
T_OUTSTANDING_MSG);
> > > > +               spin_lock(&goog_mbox->lock);
> > > > +
> > > > +               if (goog_mbox->outstanding_msgs >=3D outstanding_ms=
gs) {
> > > > +                       reqs_completed =3D goog_mbox->outstanding_m=
sgs - outstanding_msgs;
> > > > +               } else {
> > > > +                       /*
> > > > +                        * The hardware's track of outstanding mess=
ages should always
> > > > +                        * be less than or equal to the number of m=
essages we queued.
> > > > +                        * If it thinks there are more messages out=
standing than we
> > > > +                        * queued, something is wrong. Assume nothi=
ng was completed.
> > > > +                        */
> > > > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > > > +                                            "%pOFP: unexpected out=
standing msgs: %u -> %u\n",
> > > > +                                            goog_mbox->np, goog_mb=
ox->outstanding_msgs,
> > > > +                                            outstanding_msgs);
> > > > +                       reqs_completed =3D 0;
> > > > +               }
> > > > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > > > +               spin_unlock(&goog_mbox->lock);
> > > > +
> > > > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_com=
pleted, outstanding_msgs);
> > > > +       } else {
> > > > +               reqs_completed =3D 1;
> > > > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > > > +       }
> > > > +
> > > > +       for (i =3D 0; i < reqs_completed; i++)
> > > > +               mbox_chan_txdone(&goog_mbox->chan, 0);
> > >
> > > The patchset doesn't say much about the clients but if the platform
> > > works like this, I have a strong feeling we can do without introducin=
g
> > > mbox_controller.has_queue.
> > > Just use the msg_data[] ringbuffer -- we can avoid changing the core
> > > internals and you will still get ACK for each message.
> > > What are the clients going to be like?
> >
> > I don't think we can get rid of `mbox_controller.has_queue`.
> > Specifically, the queue mode allows the mailbox controller to handle
> > multiple outstanding transactions simultaneously to reduce latency.
> > Imagine host (Linux) interrupt latency is 100us and we want to send 3
> > mailbox messages. Let's say queuing a mailbox message takes 10us.
> > We'll say that the remote interrupt latency is 50us. Timing would look
> > something like this:
> >
> > 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> > 0.000010: Client sends msg #2 and mbox controller initiates the xfer
> > 0.000020: Client sends msg #3 and mbox controller initiates the xfer
> > 0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
> > 0.000150: ACK IRQ arrives; mbox controller sends 3 txdone
> >
> > ...so all 3 messages are sent / ACKed in 150us.
> >
> > Without letting the mailbox controller queue, we'd end up more like thi=
s:
> >
> > 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> > 0.000050: Remote gets IRQ, sees msg #1, ACKs it.
> > 0.000150: ACK IRQ arrives; mbox controller sends txdone
> > 0.000150: mbox core notes txdone and sends msg #2
> > 0.000200: Remote gets IRQ, sees msg #2, ACKs it.
> > 0.000300: ACK IRQ arrives; mbox controller sends txdone
> > 0.000300: mbox core notes txdone and sends msg #3
> > 0.000350: Remote gets IRQ, sees msg #3, ACKs it.
> > 0.000450: ACK IRQ arrives; mbox controller sends txdone
> >
> I don't mean that ...

Ah, sorry for misunderstanding!

> though even that may be more acceptable to the
> clients than you think. What class of clients are there?

As far as I can tell, the mailbox controller is used for pretty much
everything in the system, so latency is pretty critical. Want a clock
turned on? You gotta send a mailbox message. Want a power domain
turned on? Mailbox message.

I don't think we can just drop the queuing support...


> I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> tx submitted is seen as transferred. You anyway  don't catch
> transmission errors. That way you fill all slots without blocking on
> the first message and achieve this same throughput.
> Without knowing the clients I am not sure if that can't be done.

We need to know the txdone and thus we can't do what you're proposing.
In general, queuing mailboxes are used in cases where the remote side
enables a resource like a clock or power domain. Different tasks in
the system may independently turn on/off these resources, so allowing
them to work "in parallel" makes sense. ...but each task needs to know
for sure when its resource is finished turning on. If we just imagine
3 clocks we want to turn on.

clk_enable(clk_a)
clk_enable(clk_b)
clk_enable(clk_c)

Those 3 calls can be made in 3 different contexts from 3 different
drivers. We want all 3 enables happening in parallel with each other
(not one after another), but each call needs to know when its function
is done.

Does that make sense?

-Doug

