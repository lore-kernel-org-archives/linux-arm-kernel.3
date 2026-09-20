Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC06C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LmYPmWKlLU3Nx7bE5RMlXCJrar6BMVIiMrMMVP9sGE=; b=UoPUOJoOrI45OEENgq0HPBubor
	R4M9AwVLAauy+qZZE9pMZ5g8wL7nrO5LUQfBbSTVOm0kKvY7FnrU1T0CfJAg27pAndSCk8nMH4/cB
	bx4ca7+klJnRHXGfqSX53Dds9jCZoTe1efdacBuJNpKGVwB1wXPBJ+LMtRBRKU7J8R4lrszzXL3+V
	pmd+ObEqRjhxP3l4NYWU2EnohdPD/JO8Jy0WflxlJszF8UYGEuuwT20+DxrPtWWpeKBjb+NQVaL3/
	61u+COxs0bQAM3o6QNmQ4z3I/SsnnidegdzZYB142Y2MvqeBFcZTQ/ra0F/tzdi5jYHpUE8w/7SxL
	fBVgUiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PGV-00000000Tls-1l2F;
	Sun, 20 Sep 2026 21:40:03 +0000
Received: from mail-ed2-x29.google.com ([2a00:1450:4864:33::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PGS-00000000Tl7-3GW6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:40:02 +0000
Received: by mail-ed2-x29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso2678455a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789940398; x=1790545198; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+LmYPmWKlLU3Nx7bE5RMlXCJrar6BMVIiMrMMVP9sGE=;
        b=OUHTQbQ/EzxEZs5paMdK7qWW3i1aiSilOxzjtqPcfPnPWhCCdCzCIafQDWevBdHXKK
         p/n9+3Ls9DfzUS9AGoKWi8Z0m9J4+nXC5EJkBrXuO/Uf6dxBalekHl8K2BjJrHtVJ9p8
         qtVO7PRG/U7puEFvUbpJMZM+/UdDARLxNtILY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940398; x=1790545198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LmYPmWKlLU3Nx7bE5RMlXCJrar6BMVIiMrMMVP9sGE=;
        b=1mpvFbNDfZBFJ5Go20nPAaYu8muyOTz6Na+TqDFIrxk6obOM/6TVgBy7OKyvuIVxUu
         uu8EJK4kyb9p2A7G1Y5W3kKGBXxFS5t/lTTB/W7mx7tHj7/9Ih2rDClHOJFxYK+3QYmu
         AlySBmiu5DxUM+22yKDtbR3G1zt7RFop6mv1jNTLHdTSmm5bdar6fRcnFXmjHw2EMCW1
         zhjZ9gCMbSZ2ETeBifj7aCgCFQNWmP3AD+jIekU/iLpoWgLYJmfcE23nUz75upz/GyV1
         tdsN5qTtLjthleW006QTtsx8f/OiUNdlxnoleaSVO27QttnRF791E0lTRsGQ3BUMbYGS
         iUHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt7BM72DaaZKt05wKx0s9BrPS3I8U5jeUDLw4E26DdzHTi7Ti2E6f0BnkNttmsnzFdMYc2QuiQZFRq8UPLNUwp@lists.infradead.org
X-Gm-Message-State: AFuF++nwsw3iaZ7Qj8QVzOrkttHRgkEdnz6qhb2pihlFyue3nxvqkqUE
	Qci2DezNejryz/h6uHXiR9MEuleC6795Vz+wlEUfv/zE6yZwCdxjRdfZw/YGzvOFCcxlbxIQtOf
	F8Ys=
X-Gm-Gg: AYBFou2DPBKjSkeEvlryWOOSzJQ6q111KR2wHvPM145Ad29+XxsHkmQrqt6jodkb91C
	gOiLCVWBWo0bi/NXqWNeHUB08SllgszNSyWxPqln1cME4FXfrbeY8Fmtdt5MgK7MdJJfNYR8Kb4
	8swAiCBtrweZIhKHyUuBGvUuwMeZeurm1eHnG83+a3LYFv9YAdlxK3tCcRpEN+HKe2Ds+Lc4EDT
	dwRsvtNxV98Sxf1r15t1ax3BiaFdYeCr6qP1MiYjCgwe5kFYDkLgNGVHlnkEZDskvCzQgje1R3D
	uPyj8o6j3W/ACE7lIiZz3xk5tiky/bWQSTY1M3qA1LWez5Tf5HapX5/TjF+w04puH6GSebaG+Tk
	8mNUN2ESoe6KBobSfE9Wsp2t0E5SXJh/Iljh3s2XEJ7KC6Dpyk2448qgUNLcewxRYEnlcvG3tAK
	GvwOkOE6f1Cu2J6lDGJnVktxSE95eswGXFCmR5ozK6L+vjrC2zjXSus5APn0D5/tscOhAZpbnln
	BEZIAlWZHyoUD7HjEkCobyOPFkIj4I42OYv1vQ=
X-Received: by 2002:a05:6402:46c5:b0:6aa:734b:1a24 with SMTP id 4fb4d7f45d1cf-6aa734b1be4mr3151229a12.30.1789940397504;
        Sun, 20 Sep 2026 14:39:57 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dbaf0esm3179862a12.15.2026.09.20.14.39.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:39:56 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so14183665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 14:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIJRRgqxXCtGMrn27ELuwaudjhuFhk0LZsxFZ1IGkJefmIXN9MVlgrnrKwGX5DalJX6+uw2NCcUz7sb0eW4rEi@lists.infradead.org
X-Received: by 2002:a05:600c:190d:b0:49f:bd3c:bc26 with SMTP id
 5b1f17b1804b1-49fc574f069mr123082215e9.33.1789940394146; Sun, 20 Sep 2026
 14:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com> <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
In-Reply-To: <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 20 Sep 2026 14:39:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
X-Gm-Features: AcwNN1UH8b97yz1z04sXG3ndNvqg6dtJI_UWqOQpPbCqwLWaK8N7A5wagZvhlbg
Message-ID: <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260920_144000_910648_FA61BBAD 
X-CRM114-Status: GOOD (  50.19  )
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

On Sun, Sep 20, 2026 at 1:30=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Sat, Sep 19, 2026 at 3:40=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
>
> >
> > Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
> > "clk_spi". The "clk_i2c1" needs to be turned on when we're going to
> > start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for the
> > I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
> > SPI transfer.
> >
> clk_prepare() is allowed to sleep, so any path, that includes the
> call, can not be expected to have low or even deterministic latency.

Sure. Essentially anything using a mailbox as a transport mechanism
needs to be able to sleep, at least if it cares about "txdone". Even
without a guaranteed latency, though, that doesn't mean we shouldn't
try to reduce the latency.


> > In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
> > the clocks. The three clocks are operated independently by their
> > respective users. An I2C or SPI transfer may take place at any time.
> > The I2C and SPI drivers need to know for sure when the clock has
> > finished enabling because as soon as the clk_prepare() calls return
> > they will start transferring.
> >
> > All three clocks are backed by a single clock driver. We'll call it
> > the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
> > to turn on the clock and encodes it as a mailbox message to a remote
> > processor. Let's imagine that the mailbox message looks like a 2-word
> > transfer. The first word contains a 0 or a 1 for enable/disable and
> > the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
> > "clk_i2c2", and 2 for "clk_i3c3".
> >
> > Now, imagine that we want to turn on all three clocks simultaneously.
>
> Why? (not that it can't be done) I2C and SPI clients run independent
> of each other.

Right, the whole "independent" aspect is what I'm talking about. I'm
not saying that we're _trying_ to do all three transfers at once, but
just in the natural state of things there will be lots of clock calls
going on at the system all independently of each other. That means
it's likely there will be times when several clocks are enabled
simultaneously.


> > The "clk_mailbox" driver will see 3 calls to turn on the clocks and it
> > needs to convert those to messages to send the remote processor. It
> > will then call mbox_send_message() to queue those messages with the
> > mailbox controller. In other words, we'll see these three calls happen
> > nearly simultaneously:
> >
> > mbox_send_message(chan, &{0x1, 0x0});
> > mbox_send_message(chan, &{0x1, 0x1});
> > mbox_send_message(chan, &{0x1, 0x2});
> >
> > The LGA mailbox controller knows "txdone". That is, when the remote
> > processor "acks" a message, the LGA mailbox controller can tell (and
> > get an interrupt). This "ack" signals that the clock has finished
> > enabling. This means that the "clk_mailbox" cannot run the state
> > machine and it can't call "txdone" itself.
> >
> > Without my patches, when the above 3 mbox_send_message() calls are
> > made, the first one will go straight to the LGA mailbox controller and
> > the second two will be queued up. Once the "txdone" for the first
> > message arrives, we'll queue the second message. Once the "txdone" for
> > the second message arrives, we'll queue the third message. This means
> > that the messages are not being processed simultaneously. The third
> > clk_prepare() call will be processed much more slowly since it has to
> > wait in line. If we had 10 clocks enabling at the same time, the 10th
> > clock could have a pretty significant wait.
> >
> > With my patches, the LGA mailbox controller is given the second and
> > third message even though the first message isn't done yet. The LGA
> > mailbox controller can queue the second and third messages even though
> > the txdone for the first message hasn't arrived yet. If things are
> > fast enough, all three messages can be queued up before the remote
> > processor has even started processing the first one. The remote
> > processor can process all three messages concurrently and acknowledge
> > all three at once. The LGA mailbox controller can get a single
> > interrupt representing all three "txdone" ACKs and call "txdone" for
> > all three messages simultaneously.
> >
> If your remote (host) can actually act on multiple requests parallely,
> you need a way to map ACKs back onto the requests. Currently you
> don't.
> Looking at the goog_mba_handle_tx_interrupt() implementation, consider
> the situation when 5 requests are submitted in the h/w fifo and 3 are
> reported ACKed by the interrupt after some time.
> You assume the three done are the first three -- which implies that
> the remote handles requests in the order they arrive i.e, serially.
> Otherwise, say, request-1 may be wrongly completed if the ACKs were
> for requests 2, 3 & 4.
> So it seems mostly an illusion of parallelism - remote is acting on
> requests (or atleast sending ACKs) serially.

It's more than an illusion because all of the slow paths are
parallelized. For the remote processor, I believe that turning on a
clock is trivially easy: just set a bit. The slow parts are the
interrupt arriving on the remote processor and the interrupt arriving
on the Linux processor. Those _are_ parallelized. During a single
interrupt, we can see and process multiple mailbox messges (or
multiple mailbox ACKs). I can paste the example I gave earlier. Just
as you say, interrupts are processed and acted on serially. ...but
because we can parallelize the interrupt handling we still get the win
because interrupt latency is much worse than any of the actual work
that needs to be done.

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000010: Client sends msg #2 and mbox controller initiates the xfer
0.000020: Client sends msg #3 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
0.000150: ACK IRQ arrives; mbox controller sends 3 txdone

...so all 3 messages are sent / ACKed in 150us.

Without letting the mailbox controller queue, we'd end up more like this:

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees msg #1, ACKs it.
0.000150: ACK IRQ arrives; mbox controller sends txdone
0.000150: mbox core notes txdone and sends msg #2
0.000200: Remote gets IRQ, sees msg #2, ACKs it.
0.000300: ACK IRQ arrives; mbox controller sends txdone
0.000300: mbox core notes txdone and sends msg #3
0.000350: Remote gets IRQ, sees msg #3, ACKs it.
0.000450: ACK IRQ arrives; mbox controller sends txdone

The numbers here for interrupt latency are made up for my example and
I haven't personally measured them, but I think it's not completely
absurd to say that interrupt latency (on both the Linux and remote
sides) dominates the communication path.

> We can keep the core
> unchanged and the driver much simpler if we simply use the buffering
> in the core.

FWIW, the driver will need to contain the queuing complexity
regardless. This is because the remote processor expects queuing. Even
if we don't queue at the Linux level, the driver still needs to know
if the remote side uses a "queuing protocol." This is because the
remote side expects the shared memory to be partitioned into chunks
and that we must move onto the next chunk between messages.

-Doug

