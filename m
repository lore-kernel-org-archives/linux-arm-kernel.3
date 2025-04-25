Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD7EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbHCAUcJiqFBb9oSVZO3x35jBLSGHVixZR3edNDteGg=; b=pW9ynbEdZ9JM1wu6f0mYhgy497
	UlrZ8Fc56JcDsH96oQ9QkuVnu4zVGk8Cmo0VQiAfhlgoHDC/gXGIUugjS7eHUsIXATbzmMZaRCM4J
	I1OPeiTF6JEDqoknWFdk/Rs1Zn3D691oer/6C2HM6HSu8yDlIW8OsleJ+xTns+jxuPgfcLRFvNf+w
	weSfYmb1C9bUUcCBsAd5i/WWc4jZ9QgmeKvUh7jaysVJG/hABqxKUBUz1yuyHxJtKCxngWDjisRoi
	TCUqrxB/5TL8KlqI8zqznvM68H/HJo2NqwQdi2vKbs2oyX0ppMsx0I4EaLYbplUc84AKE2271aU31
	DnR4ysEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Glm-0000000GqZs-2hqL;
	Fri, 25 Apr 2025 10:58:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FdT-0000000GbNm-0kuX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:46:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20689106F;
	Fri, 25 Apr 2025 02:46:13 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9D43F59E;
	Fri, 25 Apr 2025 02:46:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:46:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, <dlan@gentoo.org>,
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <jernej.skrabec@gmail.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <robh@kernel.org>, <samuel@sholland.org>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250425104614.7efdd6c1@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
References: <20250425023527-GYA50272@gentoo>
	<20250425030006.45169-1-amadeus@jmu.edu.cn>
	<CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_024619_263569_4165C478 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, 25 Apr 2025 11:52:42 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> =
wrote:
> >
> > Hi,
> > =20
> > > It seems I'm a little bit late for this, but while we are here,
> > > Can we also append 'cubie' to dts file name?
> > > e.g. - sun55i-a527-radxa-cubie-a5e.dts =20
> >
> > Usually we use the device name (without the vendor name),
> > maybe sun55i-a527-cubie-a5e.dts would be better? =20
>=20
> I agree with this one.
>=20
> I can probably squash in a name change (since I'll be squashing in the
> SD card slot fix anyway). Andre?

Yes, I noticed that yesterday as well. So that's fine with me: both the
name change and the squash.

Cheers,
Andre

> In that case would you prefer to keep your current patch separate, or
> squashed in so that everything is clean from the first commit?
>=20
> It's up to you since you lose out on commit stats.
>=20
>=20
> Thanks
> ChenYu
>=20
> > Thanks,
> > Chukun
> >
> > --
> > 2.25.1
> >
> > =20


