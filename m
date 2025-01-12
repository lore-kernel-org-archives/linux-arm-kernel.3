Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED19E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLHGH+epv3M5YYT+PPWV3TJBLGXoTr8WFrivrQEhYaU=; b=3jyTNWxUphruwk4bcpar1OebLe
	8InlS3UeOwOFxnV2JhZwTKvlsq4Me4BFBu49wHJAwUNT5J3gQG9xlGM8IWZXOE+Zc54cr9wJwo0Cb
	ZoKSQTX5axii7GtEvi2OHH4BBg8YKGNrvA++hGYFa8C/P/NlTdwMqrQHh7zv2/cblDGKkywamvasa
	P3XSx/tkXQ2F+GKGyNkl1q5oE6y+mShv4M0VarGM8NaBqa9eDogLLuOYP26i5iEcvH0eNIFAUYF4T
	KtIcSIIFQrwgl1EeXbQ9/BQ9QtjTD0nAlRzcEqhqlXxbkXUBEFavo7a7djt+N0Y5tATGXL/WefklJ
	+RVao3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1NY-000000037CG-19DI;
	Sun, 12 Jan 2025 17:04:00 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1MI-0000000373G-2FJv;
	Sun, 12 Jan 2025 17:02:43 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5f2e2608681so1768770eaf.1;
        Sun, 12 Jan 2025 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736701361; x=1737306161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLHGH+epv3M5YYT+PPWV3TJBLGXoTr8WFrivrQEhYaU=;
        b=Tta6eMwanuUqRleyRoGCdlpJDRyIWjRpXMa4W/6upWJ3A5uNcHr1AjyBVn+azUL1Nm
         SNNF4betHMvNUmytnKQ86k8gIbQ68CkP17OpQZHIQFedvgIHBjafZoVV7v/SCwc7C2wp
         s+hbh86LxTwojSn8dCM90JYnO+OioWdeg+sYPIF+QPziH62d5Zbl8d7kGIegaEbdeuiF
         W/6G/Euzwhoy/K+OVPlg9Dvv+vtqXCw6wBLnREvosrfVibzXi5X2G63llSw01FZ+juTW
         VwzvqVrVFEYtmZ1vnaYkHSTzdZ45jiz9PQHX1zA7jCtd7uGBLZeBX1ApxwFNQzEFIqvR
         rPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736701361; x=1737306161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLHGH+epv3M5YYT+PPWV3TJBLGXoTr8WFrivrQEhYaU=;
        b=CEhxCwlx+LzzraikK4meAjnSFrvw9YPC26oNdNC7COqPhaN8doRI05jb3G3b0AcqpV
         0G7Ly5xRxipVd5qa0KdFE8f/Ahwp9MhtVXkf+fvYmnwlOa2XwWlgeCCoM3si82qIqWe6
         N91oJo96BvUdT4c/7MKEFYdMIN2h6ZuMfIeCZGQn/B6ZBT5vkFsIM++ebousnmMBHUCq
         Qq8dhtvk/Bq0ZDjxYnMuNvNtRJNAk991JPclcrxhByEWiHH/7yIVyRIQ46/xomFQ/Kws
         eZc5hkkV6xZSpbwSZz+AAe0gV+4MQy44Y/aEGFmrUmvZ5Sy8JUE14m2EjDwFFnOfSMZv
         mDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVhzY/0H/rHgCP28m7tXhdxzx09EIz5XSKBrQBrB2n7hdID35qMLGmMkIlWcIyIYVuYktxCWsJT76E6XgVPdTF@lists.infradead.org, AJvYcCWzXvVNLdAK9cYemcn8vx/Y9zOktk0+wJAJs0lnig957qtPSnT7+hHKqLI+e6MXxqv7lZTsJz2EP7D1uGzn++Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZSGGTBuoUcblae2hWJZntIuY8dlIc+cj1XXYdQmgaMuLmHi59
	4y1s4O62LkQcHylDWmySUalgPK8YFxCsApCfa+9cGwctga4+DZXriEx+j9cajE4LCJt2l+WLI27
	M+Cu2iAxM8WYMIF38t+jRbAj4NPZSlS9Kpw0=
X-Gm-Gg: ASbGncu1wWyMRIcgdiEb8nuHl9l9F2jILNc4H1afc1pzreN/OVFlSxj3z8fTo9uzQcC
	AufB7ET2i59MFbZq6P8318mEaZy8lgXKGz258/bI=
X-Google-Smtp-Source: AGHT+IE+nbx6AlzWrejQjGji+VB54fgrOIOIydNSnwo6l8H/PczwvJZYdI9qfx3ZuLqSObfZhkV7LJ2bPXcsbulebYg=
X-Received: by 2002:a05:6871:a403:b0:29e:6ae2:442 with SMTP id
 586e51a60fabf-2aa068d6800mr9772628fac.32.1736701361506; Sun, 12 Jan 2025
 09:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20241230034446.1195728-1-karl.li@mediatek.com>
 <20241230034446.1195728-4-karl.li@mediatek.com> <CABb+yY2G1C7rvsha9qm7mRSk1e_xBahshzHCs39=DzTCUGrsuQ@mail.gmail.com>
 <CAGXv+5E98VZnf_PL2kEF=VxytNVyCEV4iY=aEnEoZz0Z7AJiTg@mail.gmail.com>
In-Reply-To: <CAGXv+5E98VZnf_PL2kEF=VxytNVyCEV4iY=aEnEoZz0Z7AJiTg@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Jan 2025 11:02:30 -0600
X-Gm-Features: AbW1kvawhR9q_j_zMWhY9OH_vnifw3V8ugjcAxvz2Ds9ffqbhNNV3c1iJIS2tYA
Message-ID: <CABb+yY0FHBxvc2Lwg9O1G9O+rxoXk-tS1QFwi63=_zsV0SyYuw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "Karl.Li" <karl.li@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Chungying Lu <chungying.lu@mediatek.com>, 
	Chien-Chih Tseng <Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090242_571254_E7367F95 
X-CRM114-Status: GOOD (  18.99  )
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

On Thu, Jan 2, 2025 at 10:56=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, Jan 3, 2025 at 12:30=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > On Sun, Dec 29, 2024 at 9:46=E2=80=AFPM Karl.Li <karl.li@mediatek.com> =
wrote:
> > ....
> > > +
> > > +static irqreturn_t mtk_apu_mailbox_irq(int irq, void *data)
> > > +{
> > > +       struct mbox_chan *chan =3D data;
> > > +       struct mtk_apu_mailbox *apu_mbox =3D get_mtk_apu_mailbox(chan=
->mbox);
> > > +       struct mbox_chan *link =3D &apu_mbox->mbox.chans[0];
> > > +       u8 data_cnt =3D fls(readl(apu_mbox->regs + MTK_APU_MBOX_OUTBO=
X_IRQ));
> > > +
> > > +       memcpy_fromio(apu_mbox->msgs.data, apu_mbox->regs + MTK_APU_M=
BOX_OUTBOX,
> > > +                     sizeof(*apu_mbox->msgs.data) * data_cnt);
> > > +
> > > +       mbox_chan_received_data(link, apu_mbox->msgs.data);
> > > +
> > > +       return IRQ_WAKE_THREAD;
> > > +}
> > > +
> > You don't seem to do anything that 'ack' the irq line. So if you merge
> > this into mtk_apu_mailbox_irq_thread() and do
> >  devm_request_threaded_irq(dev, irq,   NULL,
> > mtk_apu_mailbox_irq_thread,  IRQF_ONESHOT,  ...);
> > you can avoid adding a new api and keep your client code simple.
> > mbox_chan_received_data() is strictly between the client and
> > controller driver. If it is not called from an atomic context, feel
> > free to do memcpy() from it.
>
> That sounds great. Could we perhaps update the API documentation and
> drop the "atomic" requirement, or update it to something you describe
> here as "between the client and controller driver".
>
Not drop, but simply add a line that the client needs to respect the
context in which the controller does the callback.

thanks

