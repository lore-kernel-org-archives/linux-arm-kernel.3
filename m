Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4958FCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q74DfFMJGIf43h3oG0AaLzcz+fNjnLU10vcumudtGPU=; b=bNnMOq/ybpEwXvLnNu8ngE+IeO
	8bcMZJoApx/CYPGt8MwL6fnmCmRw9LKhugUAWrnIaVLkhSOHd/JxKj9qE8BWOK/+WdQ0i6EGu0l2q
	BdwT3FIOEV7sB6svMWZ/W5Q+R5W9eo7CCoGSMiJlNrJm3lHF/celXJ726h0Rzy86kzXi1bUAEHuOE
	55hqP1zpUUFLKAApAD4XIdUa5xsy65kMbIG2yk8vNrgjC+1uOm7s1Nmv5Q22yBa8uZZpIZQUC6tj+
	Cd8GuBS4Ua11f6SQGAmE58PgjLIPArSvnVnJkBBU3Xt+A0qE5FrhBLIj7pdsbDaC2A2yYiMTA17gW
	p9DQ/uiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLTS-0000000CBBc-0h3d;
	Sat, 13 Jun 2026 10:20:22 +0000
Received: from mail-24430.protonmail.ch ([109.224.244.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLTP-0000000CBAh-3zNK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 10:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781346014; x=1781605214;
	bh=Q74DfFMJGIf43h3oG0AaLzcz+fNjnLU10vcumudtGPU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h4IdtranjLetTUOBYNFCtKZrpcVlKvaVpaSOmd/8APazXezroN577JvQezid6+eIn
	 k9PZutTzzHO0TxhLBx3/vRK9YVgUlxLFlN+Sa9OO9LT6birHINfK4jzf/AXvB+nrAo
	 t7Y1jaJHDk29YH+iyMkyshEx7MaCkRJdDrtkhmBr4/4qZ7OvbrBjDnQvePODJJJnjQ
	 shebYd/6/akaMoggm1FE2Dqnrb8yK0ztISMxX97RQIMVvoCZPjiYPDQU0AdwZHndQr
	 uudKj2FHIcqrwKFc+aBiuzbQ9vuOg440f27fcU7hAH9AcMqxDolfzchfyzpycyJ1oP
	 m/Hs8Cch8/SyQ==
Date: Sat, 13 Jun 2026 10:20:10 +0000
To: Linus Walleij <linusw@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
Message-ID: <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
In-Reply-To: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com> <20260530145800.1029920-7-y.oudjana@protonmail.com> <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 23bbe0e76ed880a27521d811693ae6c5ed41470b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_032020_171678_234E4D1B 
X-CRM114-Status: GOOD (  15.92  )
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

On Monday, June 8th, 2026 at 9:41 PM, Linus Walleij <linusw@kernel.org> wro=
te:

> Hi Yassine,
>=20
> thanks for your patch!
>=20
> On Sat, May 30, 2026 at 4:58=E2=80=AFPM Yassine Oudjana
> <yassine.oudjana@gmail.com> wrote:
>=20
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> > also supports the pin controller on MT6735M, which lacks 6 physical
> > pins (198-203) used for MSDC2 on MT6735.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> Sashiko has good comments on this driver, look into them!

Didn't receive any comments and I don't see anything on the mailing list
archives either. Am I missing something?

>=20
> > +config PINCTRL_MT6735
> > +       bool "MediaTek MT6735(M) pin control"
> > +       depends on OF
> > +       default ARM64 && ARCH_MEDIATEK
> > +       select PINCTRL_MTK_PARIS
>=20
> There are in-flight patches to make MTK drivers tristate for
> the Android GKI. Do you want to use tristate for this driver too?

Sure, doesn't matter much to me since I'm always compiling it as built-in.


