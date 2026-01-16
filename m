Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D7AD4A5E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 01:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HcG6roRHulppOKVp44IUXfVxD1WCgauSHg9jEnufi/4=; b=Hjo0K543aKRaNFbujQXfg+z4i8
	/xe0HvONUHn9VPXk+PpVmKEIJBK/cvfwyAnhy7g5nLLDLt1jYpiP7025ekGsul7E1LVMXi/fa3v0E
	tJ49RcVOOJWsRu1+GOH6NyOeTgYz2Umf3KpiQ27L8CM0AP1Cpwv0EuWyOD1HhHevSYiawj9zaYeC8
	m5KwTi4qS6Bnh9RZ/E9zBb/UQydr5QJYz3Mt3F3UcQSRu1sHZZHElvfa11h3jvkJAkm3vGkVr0k+o
	8QVGLnBkI5Y5GrGiQOaAkkdvMz+AlfbaIR72ZODJow8BOigPzmc/DyGET7GKFsT4udoq/6VBfN1fH
	KPZRu96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYeA-0000000DQbP-35eY;
	Fri, 16 Jan 2026 01:29:06 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYe8-0000000DQb3-1VEy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 01:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768526942;
	bh=HcG6roRHulppOKVp44IUXfVxD1WCgauSHg9jEnufi/4=;
	h=Subject:From:To:Cc:Date;
	b=PMjpUz/gqXSNvff0F0vcsit7pow+gc1BByvcDNwYXcc5bbBidqX1cOma3HcKa0I61
	 VA8vm44RGmiq+Icq3bRbZQ5GIJb/cFL8FeL9+95xpN2a71Mx9/awQ2u06XG2tswfOJ
	 SOjoPHrXFkz/l+ASls41f5dos/siIUC+WTPgpsKxfldo6Az+NR06VlNqu4DcCFapuE
	 y7Am5oigSLxuz1Zv0pF0PvGQ7PMDHgMOV5brUYmgZu8Z0hMftycJcKxd47KqJPHL8t
	 iS+JSlMHtiLE+TBHYsGmzP3Z/IoISEVRSR+ximJoOewGUC2K/5jPyhvAuCyhqya8JG
	 EC0EUdIAVns/g==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0757164705;
	Fri, 16 Jan 2026 09:29:01 +0800 (AWST)
Message-ID: <0dddb418ec4d81b30e48a079ecad8a388284cb9f.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: arm64 devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 11:59:01 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_172904_604587_923EDD76 
X-CRM114-Status: UNSURE (   6.36  )
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

Hello SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-6.20-devicetree-0

for you to fetch changes up to c6a40c867467c23d531446c2b11d310b0a6641e7:

  arm64: dts: nuvoton: Add missing "device_type" property on memory node (2=
026-01-08 17:52:13 +1030)

----------------------------------------------------------------
Nuvoton arm64 devicetree changes for 6.20

Just the one patch from Rob adding the device_type property to the memory n=
ode
of the NPCM845 EVB DTS.

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: nuvoton: Add missing "device_type" property on memory nod=
e

 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
 1 file changed, 1 insertion(+)

