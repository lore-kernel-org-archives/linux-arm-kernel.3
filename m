Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7441098783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQESvT/YL3z67ur3K9umwMWGp663lLjzF2AnKuf+BjA=; b=xLtlyV0ujCdcYGAWsfbvoicAkU
	gi0A3sNPs9x17uf5R+RuumWN1XfAvjzshrJ4XtfkmQrWgc0pZDxBlgISocJ7RRf/tlxx5m9PPt9cf
	GIsS51ti2/YElQPSZjA2tyPNltYhy8iu2O0nPQmSACr3rtk8Bp4dFndh+o+76Y9/XAOgpqmf+64ZD
	qmWO2VyQcRK6+zMXi3PMRnJYWD/wY+x0AaqF6N5ep9BZ2RX+IzwZQswW5k1bEYQXzjahApGOOC2zO
	xsx37he9MDyGVfhgYPdxVLScBajAGx2PzKu3IF2H87Jq11cPpeept2CXd3D+XrNg3hoM5h2ak16v7
	2tLPTcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zm8-0000000CqQC-0pQf;
	Fri, 20 Mar 2026 13:20:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zm6-0000000CqQ2-3EdG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 13:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Sender:References:In-Reply-To:Subject:Cc:To:
	From:Reply-To:Content-ID:Content-Description;
	bh=aQESvT/YL3z67ur3K9umwMWGp663lLjzF2AnKuf+BjA=; b=UQ/z5Evo0xogMAjtNOpgxoIaZK
	taZak5t+KrfvAsg51ksk1oDuaCmm6QzmTjTxyFAigl7Spn9gXvB2qHrvFCnjv7jRy9hlEFVUAO+M7
	iCW6/4qXwlCQacDUYfCwnD1H3bbk4aureKbK4TZCC7/WfYzWqoWug2vypYHUdrTYK4jx4RxM93wO+
	zeFcN9jIfgHhD4/N3HdQOEOc+J74y64VV3i7ANQoNZBbXkPXhMv27AYYT0jM3145mWzZZh31VsSLe
	UupLJt/2VhprC0pHkACYcXLxCpzov430qBrXaCKo3VeGF60PpBh+SatI7ZXoL578ilEmYqxeflyYg
	VxuUcxvA==;
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zm3-0000000FbbI-1gRy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:20:25 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 655BEC3EEAC9;
	Fri, 20 Mar 2026 14:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 655BEC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Maxime Ripard <mripard@kernel.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>,  Marek Vasut
 <marex@nabladev.com>,  Stefan Agner <stefan@agner.ch>,  Liu Ying
 <victor.liu@nxp.com>,  Simona Vetter <simona@ffwll.ch>,
  imx@lists.linux.dev,  Fabio Estevam <festevam@gmail.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Frank Li <Frank.Li@nxp.com>,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Thomas
 Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
  linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
In-Reply-To: <20260320-amiable-hairy-bullfinch-28bfda@houat> (Maxime Ripard's
	message of "Fri, 20 Mar 2026 10:25:11 +0100")
References: <m3ms04caaj.fsf@t19.piap.pl>
	<32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
	<m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
	<20260320-amiable-hairy-bullfinch-28bfda@houat>
Date: Fri, 20 Mar 2026 14:20:15 +0100
Message-ID: <m3a4w2d4ds.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_132023_577015_24429EAD 
X-CRM114-Status: UNSURE (   7.46  )
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

Maxime Ripard <mripard@kernel.org> writes:

>> > > -	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3)=
 |
>> > > -	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3=
),
>> > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_T=
HRES_MAX, 3)) |
>> > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_=
THRES_MAX, 3)),

> If this is related to the output resolution, the DT is the last place
> you should deal with this.

Well... just tested (v6.19 + patch) with 2160p30 and, surprise surprise,
it doesn't work for like 10% of the time. I.e., the display may freeze
at weston start and/or shutdown time, but otherwise works:

v6.19 (frozen screen while starting weston, same display, the patch
applied):
32FC6000:        2        2        2        2
32FC6010: 80000000  8700F00  12800B0   480008
32FC6020:    A0058  1000007        0
32FC6030:        1        1
32FC6200:  8700F00            223C00 EF000000
32FC6210:        0 89000000                 1
32FC6220:        0        0        0        0
32FC6230:        0        0   AB0155

OTOH NXP's 6.6.23 works all the time:
NCP v6.6.23 (a different i.MX8MP):
32FC6000:        A        A        A        A
32FC6010: 80000000  8700F00  12800B0   480008
32FC6020:    A0058    10005        0
32FC6030:        1        1
32FC6200:  8700F00            A23C00 97C00000
32FC6210:        0 89000000                 1
32FC6220:        0        0        0        0
32FC6230:        0        0   AB0155

32FC600x 2 vs. A is pixel clock inversion.
32FC6208 is config P_SIZE, T_SIZE + pitch.

More tests after weekend.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

