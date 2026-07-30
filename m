Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A32C55172
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+vAmv8lTFS1JUAqW3kAUAxDA8ka/TDsoYUr0yBhGa4=; b=sBJcWJ+z6Ra+0gRtPLQRVLMySH
	YLvRCDXkChAUubl6044Sl1sTSyhdSmoNB5iJ8iPcvMLkWHueMngUJOPCoEe5Qsp5spCMG7I9F8Ljp
	sVx2NIWsbz8bKxM3ETmluHn7pi2ZWWBUXlb0iYAL1InTta37kLAY8uBGWziWvWcdoEJcWYQFg3zEh
	1TvFMR1Iod+YWJR+rERbtyT5y0ifmFBoGLn6slZL7IC+Xyjnv51ar7rQylXTOQ4913SH7EnU0zMV/
	Ul+EnWuP7VTRSM6GHUuiY+R2HvXgcmhQy0p6lCCO1vFNvdReci0uFCxy07E3OrYfDDQMtcAuzYHWM
	UpKZuAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa9g-0000000BV1b-39Ci;
	Thu, 30 Jul 2026 23:27:12 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa9c-0000000BV0W-2xkp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:27:12 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2C4D2C000970;
	Thu, 30 Jul 2026 16:27:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2C4D2C000970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785454028;
	bh=JUzHp1d+axrQc5biwf37xUXaO88UNr0hscqy4oY9U8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XaTvHw4SDp0bpquhInHT9hiA9caSduealch8cFeljZX1Q967QIfuHnCLx4ZS0pWIY
	 BLeuLjfisgpmDunwaFSqcqY+NYE7zyYQQlGPSx/DPbP0jmT0UV7FbC2NWitp97yV8a
	 FmYpp9oigryavWqBG2e5HU9Nbbdf4mHFr56umNsQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 02BBEAD9;
	Thu, 30 Jul 2026 16:27:08 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: add wifi definitions
Date: Thu, 30 Jul 2026 16:27:07 -0700
Message-ID: <20260730232707.2707061-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727225446.267097-1-rosenp@gmail.com>
References: <20260727225446.267097-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162710_760914_6B5BA01E 
X-CRM114-Status: GOOD (  10.65  )
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

On Mon, 27 Jul 2026 15:54:46 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
> some of them for proper operation.
> 
> Also add an nvmem definition for the MAC addresses.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

