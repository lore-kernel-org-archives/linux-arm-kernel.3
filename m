Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9D8EB1060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=; b=xbsYO6T3IOhgY1BFmqc44mTtjt
	MNFcLZl/VYIm4zYy3uo5In0XgJMTlIzNt2Qv7Td2bjgUMM1ptQmxq7m+S+hhzLKoDJq2jw79l68oR
	jsyEe+Ibl+x190YsC58Zsw50HIhAD6IUMVq3qk0Hi64dfEiSY1GsdXTh67/QUVc+tVp2xG9q2gzcC
	9m8QU4yNEdLnP1Hh1n9Aw5vo+nmlBb0XAm8fRZXKvS0/sLeonIkBvuaJLKKdC1FJsgimU3M3041lL
	dmUuuwNqnK5lLpRD6HT2ejnB2RmwqS7/NAx9hICtanoVmtD7KR1uZ0FZkjY0dULaHwVBjN98r1/AB
	zfHznDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyhi-00000009lHF-0tu5;
	Tue, 10 Mar 2026 15:09:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyhf-00000009lGY-3yEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:09:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b886fc047d5so2118789666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773155333; x=1773760133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=ay9bqdMVKbrQeZLd51UUIPxfw7D7Bw5/GAxs6c91tRDwbrpY7LortHX07aNPez2uDs
         TdkFM9jCVgO2y0iMwG5zN2AnbwIM4itDMp7m57i8Ct04iM3nBzS+WcjDu9rqh7HJLUSs
         f6RhDZ96B9JvdA+Tq4LXBSn1jRBe3S280O2hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155333; x=1773760133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=cfOMDCElDzSc/pLhgx/qF7IKHo4qvbJX226rer40Tf/NPFsFAv56ka1P6yRyoAYzf1
         8KhSdS7vSCFXKJsPXOPulg8B+SFE7THRje9IHhgeaLfv0iAMsBmCQFuONz3r113fwGHD
         9pBX3vqrM1Xrva1hgZuLSu7o59TQRPjyFpwBx+GYxuSOuYFJWTgAkRxGXW0C/abcQreU
         +Mm0qK4AKWvcfg81l4ei/6oqefG2m1su48EXPty+EKktV9BQN9XNJzEmYKGbKdrYF+Ff
         OU9lvOnf5S04AGi4fcMg3R70xZzly5P844DqZTKV/prNLO/MTLIVgWfrwK+VZGcZj2hk
         7SCg==
X-Forwarded-Encrypted: i=1; AJvYcCWJN0hMCt1FKIkijI7P+tIoXAQTQ8UHH/kDPjTBLQAOGRpxtjhVmZ6695rfdiDoWjge0WxdPUll4Jjm2lYI4k2U@lists.infradead.org
X-Gm-Message-State: AOJu0YyaahI7wa3kqhVDbTV/G8+0OXvEFIZ/tSuw1Q2TuCWyTnMc7El4
	SqFJnNybbf+8Rq8zkaf9DL94vOcer1ioj3UKs2TdQwi/BEgChQMrEQ4pOAKXkRCJWlnfZhHqLPV
	8GY3p43L6
X-Gm-Gg: ATEYQzyxnlCxi09bMtpejP+mvy6385PYBXtF7bSFaRB/1A4MURuRL0Xny8wMpINEBVd
	LwL0jA3B3WxPE4tFpwk6ZhaH4ANAcj9HjvmshIoiR/GP2OgTBbUzg5GvRZ2JK60DXds7d2uxMyv
	w8h5kNYwrJ2dcfmO4chw6wiGnLEvRXeS18JztVCeO9xQCPaapX0nWyAyVckOkIiEb9CaODMe2Ys
	WuexLFTLB6/zCBpKngUu98PYMJwceQXt1hkB8xRlAvfdAWIU5c81Pf45SvV5B8C1KVnLEwdohmO
	5YhQSr42I9X6SZxjlAXyrR9d/2syiqKi1DO5C3zQ5FQQ4Fxb0P6q9TBD28F+uY/3fz/gVQbTH3F
	krdPSyX+w+hPs/fwBGYA9B0jVbzengF1IZYJRK3Li3LNtrqNvbsS5ZDTBxYksqRYRyLE0zPk9Tr
	k1YhLLDkCLcn+a+DdxegRxtdfnPUeosVMdzBzPP9Nt++IRXtNjhxodYxGY3wsujQ==
X-Received: by 2002:a17:907:98d:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b942e02c34cmr874975866b.48.1773155333458;
        Tue, 10 Mar 2026 08:08:53 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15d56fsm502300366b.56.2026.03.10.08.08.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:08:51 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so109528545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW89LHIl1LM3U2B7uwdzMReq4fmmcqumFLT7ZEdw7BSfqrwoC9P71KyCkUi7mJcQ7zGSFLVzqmJ6G3Nukq3eL7Z@lists.infradead.org
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr236479455e9.34.1773155329681; Tue, 10 Mar 2026
 08:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid> <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
In-Reply-To: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 08:08:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
X-Gm-Features: AaiRm51YHmAMmjPRIWQTSvpfsMBkAMaTT684zHe2XNjk21TEkEMaZPx6RHcKG9o
Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_080900_149091_70BB9204 
X-CRM114-Status: GOOD (  28.27  )
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

On Mon, Mar 9, 2026 at 8:24=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void=
 *mssg)
> >         if (!chan || !chan->cl)
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The mailbox core gets confused when mbox_send_message() is c=
alled
> > +        * with NULL messages since the code directly stores messages i=
n
> > +        * `active_req` and assumes that a NULL `active_req` means no r=
equest
> > +        * is active. This causes the core to call the mailbox controll=
er a
> > +        * second time even if the previous message hasn't finished and=
 also
> > +        * means the client's tx_done() callback will never be called. =
However,
> > +        * clients historically passed NULL anyway. Deprecate passing N=
ULL
> > +        * here by adding a warning.
> > +        *
> > +        * Clients who don't have a message should switch to using
> > +        * mbox_ring_doorbell(), which explicitly documents the immedia=
te
> > +        * sending of doorbells, the lack of txdone, and what happens i=
f you
> > +        * mix doorbells and normal messages.
> > +        *
> > +        * TODO: when it's certain that all clients have transitioned, =
consider
> > +        * changing this to return -EINVAL.
> > +        */
> > +       if (!mssg)
> > +               dev_warn_once(chan->mbox->dev,
> > +                             "NULL mbox messages are deprecated; use m=
box_ring_doorbell\n");
> > +
> Does this patchset leave some such clients out?  If not, should we
> drop this block and return -EINVAL already?

This patchset series got all the clients that were in mainline at the
time I last checked. However, it was unclear to me if all the patches
would all go through your tree or not, since they don't touch mailbox
drivers but the somewhat widespread places that were clients of
mailbox.

If all the patches aren't going through your tree, we'll need to keep
it like this until we can confirm all of the clients have been
updated. If all the patcheds are going through your tree, then we
could make it return -EINVAL right away, but it we'd have to do that
as a last patch in the series. I think it would still make sense for
the first patch (which adds the mbox_ring_doorbell() call) to have a
warning like this and then a final patch to switch to -EINVAL. That
keeps things bisectable.

What do you think?

I'm happy to post a patch atop my series that switches it to -EINVAL
and you can land it whenever you see fit. Would that work?

-Doug

