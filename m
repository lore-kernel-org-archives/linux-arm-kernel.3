Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E79DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 01:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts1zobpCK/euzxoCBpLogZaK0KIVWRAOk6N20EwhcMI=; b=qKlrYSM+w0k7uLkODta1+uMvtH
	GREEDxZPdrt+JwVC0Fwpx4+sI/ZhSHT9JK7DUCrwWJJSgCMW0p6jtgrYKXn4Kzm4ByYyjOUxCBT6u
	kbBMT/WFf+Tz0YRMi4QDZiUwuxjyT1QyVDmOAKRXszNZhrUEdHrMWn2YKfC7aGFbZMLi+rdZX4GPP
	3tHBl1M0/tJa8kP+/hL9vnaGkoK6e4AL79+sdvFnstzIv2KKGz6IgnbW+UW3VsjttsgvRw+moQj1z
	4jLoaphjc+dik3CJ0Ibqg/5GgB6VjkTxz7Dbi1TJ8Da8nSm+lDnybF2EcGD1J4zSSKqX6EZFiKFmd
	9SmbAw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCBQ-00000001o05-3EGv;
	Fri, 08 Aug 2025 01:46:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukC8s-00000001nmp-0zEJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 01:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754617407;
	bh=Ts1zobpCK/euzxoCBpLogZaK0KIVWRAOk6N20EwhcMI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FHNEVcw7jWORt5mo5EgNeEBRd3dIcoL/5kB5U83zUl1HwD6KeiVLYcBokMPbHCaRg
	 6ou1vmExWaWE4rBAJGHNlNxdP3/FMMFy90TxLwoalnTh6qt5N5xhvfW772Dm9NGC9d
	 LUBTPFp8nDLlQHHPmoJM6lu+4PIc3rxgXNdLYBdqWwaUEtNqZ5Qo3eVBeffXksgC3F
	 0Z2/E8U0GKsbHniDdgYZF/c7JarjK8Tjz6YjeeEOiJ8RpiJRu2c+un7bYjU2vKKh+j
	 pEgcpXsLnrXnhuezZEdoX5wCWvLrAPO1L03W15Rq/jxkmRhcasVvZp19MKTZiLKvHc
	 +iHss2W0MA6DA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8234A6AF39;
	Fri,  8 Aug 2025 09:43:22 +0800 (AWST)
Message-ID: <f1aaeb371eb0c753e6ace45e5e1ce5ccd73a0f76.camel@codeconstruct.com.au>
Subject: Re: [PATCH v10 0/3] ARM: dts: Add support for Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com, Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 08 Aug 2025 11:13:21 +0930
In-Reply-To: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
References: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_184334_465904_C9299961 
X-CRM114-Status: GOOD (  10.54  )
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

Hi Leo,

On Fri, 2025-08-01 at 16:22 +0800, Leo Wang wrote:
> This series adds initial support for the Meta Clemente BMC based on
> the
> ASPEED AST2600 SoC.
>=20
> Patch 1 documents the compatible string.
> Patch 2 adds the device tree for the board.

There are now three patches :)

However, the main concern is that these do not apply without fuzz.

Can you please rebase them on the following branch and re-send?

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git aspeed/dt

Thanks,

Andrew

