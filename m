Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CC1CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tx82nXcNwoZBDaSltchd88wfYFzbl1TA2nlVTrEqhtg=; b=L+N4iJqWEp+3R4hUx8qZmD6jxd
	uLt81pvDIVg8wfminyGgeDSiwy+EMO24gfKgdo87gaS0mLitttr5vq46AXWcmwcT7zYm6qM9wvAAh
	RBgNMoPZ7ketLu+SYACIMz5MBAJMakBiLyhi+TFnYxgAK6vTxp05UOSOgvXdBEewAfj1dow/h07EM
	9G3qY66yTbaSlfDXCj9tlkVt891XPXBQcAN8thitb5gKSbJN0c+volkfsAy3YIUn6qlhpsb5tgwWN
	FuB6XuEGPg47d2E9bIbwGKKN28YSrMKDt9okf+5D/69zfMPe2bCbit6gQ9OFPPsEJnEMsJSIdHk5T
	2DlY2SNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUapT-0000000E4ZV-39b2;
	Wed, 03 Jun 2026 01:55:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUapQ-0000000E4Yt-2P1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780451730;
	bh=tx82nXcNwoZBDaSltchd88wfYFzbl1TA2nlVTrEqhtg=;
	h=Subject:From:To:Cc:Date;
	b=bCn2zoTloqOxxDig5JmDUJm6foeRhBtzOX06v24QuFpeEjX86wYXplBnnTpBJPJfk
	 ih1moDj6u1KxTKfjvzvsxivMT6Z6NWmGeAvVsWM0ujjYUrseXUDfxszU6lg5YSXDaV
	 OvPbBIHLJZxAP33hcJOscqqQxTFfYEatcUIG93f222aVOm8igbNg8LOJMEoR0OXYxi
	 S7Y+FwoafaPjMtHQPCSt/Dhvk5CwhDZJ40NoP3qpw6nPJpmK7CJnqX96gA0oTzyVPS
	 5L19RZvH4Qrv9rUOIdrNLqRo5qXDYG45kKZdoLaxUwk1BMH/lFw4U+C5qVgYilnpc9
	 GV8o/lchiUpAg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 302CA60087;
	Wed,  3 Jun 2026 09:55:30 +0800 (AWST)
Message-ID: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 11:25:29 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_185532_802425_9A5C241A 
X-CRM114-Status: UNSURE (   5.22  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-7.2-devicetree-0

for you to fetch changes up to eae82b6e8c2399892e145195cae9aaa0b960fdaf:

  arm64: dts: nuvoton: Add Ethernet nodes (2026-05-18 23:18:01 +0930)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for v7.2

Just the one patch adding ethernet nodes for the MA35D1 development board.

----------------------------------------------------------------
Joey Lu (1):
      arm64: dts: nuvoton: Add Ethernet nodes

 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 25 +++++++++++++++++++++=
++++
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 24 +++++++++++++++++++++=
+++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 52 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)


