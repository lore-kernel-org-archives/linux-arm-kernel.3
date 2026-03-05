Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E2DEFCE4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 00:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhY75jogzIbjhIU27lFiOoKUr7croBBqbus1UG6As90=; b=fTt7rO1uQKw3Qg9fRxPAgpcn7A
	Wc3mX+2MhtfamOwfO98MElixsGdupeEH3cWA5CQRp121HGVuzQbzz+wnGw0Xz0///mTp2rC2emq8O
	+xfCoN5QdMcWUQppruYNBSH4Lfpu4/S0HZlhAhIq1tOnC4f8a+lCO4INAfOOPFY2Q2eALEttyfg+j
	M2ZrD/VKgEY8WTSnAXTJEPEbWKkQauloV/e/8z462IfDhIcUrXnbXQzipE+roRZp7ZPPLwK2DyZaO
	HxJziYnWr3AWIIrQrwb8QS59V3bc1dN2TFycT+t4CoVdGBTZ6XHtmO3azZoGQt+uN81AdsvRT/W1Q
	8nno341w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwKS-00000000gcW-3fFv;
	Thu, 05 Mar 2026 00:12:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwKR-00000000gcC-0i9r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 00:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772669552;
	bh=VhY75jogzIbjhIU27lFiOoKUr7croBBqbus1UG6As90=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eNz3NS9/mqu22kQpJvGSvcfTjFkgM9K80QAyI675eZTCeg0UZADIuFVg+7wB2B/bB
	 i/cO7wIIsMAjX0iquAGV+hse58/7N1tbGTi81IH/W7GdjG8f1AlQSXN4qUoIFhz41c
	 8ZAmaCkV7EFpU/O0rBBtTPMy/5AnBvWWrFvV4N99HIvyYFJuWg88qSlMPdfWlyHnLq
	 DbXrFt572dt3X7gT2iprl1tBlRvR/Lez3favGPZcjVsr0JdxSlkLhS7danAQqDPfEx
	 2obVBaa/neFVE1l2O6pzzJ0YoRGdcEkHpunSaRSgFhgnq8qO/XXK22+RaqHlBUJ872
	 Ot1S8wUQ2NsUg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8733060C90;
	Thu,  5 Mar 2026 08:12:32 +0800 (AWST)
Message-ID: <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com
Date: Thu, 05 Mar 2026 10:42:32 +1030
In-Reply-To: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
References: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_161235_400442_4DE00FF2 
X-CRM114-Status: UNSURE (   7.86  )
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

On Mon, 2026-03-02 at 12:20 +0800, Colin Huang wrote:
> eeprom address changed (0x50 to 0x51) in DCSCM rev D
> To support previous rev (B/C) and rev D,
> add eeprom device node for DCSCM rev D.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> DCSCM rev D changed the eeprom address from 0x50 t0 0x51
> To support previous rev(B/C) and rev D.
> add new eeprom node for devscm rev d.

I feel different hardware revisions may deserved different devicetrees.
What are the trade-offs that lead you to avoiding that?

Why is it better to cause driver bind errors on both revisions?

Andrew

