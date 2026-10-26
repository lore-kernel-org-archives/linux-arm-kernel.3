Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB2C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08AvfEjT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WECzAvya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=; b=08AvfEjTqjo4hf
	yatmk9kaSXBbJYlyaRaRKjShtzZ6+xnEV5QBAbgNMGSwNmIiRphcZRdLfw9xUEOaZoleVquGkCOmG
	h97NktO2dvvEF7x7WqzPLM7BSwUDZx8BUNvBfZ5/903wkAD4WJL+TN/zFs/A0158tSnru9ViHkDZZ
	M0jUKOS1R8aSEWXC5U+NjWkpGncJC0j/rW2N8X9Kueh7VlSz6tCqGrCrosdj9F2lfWyCUX4DXnHrQ
	lit+7uSDyfu4fbi36Wd2bDiWObhuqJJ5qBe9dnHy0Y1e1CBcyEA0vjmaWJYNTMxOlQS31rc/CRuDE
	894tESCF8rfjuDOnYhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRFq-00000003DQT-4A41;
	Mon, 26 Oct 2026 20:25:15 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRFo-00000003DPm-1De7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:25:13 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-98301b325c4so786308241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046311; cv=none;
        d=google.com; s=arc-20260327;
        b=DN18d1+qFewodKbipdmZD5z5578x7STdnf90T9o5dnGf9S3wuqW2TOK8vommfqb0Ew
         MMgccFVAV3mOSqwO7mvpB+JgBxhGLbWpoV45QNZX8+qar068JtTZjtpz2mTWXyS7jQoy
         WIGtNF6oAJN5jzmeXt5TDhN9FkdQr9FnPjNJeLXoRgO4vFTcyuARGornWHagitnZhVYa
         qP2VT/isTryzGTbinTTnEkti05iBXX866RYVbdQPn7tg1er3v+xtPanj4KSzeQGMjIWZ
         eH834SAO+LHwIQMCAKF7lTSjKc8y3AwNt8CAIJ9sQDyNEXfTJVVqh3nILmKnuP461Yw6
         4a4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        fh=iYFcjqFBed7B0CqtS0YbWIqqKeSqfHOy2c04jOqn83A=;
        b=MOynt2DXX3EWlYK0lfU7Yp/R3SnbCYH16+DEeUw1zrmlJNTQWcg3R4Wlp/UfX6mFYC
         1AI9r/euWcmjfmBgxMwQE+UknRPOt35uO96AXUQARVJM5A4mmfM3tqUn+Rq+XxgPjX7/
         beMoJFOBQLG/NIwwvCCDGEkOxbppXA3h7Qr7xjDz79eEDl5WVYTEFPGkUmR1gw3yrtID
         zCmDSJe23qZAHPi5lHMOOi/lUcwk0DR0wC7gc9PnPpHSCzhaO9M3Kp4OeTI+BjlSLFh5
         WzaOOBzfu7LvkOYwUmL32L66rGRHmqP/bB5asXs+k8DVhnVe02vby3Jhaj3NjUKSCDuj
         vyNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046311; x=1793651111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        b=WECzAvya286/4/Brq6Er/uH7o8BXaFO1H1HkRMt43umJHqc062NeDNTz/5hq301mWH
         79M5EEE0D6l0PtxtUJo7UxqGXsmuQoTCI1Ri8vUjdIeP7TxDlSEn/OctZgbXVADQa0MS
         5JmA1poqvjN97TM9+9iqIMkqU2A7sjecChOK9eiNr6lZ2KlPbVYlsHSWfR2Sx7ioocPh
         af3Lt2rI0hJMjQm2cAIhfsABbG87NYVGykSCWme4N9OlWgWP9M1+Cz3u2AaEdAcquzHl
         6vcWIDXupHwYXlXHWMqP5RVM624krEkAbj78e53FJCEglKC9F6FZtpAov9wZ4kEpbGPw
         dFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046311; x=1793651111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        b=q78Wk0PI0AFaKPI5AijlFR6mgYXEvJMZ/ovt/xSrIKQWg3noPWgl5oYv/mcs9SeYv5
         alvK9RmYNlnwovqHScSyJn2PBC17dMlgB74e7rppYlGY4cUNFEaYNLGPUqCIVM18oKqm
         irJ8kIu/7xRgRC2lK+VhIkzJpNpofYGi1+rUx74dMAGLiZmz4BaZ1NgbMsFddqmIXKUn
         dObtnkQVEDh6+fgzna5tdMEtg7KNOH4RlM9epF5nEGd3JMFTSibq/6qR2RGGfDJRlRA3
         1ZLhGy+d2gxbyXKUVh66m9PH41IoXfZhsPz8UD9k40VQOd5KRbeBLDg5xFZvGVbhCRnd
         hHIw==
X-Forwarded-Encrypted: i=1; AKwUvBzOTUOxz8rrjD6ywsBd/ZrTExR3Fw5Z9eD0K6smrIVlO25ZhDHkCYu7sOyCPSFu485Gt522wPiVSTNO6WKFlzLU@lists.infradead.org
X-Gm-Message-State: AFq9FYIumWF70Szd9vRDmDLZajSkdlLNxA9o5wteoRY1C+Scl3Wh0cS8
	eEXjOLH3GMxSWwvFzm6f7oFxoRgbScjoZt3YorwAEFZUN62o26pstOaiwbKaXaogmB7d9RLEesx
	ULB/PVLHdXIG0GGhMntJlt9DOph2anrI=
X-Gm-Gg: AYBFou2YWrhvExzftZUxxKOK1qHiXRw01wV6hMe2gVhZKGE2YjfNzW6YJBCAHWWS/ac
	GhkD1jLDFbVWJgm3QVdD3iLv31lKozuHQD5wsUoyXZ10Tgh+qCttJ14bzggAfx9of+jWc+cp5D3
	FzaQe3rea9dMjoTrOTpWxgNooekcw+PRK+SU/JmqQMju7vh2p1PBD85RKqBA/O8tQ2Op3POD8hC
	1qRG4GRZfhQMNx8UXKj3HyQ6vPcPsl6oddyMj2UBpg0kRclwDmKIOuEj/3M086W6AdGsVu5y5AJ
	Cvrqayu0iGb9RVc8Ob48zZNWZUtCu5LkyjR8k3s+Px0D09DLkpfHG+6zQikLhPI22+IKjjXsW+1
	b8/fqfaxj6tcqSUjKX9m5hXuhPyoicRElthLyCxzkne9avMjjzGGwPQuDX9iAH6DjCB69tGMjXY
	JLRo8r1QtgaBYki/FXTsRwDRQ913zHJhgiGJRHyaXttqgeFy7PE7DxlOs/hOoyClfpRYMazzUVe
	Z815TXfIB/X5RX5xUZWqi4Cf9vy6w==
X-Received: by 2002:a05:6102:83cb:b0:7c1:6de4:9f67 with SMTP id
 ada2fe7eead31-7ce5ca62390mr2075068137.2.1793046310592; Mon, 26 Oct 2026
 13:25:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh>
In-Reply-To: <2026102631-stove-preview-b534@gregkh>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 14:24:58 -0600
X-Gm-Features: AclHuK-jg_V963WeCj8dDZYyLMETxUQLvBlHikJJBrwQZYN579iKyQfuGLYZuh0
Message-ID: <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_132512_348637_519ACA3A 
X-CRM114-Status: GOOD (  33.24  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrot=
e:
> > >
> > > ...
> > >
> > > > > > > Some people might want to test the stuff. And sending too oft=
en you actually
> > > > > > > will get the opposite results, people will be tired to even s=
tart reviewing
> > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > >
> > > > > > My thought process was that people wouldn't want to be testing =
code that
> > > > > > had known bugs flagged in Sashiko reviews.
> > > > >
> > > > > Sashiko reviews are not visible in my or any other mailbox. To se=
e them I have
> > > > > to go to some URL and so on, meaning to waste time to see why on =
the earth the
> > > > > new version has been sent.
> > > >
> > > > Maybe the Sashiko reviews are getting caught in spam filtering or s=
omething?
> > > > They are showing up for me and on the mailing list[0] so I'm a bit =
confused why
> > > > you aren't seeing them. You shouldn't have to go to the web interfa=
ce[1] to look
> > > > up the reviews.
> > > >
> > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> > > >
> > > > [1] https://sashiko.dev/
> > > >
> > > > > It's better before addressing Sashiko comments,
> > > > > reply to all people involved and to Sashiko's original email, so =
it will be
> > > > > visible in the previous version why you issued (actually about to=
 issue) the
> > > > > next version.
> > > >
> > > > Hmm, maybe it makes sense to enable recipients in the reply_to conf=
ig[2]?
> > >
> > > It's up to the list owners / subsystem maintainers.
> > >
> > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/li=
nux/mailing_lists.toml#L290
> > > >
> > > > > And before even issuing it, wait for a while, people might
> > > > > disagree with Sashiko judgement or your replies on how to address=
 that.
> > > >
> > > > I was assuming everyone was seeing the Sashiko reviews getting post=
ed to
> > > > the mailing list already. The are ending up in lore so unless someo=
ne isn't
> > > > subscribed to the list I'm not sure why they wouldn't be seeing tho=
se reviews
> > > > already.
> > >
> > > I assume you already answered your Q. mailing list in this sense does=
n't mean
> > > recipients. I think it simply goes to the mailing list without forwar=
ding.
> >
> > Do we want those reviews going to recipients as well as the mailing lis=
t?
>
> For serial patches, we decided to only have it go to the submitter and
> the list.

When it goes to the list is it supposed to go to list subscribers as
well or only
to lore?

>
> thanks,
>
> greg k-h

