Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8072AE668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJbv8XLF2L0kTbdJQI/KPS0a4buS5AM1QyuGgQWSO4o=; b=q3byWAv7i3OdMwyor4+ps8iaqZ
	qD/LnsX5JIsqgGXUFiLIQFcol95+o6EST+8uW8S1IhGb7f+d61z+L96J0D5i2aPlgQkN1R5ZEnaae
	RTznmpGHrUTKLkje6v6xF3J7NWCr8yzXORhQGnRp/AgKm/XeragqVtNn4+1vy+J7bHe71vxtm3JH+
	ljWs5obW2C9dn8m+M1A1QLiT4wyjzbc/JhE+zXuCoxFHwgpLhplRlDypjbyDX4ZDERlAK21Lyh0gv
	BSupAjqd1GLG0fmOMfT/UjmC0mQrfmIgoqLIfGx1jA9hv4zHWIcVBu/Nk7JEevPSkdgszyc/1VMNJ
	zCm5CsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGxX-00000006TVA-49j0;
	Sun, 24 Nov 2024 18:03:47 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGqm-00000006SJW-1oxr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:56:49 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AA4E8C0005C8;
	Sun, 24 Nov 2024 09:56:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AA4E8C0005C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732471007;
	bh=/SBvytuI9Z8C816Rqt15Wi0YXl1GGrYWQ5VrqPQ7zo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FumobubJ1/5491nB19drdCy132s7Rvt351SdSQ1/GvBUNODMl/Lq+X+xx0AUOdPdr
	 GnsQKjVM4kaj9+yuEpYBZhVYU1YAwmTAcdWB5+p9AKD9uuR0u2TzdGRfCigMkM3qw4
	 lXPcgUI/I0XGMxmjnu3XCKIcwK7eQOR4iv59OIGs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 472C018041CAC6;
	Sun, 24 Nov 2024 09:56:47 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sam Edwards <cfsworks@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcmbca: bcm4908: Protect cpu-release-addr
Date: Sun, 24 Nov 2024 09:56:47 -0800
Message-ID: <20241124175647.718610-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005050155.61103-3-CFSworks@gmail.com>
References: <20241005050155.61103-1-CFSworks@gmail.com> <20241005050155.61103-3-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095648_543004_E3F41FF0 
X-CRM114-Status: GOOD (  16.20  )
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

On Fri,  4 Oct 2024 22:01:55 -0700, Sam Edwards <cfsworks@gmail.com> wrote:
> The `cpu-release-addr` property is relevant only when the "spin-table"
> enable method is used. It is the physical address where the bootloader
> expects Linux to write the secondary CPU entry point's physical address.
> On this platform, only the CFE bootloader uses this method: U-Boot uses
> PSCI instead.
> 
> CFE actually walks the FDT to learn this address, so we're free to put
> it wherever we want. We only need to make sure that it goes in a
> reserved-memory block so that writing to it during early boot does not
> risk conflicting with an unrelated memory allocation: this was not done.
> 
> Since the previous patch reserved the first page of memory for CFE's
> secondary-CPU init stub, which is actually much smaller than a page,
> just put this address at the end of that page and it shall be so
> protected.
> 
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

