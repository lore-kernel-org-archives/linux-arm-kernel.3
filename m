Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF682606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RufSrWWg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sv4uUvbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=; b=RufSrWWgAgSTDn
	ayIEFTx1LX0gUTi1/XVdITfsNYSVmW0NC/HxCknOjVTIWm6fibwiYCNiwV8opdM7QFcu5tn2oKQT9
	zswfNnbLkyrxGRRuewRNYBNqMTOqXPLLtDs9PTT7sVnrvqFokyhojyO+t8XqWZhNhj5XUrkXTp5qG
	Gh++U8JL6y7vcEciT8cGE0L9/O+8gy7cwtcQrSe9l4dc1b4qoS2uigtjJjrwvE7k6IS5papHfWiTp
	2TMmndPMFzJWWV0ZvonTM8jRzVDzhllcmeWxI9Nycw+l3KiF+0y3cJ/bKa/k14ebkrUFIi0ORNGq0
	ujpJNOAfxZXW+9e+hSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRdU-00000003FGn-1Fxw;
	Mon, 26 Oct 2026 20:49:40 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRdR-00000003FFc-3JJi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:49:39 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-7ce77f98658so488868137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793047776; cv=none;
        d=google.com; s=arc-20260327;
        b=gPNmvnh1FfCrXLFs7nknRGZ3sHaU9XbfJztLhnGL8eFz45NttAiMPkXHXJUbd/Mef1
         BiYO958mfpZnSCCOxfeRmQq2s2N2yaMtHoRnLWygTA0INcAC2Btem4FcnM+cP6qeA8zS
         F+sfldeVL0NeCMU+bUC04EFrqUydOspiEQnthFj9lvPZRfbxJ/RvIFTDRse6BR5ofmJP
         X2BGkpDS9YdAaOKsm02P/fcv0IfNemvlg6M/5m1tfbvy5BhomeusvmaSuX/Qe+B9ueZq
         iOgr9+BJBwFvYkxQJ4+oN15RaFfw2JGJmmR6ct0alAG8a3/AumP5+/JqcXSmVfzb2yTR
         +NWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        fh=3QMgO4L0i4vtFhjDBvo7IUqXHi5c+0pVfWPj9mLdW+s=;
        b=A84lG5Fk76X1QYznz/bdBmonOX2arNDZ5FQvtaWs+b0qgNl2LBOIcmOfC8HAG6bxcc
         aQLn3mQSIacXnNzubP82PctZSCTvy8/nEVoD7DCQG/CENYryPUThJ4eLLVUJdTDF70n4
         56LkCWfq0gapd2m/ynoiYWSlFac1xbDf+udHMIqSNaUyLpTi2lALMKX1Dw/ianEDSTCz
         b8wscxd5hRFrfGRP/X/a68YeIutRaMnkWPorM4INkqs2OnYPfuWhpmjCYkbQzLm7Wuqf
         M/g1FYQ0QCEJnLf3A4HBZXzpUKbb1oO/5/XGPkFuPQxuu7wzs9HK0+NQDygacJKKF2Uv
         WNpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047776; x=1793652576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        b=Sv4uUvbqrkdPQIQd4h/pShSO7Vj7oK4DLy4UhyFLBjaSLGjmzV2dVuwNm6RnYr9527
         fmExaBbtPEtRqlHGNEiS3ZOogAQU1P4iOGjJQ/W+UINUOl5KwY+EWaJbAfGBlf6tL37O
         T9PBR+C6Ej590keKQ1zHZYbXjDmDS6QmyClOCPS/kxI6tNWmo698y8XI6IxUnOVBO8HX
         GR79DMJX+qenaSZhpb/BZO9c9rTHxl8AWqLnXshMo5pZu3EvaWhaLGT0jECN8YOdAmr5
         ltRkd3xBRng+mleIZ4za1L3Q8nwT62gyCv3W87a/Vf2BxsGf6+JDpG5x4won4fhlSuVB
         QGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047776; x=1793652576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        b=hx8GtsoZuEDSv2/L5Iquxc6dHXY+Jim4eEj8qeh1JdPKOnGPph38Y+FojDvimSGJEa
         93josyWd3XLdjiIMt5hN5V2sBZVm6bStPJnSJMKqNv1PdXjp+UjnuXT93DP4jNnqLbfs
         7R/M9zYKNkVbBHAt//zokwSQw9PZygwHhDgEV/fbDoOE2xao628bUoKNNTvBgNiu2P7z
         neU+WQks684iUnCyGU3/EEOrwM6Sss3YidUihHpnOTeB82zGeua87WOpc/bZJ1KgLXPe
         8LcgxBWHp8ynoci/hO3VRrH+h3XKPM2JIc4ayCqPviQfBJoA7ewHvU4Ji3uZK/yJRpXX
         +QbA==
X-Forwarded-Encrypted: i=1; AKwUvBxFoKavjStQrI0662hltsMVdMzPDWhF5sR7sH2ObXMBBcVoPuOe81w1MH7MKHqOdCh59Caz1T6D2w2S+2mhbpjA@lists.infradead.org
X-Gm-Message-State: AFq9FYIhKw9doBRlC2PYdbXw9671JpDgzuxgx+WfSRh5jUldMkhrqJnJ
	+hYUVFVJb3s7A21WnOhRjeAChJSuJBxjAQjNbI+kCDNUikTU2KMZ6gR/4gsoRuTXKQFb6Kuowfh
	lutpy/HYkE06lrkTGZIqSqyqIzR5+qN8=
X-Gm-Gg: AYBFou3Jrx+v4nSoHDafLYMyyqqXzsYmKnJ6+eoS3ikxoFsMWzrMW0D4ORP+XzkkU97
	9/XtPTWzt7Vd21KmQeDE26qtUYwMlvBZmbJZt4ejdFJ2cU05dbAKpDKsDSybHqJENU7649N39vQ
	plcWNDPVEsSM8b834Gr1AXenB6YsHd7t6oHXKLem2M6Wmx8zFZfF0Su3zRPzfV8C+Hb6PNeoyRj
	sBSOZHgLIwa3cCK9usO0jCqXYYY9tAiPZB/g6WsKINZ5Z2KfBdbePOPq9wuoXZf37Q/XJc3odZy
	uqPZvQaqU3JwqPE8N6Wfar4T3C4/dDQRbU3+4bZzjcbAAb4yk3uD0jg+4A41X599rZ/SYB59PJN
	6KdJ3TielHvEDO2gV3/Z9gFAwo98rzV/CjhzwlT4SGGKpKWKCZCzZPiPBX/EP1rG1r1Z5d72a/M
	V2J1ykPul9IIEbBrh+l65GCzverx1fGC42OKdfSnpNDcTr3guf1gKiVDJSeyOS3gdYEJnUnuIk6
	9EjBAuolxmuR9sggt+2gFog0G5QJ+h13EWM0HBnkDWvXrlcOkk=
X-Received: by 2002:a67:e114:0:b0:7be:37d8:1567 with SMTP id
 ada2fe7eead31-7ce5ccdca48mr2010224137.10.1793047776347; Mon, 26 Oct 2026
 13:49:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <at4bw-G8czG-G7Wl@ashevche-desk.local> <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh> <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
 <2026102657-tubby-tragedy-5f1b@gregkh>
In-Reply-To: <2026102657-tubby-tragedy-5f1b@gregkh>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 14:49:24 -0600
X-Gm-Features: AclHuK9UNYlzFhcHxdKzFFVeehL7ZLxndmHwf2zdIRC7OGdlKpLpZQpwjo4GLVA
Message-ID: <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261026_134937_870272_55F3D92C 
X-CRM114-Status: GOOD (  35.13  )
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

On Mon, Oct 26, 2026 at 2:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 26, 2026 at 02:24:58PM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > > > On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > > > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrot=
e:
> > > > > > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard =
wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > > Some people might want to test the stuff. And sending too=
 often you actually
> > > > > > > > > will get the opposite results, people will be tired to ev=
en start reviewing
> > > > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > > > >
> > > > > > > > My thought process was that people wouldn't want to be test=
ing code that
> > > > > > > > had known bugs flagged in Sashiko reviews.
> > > > > > >
> > > > > > > Sashiko reviews are not visible in my or any other mailbox. T=
o see them I have
> > > > > > > to go to some URL and so on, meaning to waste time to see why=
 on the earth the
> > > > > > > new version has been sent.
> > > > > >
> > > > > > Maybe the Sashiko reviews are getting caught in spam filtering =
or something?
> > > > > > They are showing up for me and on the mailing list[0] so I'm a =
bit confused why
> > > > > > you aren't seeing them. You shouldn't have to go to the web int=
erface[1] to look
> > > > > > up the reviews.
> > > > > >
> > > > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.or=
g/
> > > > > >
> > > > > > [1] https://sashiko.dev/
> > > > > >
> > > > > > > It's better before addressing Sashiko comments,
> > > > > > > reply to all people involved and to Sashiko's original email,=
 so it will be
> > > > > > > visible in the previous version why you issued (actually abou=
t to issue) the
> > > > > > > next version.
> > > > > >
> > > > > > Hmm, maybe it makes sense to enable recipients in the reply_to =
config[2]?
> > > > >
> > > > > It's up to the list owners / subsystem maintainers.
> > > > >
> > > > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/project=
s/linux/mailing_lists.toml#L290
> > > > > >
> > > > > > > And before even issuing it, wait for a while, people might
> > > > > > > disagree with Sashiko judgement or your replies on how to add=
ress that.
> > > > > >
> > > > > > I was assuming everyone was seeing the Sashiko reviews getting =
posted to
> > > > > > the mailing list already. The are ending up in lore so unless s=
omeone isn't
> > > > > > subscribed to the list I'm not sure why they wouldn't be seeing=
 those reviews
> > > > > > already.
> > > > >
> > > > > I assume you already answered your Q. mailing list in this sense =
doesn't mean
> > > > > recipients. I think it simply goes to the mailing list without fo=
rwarding.
> > > >
> > > > Do we want those reviews going to recipients as well as the mailing=
 list?
> > >
> > > For serial patches, we decided to only have it go to the submitter an=
d
> > > the list.
> >
> > When it goes to the list is it supposed to go to list subscribers as
> > well or only to lore?
>
> All list subscribers as well, I've watched your interactions just fine
> :)

Andy, are you subscribed to the linux-serial list?

I'm wondering if some mail is getting dropped, in this particular thread I =
never
actually received the review from Maciej W. Rozycki <macro@orcam.me.uk> at
all and had to manually import the email from lore. I think that's the
only review
email that I saw go missing myself.

That one getting dropped seems especially strange since it had a
direct reply to me.

>
> thanks,
>
> greg k-h

