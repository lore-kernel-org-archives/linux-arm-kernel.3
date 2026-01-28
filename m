Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D4DD46C0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4upRbVfTJ07DQH6ODb25K7X4KuRaWDl+UDpNd35zMs=; b=S68eAOfFnS/m4DR8haCHQlzi85
	cXgZ/da/86m9keCse4OhgsJap7hFRMdDgDHuQ7fryLRLfq7iyozfhBjIDJnR5FPGBsP0JCh/IT25Z
	SUCjSIc6USWBP0PVl1o4e7NsWenRXjhOb3hPlfFSzw6AhzwCXuwHPLWINdxCFD2Wv58f5dV5g2pON
	JU9ctXCzKiL9MAQKKBsIzmGbPyCsfr/680oxUWYSLdAhlzG3wCNK94xi/p3SjalNvkvdQayqY1nUl
	w+ZDSoTuL+xKl0y9AqyCLKisjnWPvgwzZNW+nSzV0QgNPLXc64BBs3PRZ9mxpzqlJWlFOs6DrZ9Kp
	Tf6SyxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEKK-0000000Gu1q-26Sf;
	Wed, 28 Jan 2026 22:47:56 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEKF-0000000Gu1U-0nje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:47:55 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f1cqQ2Kkhz9tgG;
	Wed, 28 Jan 2026 23:47:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769640466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4upRbVfTJ07DQH6ODb25K7X4KuRaWDl+UDpNd35zMs=;
	b=SyOhNsIE+x9Koof+yayV9dROTmHkxZR2tmaXFlmoeW44lqFagrJdNkWousn1cicP7XiTHY
	DawN7wl5LiqsBW7AI9VDIXQGPfHLD75VGtrYTxK4GHSaIscGr7Oc2u6pL2eHuY5pF9atMn
	TxO+WldlLcQx6UyyJicNCkghMB3b0GmC0f71pRK72knE8HDQQF1hcFodMBMVwoErd2t1GD
	4ySioLnGAQcrYpsAfeezykD6ZZykeyhtLymTdatgn3vu2W516EW4EVlmuXZHIBUNLDMwFt
	A2i27xDC8jmDdSGiW8OyduPz0t+el9ptTDlA2mkwQcHx1amp3Uc3Kwg1jT/lvA==
Date: Wed, 28 Jan 2026 23:47:36 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, horms@kernel.org, shawnguo@kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, wahrenst@gmx.net, pabeni@redhat.com,
 davem@davemloft.net, netdev@vger.kernel.org, richardcochran@gmail.com,
 edumazet@google.com, andrew+netdev@lunn.ch, robh@kernel.org,
 krzk+dt@kernel.org
Subject: Re: [net-next,v20,2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20260128234736.49bd70b3@wsk>
In-Reply-To: <ed0e1af1-0210-4461-8939-3e4e35d74dae@lunn.ch>
References: <20260126103400.1683125-3-lukasz.majewski@mailbox.org>
	<20260128022549.4151341-1-kuba@kernel.org>
	<20260128224125.246bcf41@wsk>
	<ed0e1af1-0210-4461-8939-3e4e35d74dae@lunn.ch>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 686151c5d01e846fd34
X-MBO-RS-META: 5xys9hdxh1j3adjqtyn71d9ygs5oeaky
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_144754_191680_40283B11 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Andrew,

> On Wed, Jan 28, 2026 at 10:41:25PM +0100, =C5=81ukasz Majewski wrote:
> > Hi Jakub,
> >  =20
> > > This is an AI-generated review =20
> >=20
> > AI is going to take the "Maintainer's" job :D =20
>=20
> We had a bit of a discussion about this.
>=20
> Our observations so far is that AI finds different sorts of issues,
> which human reviewer often don't spot. It also does get things wrong,
> so we spend some time sanity checking its reports. So overall, it
> might actually increase the workload, but also increase the quality of
> the code which gets committed.
>=20

Frankly - from the MTIP L2 switch patch set review - the AI review does
a _really_ good job ...

It finds non trivial issues - with very deep insights to function's
call dependencies.

> 	Andrew



--=20
Best regards,

=C5=81ukasz Majewski

