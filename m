Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4587E83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfHw/qUUbQI4q1yfXdORbiPN85R9FCfM+zoYKC5U2Cs=; b=rp2ocgDmh7KxgQN+xAa/JI2m6i
	pG0AT81eXjSKUz+3J1pUKHjCmwWzlM5/cSCVsFCe6Lm78+dLpdqltwGlgCecYI9nAOAxn5dGxxATS
	y3hw912ht6GlEYQKUa7jlxH7B+vrvFd4Xa8u5JShk7UqM9MOqSbHl6U8QbvVU23zDfmjGmDiI3i9r
	+mUdhqOtAc236F4V8nllOg4DAVG8pDmRR4IWvCUVDBEjwCuWDkx0UgfD9UzCnCIBQc3EJmLETCrUy
	tXKloPerhwvkBj1q7oFxt/yg++97lgNCoq5rXxXZ+XLu54RVOLp2FUWyeNxIt8DGtcAzN8SjyAqUG
	rLrUKHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnha2-00000008vbU-1CTS;
	Wed, 04 Feb 2026 18:26:22 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhZz-00000008vaE-31Mn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:26:21 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8359BC0065C6;
	Wed,  4 Feb 2026 10:26:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8359BC0065C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770229578;
	bh=U3kKq6AeheDTj29tSB4X7ZOi6cLa040ZVTTBNLcAZ9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f70doQmn7P9+oB+N8RzTZiQF2tmp7TaVjYeDzBNotsKLy9tWFJ6lWbjogXsT+u/QC
	 tw4fhwHH4YE5zYwLHG/2I+mU98eqQE+q12NxGPjck0+1+TN70Qai+iuH5jnnsDqCA7
	 K3+lN03yPKcmdk1hd/UPbbyimvD3imCGBhocVd4A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1CDCD1B858;
	Wed,  4 Feb 2026 10:26:18 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	zajec5@gmail.com
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller compatible
Date: Wed,  4 Feb 2026 10:26:17 -0800
Message-ID: <20260204182617.1154751-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204091530.624230-1-miquel.raynal@bootlin.com>
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_102619_829310_9F3123D7 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed,  4 Feb 2026 10:15:30 +0100, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Fix the dtbs_check warning introduced when the brcm,brcmnand fallback
> compatible got removed for iProc machines.
> 
> Fixes: 4db35366d6dc ("dt-bindings: mtd: brcm,brcmnand: Drop "brcm,brcmnand" compatible for iProc")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

