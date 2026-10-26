Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2057C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y089bZpJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=keqo1ezq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=; b=y089bZpJ0sR4rs
	w4is7R46P3w6i8WqVwqaX4nc6h4HWRUqcl6YZSm/P7QfxGPP2QLjTncCDfY0VqoGan+ifYiT23QOP
	NAEZsABwiP/NJaAdx8cSbV7DHrSB4m1P4DsNQvs1KxGhkYJld8eRHzF30M11VUD875UfOU+pB/EA3
	IlKbR5Y9SCEpBOVpodAm3qE5VUBEGhjfn2/XxUoN22yk96spyxoNPMpkqqXoHrP4NCC2HZFMXxLyj
	jG8MlcHk5JaG4tpsRuGdMBAuTkVF9CcWOgrbnIQ4+Qgkrr8WxQz9adPhZOUOOWGcs0MoRMNS06WaN
	fiH7jicgu2AOPb5EfeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLODM-00000002xgK-42Vc;
	Mon, 26 Oct 2026 17:10:28 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLODJ-00000002xft-2Df4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 17:10:27 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so96493e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 10:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793034624; cv=none;
        d=google.com; s=arc-20260327;
        b=IWY+zG+7ekkAynRQCFKTCS5sOom0DjKcEsTsinVIxjy8PEH3AP+cEoihocTg3f6QAT
         h06akll1hVZ18yf3uTzeXFjJdHK3udICtaeuhFwep8BEfrMNkCj90ZmU+Cs6vZ5O8MUT
         1JtaXh8ZI9o1fF/LOgezQYpDMWNWMj4WuGHiZnKJlnyK++e38C8nz7quawLN1KJOyWjN
         9ucSj2lkrs9uBe6qOEVN1Ati2U6TEL9UI2spOgRy0PKJxG3LrGL02Qn3KupFYwwoehFL
         T1XNGM6lItt3on2eTp+GHaP2MwbY8E+T/Kk/fmfTW7p4MO526dq+8h2HvXJAnn75dGAf
         +S3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
        fh=2Q5xMHEXnKtpIkxJTpJjABrrbaYoErnmZrEi/2uQ6NY=;
        b=MoaFsqgkL47RjA1NtjpGOwVAZ1LwBwImDiboZIVGser7Cs4LF6ou6eARkk3qHplM58
         VMKvVdef2BdSml/qqIruZZgwWDIACQadJqD5ZQhV65fdxfHtxFznmGOcZ3uqIzTXTtcl
         hFaefkz2MWMCwfMwMyCgDM/JygEkWQJYFmZiwxKVAjEQDud1/TNManvbWlvwLBfu6ioj
         o7UfJx6vjHD7XLLyqEmyNZ/LZ7D85kPLMtP+hiBdkZS9H4mewJYNy3DOAwT7ooD2Rq/2
         Z9IRQ9ctMysXzuTn1x7FaDAyUO4BA1OUAbxWJPZIEleH1LxcoxvppfdXEtMVUGYKxedK
         UGyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793034624; x=1793639424; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
        b=keqo1ezqNtjTz5sPlVN/IwnHb4cBp2UUkKSvibmMT9gd3kFrZUFJ6ApegUT0u8R0pF
         32yia6akiLIdLmszuF6b2srBawmjXBPOhEjY72iExF46jatKj6FdXABKFzJ4WhR7wDna
         PVvEzLm8k8komuLPW/9gxHNy1lb0elIkFmoQtqTVqEm95wRVrEcOUg+eIyZ32d/ETUox
         RAYpw3zfHNp9lfQmG8nBouJdiSZn1vgk85fZHy2j2J0+UglqeJtvrERNcjcScpRdJoUT
         yhQyQK3qlZx8M+tJMMxjAddkRlMUEVuJ0MAosbruRwoRymCllY1oOAcvZ+9XNJ+8L4yn
         HZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034624; x=1793639424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
        b=kw60RtnwX11Ivk9o4JE3hZCJFtBhdtMUmFqsDMFZ1oX0Pd7UuV7HlEKTw3aYhMXhM+
         MhBu28yHxGIyhxaeh1s/+yMAJKkGfDDSMrgusXT1w3lh0bdkrNQfFTxN8CQSVBHSQ96A
         IohxvAUsNHf5HgWkkSZHwVwV2PEFMlYC4QBOTptSNMR/IE3spWvS/fiWtucQCQVBZbtB
         NRAjhhzS96H+8RxG3hZfDVGzK8IR4arqPGKHw/1QgPOCCAaufRZXyC8RE5fgYZfS0Ecm
         tl6xdoIswjKPJ0UPy2/T/yl0MdHKW2ri6WXcgmX+fqx4sdYVOw/K4vy/NlZITjnFtZjX
         f6yw==
X-Forwarded-Encrypted: i=1; AKwUvBxg1JNOlHeP/cIzRe5ArQcugB2QRhyWosfyMC/VZ66Jyxp95mDOuUjIkw9LlzsqVMH6lIgB8ZgRiCoKh4njcfSA@lists.infradead.org
X-Gm-Message-State: AFq9FYKrKfZpaKc6R9+Ljp3YCQlgPvVKT9lmtyNNNqC8dg4Y3nV2qgbb
	80ps7v0fVQQPn4Z0ioBjCm/5QpFeRNjjKVUB6dEBTfLC6q5gcOnNIU2YKHmcwfuT1Dv8Nob2pfe
	AwsZzG3Bz6lP4ZsYdYuYeE03SIVKeXYA=
X-Gm-Gg: AYBFou27/CwE8UXAVEt5GpUQgztXwnDM+HdfUju1p73KKlZHPfoP4ihas24pwAhoWgg
	p5msar/rJ9J8MaLj3IeJpkghD43562VwmHttBZ4006bqfAb6NCvIMDOYGeOUXtLrDYG7/7smIlD
	1wU1o/km+X0Z2rOn7804ooAzvyLbyBWyi3642UCrJCMxSVI2Tq5rGI9PhOaVXlHQzLNX5G7vP3s
	MuZRtuJEYb+gzS4PiCLk1Yi4vaq5FNrB821zrgutn9SLTjSPVUD6e+8avnu0v/f1DP1d5zJkzvN
	Bvfj7+jSU3Zlf8dPfuFvHmbUwQubK4H3QijQHCkV7bBSbFSE6fys4nJKscHyNtD1iG84VS4uBKI
	zn6YHp3BFM+PeawBzAfPS/d/MGBlp6VY7Dwjucx0iZll5fpl1NA/AuH24yAc9FhXtSfT3tU8AnW
	BpBYVV+gQpiYc3B7Sqp0PYhbjnk3fM2rLc02AZnrEZ2gRA/rTUR7yAV74YIsmwccecfauh7ZsHj
	29QRaDZhwiRtR5MZ+GFUqNI0ns85Tg=
X-Received: by 2002:a05:6122:50e:b0:5e9:441a:d5f8 with SMTP id
 71dfb90a1353d-5ec3e8e04admr159689e0c.1.1793034623801; Mon, 26 Oct 2026
 10:10:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
 <a011174b-d64c-305b-7dab-62017fc885fa@linux.intel.com> <CAHQZ30AfcwMTXPpCgiWkhz1OFoxHJOqcVmur8Buz72M45Acuag@mail.gmail.com>
In-Reply-To: <CAHQZ30AfcwMTXPpCgiWkhz1OFoxHJOqcVmur8Buz72M45Acuag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 11:10:12 -0600
X-Gm-Features: AclHuK8g6EMHpoadOv3TJAD667Nte-zf1vnBPpYx8rpkF-Kg_pkoFpFDJdWRf6E
Message-ID: <CADvTj4okFSpw7Wo0e3DR4r4-1TDvOY1esoUDWftY27B7XwWAHA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] serial: 8250: serialize DMA cancellation with
 buffer reuse
To: Raul Rangel <rrangel@chromium.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_101025_653923_0FF2E802 
X-CRM114-Status: GOOD (  33.70  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 10:24=E2=80=AFAM Raul Rangel <rrangel@chromium.org>=
 wrote:
>
> On Mon, Oct 26, 2026 at 5:16=E2=80=AFAM Ilpo J=C3=A4rvinen <ilpo.jarvinen=
@linux.intel.com> wrote:
>>
>> On Sat, 24 Oct 2026, James Hilliard wrote:
>>
>> > Reserve canceled transmit and receive storage until DMA and its comple=
tion
>> > callbacks have retired. Serial-core write backpressure protects a flus=
hed
>> > TX FIFO while normal transfers continue to DMA directly from that FIFO=
.
>> >
>> > The series separates OMAP's locked completion processing and serialize=
s
>> > asynchronous write wakeups with the port lock before adding the serial=
-core
>> > reservation helpers and applying them to 8250 TX. Flushing
>> > empties the logical queue immediately. While the old transfer owns its
>> > storage, write_room() reports zero and write-ready notifications wait =
for
>> > retirement. Failed termination retains the reservation until normal
>> > completion, without advancing the reset FIFO. DMA retirement releases =
the
>> > reservation independently of port readiness. Serial core keeps writes =
and
>> > wakeups gated during shutdown until successful startup or resume.
>> >
>> > RX delivers paused data before the PIO fallback and retires callbacks =
in
>> > process context. Track FIFO access separately from buffer retirement s=
o
>> > PIO and the DesignWare empty-FIFO timeout handling can run once DMA ha=
s
>> > released the FIFO. On failure, retain the requested interrupt enables =
in
>> > the existing IER shadow and mask receive interrupts in hardware until =
DMA
>> > has stopped. Recovery then leaves RX on PIO until reopen. Shutdown exc=
ludes
>> > new retirement work before releasing the channels.
>> >
>> > Based on tty-next with the posted shutdown guard [0], channel
>> > configuration error handling [1], RX TTY accounting fix [2], RZ/N1
>> > transfer-length fix [3], transmit-PM shutdown fix [4], serport
>> > write-wakeup deferral [5], DesignWare BUSY-safe fractional-divisor
>> > programming [6], and Intel MID RX DMA timeout locking [7]. The serport=
 fix
>> > is needed before serializing the remaining write-wakeup callers with t=
he
>> > port lock.
>> >
>> > [0] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-shutdown=
-v1-v1-1-3d3ce383c614@gmail.com
>> > [1] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-config-e=
rrors-v1-v1-1-c067587d1ef2@gmail.com
>> > [2] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-rx-accou=
nting-v1-v1-1-c11795914ab4@gmail.com
>> > [3] https://lore.kernel.org/r/20261023-submit-serial-8250-dma-tx-lengt=
h-v1-v2-1-c3106ef4d2df@gmail.com
>> > [4] https://lore.kernel.org/r/20261022-submit-serial-8250-tx-pm-shutdo=
wn-v1-v1-1-0e894afa3bb8@gmail.com
>> > [5] https://lore.kernel.org/r/20261023-submit-serport-write-wakeup-v1-=
v1-1-74e7311638a2@gmail.com
>> > [6] https://lore.kernel.org/r/20261024-submit-serial-8250-dw-divisor-v=
1-v2-1-032ca5338359@gmail.com
>> > [7] https://lore.kernel.org/r/20261024-submit-serial-8250-mid-rx-lock-=
v1-v1-1-2b9afdf869d7@gmail.com
>> >
>> > Assisted-by: Codex:gpt-6-astra
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> > ---
>> > Changes in v6:
>>
>> Hi,
>
>
>>
>>
>>
>> This series is moving way too fast with new versions. Please slow down.
>
>
> +1. I think you should have spent more time refining your patch set befor=
e submission, or sending individual patches that weren't interelated.

I was doing as much validation as I could locally already but often I
was missing
issues the Sashiko review bot was flagging. Since the Sashkio reviews appea=
red
to be release issues I was doing respins to try and fix all those issues.

Apparently not everyone is seeing those reviews posted despite them showing
up fine in lore for me.[0]

Is everyone here seeing those reviews or are they not showing up?

[0] https://lore.kernel.org/all/CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCH=
NPo3pS6w@mail.gmail.com/

>
>>
>>
>> We're not aiming to who manages to produce highest version counter for a
>> series. ;-)
>>
>> You're making non-trivial changes so please do expect human review to
>> take time. Cranking new versions almost back to back (or even every othe=
r
>> day) will just fill up inboxes.
>>
>> --
>>  i.
>>
>>
>> > - Use v2 of the DesignWare BUSY-safe fractional-divisor prerequisite.
>> > - Serialize CLPS711x TX servicing and interrupt-enable state with the
>> >   port lock. Use non-waiting IRQ disable in stop_tx(), skip queued TX
>> >   interrupts after stopping, and drain the handler outside the lock
>> >   during shutdown.
>> > - Make the Atmel RX/TX tasklets and SB1250 termios locking IRQ-safe
>> >   alongside their interrupt-handler locking, preserving the caller's
>> >   interrupt state when releasing the port lock.
>> > - Report RX DMA recovery after releasing the port lock, keeping the
>> >   state changes and interrupt-enable restoration serialized.
>> > - Link to v5: https://patch.msgid.link/20261024-submit-serial-8250-dma=
-cancel-v1-v5-0-9e52968928d2@gmail.com
>> >
>> > Changes in v5:
>> > - Add the posted serport write-wakeup deferral as a prerequisite for t=
he
>> >   caller-locking preparation.
>> > - Add a preparatory patch serializing asynchronous write-wakeup caller=
s
>> >   with the port lock, including indirect CTS and transmit-helper calls=
.
>> >   Keep sleeping register accesses outside the lock and defer SCCNXP
>> >   notifications until its controller lock is released.
>> > - Use the separately posted DesignWare BUSY-safe fractional-divisor fi=
x
>> >   and Intel MID RX DMA timeout locking fix as prerequisites, leaving f=
ive
>> >   patches in this series.
>> > - Separate serial-core write readiness from DMA storage reservations. =
Record
>> >   retirement during startup and shutdown while keeping writes and wake=
ups
>> >   gated until the port is ready.
>> > - Wake deferred writers after successful startup or resume, including =
when
>> >   reopening with a retained FIFO, and restart any retained queued outp=
ut.
>> > - Keep the write-ready notification pending while retained output is a=
t or
>> >   above the normal wakeup threshold, until TX completion drains it.
>> > - Publish resume readiness under the TX restart lock without releasing=
 a
>> >   reservation that may belong to a newly flushed transfer.
>> > - Release 8250's TX reservation after shutdown has stopped DMA and unm=
apped
>> >   the source; serial core retains control of write readiness.
>> > - Link to v4: https://patch.msgid.link/20261023-submit-serial-8250-dma=
-cancel-v1-v4-0-e759de1839de@gmail.com
>> >
>> > Changes in v4:
>> > - Retain flushed TX reservations through shutdown and failed resume. R=
elease
>> >   them after successful resume, or when allocating a new FIFO on reope=
n,
>> >   so retirement cannot wake writers into a closing port.
>> > - Treat RX flush as complete once the channel is inactive, and clear t=
he
>> >   shutdown guard before startup configures the UART and tests interrup=
ts.
>> > - Check completion after a failed pause so a transfer that finished be=
fore
>> >   its callback acquired the port lock is delivered and retired normall=
y.
>> > - Keep DesignWare's BUSY-safe divisor setter after fractional-divisor
>> >   discovery, writing DLF and DLL/DLH only after confirming DLAB.
>> > - Link to v3: https://patch.msgid.link/20261023-submit-serial-8250-dma=
-cancel-v1-v3-0-d78f9e4c4932@gmail.com
>> >
>> > Changes in v3:
>> > - Defer write-ready wakeups while flushed TX storage is reserved, and
>> >   serialize the flush wakeup with the reservation under the port lock.
>> > - Suppress ordinary TX starts during the reservation while preserving
>> >   high-priority flow-control characters, which use separate storage.
>> > - Separate RX FIFO access from callback retirement, allowing PIO and t=
he
>> >   DesignWare empty-FIFO timeout workaround after a successful pause an=
d
>> >   termination while keeping the receive buffer reserved.
>> > - Use the existing IER shadow for requested enables and a shared regis=
ter
>> >   writer to keep receive interrupts masked throughout DMA error recove=
ry,
>> >   including termios, RS485, modem-status and overrun-backoff updates.
>> > - Preserve the timeout-enable bit across stop_rx(), exclude late shutd=
own
>> >   interrupts from PIO, and avoid FIFO resets during RX DMA recovery.
>> > - Preserve the completion-path LSR read after stop_rx(), while gating =
DMA
>> >   resubmission on the receive interrupt enable.
>> > - Pack the cancellation flags after moving all their accesses under th=
e
>> >   port lock, including the recovery worker's snapshot and initializati=
on.
>> > - Apply the early-return, shared-helper and line-wrapping cleanups.
>> > - Link to v2: https://patch.msgid.link/20261022-submit-serial-8250-dma=
-cancel-v1-v2-0-088ea51e3891@gmail.com
>> >
>> > Changes in v2:
>> > - Add serial-core helpers to reserve flushed transmit storage until DM=
A
>> >   retirement. Apply write backpressure during that interval and keep n=
ormal
>> >   TX using the FIFO directly, replacing the private transmit buffer in=
 v1.
>> > - Document the flush callback's reservation, writer backpressure and
>> >   retirement requirements, including release before shutdown returns.
>> > - Split the OMAP completion refactor into a preparatory patch and move
>> >   the RZ/N1 preparation-order and shutdown PM fixes to independent
>> >   submissions, keeping four patches in this series.
>> > - Take runtime PM references around worker UART accesses, and leave no=
rmal
>> >   RX retirement to release ownership without reading LSR or restarting=
 DMA.
>> > - Synchronize the queued TX ranges before preparing the descriptor and
>> >   return the mapping to CPU ownership before releasing the reservation=
.
>> > - Keep the TX transfer length separate from FIFO cancellation, so a fa=
iled
>> >   termination can account completion without advancing the reset FIFO.
>> > - Exclude late RX flush work during shutdown, including Intel MID DMA
>> >   timeout interrupts which are independent of UART_IER.
>> > - Accept DMA_IN_PROGRESS after successful pause, and recover from fail=
ed
>> >   pause, termination or DMA_ERROR before handing the receiver to PIO.
>> > - Preserve stop_rx() and shutdown across recovery, and retain the
>> >   DesignWare empty-FIFO timeout workaround when receiving through PIO.
>> > - Apply the requested guard spacing and container_of() formatting.
>> > - Link to v1: https://patch.msgid.link/20261021-submit-serial-8250-dma=
-cancel-v1-v1-0-efe2b89f2303@gmail.com
>> >
>> > ---
>> > James Hilliard (5):
>> >       serial: 8250_omap: separate locked TX DMA completion processing
>> >       serial: serialize asynchronous write wakeups with the port lock
>> >       serial: core: allow drivers to reserve flushed transmit storage
>> >       serial: 8250: drain canceled TX DMA before reusing its buffer
>> >       serial: 8250: retire canceled RX DMA before reusing the receive =
buffer
>> >
>> >  drivers/tty/serial/21285.c          |   2 +
>> >  drivers/tty/serial/8250/8250.h      |  59 +++++++-
>> >  drivers/tty/serial/8250/8250_core.c |   2 +-
>> >  drivers/tty/serial/8250/8250_dma.c  | 286 +++++++++++++++++++++++++++=
---------
>> >  drivers/tty/serial/8250/8250_dw.c   |  27 +++-
>> >  drivers/tty/serial/8250/8250_omap.c |  38 +++--
>> >  drivers/tty/serial/8250/8250_port.c |  31 ++--
>> >  drivers/tty/serial/atmel_serial.c   |  12 +-
>> >  drivers/tty/serial/clps711x.c       |  23 ++-
>> >  drivers/tty/serial/cpm_uart.c       |   2 +
>> >  drivers/tty/serial/fsl_lpuart.c     |   2 +-
>> >  drivers/tty/serial/jsm/jsm_cls.c    |   3 +-
>> >  drivers/tty/serial/jsm/jsm_neo.c    |   9 +-
>> >  drivers/tty/serial/lantiq.c         |   3 +-
>> >  drivers/tty/serial/ma35d1_serial.c  |   6 +-
>> >  drivers/tty/serial/max3100.c        |   6 +-
>> >  drivers/tty/serial/max310x.c        |   9 +-
>> >  drivers/tty/serial/mux.c            |  13 +-
>> >  drivers/tty/serial/mvebu-uart.c     |   2 +
>> >  drivers/tty/serial/mxs-auart.c      |   2 +
>> >  drivers/tty/serial/sb1250-duart.c   |  14 +-
>> >  drivers/tty/serial/sccnxp.c         |  45 ++++--
>> >  drivers/tty/serial/serial_core.c    | 100 +++++++++++--
>> >  drivers/tty/serial/ucc_uart.c       |   6 +-
>> >  include/linux/serial_core.h         |  18 ++-
>> >  25 files changed, 551 insertions(+), 169 deletions(-)
>> > ---
>> > base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
>> > change-id: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
>> > prerequisite-patch-id: 3604bfaa3a1c214997de1f11162b81a4541af5ab
>> > prerequisite-patch-id: 79dd093ffb35e254e790dffb8887faf51b64f947
>> > prerequisite-patch-id: 80a5061d84c055a64c760268febed179c687b99f
>> > prerequisite-patch-id: 7dbb404baf1f861982cf6a4b755d39cfec548223
>> > prerequisite-patch-id: 40881d81a27b3a1aa45203d171214faaf2197768
>> > prerequisite-patch-id: 4456eb7f800cb5d50a70c898e6d5a452a7f0bca4
>> > prerequisite-patch-id: c3d8ac0d54d1bfe43657964c517cfa4c7fde11af
>> > prerequisite-patch-id: 48659e5ef3f5fb377d0b751f0830c0de4699262c
>> >
>> > Best regards,
>> > --
>> > James Hilliard <james.hilliard1@gmail.com>
>> >
>>
>> --
>>  i.
>>

