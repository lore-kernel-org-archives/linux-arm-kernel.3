Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42718EB2700
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByPFv9LSfPa2h98LgJFBNckt7yVpvetzmP0rKVGMRWE=; b=r1Z+EdMvnyoTydxdq6G0eZz+US
	kuAlm4p4R1Lm9N62KkaeC3CsaABJM0gJt7Z1mglRBpuI3BlIcE9Bk0c/VsNOtFiKKC/ZkuxxYIyI8
	EU0K4JyKWeJJWmUPOemYywKqJfxFS3r5zwYgJbTpM63z1rCGt4Oq5QmY31sGMrnKEvQJ4dIhTphyi
	LOvzAJzp9av8dT3rlpHI0xfRiXAD0SPOGBWBitn4jr485fdKMORoC8d/qY/uLOQkpbag2dWpqVu1U
	8XEl7YwIAXG46vniAI1uzSftnqQXoNkZ3oU6vkp2GPI/jVq068C17ZC3nEwq1XowQ12Ps/Ivq47o6
	NLK60obw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7N5-00000000Um9-0TYY;
	Wed, 11 Feb 2026 10:22:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7N2-00000000UlP-0iPX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 10:22:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vq7Mp-0006CD-Ff; Wed, 11 Feb 2026 11:22:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vq7Mm-000ECR-2H;
	Wed, 11 Feb 2026 11:22:42 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vq7Mn-000000004Mm-45m0;
	Wed, 11 Feb 2026 11:22:41 +0100
Message-ID: <fcbc10e7657a20c08eb1fd50f0eedad0d6361fed.camel@pengutronix.de>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A?= [PATCH v8 2/3] reset: add
 Sky1 soc reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Gary Yang <gary.yang@cixtech.com>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org"	 <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, Peter Chen	 <peter.chen@cixtech.com>,
 "unicorn_wang@outlook.com" <unicorn_wang@outlook.com>, 
 "inochiama@gmail.com"	 <inochiama@gmail.com>, "alchark@gmail.com"
 <alchark@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	 <cix-kernel-upstream@cixtech.com>
Date: Wed, 11 Feb 2026 11:22:41 +0100
In-Reply-To: <TYUPR06MB587663CF0612A0552C0029E8EF63A@TYUPR06MB5876.apcprd06.prod.outlook.com>
References: <20260209093344.2013693-1-gary.yang@cixtech.com>
		 <20260209093344.2013693-3-gary.yang@cixtech.com>
	 <1c77ab31e6ba8b6285a67a6f2877a415dc9f3d3b.camel@pengutronix.de>
	 <TYUPR06MB587663CF0612A0552C0029E8EF63A@TYUPR06MB5876.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_022256_208511_86A7A1C3 
X-CRM114-Status: UNSURE (   8.09  )
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

On Mi, 2026-02-11 at 01:56 +0000, Gary Yang wrote:
[...]
> As Krzysztof's advices, we will remove the file named sky1-system-control=
.c
> Make the syscon node directly bind to reset driver. Are you agree?
[...]
> >=20
> >=20
> >=20
> >=20
> We will delete sky1-system-control.c as Krzysztof's advices.
> Are you Agree?
[...]
>=20
> Yes, you're right. We intend to adopt the advices from conor. But I saw t=
he new syscon scheme from spacemit,k210-syscon
> and these comments from Krzysztof. We will delete sky1-system-control.c a=
s Krzysztof's advices. Are you Agree?

I agree.

regards
Philipp

