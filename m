Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B891FED9E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOQHrjKwGcczje2v+eU1aZvCLFert0kO8lT/mQtbxsQ=; b=nlJV9GfLh2qXA8CHaBrmtHJddz
	8zy1VOiITngygaNiVrlAWeNKzmAq7XgKsKR9sex0OBjvaommX8+LcG1/Fv1IG0OkTw+caJPgQF6O1
	bJurL9VjK1jjkjjcgGmCBfjwXcgQzJ09crfgPccSW5+DB4oBsG/XOQ3w8ej3hZzLTOBQomcxLJjWq
	F0Yd9R5E4avUse8Vq+MirgChEXNkprIgba+e4OsAlizwipt3WlXZF5/rKYQfx9xFTs5dVSe4uFM1w
	Lz/OVzVw8xgCnH/q/lxKUtU4z1yN4c/fRN05A7TzXf2IMsfAFoXF8KKU7rdOU/0MvIUgumd+HgjlC
	NeyF9ZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WgW-00000006lFL-310D;
	Tue, 17 Mar 2026 15:50:20 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WgT-00000006lEr-0grA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rOQHrjKwGcczje2v+eU1aZvCLFert0kO8lT/mQtbxsQ=; b=lg8M8Gmvt96POhHYdOGTrWhd9a
	RNHAQctN7q1Ib/FrqD3/4Oq7XRfiiIHrhmySXDpF3Pi8KwTETfkxdjTD1pD8PtpwSgTl4Xwz5JVFU
	rjo9GZqffOI6n/TG8Wr541n/67T78b84cqiFqzO5QTWqBRzyishrQrLOlkc+/zr3wB6QA1a/X5ydE
	8IRcwSR/3SVv1Nmo+NbJTKAP2eYBddVi1SMPPOAlJx/U14GyepUk0RmG0iyFCtX5yW4Lo0o1JYIbY
	DgmAcNEqTxDZJZEu+bFeGisYqCSiMsrfrg2aLtIZ9Y6srfQbZL5WwLJ/hl+Z3ZJ3wD/91RMLVc9ol
	oiCxp0IQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2WgL-000GUf-0R;
	Tue, 17 Mar 2026 16:50:09 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2WgK-0007xR-1x;
	Tue, 17 Mar 2026 16:50:08 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add
 WLAN/BT overlay
Date: Tue, 17 Mar 2026 16:50:07 +0100
Message-ID: <5087680.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <79135f84-68cd-4b82-b7d7-4dec364933fc@oss.nxp.com>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-4-alexander.stein@ew.tq-group.com>
 <79135f84-68cd-4b82-b7d7-4dec364933fc@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_085017_342813_6A794A12 
X-CRM114-Status: GOOD (  14.30  )
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

Am Dienstag, 17. M=E4rz 2026, 14:09:42 CET schrieb Daniel Baluta:
> On 3/17/26 13:17, Alexander Stein wrote:
> > From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> >
> > This overlay enables the LWB5+ M.2 wlan module from ezurio.
> >
> > Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> I was expecting this patch to be in line with this comment:
>=20
> /*
>  * Display is not fixed, so compatible has to be added from
>  * DT overlay
>  */

Well, the DT overlay from this patch is only about the WiFi and
Bluetooth module. Display overlay is a different one, yet to be
included as this depends on [1]. I need to respin this after
imx91/imx93 pdfc patch is included.

But if it is preferred to not include backlight/display until the
display overlay is available, I'm fine with that as well.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew=
=2Etq-group.com/
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



