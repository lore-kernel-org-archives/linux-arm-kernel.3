Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2758DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hWoh/r/xrMOhs2u9hguYY4e8oiDTAcNiFZVKMNhZCs=; b=qcdVrbbA2JUCesZ3qwyN2ZNWL2
	TmmHkF3+PXPwWSW124SlJ7mZnI4XGxWmUXhT3PquKQkCKYkjpP94mPJVovV3GXHpnn5PfXTxQawvI
	D4Fs4Kw+sSrc+vnenmoJHFua9nhi4R3JNt4pHTN9WTtVrzUF/fE0h+x1JVJG+TP4OMbJIPchf6eRu
	pbmmcxdyX5w94p17+03J5gB9B2gWh5rMlijNX9oZ+mslCPnhy7Fb5H17HiN6fMbaICfEkZeAJUc0A
	seU2L7IDROv4wrVoY6SUkLq+OUCJNIBFOfqZE23URPuaiGCDaGg3tlYpYVSbDAXC1M6gWrrFIcthr
	tY5HVetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua97q-0000000E8fG-0wIb;
	Fri, 11 Jul 2025 08:28:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Qg-0000000E0v7-27H1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A01A4A54CC7;
	Fri, 11 Jul 2025 07:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DB7C4CEED;
	Fri, 11 Jul 2025 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219861;
	bh=mJ8f0o4lu7/7z2kky8W5rnqHSfBhvDECmO3dfujPoko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K577jTrmkOxDdg3Tnq0u8ziyEvFSwFZMaHhSd1j+ngRE/JDj6+K15g4c+5VMx56Bx
	 WS1jufZqmt3z94c/LrQuyxIMjzGE55ioQl+ofJPsLPOObRIa8/VipCbc42GRG2pKfK
	 cC78IdNJSvS3XAWWxC6FTQjycJomYzCFcLBzGqkXJY7YFQCSnlRXneWsxdWq4IpYwr
	 wFdEEJgTI35efM+LTgFw0GfmWo3sgg+14J1FztUcTki6KCm4KrohC6ivf255CNTFw6
	 Q960jQGwIaKXKjCRZTuB1AumE5T33HX7fFA3KwmIxWVc1AnoV6JM8pN7D2XhYNkuHR
	 FfOUwBedIQA6g==
Date: Fri, 11 Jul 2025 09:44:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 06/12] dt-bindings: pinctrl: deprecate SIUL2 pinctrl
 bindings
Message-ID: <20250711-inquisitive-dainty-foxhound-6feeb4@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_004422_610450_94C20DD4 
X-CRM114-Status: GOOD (  12.16  )
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

On Thu, Jul 10, 2025 at 05:20:29PM +0300, Andrei Stefanescu wrote:
> The existing SIUL2 pinctrl bindings don't correctly describe the
> hardware. The SIUL2 module also offers GPIO control and exposes some
> registers which contain information about the SoC. Adding drivers for
> these functionalities would result in incorrect bindings with a lot of
> carved out regions for registers. For more details see the discussions
> on the community [1] and [2].
> 
> The existing SIUL2 pinctrl dt-bindings will be deprecated. The new SIUL2
> MFD dt-bindings are to be used from now on.
> 
> [1] -
> https://lore.kernel.org/linux-gpio/20241003-overall-unblended-7139b17eae23@spud/
> [2] -
> https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/

After fast glance I see only nvmem is outside and missing in these
bindings. I don't see a problem nvmem being a separate device node, so I
don't see justification for dropping old bindings.

Anyway, bring the full raltionale here - describe the memory layout
proving that you cannot add nvmem and GPIO in your system without
breaking ABI or without making this binding unreadable.

Best regards,
Krzysztof


