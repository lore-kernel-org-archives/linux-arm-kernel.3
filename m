Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696E8606FAE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pf8NTEdl;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZCZJ+fI7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6b2TVz5RBdMTmkdnd0+DdIVBECbziA2iv145pJZ1Voo=; b=pf8NTEdlt2Nhu31k5IXO22LDKq
	ZCEuyGTub0a3GO6kuZyqdeQFjwJnkrLKcJPZ5a6+rWruOML2LfDrKXlG/4wnrHDprwI93bGarxn+k
	kA5mCBMj0aSHkiUwkXWDwk+4/XLenQjKEuc7X21NsXgx18Opn/wBJMQHke6iNbIIIEyK+1nF/YWXq
	S7V0NpovC2m1hAOdx+4DxhFk42w1JHE9MMYu5+ehCMzqDF7kXG4j83dxxjQUL5CM9At0JXPdB45JG
	f9plEIZVx2iF0/zy4SCXE+JKB3h71AN6EgJIDLqgIWvEoolDou8T7dQXRdYuuu6L6H2lCuDgTP0Nz
	+R8webvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCEk-000000026tS-1oWG;
	Tue, 03 Nov 2026 10:59:30 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCEh-000000026qu-31FK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:59:29 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 771D220103C;
	Tue, 03 Nov 2026 11:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b2TVz5RBdMTmkdnd0+DdIVBECbziA2iv145pJZ1Voo=;
	b=ZCZJ+fI7f/VO1TopNf3JRW/u2mE25GBHZNgWHLCWWQwyRf2LAChiJOhS3IL3abLErXZw/t
	sEqoW8lgtIN9JgPX0B9bwWEDYA1omA3HC+x3qoQBHtPXPaBcK+HnY6Hbu4BY3kXmZW3/D5
	79D1lDTlDVDudWBJThk+6kgcIoN+5dQ0EWM6w4xnTQOEitxCiz902XouEDZU7LgBqwhqxE
	05NZz+jTpG9xi6IwF+NQfmg4rurtmOFBEK0xbnXrWX3w3iZ50HyYK0Cu6djRUf+sun4Yiw
	NzbVvXoDXpF7q7ABo2YCvYk50o3tPZ5WGEwPkLO2KSJKsPUCRYB11k0LUtAsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b2TVz5RBdMTmkdnd0+DdIVBECbziA2iv145pJZ1Voo=;
	b=Aa+CYFkVPNRTO2wPfmTA19Uryvuya293TvNsuXefwpnDtChb/3qiuxYezASP/lnRmUgA9O
	9UMLAWmOPrrZneaiR+ZU5Yjo4Z724IxclK7n6vXPi8W3rOIHSwcOhCb6XyFf6UwQp1iOBB
	vbQRHCPhogjlC2+2WC1k9i+dPNGk5wN3zx0iRPVJuS3dc9W6aCPEugFN17EVEqccO92NHX
	+CreZkd7UQU+t1nOHws+hPNnmeARK9FD/MWtGjDY1N6zhkQ3w2tn9/i2i+FwV/ECzViBAO
	eCDhctfk8EipdHIknkCr026moY3eRvAXPlnsbVzWcDM1r0Np/GMh3H9VJoOU7g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703565; a=rsa-sha256;
	cv=none;
	b=GrDTaT9qYC7XXPLYVBFmUIbVppj0VVtTIuWcxsIv6OlbI9KmoP0b/56JR6QTbHJ5DaABkY
	1y7w4z+qhdNiUmIxWkUIv7oe1pJTDVqlnqkZRm0VDV6Xabdfo0iT4WvBIecutBwp4qQNY4
	LhwE6K9ikmmb8S/feQ6I5Xp6Z8SghNX3J83bwGsmLulGkowJlBfrdVQ3dbJdCLJRGbf1G0
	ui/+YOcf0gbcPIxWHsG7fOf6WYmz1MTAUsAH1cxwwW6Yuf2Lxnj0u7MU5KH/ZVEyIlzxB5
	k1AmxMYzqnMytdFV44ZXX0402vI7n3X+n6+1f2E+1b/q2ZAyUyJ4NuHJhvNT1w==
Message-ID: <3b2e95430efce4822b232f5ba4a5007574de216d.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa
	 <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 03 Nov 2026 11:59:25 +0100
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025927_912554_661FFC88 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sa, 2026-10-03 at 22:50 +0200, Sven Peter wrote:
> Hi,
>=20
> The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
> reset inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 and t8112 each port comes with a
> dedicated register page while t600x and t602x use a single register
> with one request bit per port shared by all ports of a die in the
> middle of the PMGR MMIO region.
>=20
> [...]

Partially applied to reset/test, thanks!

[1/3] dt-bindings: reset: Add Apple SoC CIO reset
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D5b428d8ecf10
[2/3] reset: Add Apple SoC CIO reset driver
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D6547df06b982

regards
Philipp

