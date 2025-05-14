Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDA9C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SywIgVZ5ki37fpvEs3Za7rXaxD1amf+VenIKyJpYJGU=; b=dhiGalCBwo4AQAs5whOvRGhCpV
	k1RLRnDmmAp+apqFIs86V0z1eP0LjS9xMbc5JQ9OE7lMQlJye/p9p2p1pYz1al8D1XSBKXDbPgv5t
	oO+kSkkrHCVPTKWDphewnexvDm5BuTiZTlTVlQvBkGlnOPgYaiD7nBOLtQDaD3aPTFna1jv8AQpCq
	4Lz/VfqtMsLn31TcIWvBNzhMVrcpSmXBEKKtPleHlf2/BRExg/Phgnn2TOoOYZ+5c8W32ZQSHBXCH
	1NOYpMu7UZzp4xieuf9J0wY8upyCKqzEN1PtQYPcJdQd1l70x+3VMl8LfiPaN9ftf54kPAiTVnPUa
	NjIB7gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCiT-0000000FMFs-2yeI;
	Wed, 14 May 2025 14:04:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQH-0000000EuOk-1YN6;
	Wed, 14 May 2025 11:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BA005C33C4;
	Wed, 14 May 2025 11:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0020CC4CEF2;
	Wed, 14 May 2025 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222636;
	bh=IT/rqqrN2B02eom0BK/jGdQZGK6p0WHtvFi4frRfS/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G9dyxvtHbzkDZp37KAkz/bk9eZrJuA4owLh1i0aK7CCyKTwVbSIa/hmSbYRCuI8mK
	 H4awQBdyBtq8MsSxrJw3EO0X3dzioCUT0kc0oCUZomfrT70yFrF3aTraEyUgg8zfMr
	 O8AeU9F11KMojNH+jHg7N4V6HH5uUHZ7jZcNQg7e558Vhc9XC/ljwLQswKCAaPCb48
	 gpRoZdVgCcJ6CrMjFTJFodr6Mjll3O6w1ulintDW8sje5eG/LntgU406ON6LlnerJb
	 I7ccDsDCcWDvUYtt5yd7Uj16dsJaGwMbst0k0u3XuDDaW/PJqeQxd2LBBzDNaJ661f
	 I1jLaMQJkD3Zg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, sjakhade@cadence.com, yamonkar@cadence.com, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srk@ti.com
In-Reply-To: <20250411055743.623135-1-s-vadapalli@ti.com>
References: <20250411055743.623135-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] dt-bindings: phy: cadence-torrent: enable
 PHY_TYPE_USXGMII
Message-Id: <174722263362.85510.16134406396198337787.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_043717_454275_028EDEE7 
X-CRM114-Status: UNSURE (   5.24  )
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


On Fri, 11 Apr 2025 11:27:43 +0530, Siddharth Vadapalli wrote:
> The Cadence Torrent SERDES supports USXGMII protocol. Hence, update the
> bindings to allow PHY_TYPE_USXGMII. Since PHY_TYPE_USXGMII has the value
> of "12" while the existing maximum allowed PHY TYPE is "9", switch back to
> using "enum" property in the bindings to account for this discontinuity.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: cadence-torrent: enable PHY_TYPE_USXGMII
      commit: e00c9aea31035f46b04a13effaa801f8b3419d2a

Best regards,
-- 
~Vinod



