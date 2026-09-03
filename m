Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70CEC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suQtsULUdI32lW4zM+h66SPw4UUxtZyuP0lpSL8kHx4=; b=Wau7zp13e4E9bo9aP6y4U7up3r
	bP1sp8G4PizvfhWaUXBXFZflrSm/D/CgwZSVGAMUvKiNKWNpAU4Lx3legQ/pPv/c5XNUdfBeRZofr
	haS9iB9VcrZxryDE93JpxTeLZBE9sYR+/F2ijhmaEVWw12ERUqmPdFhC3/x7i4XFoctqZ4wsPgi8u
	wDl11mKfEuaHAZK0WNDyXaQRi/gLOrjRkry5g5XxOk7sJ2EU7A5cQO8/gMuELl6xm2YHIB7jNzYiR
	LntXOZLTjWY9QIE52yiIIXokDAkjyK12788o+XLdmzBV/R4OHJmPF9LMiWlfPkBuW6Qey4dl6n8QA
	/dOUPgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dfk-00000000WtN-2Alj;
	Thu, 03 Sep 2026 20:04:32 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dfi-00000000Wsv-2T7O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:04:32 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 755B0C0000F8;
	Thu,  3 Sep 2026 13:04:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 755B0C0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788465869;
	bh=3y7n9zGFhvv+h/PR5gozbr1TAGtRRuth6oAg6boeVCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OA5l7yJiZCpIFOA+Lp9PfMst0InYBfjOoQUvX0w7Ptzu+6fz2gFWkxskuLuVhNL0L
	 NjwbO5fg1mBujF4YXPHPqMw3jjLd8HEX1FwD0TD34Oe6faBh8Z9y4vyq1Mo4FUUTjp
	 xfWVdSEv39eRoVh4/k+CRdQmBJMtiIDZNSF+4MIY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 158D7A9A;
	Thu,  3 Sep 2026 13:04:29 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: add LAN WMAC
Date: Thu,  3 Sep 2026 13:04:28 -0700
Message-ID: <20260903200428.2042690-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805190640.7957-1-rosenp@gmail.com>
References: <20260805190640.7957-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_130430_686810_5AAF6262 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed,  5 Aug 2026 12:06:40 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Make it clear what the MAC is relative to the others, which already have
> nvmem definitions.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

