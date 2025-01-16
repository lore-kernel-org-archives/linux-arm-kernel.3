Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1868C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1qjdkGu320p2ntYbRPYPJ18x0guhjzrGBd9MaG/Vpk=; b=j5TUsxL11Dw5+tlF5NEVVuFdyw
	nlbLUIxgcHCSfLhz7h0ppTlnVmJ2hEKpVi3lCMRWYRt0O+IazVBvo/w6o4DuXuEqP/DQGruZvwUj4
	31CPIJPVsMrytn3GWDGaytNTicO+NK4DoYIPz+dhzb7qcQ1N07GFR1upaxE0do0t8MrlfmwS2BZgL
	BUSxurYmhCjHWuu+QDZOypwOtXBhPzdZYsyMyv+rj7JRVOin76KAaWnXR6IqBHsreN92qvsuWM28b
	FWujNs6dchFTsEGGTHKxnvbrTxWZKuzkHZcrvMSqbFlEMKPCawAiv8SqzQicTrk+bgXxUx7Lt5IZJ
	/c51scRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLKo-0000000EEYx-04FC;
	Thu, 16 Jan 2025 08:34:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLJX-0000000EECh-0iZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 08:33:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLJT-0001hx-8a; Thu, 16 Jan 2025 09:33:15 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLJS-000Dn2-0a;
	Thu, 16 Jan 2025 09:33:14 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLJS-0001nF-0O;
	Thu, 16 Jan 2025 09:33:14 +0100
Message-ID: <e62c5ee057c924a1dcc2f37d789b49f160b1010d.camel@pengutronix.de>
Subject: Re: linux-next: duplicate patch in the reset-fixes tree
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Thu, 16 Jan 2025 09:33:14 +0100
In-Reply-To: <20250116102149.0b0feb88@canb.auug.org.au>
References: <20250116102149.0b0feb88@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_003319_210051_8143A142 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi Stephen,

On Do, 2025-01-16 at 10:21 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in the arm-soc-fixes tree as a different
> commit (but the same patch):
>=20
>   055884c45d5f ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the a=
llocated device")
>=20
> This is commit
>=20
>   1f8af9712413 ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the a=
llocated device")
>=20
> in the arm-soc-fixes tree.

Thank you, that was an unnecessary rebase [1].
I've reverted reset-fixes to its previous / merged state.

[1] https://lore.kernel.org/all/c5eb7690-85b8-4f44-b8bb-598badf3b729@app.fa=
stmail.com/

regards
Philipp

