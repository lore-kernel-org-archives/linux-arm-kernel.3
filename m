Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A3DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3I/mDqpQX9jkLpLoehB+o2RmLvW1cxiRLz6+Er4xFOE=; b=L3+gYAnIZGGRvs9Xm6W3ZhNjRX
	E9lXH69ajJoeb4/uRsTw5EesGojUAo9ch5JijzoPKPJKHgCLCQkfGOCtB8gUpg9O3loDsAL+s9lZ/
	+B7bHYoVy5UkWzX7cm7dymDAMszqCQpb98iNjJgowWLpbVdQQ4XXrI+t8YzQXK11N3hxwztxeyY+S
	hSTdu0b+5Q7hyKsvneNsy424sQzezlYaxt5C1zj9DmIDTz9+Hrk3f/18U58eS2Ok19J62kQotFLMj
	qToqMYhUmXgyR7GRnFnO3RgDDJg7huyj49BbBfeoDNL5a/FAkOzV9yHlu+jBtPFP0xCUg1xyU2zZi
	12vAt9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8gT-0000000DNGr-0DCz;
	Wed, 13 Aug 2025 10:26:17 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8EL-0000000DIEz-0L0x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:57:14 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c23gc147Gz9tHg;
	Wed, 13 Aug 2025 11:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755079020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I/mDqpQX9jkLpLoehB+o2RmLvW1cxiRLz6+Er4xFOE=;
	b=rPxck3uVjGwVbjegnyQf978gzo+AChZ920JmecucA/mfRWGtJP/WQrT4CZ4rISo0Z5SfTb
	7xbZL8h7b+hIab2dIR7MXaDX6HpxJCouTG2Q0ACtD0/XYRCewrARcji9s7L64Ke7qTWDPt
	INm9fhWFk18EwwsxU9o53TNNEG5E4mAyRlC6tohqirDigkOtmYQpbsLWEpmPnIT8NjLcPm
	mcnfTTl0qZLpmmcQj5+eYBnAPiBoSsBsvNCFP0qzQw40jogFJz7GeluVyJ/lHg489NnlQ7
	iLlcRYa9uDRtK+NB62kdSCLvam2gG6Fi+UqF7HLlXbc55DXrMHY3joUawW/Teg==
Date: Wed, 13 Aug 2025 11:56:55 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6-display5: Replace license text comment
 with SPDX identifier
Message-ID: <20250813115646.29a08c1c@wsk>
In-Reply-To: <eac01571-13cb-44a8-b724-76e1b2af4c0b@kernel.org>
References: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
	<d9e81ff2-5621-49db-92a1-acf304b225f8@prolan.hu>
	<eac01571-13cb-44a8-b724-76e1b2af4c0b@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: c13e5f5f6dd64ce9ace
X-MBO-RS-META: sowtjo94ijj8df1d4gp6ww9koodhgx4h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_025713_295527_28EDB8DC 
X-CRM114-Status: GOOD (  15.74  )
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

On Wed, 13 Aug 2025 10:33:32 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 13/08/2025 10:29, Cs=C3=B3k=C3=A1s Bence wrote:
> > Hi,
> >=20
> > On 2025. 07. 09. 9:32, Bence Cs=C3=B3k=C3=A1s wrote: =20
> >> Replace verbatim license text with a `SPDX-License-Identifier`.
> >>
> >> The comment header mis-attributes this license to be "X11", but the
> >> license text does not include the last line "Except as contained
> >> in this notice, the name of the X Consortium shall not be used in
> >> advertising or otherwise to promote the sale, use or other
> >> dealings in this Software without prior written authorization from
> >> the X Consortium.". Therefore, this license is actually equivalent
> >> to the SPDX "MIT" license (confirmed by text diffing).
> >>
> >> Cc: Lukasz Majewski <lukma@denx.de>
> >> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu> =20
> >=20
> > So, what do you all think, is this patch acceptable? =20
>=20
> Yes, you just need Acks from all contributors there.
>=20

Acked-by: Lukasz Majewski <lukma@denx.de>

> Best regards,
> Krzysztof



--=20
Best regards,

=C5=81ukasz Majewski


