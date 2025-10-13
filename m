Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA2CCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 22:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkjYWJRZ8BxtAqiUXkln222K7WFG+8n4AKa+Z11rdx4=; b=qc+QKsjyZSPF53eQTlYTJb0wHI
	I/3Cok8fRAVPYn5rQdVw6K97nm6/0iYCy/7gz7HwwrkAFMzrIBWj5UhtR5A9kK9a2MJpfTjstLYFt
	5caVTaGB2X5mPlhoFaHErVeD7gV/mdTHcDxE6S0r68EEOVMZ630T/iciGGJebDFcuq2RwGyOOfCjc
	41xR52wYFf6fjmPf9kqdh13eIeW1TU9pAQEFbvLB9HgC+sPgjodjK8G5azxwoGfA00QzSwZnUqf7j
	RflzE2j7oENXbdgounTS4Fw7Ey9Y0rtrOLGcU4AkKyff7oxe1jADIAg+T8rNz19+51hss+mT2d9Z2
	j8xL5bFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8h-0000000Ehy6-2e7F;
	Mon, 13 Oct 2025 22:35:35 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8e-0000000EhxV-409l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 22:35:34 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AEB8DC0000EE;
	Mon, 13 Oct 2025 15:35:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AEB8DC0000EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1760394930;
	bh=y8kvHBT5GSm5R27fl479Rj//1SH77XIhCp7ul1dMu5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VbfFnw/KGSBEly/Jt8Zdog1d26I3LQo2BUV3++o5yEFOPdxJ9rw1euz7hPbMAh8UM
	 ekVjVpxYNtW+Gc1ySzxjJ3baSmWdoWKR74+BXLMQeUO+xPw/uTbHFLf8S+Msh6CE40
	 lhurU9YxgY1TMIEKP7kOq5WmVVKf3fIHvzQ5GRME=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7E8361800051E;
	Mon, 13 Oct 2025 15:35:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY
Date: Mon, 13 Oct 2025 15:35:30 -0700
Message-ID: <20251013223530.2518756-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002194852.13929-1-zajec5@gmail.com>
References: <20251002194852.13929-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_153533_038479_234C421A 
X-CRM114-Status: UNSURE (   9.08  )
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

On Thu,  2 Oct 2025 21:48:52 +0200, Rafał Miłecki <zajec5@gmail.com> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Luxul XAP-1440 has BCM54210E PHY at address 25.
> 
> Fixes: 44ad82078069 ("ARM: dts: BCM53573: Fix Ethernet info for Luxul devices")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

