Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB42C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lGlrgmKyBVX12G/toLShWKvZESZbcoGJW2/gYz4nQo=; b=kj22KymvjcZ73E0pagGtDeOwx1
	RIn7MPY7i9C6OMCFf5OSC5g4AfOt4arBe/P44mrZzPrbJeC7V3zH5fzZgiqG8lhjjJvh9vMnPEZKJ
	qbSgXrObASyQjpccshUSmJ5P5V16TKlVVpuTosqBNyt0S8RLzVyn8f3U9oiPb0YrbPmtyCYRAk2hl
	9HSSAa2fLxpoyAkj9D01BtNBiv9MWelJwB79gBoQ8r5RNjE56W5aHRgRr1hqA2thFdyr4eCgjr1X8
	hyUm5SBlmME7oxsNBvDlDLj+pGQ/U0iy0s1bl3A7FIfZF1NoC5jOswU44Ds/CYl8xpzgJ7xdUb7B4
	JkEjfk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cNj-00000003OaG-2lgk;
	Fri, 04 Sep 2026 22:27:35 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cNg-00000003OZk-26pF;
	Fri, 04 Sep 2026 22:27:33 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 46FF1C0005C4;
	Fri,  4 Sep 2026 15:27:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 46FF1C0005C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788560849;
	bh=EJhdUrXD00ZbYc4XnfZ7oS7rGZrbaRH6yr75sgQ/3o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hfOrBTOPT/4YSNAX6QhTJ2MH4v60PJ9s5fmK5IzyvFqWNRqgJINuit6DpsW+QMI0C
	 rc1ZSYwXg8mwimWOKSTxdFhbx5WBb7BZzGTg+m8tbQrB1Kd9h7n+vIU1YW2TWuTdRb
	 CiDYZ/hH7Nzjst4Z1jYwHuVrTyM5kWrPtiSOX0D8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C8498A9A;
	Fri,  4 Sep 2026 15:27:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface
Date: Fri,  4 Sep 2026 15:27:28 -0700
Message-ID: <20260904222728.105465-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_152732_632134_CFD0D595 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 04 Sep 2026 11:24:24 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> the spi interface.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

