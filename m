Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC20C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5TdnORzHnSPCcwkwh5ZdJaD4rGkt3pOr1UCtbU8p/0=; b=CXdb8oaVQ0F1/Rld3EgZQVFw9T
	o8BLpc7qisTA2jtd/ao0bV1SuBvCiKMSBTLZatDfGvHyHfoiVW6NwPeJKY8uB76cFn+ZvUMFB5c7N
	Fh281VHl0HYVPh157vlDqkPaKSXIRsHVvcp/GKlbu5TG88kMQrMoK0VnmnGTC2zUhrht2Q/ZPpNqM
	5JepaZMkVRIBRMY+xTlcWgD0nfT+q9Dsu4dknbpw4jlE0OJx/4++PFBrArVnM9W34WXyc0Wccqp5c
	kESUlt4MZ0CV38NGy28MBxI2DXa0Fp42ai+upSLVNPxLFtY1OknFrnUYr1rf2D8psrF0+3hTc3c92
	zm1spe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycG0-0000000HPmp-2xqf;
	Mon, 24 Aug 2026 21:31:04 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycFx-0000000HPmW-2zWG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 21:31:03 +0000
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:9a6:acd5:d8dc:dcdb])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id C55642003B4;
	Mon, 24 Aug 2026 23:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787607059;
	bh=9epPxeHWNF8W940Jf+0CNBre0EINBiimKM4d85ai6W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buZW05gc6K5VVSLaQz9HETJnwKgZiZe0c967arfsdrSEpjokoRbdMJrOnStbDH7Zf
	 onw2xa+5HBhIxAt0SuN1Ef/Wlb/I4bZjEYKp1/KX+Q2MyZLhB0QCTf7AaRPN+juiEZ
	 30lMmCJW5NF9Rt3p1FMxkV5jBmM7sys1NljQ7V7iLOTLSFmG6DSI/3Ck+8e8oz9CTC
	 KW0mOeKALISmUHNjbRSpQSxdB1amMz2ZV1+yBHgzoXBqqCJuCA4Sh8Imxwq1NeVepC
	 AEXBqLNhs+cx7/iWDa2FiVoDk6Z/ZEpckaSZfQmAfWb0uax0AVsyTgjkqEV7W1EjSJ
	 6g7hCqX6UlyMQ==
Date: Mon, 24 Aug 2026 23:30:43 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thibaut Collet <thbt.cllt@gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Message-ID: <aoy4A810WeNi7YAw@L30177.local>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-2-0a525d5f4cd5@free.fr>
 <e9a20a84-a20c-456b-bf17-0790d2aea633@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a20a84-a20c-456b-bf17-0790d2aea633@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_143101_889842_AA72007E 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi Josua,

> >  
> >  			gpio0_3_2_pins: iic1-gpio-pins {
> > -				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
> 
> Perhaps add a short comment here on reserved bits, e.g.:
> 
> "LX2160A RM describes bits 11 and 12 as reserved, but writing 0 to them was confirmed harmless."
> 
> Feel free to rephrase.

Done into the v3:
  https://lore.kernel.org/all/20260824-for-upstream-lx2160a-pinmux-fix-v3-2-5556ff1e6be2@free.fr/

Thank you also for the Reviewed-by on 1/3 and 3/3, v3 includes your Reviewed-by,
  Vincent

