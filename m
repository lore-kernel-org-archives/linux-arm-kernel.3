Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF1AC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7CIxp+l5MECOPxVN0jimE1PwbWGeYvkhnCVaEe9UeY=; b=2zqphQI7moUFeJYQAShPZGJfrx
	k0xq02QUcmrMRUlsVmgn1tX79fp4jdruf0qXQC2qRyTasb6Xhhs8rvWOqMK2j90QKM01CRWbsbHUo
	nCP2KntzTN2MbFYKzRjPS7vD+a0iH1PluglWHsCP3q7DeM+cGAOi4p4MBDD0ABthjGbVQtEPLzKwo
	/Cmt2ZvYaYb/X89w0L/abObQEW7rN4OvyZ4ctQAqHeRDEkCLHaHfRTQg1xogbVsdaLf77gR+ES+Jc
	eREru/1cxg7TNV+SW3Ery1iPCJieXeQe4d+0YH0FhXJc2EXoUXEQBrtpS7YDZcXBOOLnpdjLQFDoE
	OpLfCH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt14Z-0000000AE3E-2B57;
	Sun, 09 Aug 2026 10:48:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt14W-0000000AE2g-3HPr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:48:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C7CC4E4117C;
	Sun,  9 Aug 2026 10:48:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 194A76033B;
	Sun,  9 Aug 2026 10:48:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 885E111C489E6;
	Sun,  9 Aug 2026 12:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786272477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7CIxp+l5MECOPxVN0jimE1PwbWGeYvkhnCVaEe9UeY=;
	b=N2NCMho/Ypy7Hzhs6KIxnF5v3QUvFQ+WwGreDJwRo0jdx9R6gIqXI3u75axucsgseiBlGs
	fwnnuytw1/WDUgjD/JqBTR0kpc/Xqsxl3yQKMM+33Ny+quohujFjF0L3/pP6T/VcA33RDH
	eePLun6Pk60UJDCOIDgMG3XQvixdF8Q71QBDn3x0iIlg+3GjkcNJZ77LWz2uDTyaVWwTVg
	Sxug6n3ljWx45TnNY4BXIr9mI/gxWJRlNt+F6OhBJLjrNOFtIXcPk0Jh18rkC2860jsKDT
	V19ZNSaUIW2F1HC15xBuh13X2pfsHdmd/MXAuPDX2IC2GmazATgv9qa7DUWlpQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 0/3] ARM: dts: helios4: add regulator supplies
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
Date: Sun, 09 Aug 2026 12:47:55 +0200
Message-ID: <871pc7muxw.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_034804_963654_8C7C56F9 
X-CRM114-Status: UNSURE (   7.73  )
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

Hi Rosen Penev,

> This series adds missing vcc-supply properties to the EEPROM and GPIO
> expander on the Helios4, adds SATA regulator supplies.
>
> v2: remove thermal patch
>
> Rosen Penev (3):
>   ARM: dts: helios4: add vcc-supply to EEPROM
>   ARM: dts: helios4: add vcc-supply to GPIO expander
>   ARM: dts: helios4: add SATA regulator supplies
>

Applied on mvebu/dt

Thanks,

Gregory


>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

