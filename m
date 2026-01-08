Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB0ED1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJI6Yz7PO4qZY89AxBdpHKm6XLaYA7eWiX3LDKCw+5M=; b=fAUe4CSlB7eezfQmLgC9UBwMuH
	Gb+QtMBTgtwdUlk0FKRq0fsl+l0osdAGiWGdPdxV+bzBxY7V9i4ug2+/f6IS/R4IHUZhItdSR8xXr
	X6xUBT6/jKwRhgXOTC+LMFISFPMM9InAfyhS0n70GPYS2prIWWcqQogrJ4SZDPEBAA4ZD8rk9KF9P
	4WCExaIhRiKoilJ9avHZX9/WG92Jb6rCshfDRPvIVdxo6ePOzXVJQr7TMo5RgHPJZQcQXxNEFOpbY
	dcszRKKl3FqXnSXoFBYsM3gtIlop5F0exv0EZY2DHFAwkxN205d1vih+ti6zVikp43R7mIMQCfM0N
	YXCQcuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtv2-00000000RTj-0SMD;
	Thu, 08 Jan 2026 17:35:33 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtut-00000000RQX-1QBm;
	Thu, 08 Jan 2026 17:35:25 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E7F1FC000C61;
	Thu,  8 Jan 2026 09:35:21 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E7F1FC000C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893722;
	bh=6IRUQ4VrJOK9hh2AtecX8rTBLEv+hZNTsgrBT1wo9cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RE++dxZaZ6HMJDRAE0qcLqEhyjLntO9GcnDlNe+szWeSepsVMDOmpGINoSDwHtYqF
	 f31H3sFnfXehgvSz5hgZpEhyPS0z0dsDaAZUqF+yraxkyK6ho791kixEdL7AnbdbLk
	 ZcNVCYKrB8GM8RkAHWi3NpW3AGePUHGUoWVAFlOo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 8720E1CAF5;
	Thu,  8 Jan 2026 09:35:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] arm64: dts: broadcom: ns2-svk: Use non-deprecated at25 properties
Date: Thu,  8 Jan 2026 09:35:21 -0800
Message-ID: <20260108173521.3784904-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-9-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-9-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093524_411043_3431F546 
X-CRM114-Status: UNSURE (   8.96  )
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

On Tue, 06 Jan 2026 20:09:48 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The at25,* properties have been deprecated since 2012. This board wasn't
> upstream until 2014, so it should be safe to switch over to the "new"
> properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

