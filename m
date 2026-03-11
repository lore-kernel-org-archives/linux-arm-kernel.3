Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F941125866
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81J9RcYlVjgXPDSeMj9W/C70E173wqDJE/JZDphTsSM=; b=U5t/1tqqlpwSRtrgDOcMEt3f8s
	Aq1HhukvIqvulbd9Aik+koVwEz11NLvHzWS3BwpcIZtbIatelt5L3Sm9HZ60E5OdZpMVk6nNXWoZ1
	wLyx1pRIVx+1mXuINkIIRR32EfOFifzfNrvj0bKJRUHz33dsaahSEjtebcn2oBilwJPKC4HASjkYg
	MfFDRbsZqoigGlx+EOWE7Iv2rTcSWMwcyzWXD97PU9qX+Utn126gCv3RWTelw7GhEh1Bp4nNgOlox
	MjGx9gXW7Vo5EPuv5l0urq+Cfkbkg+ivEvRUP6w83DfkF2pna5/8kREVC2HMX7GuW7IzOSRm9mwkc
	718sMU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OMR-0000000CBlf-3gEb;
	Wed, 11 Mar 2026 18:32:47 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OMO-0000000CBke-2sbl;
	Wed, 11 Mar 2026 18:32:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 60AC042183;
	Wed, 11 Mar 2026 19:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1773253959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=81J9RcYlVjgXPDSeMj9W/C70E173wqDJE/JZDphTsSM=;
	b=qpY5+DyJVsvmbHbN+N+4uRjVm2nTPpA3XmNT0W0zNPxvY78SQNsI7zJ983G5NQGetqLDTP
	wSkzbFXWxtJae4N8H+hmPdV4/0BPnb5Z7+asjBLcTqX+QWv+1/uoSxyLrSeY2JYOxpcQBy
	iTggG0B0MxpNxGp2OMaMfAzm5WsWmS4uOhme8T9Wce+rGpy5PNVtm6THlJu5ABt/ANoF2Y
	eaueW1q2vE6Z22XQGpS8uVl+bqft3ItI+eiE/xvN3mbeJMtaJUOPIRJFUoGbKXXuYNkMvQ
	X5h7rWKVx/0cznDHHf2OLI7CsgDWtDwCKuRZ+oeKMRSLtqsg34wZS+/2v758ig==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
Content-Type: text/plain; charset="utf-8"
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
Date: Wed, 11 Mar 2026 19:32:35 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Gene Chen" <gene_chen@richtek.com>, "Heiko Stuebner" <heiko@sntech.de>, "Sebastian Reichel" <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
To: "Alexey Charkov" <alchark@flipper.net>
MIME-Version: 1.0
Message-ID: <802df30e-607b-7404-6693-6691ea45618b@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 0/4] Add HUSB311 Type-C controller
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_113244_961925_DF3B049E 
X-CRM114-Status: GOOD (  13.89  )
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

Hello Alexey,

On Wednesday, March 11, 2026 17:20 CET, Alexey Charkov <alchark@flipper=
.net> wrote:
> HUSB311 is a drop-in replacement for RT1711H, used in Rockchip RK3576=
 EVB1
> board and some other boards closely following the reference schematic=
.
>=20
> The existing RT1711H driver seems to work fine with HUSB311, and ther=
e is
> no public documentation available for HUSB311 to identify any meaning=
ful
> differences, so this series wires up the existing driver to treat
> HUSB311 in the same way it treats RT1711H.

I'm a bit surprised that you haven't managed to find any HUSB311 datash=
eets,
because they are seemingly rather easy to obtain.  I've got a couple of
HUSB311 datasheet versions with the register descriptions and whatnot, =
would
you like me to send them over?

> This also enables a bare-bones DT node for HUSB311 on RK3576 EVB1, bu=
t
> currently misses the connections graph for the USB SS and SBU lines, =
as
> those might require the USBDP PHY ports schema to be updated first fo=
r
> proper DP AltMode support as indicated by Sebastian.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>=20
> ---
> Alexey Charkov (4):
>       dt-bindings: vendor-prefixes: Add Hynetek Semiconductor Co., Lt=
d.
>       dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
>       usb: typec: tcpci=5Frt1711h: Add support for Hynetek HUSB311
>       arm64: dts: rockchip: Add HUSB311 Type-C controller on RK3576 E=
VB1
>=20
>  .../devicetree/bindings/usb/richtek,rt1711h.yaml    |  2 ++
>  .../devicetree/bindings/vendor-prefixes.yaml        |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts    | 20 +++++++++++=
+++++++++
>  drivers/usb/typec/tcpm/tcpci=5Frt1711h.c              | 21 +++++++++=
++++++++++--
>  4 files changed, 43 insertions(+), 2 deletions(-)


