Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52401125847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHcXA4Vo5uDe7HPajpC5VBv8LgcG6irSL2nhHCrAnTE=; b=wcOd5vphdfnP7rNSc/+p3/4WGf
	KlLFkCxhYwfVtCg+Q9dG8QF0fG/UZgaZhfGoGkq+RYdRntK7flvZ0bRnXX8ojmhAcLURbeGwIK3AT
	o9NDgvhCL2WjwChg0ONZdNIX1jtotbvI7xsZSgpL/2xGwCZjnouRB+3UgpPoUxKZwO2gYzksdDybO
	W8cW4EvRJyKgOPwQgv7h4uIbSayIlUfxBBCE3gKYb3qI2FQA3T0exKe+ZxtrtW+jFSrW6kKVpeAvL
	YHhLagovnvn6WON2zYkGUVCQeSqa4c/aMYzN6a56UNrpIrJrfiG1LZug5OApIv2ciBiT8ngzVpalZ
	NFutYMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LOX-0000000BniM-136L;
	Wed, 11 Mar 2026 15:22:45 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LOU-0000000Bnh4-3DTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NHcXA4Vo5uDe7HPajpC5VBv8LgcG6irSL2nhHCrAnTE=; b=Iuupisj3Zuhf6ZYUv+SXKfxkRn
	jiWeCXQ3kAySgP18jGwfTLUhs9mFqMYGEOAFxq2l0Z9lWgRX7+pxzHDoF0v42r5+EN1L+OFGzn32p
	aotu/q3DhTlY9b/H6N1JnNqc4vzPMJ3Z7NhyI+anji1mIOrT/SIL0SLjjO5SFJpdGj+lX0ZjvUy8X
	4IDiKMQkkI368WAOO3CH5Q0NzBvVQm7DHv4IFgDiuRgT3YHuQEByjbFGeowge2v2iNJu+FEnJTVcP
	RIsXKZZ2W93C/d617uAo1GfVelOWT6hX8Mzl0BycC/jxf8Lzrf4OvkscDraezo02iEbwtZIu8R2mG
	/rgxEOMg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Ktb-0001sr-0G;
	Wed, 11 Mar 2026 15:50:47 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kta-000FGI-1O;
	Wed, 11 Mar 2026 15:50:46 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display
 overlay
Date: Wed, 11 Mar 2026 15:50:45 +0100
Message-ID: <7489551.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1ba940f3-6ff8-43b4-98c3-a8ce23e2b0fa@oss.nxp.com>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
 <1ba940f3-6ff8-43b4-98c3-a8ce23e2b0fa@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082242_804410_22954970 
X-CRM114-Status: UNSURE (   8.05  )
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

Hi Daniel,

Am Mittwoch, 11. M=E4rz 2026, 15:48:04 CET schrieb Daniel Baluta:
> On 3/11/26 16:32, Alexander Stein wrote:
> > +
> > +&panel_in {
> > +	remote-endpoint =3D <&lvds_encoder_output>;
> > +};
> > +
> > +&dpi_bridge {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_rgbdisp>;
> > +	status =3D "okay";
> > +};
>=20
> Hi Alexander,
>=20
> Any reason for dpi_bridge breaking the alphabetical order?

Nice catch. Thanks. I'll update in v2, same for PATCH 3.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



