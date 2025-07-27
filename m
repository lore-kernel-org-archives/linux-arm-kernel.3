Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBE1C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6GEbE/qLybdXBADc8I0NACgbRc+yYy+1TEP72jbzlg=; b=bzeIfVkMZAbP+HucX6S4s4GItd
	Lrglr4t5Plr4IncqXZR+loUCZaLe+/+OU9MOi959IyzeV/2pA/PG2JvY19P7CCO0kuLV+HzrEZp7i
	dnTlgYwNR2Ij/5DDV/frOKvn6HM53i2geX6hJ7azSTCxkMtyXZp2cw6XUTYqE7nKqD/t3D+huTOQ9
	1XNuShYdcqixkgifLHd6cELC/2fGzFS79m/njIT/MurQMHiNGmPFx3yivnJd3pzFtIvchjjEg5XU4
	zPgJBf9wwVKTQwt+nmzZkGeKSgbvR7mFf6F8u2dTe9wFS0kC8M3sdxvaaBmSTLAoc/wb5r+Dr8mH6
	YSwmDO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug19t-0000000CjP0-1Q6N;
	Sun, 27 Jul 2025 13:11:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug17L-0000000Cj8g-1AS2;
	Sun, 27 Jul 2025 13:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A928418C9;
	Sun, 27 Jul 2025 13:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4FBC4CEEB;
	Sun, 27 Jul 2025 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753621722;
	bh=hN9LDjd6CLq5G10VnQYY9Dgif1+I33fW6zwuL/KlJ70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NXaDpZkGOTrdczLzZtFLw5a5TR8K0054fptr52ejiMIh1u4w9pSTseGI5EM4ABgBI
	 KFEGCpfdanCIdw4ssb8+lXrAxDEZH6PMFvAyOo8d63kNZs0+YAnKq9LMdy4RrngvVI
	 BWUiXIe9yz3irGRVtZiy2dzWcTogwYzAz+X3CraVX+FXuWBeMXnK8qtT+9cjkbvs8m
	 sDkT32CjuFhHf4Ftpfk1qvX4vHGSy3R44Y3gmk21n/6zqAIMgygoGGfvZ5sqhlw1+i
	 84Hx8Q54byOG/8Y97zfDS30QwogWcARAyel32hT+Rp/BGSN5r18AzUKP6JuDoDfnPq
	 9cxXOLprtOFfA==
Date: Sun, 27 Jul 2025 14:08:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
Message-ID: <20250727140828.4893fc51@jic23-huawei>
In-Reply-To: <8f4358e8-ecd6-4d86-8326-25d21c3a4ea2@gmail.com>
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
	<20250724111247.669d6955@jic23-huawei>
	<8f4358e8-ecd6-4d86-8326-25d21c3a4ea2@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_060843_337561_67FBC9F1 
X-CRM114-Status: GOOD (  19.47  )
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

On Thu, 24 Jul 2025 22:38:14 +0530
Sanjay Suthar <sanjaysuthar661996@gmail.com> wrote:

> On 24/07/25 15:42, Jonathan Cameron wrote:
> > On Tue, 22 Jul 2025 22:35:13 +0530
> > Sanjay Suthar <sanjaysuthar661996@gmail.com> wrote:
> > =20
> >> Fix minor grammatical issues by removing duplicated "is" in two device=
tree
> >> binding documents:
> >>
> >> - net/amlogic,meson-dwmac.yaml
> >> - iio/dac/ti,dac7612.yaml
> >>
> >> Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com> =20
> > I'd have no problem with the argument that this can go through either
> > tree if there was any interaction between the files or the changes, but
> > here there isn't. This is just causing potential mess if either tree en=
ds
> > up with other changes overlapping this for no benefit.  Please split in=
to
> > two patches, one for each subsystem.  You should be fine to keep the
> > various tags given here for the new patches. =20
>=20
> Thanks for the review. I understand your concern regarding splitting the=
=20
> changes. My intention was that, since the fix is a trivial and identical=
=20
> grammatical correction across both subsystems, it didn=E2=80=99t seem nec=
essary=20
> to separate them.
>=20
> However, I=E2=80=99m open to either approach =E2=80=94 keeping it as a si=
ngle patch or=20
> splitting it if that's preferred. As I=E2=80=99m still new to this proces=
s, I=E2=80=99ll=20
> defer to @krzysztof and the DT maintainers for the final call on how=20
> this should be handled.
>=20
> Please let me know the preferred direction, and I=E2=80=99ll be happy to =
update=20
> accordingly.

DT bindings ultimately go through the subsystem trees (in vast majority of
cases) to avoid churn issues and keep them aligned with driver changes.
So split it.

Thanks

Jonathan

>=20
> Best regards,
>=20
> Sanjay Suthar
>=20


