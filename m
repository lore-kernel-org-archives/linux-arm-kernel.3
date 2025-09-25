Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B826BCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HoC1o4MfPBIZ3BC/SdhLJ7TQDPk+ZK1/mu2Gdv7m98=; b=QvZGrKW56VnvCAXP3N2k3WhDwf
	n3dXk+jE8rADN4l3NtcBBGddAtyzAU4TrcjFzUSjEsCPLDyZDgzq3jYKRwvbLIkrXX0ywFsuw1mTN
	CbQ/09S5m8eIlSvkW2utpWQHwSswZ/HCnE6N/oHGpOUhWtcvI3DWwVNBuw7V0cptwcc5id1mY44eT
	G9wlevysVv1Nwux4UkYD/wC1KIulBG+sbeo4hKsFPF/n41ESqT6deePNfmt3rs5+h2K/eg7ApRCTp
	LkmgtZYM7LR84XhCs9S3jSP5Z+OIMDMeIFdmf4lFYQR2Ux1oUvGlw1RLFTC8k+pbZqY0m+1kqJsS8
	AGUe1H9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1t4j-0000000CxUJ-1nga;
	Thu, 25 Sep 2025 21:00:25 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1t4g-0000000CxSp-2rPL;
	Thu, 25 Sep 2025 21:00:24 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3E531C0004BF;
	Thu, 25 Sep 2025 14:00:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3E531C0004BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1758834020;
	bh=emhJbpw7KeIbphJtE7IGAQyXN9ZnMgLLd3yCyh/4Yd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sz8ejj9PqzABzxMxEt9n0FqilIfQcWyms64jAD0i9GB2l+er3aaV9ngGAIlxrWrQR
	 vhIgrA8ZeLUGnbKwV7o0B5hrTnSisLTkor+VfBm2cck4SHMCMhDPAFb0TMOfgFNsBX
	 jW5WB+KVjfUmEatesm6c0Gza4v6L95rDskOQPWps=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 04EE318000530;
	Thu, 25 Sep 2025 14:00:19 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Define VGIC interrupt
Date: Thu, 25 Sep 2025 14:00:19 -0700
Message-ID: <20250925210019.1381542-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924085612.1039247-1-pbrobinson@gmail.com>
References: <20250924085612.1039247-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_140022_774918_928221C3 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, 24 Sep 2025 09:56:05 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> Define the interrupt in the GICv2 for vGIC so KVM
> can be used, it was missed from the original upstream
> DTB for some reason.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Fixes: faa3381267d0 ("arm64: dts: broadcom: Add minimal support for Raspberry Pi 5")
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/fixes, thanks!
--
Florian

