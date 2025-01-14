Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC508C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIz81kI/0fMkI5oB56yktRNwhAb2ZJ8YqtdzhpZHOqM=; b=JDmwT5CwuvaNrBP91GmA1rPtPz
	WXQRRRHHNTfJi6IgGtXkYBljM+VwrK23bL2k03I1oKCtUbre11715CSX7DPnsmOvuheaUxLkPpZ++
	9NDdJlt7wKk7DtL+zfSkJ/OZDhIL+AQujZf/+LCdUjtxtqbEr2kl6uZfPw9YvFT/5T5VQDBV9vkvN
	gjZa3tjMQ7wnLu+JwUrWUOvSFLrYIzJI8y7hE5vIuAS6ATEAFW5XymJ1O+OOg6ZJWzFDXICSjm1FG
	TYl01pInhcnA/sZ1e9Ud+K5jpgzehQf9ymt2JY0IhvpajHDquXIwZVSjPe+/RKMFlK4S3hhZEUi5M
	bb8ItcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKj-0000000ACyJ-2leK;
	Wed, 15 Jan 2025 00:32:33 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq9K-0000000A4hW-43HM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:16:45 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 603E6C0005D6;
	Tue, 14 Jan 2025 15:16:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 603E6C0005D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1736896599;
	bh=GHB4mfWzXda/HjE9ygllQsgOY46MEAWbTKWXRIwefMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFyansuX9n67Lbxnjx7r+d+sIxaHnUcGiATq7uew/xKHKQ8nv1rpp/BKNNSdJYyxw
	 zD/CedGrv77ag9MTeRP9GMXM6E0u2DwbifKkpzDRGoM//U60+9f8E7ERtI1/ldQiGu
	 au++WEMmHXp7Twdtc+TavMcnIWTODyhcfYNyhFUI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 02A0018041CAC6;
	Tue, 14 Jan 2025 15:16:38 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
Date: Tue, 14 Jan 2025 15:16:38 -0800
Message-ID: <20250114231638.511804-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217193356.111102-1-wahrenst@gmx.net>
References: <20241217193356.111102-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_151643_976412_0FA633E1 
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

On Tue, 17 Dec 2024 20:33:56 +0100, Stefan Wahren <wahrenst@gmx.net> wrote:
> The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
> multiplexing for I2C0") introduced multiplexing for I2C on BCM2711-based
> Raspberry Pi boards. Unfortunately we missed to enable the necessary
> driver in the defconfig.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/linux-devicetree/961b3d43-b4c9-4573-82d7-844aa129d994@notapiano/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/defconfig-arm64/next, thanks!
--
Florian

