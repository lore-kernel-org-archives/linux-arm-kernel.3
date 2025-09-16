Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7F5CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEBeb6eiNAU0S3VD9iH4/omSWMUm2llE4vreq7Pw7vU=; b=hLl4mLZotlVhAXFJtskxD4QlbR
	Vrz33vonIKUfZWxsQMr9wUVfeWUCgvBLiBFpfs0CiDvzr+OqF4ibWEhqD7b9EDAt9MaUv93goKwHt
	6fFNe7YeaOsce9lHpMEvlvdfs18RFf9v2Ltp7WK9c/3rBcLgSevCsn5B30+SQtMWdPi7tyi+ahj0/
	HJenymOkj+rg4Vqv5Wbr1q8oOoYmV4G8NKIrmbD5BPA9tQ0+7zvAB898p2GmBhr/ATl79RtE0GuDs
	0p3FEydIcXCkZz0YWPPqvGIHEPSIugKlzWnxQ+Wcgr0uZkZqJp/DG0zpClkgvo21q/Vz4azxuUooB
	PucwaEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKOU-0000000690r-3YTK;
	Tue, 16 Sep 2025 01:22:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKOS-00000006902-1Xt2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 01:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 187DF405A3;
	Tue, 16 Sep 2025 01:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF4FC4CEF1;
	Tue, 16 Sep 2025 01:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757985722;
	bh=ibKrn2mc/fR0T5tFKwJolutZB/nooDTAjYESNCRVuvA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u7uaZg3/QT6HzAHdYt6EPB6CyYkwTxBX235X92B+1a5Qn7l4ZcNt59scn7gJPKSYA
	 zapGiBToT/OEDOVGchYetXRKlOXVfXV8Cz690RIWMyTKubenI4SSHIA9kfoy2IK6ft
	 oSF2peswNX1FwnnU7MvcrG+0+87lGpYzRsD7Vm7RlXeXi+s1WlFjKP46lStrLy59mQ
	 xpd58Hh5GcCdOv0xvsHFQmFbVPs0WSHtRMew796RJkExB192e4AosiDjbK6TzN3f5F
	 ZUb2+9tf4Bhzcc01WIgqibpu6Wx41UiF680uMVUnWfDCgsH2pMn+E3X8idpq5VE0lC
	 eTpWLyrEGr12w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <212df54b-b3b8-454e-8d4b-e79bd9b69349@tuxon.dev>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com> <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com> <212df54b-b3b8-454e-8d4b-e79bd9b69349@tuxon.dev>
Subject: Re: [PATCH v3 01/32] clk: at91: pmc: add macros for clk_parent_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org
To: Ryan.Wanner@microchip.com, alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com, nicolas.ferre@microchip.com
Date: Mon, 15 Sep 2025 18:21:49 -0700
Message-ID: <175798570907.4354.6724058613129324221@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_182204_426561_FCA4F005 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Quoting claudiu beznea (2025-09-06 11:33:34)
> On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> > +})
> > +
> > +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw =3D (h) })
>=20
> Could you please update this one, something like:
>=20
> #define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ \
>         .hw =3D (h), .name =3D NULL, .fw_name =3D NULL, .index =3D -1, \
> }

If you're only using a struct clk_hw * then just use clk_hws member and
not clk_parent_data member of struct clk_init_data.

