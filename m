Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAC0CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byT23yRuymPPdxIdTw9swgQHBmcIsr3XjUFDrG55fV8=; b=p0wAXLrQc4tHznVQjwG8QTMRhL
	JQXTguprDwom68s8nnAVLxTcg2qVtHM5pNshWi3Lx34aOiyiXb+ISrITFzoeSkV0yNPQQVP15lGXJ
	czB4SJqdkudXX558+HlKAmxInigUt4CzhWPWm5cfjRoa5u8z8ZHSYfXZo7AawY98r+RT9lThLc3AV
	qQ1YUjq55BKnUrKFBYc7s4/gOrN6N/z42L3rLOhSmb1yb6Pu07msfieeA3aeM6OlGF27Q5EPoWpCg
	BwlC4A/MVH1HJebOtN2zbm3yljW0/bOVmXHYF7qpOv7ur9U/RPKlGy9UBvLVs4dXoDxEK4iMlvRRy
	zmGhmxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDiG-00000004Qlm-1yMn;
	Sun, 09 Nov 2025 22:16:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDiE-00000004Qkg-1qH7;
	Sun, 09 Nov 2025 22:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=byT23yRuymPPdxIdTw9swgQHBmcIsr3XjUFDrG55fV8=; b=UeTugOV+E0hXGyFevS5N0iiGGy
	Z04TlC1xumdZH+nmT/wlZcT6VB2EYFmR5T6N9pMYBtx76N4ewTk6uMCuHCsiWKrcR7XySmYklHaMC
	hHfkllprfyx2azRK9MI2rzFID9QWqakDL9f1eOVT8TS9jPoT337W+xY/HjDHO9ieBL5qCUzrPvBgf
	X9eLxHb7W+PcihWt40WJDr/4r2+jbqR8aUuVVwzuOvHzKgV20FBx3jq7hJiLizl94tWjQIeuJ4G5D
	by/ZGccOPc4ibNr6sXwPMx4McXn/3OHYx/1i/E0HK7JB9sMgWWwefHd1UP2X2WbX1RaYGCmouKCjg
	evGZ3JHw==;
Received: from i53875a5e.versanet.de ([83.135.90.94] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vIDhv-0007Wr-0V; Sun, 09 Nov 2025 23:16:23 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: hrdl <git@hrdl.eu>, phantomas <phantomas@phantomas.xyz>,
 Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Simplify usb-c-connector port on
 rk3566-pinenote
Date: Sun, 09 Nov 2025 23:16:22 +0100
Message-ID: <5024969.GXAFRqVoOG@diego>
In-Reply-To: <a726fac9-afe5-4639-b06a-4bccc256d98f@kernel.org>
References: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-0-ed38d200cc04@cknow-tech.com>
 <20251109-rk3566-pinenote-dt-fixes-upstream-v1-1-ed38d200cc04@cknow-tech.com>
 <a726fac9-afe5-4639-b06a-4bccc256d98f@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_141642_498336_2B29957B 
X-CRM114-Status: GOOD (  14.91  )
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

Am Sonntag, 9. November 2025, 18:37:26 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Krzysztof Kozlowski:
> On 09/11/2025 18:05, Diederik de Haas wrote:
> > The USB-C connector on the PineNote has only 1 port, so there's no need
> > for a 'ports' node with address-/size-cells properties as a single
> > 'port' node suffices.
> >=20
> > This fixes the following DT validation issue:
> >=20
> >   Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports:
> >     graph node has single child node 'port@0',
> >     #address-cells/#size-cells are not necessary
>=20
> This is not a DT validation, but DTC warning which we do not really fix.

That is good to know. Is the same true for other dtc warnings?

Thanks
Heiko



