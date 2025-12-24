Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37BBE75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He22hg7Pf60Vb1jpOAaSsU0Q2mSrOPk6nn6TP4vK02Y=; b=vc2V1RavozXoPMYAvnO41MRtk1
	iskoKWNXdpWCBj1L8CWFAJD9G65SS/gZRHxYXKbx8dncew29Wr2vu0kqUC8UkncjQIkaGd7sVuV9k
	eBf6qIaUS99HHy0kU4TVWG5PrOtPYJjI3oKj5Y683Z+/Ya7Bu311C64QCWuhDdRdUanOlxZr8lc5J
	un/XvzOMxV4tXLGLT3XVoGOZfjWvFqCHzVLDqt9H/FEai/ydtN2yi0091fVOeL/3R5a7EenvaGLzr
	nZxrbfMQVSbRNeRv62Gu4fBxW+1ki5hN3uniVfefeEOJTycix8Qfpj+0u+lgAs6g4rH8ZFn/Fs9r5
	jHSEUmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOOz-0000000Gp2r-2VCA;
	Wed, 24 Dec 2025 12:55:47 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOOw-0000000Gp2H-1gzF;
	Wed, 24 Dec 2025 12:55:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 06125418A6;
	Wed, 24 Dec 2025 13:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1766580933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=He22hg7Pf60Vb1jpOAaSsU0Q2mSrOPk6nn6TP4vK02Y=;
	b=rIH3fAA1weXMcnywGhw9J/NjYO7gM+SD1P8ggPsnJGW0N/G85XXy2sVfaEMeJUa6ars1h3
	852lv/3i/IkLSgvI1ILhibJABZR4sNHlsMvLKMy2qMPvR4BwSxj4MCh25Bkcj0g4MrQEYn
	81tFoyjdNzI3EvfwL6K6QBSkg1k/ylSxyBHevgh9Pw22k/hbGYJ3Bdadmi8TniM0jOmk1W
	Qyyz5uGhdXO//fq37KF+HmSj8Rf1DD3rNpG9xR1RWlXu6e6fIXJIDvnxGN3p4Xc1E82h9Z
	fXtIuIK3OhE1jg2EhX89ikMCDdrR0z4ASzaXwIMmKSeNyhYUN45R4qOiyIRoQw==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <CANAwSgQPQUBi6VVb+hZNraMt71vnRpki+YK_at=Luo4aPVtOPg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com> <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com> <CANAwSgQPQUBi6VVb+hZNraMt71vnRpki+YK_at=Luo4aPVtOPg@mail.gmail.com>
Date: Wed, 24 Dec 2025 13:55:29 +0100
Cc: "Geraldo Nascimento" <geraldogabriel@gmail.com>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: "Anand Moon" <linux.amoon@gmail.com>
MIME-Version: 1.0
Message-ID: <0afea20b-be22-2404-5a8e-c798ed45f2fd@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/4] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 limit RK3399 to =?utf-8?q?2=2E5?= GT/s to prevent damage
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_045538_671053_E5B1DB65 
X-CRM114-Status: GOOD (  16.48  )
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

Hello Anand,

On Wednesday, December 24, 2025 09:04 CET, Anand Moon <linux.amoon@gmai=
l.com> wrote:
> On Wed, 24 Dec 2025 at 11:08, Geraldo Nascimento
> <geraldogabriel@gmail.com> wrote:
> > On Wed, Dec 24, 2025 at 2:18=E2=80=AFAM Anand Moon <linux.amoon@gma=
il.com> wrote:
> > > On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
> > > <geraldogabriel@gmail.com> wrote:
> > > > Shawn Lin from Rockchip has reiterated that there may be danger=
 in using
> > > > their PCIe with 5.0 GT/s speeds. Warn the user if they make a D=
T change
> > > > from the default and drive at 2.5 GT/s only, even if the DT
> > > > max-link-speed property is invalid or inexistent.
> > > >
> > > > This change is corroborated by RK3399 official datasheet [1], w=
hich
> > > > says maximum link speed for this platform is 2.5 GT/s.
> > > >
> > > > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK=
3399=5FDatasheet=5FV2.1-20200323.pdf
> > > >
> > > To accurately determine the operating speed, we can leverage the
> > > PCIE=5FCLIENT=5FBASIC=5FSTATUS0/1 fields.
> > > This provides a dynamic mechanism to resolve the issue.
> > >
> > > [1] https://github.com/torvalds/linux/blob/master/drivers/pci/con=
troller/pcie-rockchip-ep.c#L533-L595
> >
> > not to put you down but I think your approach adds unnecessary comp=
lexity.
> >
> > All I care really is that the Kernel Project isn't blamed in the
> > future if someone happens to lose their data.
> >
> Allow the hardware to negotiate the link speed based on the
> available number of lanes.
> I don=E2=80=99t anticipate any data loss, since PCIe will automatical=
ly
> configure the device speed with link training..

Please, note that this isn't about performing auto negotiation
and following its results, but about "artificially" limiting the
PCIe link speed to 2.5 GT/s on RK3399, because it's well known
by Rockchip that 5 GT/s on RK3399's PCIe interface may cause
issues and data corruption in certain corner cases.


