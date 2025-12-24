Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2741E6B279
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 02:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1loIAAfZi3ARrBea2GD590U569CMRnH53n7SJVQ+fYg=; b=vuXhtxY2UNtSCQ7YJKTMBAnXwX
	TL64or69jr4ea40VdvtaDtJwVuenwIJgz776WQrx7K9EtWxeSDXAaMMAFczNdWYAJzsj6dEXhXVPC
	+xUe14/UD8TzUTbFPq6fe0ey404HiPap8iR4YCtb0Y4FBMdCG6ODdsZmUFiBZGgFhO/El7/vz4/qt
	cxxzjoCJXCUryiXTlY8UJdmgfLSkAPB2OLkadQsVAxcq6jlATT9GNnxJDcazUrypfAdMiYazi07q8
	05jjOzyDds9PQaq5HzPDFtZ9tVy30XD1XCf6xBF6NSvzGt891StdA9UFvUeanmc01GOxAtRy6XZZ/
	TmlUGKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYEY9-0000000GJjJ-2XDm;
	Wed, 24 Dec 2025 02:24:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYEY6-0000000GJi4-2VfE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 02:24:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so4413514e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 18:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766543064; x=1767147864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1loIAAfZi3ARrBea2GD590U569CMRnH53n7SJVQ+fYg=;
        b=jMBde3ZwF2FAi9CyrDulW0iUuJPxfpMKKC7A5rtnDZ3va6OsiHMw6f/y7SVpJvFEdG
         TH5EceQeyRnt8iOxnQTEvBdhrwchvAo3sO5VnWJznuAlFQqccwVKPlW3oi2+yjBBJTeq
         DB9BCucpJGRDqDHXu2f4zeQK6ZvnadD8rp1DXL0RBZfkJk4Lbq/coqJ0di9Sc3c4w2Ee
         B06cIwlKleKGJBdrapF+grgjW/JITkVOYmxiK9iAdiyEji3cb74mIv8YSxZcZaJizShT
         jPPqBxEDcF9rHH7UxueC/vbz/LvNhV/QuDz5g+TMjNEx+qbq90qYOEFjqTKz0fBn0XoI
         jyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766543064; x=1767147864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1loIAAfZi3ARrBea2GD590U569CMRnH53n7SJVQ+fYg=;
        b=TVMTW2B4ltBn0IXxwaqaCRxbeNNj730gTdK170N3PQDEzfZKRVUJUgt5ZdmTPZ9xyu
         f5KIAwTCIXIST3i51DADFe946bhCvh62TIuHStVbHFfuQQsRVCeS5VGpGDy+Yi+42AK1
         vL5Z0Qpg0BMFcTTE6vuC6WFjOrybBVdRwTJHfPijV+VuEc0cSapvcZM6UKl8AbkZipCE
         0uErKSb+F4SAaNqO3TxyL6eH7LcnrbryE1Op30qdo0cw356nucGmPR+Dinzroklolg3Q
         bKnbFW1YapoCepmdNNNbIaL9oDP1qO/2Sc/SdbGrBRdPlPUdXswHM01X7drfLqxZw6eT
         FlOA==
X-Forwarded-Encrypted: i=1; AJvYcCWP+a2MpzdZnvPZ+UrYmZ06Mu9uAxIJQxITwLMeNuu5vNliMygRba7eOP6ofgARyOT9ZepVizQOEhpQJW+171f9@lists.infradead.org
X-Gm-Message-State: AOJu0YxfamPpvKWZN3wWw2/CdbhNs3+Zs5awin2qU1rRaT+4HkFDUQaj
	lg/4387POj0zvWB0ccLiVSm4/fbGUfvqjF9wIWMQh5WHOVt8xhrku8ZkXDLRPsJCVv6oOXRMuj7
	dehPofPDd8yfyRr2d2y10qPY18G5hS8I=
X-Gm-Gg: AY/fxX7i3jW7tezVOBtiDb5bxRVGSAK5dnjizcBNTvnF+70N05aQBx4eawW4bDl4N5R
	ZoRNp7J7A2fBWwbidUN76pGI+kYkLyT7QqRRGg4LZQtxZoQsc42ujPUP/9hlQuncaCEutItC+A2
	r+h+TC1wPmr8vwhxVx3jfjCwm8PqmrkvwXERt3pkpNPn02NU1xm/L1Y/9HbCGswI++4hVJFPJWg
	Ew49vrDXDf7Dsvx0gJJDPOSKTH87g6baJWAXLl0UMupX5MZy7mWmZbEhyISHxVx+zOCI2Po
X-Google-Smtp-Source: AGHT+IE/+50K3afhfndy8OOQCaT5Jx8UIeiRvbJr4DL0U3mNPbecM/23tUIstTpZgAeJvbIu4PB7SOkqEOl5NRqK1zg=
X-Received: by 2002:a05:6512:128c:b0:59a:10d9:72d with SMTP id
 2adb3069b0e04-59a17d498fbmr6776183e87.45.1766543063511; Tue, 23 Dec 2025
 18:24:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <qncj72c3owrw7rvnj6jit2sbn4ojyr3kztcjailfxtdboan6sy@ddh5g7v4fcvt>
 <3ea8ac20-6332-0c0c-645b-36ca4231c109@manjaro.org> <DF197NIRHLIJ.3LIG9GJGJQLQX@cknow-tech.com>
 <656e9b4e-c350-f808-701e-e49e8dad7062@manjaro.org>
In-Reply-To: <656e9b4e-c350-f808-701e-e49e8dad7062@manjaro.org>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 23 Dec 2025 23:24:12 -0300
X-Gm-Features: AQt7F2qM7hLDFS0yoRUqiACBfHqK5NSRbS9YoOFtrIx5Y1oXB1EP6whymdD-2I8
Message-ID: <CAEsQvcv_8HnWNHAQGKs3pzBqrO_9+HsMr9w-F=pZJ1oEXeC=Bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
To: Dragan Simic <dsimic@manjaro.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Jonker <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_182426_667453_A6E967E0 
X-CRM114-Status: GOOD (  28.76  )
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

Hello Mani, Dragan, Diederik, and all,

I'm currently facing banking issues in Brazil which means I'm
refraining from fetching my email through POP3 with mutt to do proper
kernel development.
I usually fetch my mail through POP3 and have the server delete it, to
save space on my free tier.
But I found out I have a 20-year old bank account open that I had
forgot about, and with this bureaucracy hell I can't have the server
delete the messages for now.
I'll send v3 with more proper and illustrative wording once I get this done=
.

Thanks,
Geraldo Nascimento

On Thu, Dec 18, 2025 at 7:13=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Diederik,
>
> On Thursday, December 18, 2025 11:01 CET, "Diederik de Haas" <diederik@ck=
now-tech.com> wrote:
> > On Thu Dec 18, 2025 at 10:47 AM CET, Dragan Simic wrote:
> > > On Thursday, December 18, 2025 09:05 CET, Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > >> On Mon, Nov 17, 2025 at 06:47:05PM -0300, Geraldo Nascimento wrote:
> > >> > Shawn Lin from Rockchip has reiterated that there may be danger in=
 using
> > >> > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT c=
hange
> > >> > from the default and drive at 2.5 GT/s only, even if the DT
> > >> > max-link-speed property is invalid or inexistent.
> > >> >
> > >> > This change is corroborated by RK3399 official datasheet [1], whic=
h
> > >> > says maximum link speed for this platform is 2.5 GT/s.
> > >> >
> > >> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_=
Datasheet_V2.1-20200323.pdf
> > >> >
> > >> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC =
driver")
> > >> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4=
c21b@rock-chips.com/
> > >> > Cc: stable@vger.kernel.org
> > >> > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > >> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > >> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > >> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > >> > ---
> > >> >  drivers/pci/controller/pcie-rockchip.c | 10 ++++++++--
> > >> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >> >
> > >> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/=
controller/pcie-rockchip.c
> > >> > index 0f88da378805..992ccf4b139e 100644
> > >> > --- a/drivers/pci/controller/pcie-rockchip.c
> > >> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > >> > @@ -66,8 +66,14 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie=
 *rockchip)
> > >> >          }
> > >> >
> > >> >          rockchip->link_gen =3D of_pci_get_max_link_speed(node);
> > >> > -        if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> > >> > -                rockchip->link_gen =3D 2;
> > >> > +        if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
> > >> > +                rockchip->link_gen =3D 1;
> > >> > +                dev_warn(dev, "invalid max-link-speed, set to 2.5=
 GT/s\n");
> > >> > +        }
> > >> > +        else if (rockchip->link_gen =3D=3D 2) {
> > >> > +                rockchip->link_gen =3D 1;
> > >> > +                dev_warn(dev, "5.0 GT/s is dangerous, set to 2.5 =
GT/s\n");
> > >>
> > >> What does 'danger' really mean here? Link instability or something e=
lse?
> > >> Error messages should be precise and not fearmongering.
> > >
> > > I agree that the original wording is a bit suboptimal, and I'd sugges=
t
> > > to Geraldo that the produced warning message is changed to
> > >
> > >   "5.0 GT/s may cause data corruption, limited to to 2.5 GT/s\n"
> > >
> > > or something similar, to better reflect the actual underlying issue.
> >
> > s/limited to to/therefore limit speed to/ ?
>
> That would work well in a book or an article, while slightly terse
> wording is usually preferred in the messages produced by the kernel,
> or in log messages in general.  Such an approach compacts as much
> information as possible in as few words as possible, while still
> remaining (mostly) grammatically correct.
>

