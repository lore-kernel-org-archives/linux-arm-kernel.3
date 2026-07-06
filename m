Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxU8CHzvkTqWab+IeF9EPpfT2XdfzFSqHKpwnRwHBpU=; b=xugy+uyc10hxWY+PnWXmqZEsp+
	t2p2JB1YfodoGtC7ShIPUynEFYvtyFuteKjIvdB7LZ7Inp2fi0XtSlhW9J43AyWJLzsaaZIvKptse
	V2F/9DAKw8vPUhbMOPKiyEafeZxezwesZ62uvn2nIdpRKY8NIUbD049liGeckbUCPxfnKVmTz5qAB
	muQKte8b856z1XYkmFcfdVQ12U6PPoM8G6Bd3dhdAM1pttuimHZFJTt1RZBm33DunqaQB0FgBtZOd
	B4WJ6vDUDV5gyNk2G3ngUWxWbbm7meRxm/CDEcYvppbKvR34QpVijsN3xBm31HxHFA6hh4NCEP1KK
	5tNcXQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgskl-0000000DnWG-37fZ;
	Mon, 06 Jul 2026 23:29:31 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgski-0000000DnVP-1FIf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 23:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: From: Subject: Cc: To: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1783380567;
 bh=yxU8CHzvkTqWab+IeF9EPpfT2XdfzFSqHKpwnRwHBpU=;
 b=C99IDKw7CnTdbLDlnuCaqIs3LwVfqkOroAXJJFE+52dHHsMC0o1Q00r5YK7Gh36q5Z7YmfcOD
 arch1Opc7DhDKfEB91xnmsTRFECnO898uJd8oFn5OcdFaW+5hmDhGVu7n+kx+uyXcFiyyaHdKrC
 aKqlOLsCuSFINJrPtD0yxixQHYmfhut4xGlZxGUMtxJJLnxI0h/UrtqPrhaomrPt91O4R9jvqoW
 017SRadaFZr1atQakd6H7BGqF40o4O/b4lqOMbaCy8BvOlXSK1r4kqpokZ4aXGFGqAiS8TmgUwV
 u2U2x0XAvNKW2btkBSyccJR0qfX3Urq72+PyfnjtKwlQ==
X-Forward-Email-ID: 6a4c3a4e49befa328926c594
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.9.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 06 Jul 2026 19:29:15 -0400
Message-Id: <DJRVN972B27A.XI5EE88SRI89@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Hector Martin" <marcan@marcan.st>
Subject: Re: [PATCH v3 0/3] soc: apple: Add "PMGR misc" power controls
 driver
From: "Joshua Peisach" <jpeisach@ubuntu.com>
X-Mailer: aerc 0.21.0
References: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
In-Reply-To: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_162928_339194_06547CBC 
X-CRM114-Status: GOOD (  13.84  )
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

On Sun Jul 5, 2026 at 4:16 AM EDT, Sasha Finkelstein wrote:
> Certain Apple SoCs have additional power state controls that are using
> a separate "misc" mmio interface. Currently this includes the fabric
> and memory controllers on pro/max/ultra SoCs.
>
> This series adds a driver to put those in a low power state when the
> machine enters sleep. The power savings are SoC-dependent and are
> around 1W.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v3:
> - Remove ability to probe only one control, it is not used anyway
> - Allow building as module
> - Style fixes
> - Link to v2: https://patch.msgid.link/20260703-pmgr-misc-v2-0-4b26ba10c5=
a4@chaosmail.tech
>
> Changes in v2:
> - Error handling fixes
> - Reword binding description
> - Link to v1: https://patch.msgid.link/20260702-pmgr-misc-v1-0-4f075a3a95=
c1@chaosmail.tech
>
> ---
> Hector Martin (1):
>       soc: apple: Add driver for Apple PMGR misc controls
>
> Sasha Finkelstein (2):
>       dt-bindings: soc: apple: Add Apple PMGR misc controls
>       arm64: dts: apple: Add pmgr-misc nodes to t60xx
>
>  Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |=
  45 +++++++++++++++++++++++++++
>  MAINTAINERS                                                            |=
   1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |=
   7 +++++
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |=
   7 +++++
>  drivers/soc/apple/Kconfig                                              |=
  10 ++++++
>  drivers/soc/apple/Makefile                                             |=
   2 ++
>  drivers/soc/apple/apple-pmgr-misc.c                                    |=
 181 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++
>  7 files changed, 253 insertions(+)
> ---
> base-commit: e5d9690657844a2645a518cdf838206f6daf513e
> change-id: 20260702-pmgr-misc-ae1cbd5bc2c7
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>

Seems fine.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

