Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8315DC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9/chxFPPa22IO8qa27xxpbmwA43QsAQuqs/BaliX5M=; b=vZp5eG/8q95CzXlDgJ07rKbFdq
	hZIDwE+KXuslrjkLmmHK7PFgnGHVkxRAWGNTd+FHUPpi0FHjyQ55qbshbV3dpWfvteYBH5XHTTf4R
	LiweCqvEajIkVRIwzm+UNNumLygePNuVflZAVCoe5VdcKR0AtZtIBl+67mCI/CXC7R3r/HUlUTl7u
	VS/nGx+KyGAR9XqRpfWlfj5c7yom80wL2RpN5WzLQydRvDMFSH4/NLrAkmDxi6nxlDlLCqAHroIcV
	HBfMB8IsHoBd2WZiPJS9U2amR4DpjExh9AlzxrHFhPPDilFooYp6LiOKqpHYz886DIJxn++yixjnd
	6u2EkHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRC3-0000000B2y6-0Hff;
	Wed, 22 Jul 2026 07:16:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRC0-0000000B2wH-2ktw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784704594;
	bh=K9/chxFPPa22IO8qa27xxpbmwA43QsAQuqs/BaliX5M=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=IjLWOwwF+Vkg/0/TOKB9y0d4L/1Iimn/gdWdnmdiBRcqFsYOQd7ZSO6YumYjqsIEk
	 SUQyAUcHyTsJ3QMKaVP51PuvnDeST0/SLcVuMDBdq90V5+xSPv03yBwW/+Jl7+Ti9K
	 pGCmPPKpfJ8MFlYthmoutoBPPmSyM1eaxVkfdb3YC/6ciK2vb+ydDf7mh3nTk6KyCv
	 3pUIMAo39htGVcsv1BlbVy266/QaimoBFpgmoHmffolwDc0I+dy5oRqNfGUqADgGKw
	 CI0s39eiWAhPuvoVCZxOtNo3FirpFBedm0e04+EtRsZKqDw0rPv7Wf5ML0KqqbGg3J
	 AmBAvWONOVvhw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7810065B37;
	Wed, 22 Jul 2026 15:16:32 +0800 (AWST)
Message-ID: <e3e3d647b9194b7ea4b88241a37df184bbdb307c.camel@codeconstruct.com.au>
Subject: Re: [PATCH] EDAC: Remove redundant dev_err()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Pan Chuang <panchuang@vivo.com>, Talel Shenhar <talel@amazon.com>, 
 Borislav Petkov
	 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Stefan Schaeckeler
	 <sschaeck@cisco.com>, Joel Stanley <joel@jms.id.au>, Andre Przywara
	 <andre.przywara@arm.com>, Robert Richter <rric@kernel.org>, Khuong Dinh
	 <khuong@os.amperecomputing.com>, "open list:EDAC-CORE"
	 <linux-edac@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
	 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>
Date: Wed, 22 Jul 2026 16:46:32 +0930
In-Reply-To: <20260713131510.332386-1-panchuang@vivo.com>
References: <20260713131510.332386-1-panchuang@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_001636_888854_0A856EA8 
X-CRM114-Status: UNSURE (   6.35  )
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

On Mon, 2026-07-13 at 21:15 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
> =C2=A0drivers/edac/al_mc_edac.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 =
++----------
> =C2=A0drivers/edac/aspeed_edac.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 =
+---

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed

