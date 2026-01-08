Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985D0D185FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8UJ8c/YdbF7K7cam1fQP7rJ2G+VG0sxNQemUdaEvgE=; b=zGsHE0NE/PZ6LAfgzBRQggOqKH
	bjil8Ps/OWyntFAYvB5UAetUP1Xz2o9IcF5vIqWb0xiJw8MVN6RK9MWbsU/qmefWPO/62pQ3jxewh
	dhAN63hrMIwAfBEL3Iwz3qFzuuS9gX6bBqP4q6iAOA8oNPQkNYRwyV4cSeDtJ5NedtcaGFwFCWUfF
	VHL+xTZ+0wP5j2eTYHdH5Al/3iY8+nT/ACvayIRKE71zaXXKT1/AYM+J+0CxchWU46HtEyxrcAqCx
	NqQkjJ6abrqDnA8K0XFJSsGsteXZqQXsB0veLtH+AViRdp3o+9PMfM9JGRWmGROCIO3BqCr9/77Us
	OuJRRPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqU0-0000000HF9M-0jOs;
	Thu, 08 Jan 2026 13:55:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqTy-0000000HF8T-0BQy;
	Thu, 08 Jan 2026 13:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=G8UJ8c/YdbF7K7cam1fQP7rJ2G+VG0sxNQemUdaEvgE=; b=2on3GKlU5bki7VzOeETLHDYUaP
	ArDx0fY+yaTtcnAfKuUrhHZ83nAt2SQF2TeOydKhWAtMhKL5uAFfRhkC755kz9HxjEPKg+BNZnaNf
	FX2tvJth+t2V/a0kOHN0xrBMlQxb6OxCqqJOJpu4dI4BWTNgVq58AochQdbDQ58HjrX+EFMSRbI5y
	UoN8chwJvjg5rehokBF6XGEcML0GbPeR+hr1scJo5Hdg6mpLkAkLHIoMkvSPDWEbFOSFKh04DzaHt
	nU8A36wOBr1f4fR8Ba30gDnIh7N7N22cWqG7rJit5FtfuXC4pjSSA2K3iEHiMfsePKwfzlM5DSFOu
	EAO6E2Rg==;
Received: from i53875a63.versanet.de ([83.135.90.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdqTa-001VS8-9b; Thu, 08 Jan 2026 14:54:58 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: naoki@radxa.com, Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: remove RTC for Radxa E52C
Date: Thu, 08 Jan 2026 14:54:57 +0100
Message-ID: <2090167.kXSN5OTJKJ@diego>
In-Reply-To: <20260108123008.134323-1-amadeus@jmu.edu.cn>
References: <6547200DD4E67155+b1fb1848-2f11-4b3e-b556-9386373d23f1@radxa.com>
 <20260108123008.134323-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_055522_107743_752070D2 
X-CRM114-Status: GOOD (  11.01  )
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

Am Donnerstag, 8. Januar 2026, 13:30:08 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chukun Pan:
> > V1.209 and later should have RTC. What version do you have?
>=20
> # hexdump -C /sys/bus/i2c/devices/0-0050/eeprom
> 00000070  0c 00 00 00 01 00 56 31  2e 32 30 38 00 00 89 0b  |......V1.208=
=2E...|
>=20
> How should we handle the older versions?

I think we might want an dt-overlay for this.

As the value can be read from the eeprom, you could even add code to the
board in u-boot to set the "fdtoverlay" variable automatically for extlinux.


Heiko



