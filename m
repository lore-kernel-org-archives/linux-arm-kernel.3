Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3700DE6688C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQR1LrYAJHk0nLot5C2EheoBROZ3NMvn/V/SUlpFxWM=; b=zIoaVIKDeGb4b+OUEjZNBslzlp
	KtsY1uNGIKMqt9gCloWmF5dZrueBY4qbRKCoDO4RVjzxsOq94LQAHWNqoR9ZASfY7LO6E+3hqabmw
	NadrlM2YMDlHrvLh4bnsk37EGjUH49v7CIXKtR/SXzFv9WGV6mOhSZKHtoaGrRe2Lx33CHERxVSU6
	tAy3Gj/2GsOE6QqyQnEnDpHvMozguMBXkjMLywFsYObz8hvjRADS7z1oj+pNr44D5PENgoCv1Wl6d
	a7/FH/rkZHH+qEOrjMLIQzEj5CSSbauWsZIatKTfWrybjBoLbnRS2+UU6aEd1jwnziqCkwh3o6s3Z
	2IdplCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhIT-0000000AxWb-2Mxh;
	Fri, 19 Dec 2025 20:41:57 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhIR-0000000AxVd-2CSE;
	Fri, 19 Dec 2025 20:41:57 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 753E6C00151C;
	Fri, 19 Dec 2025 12:41:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 753E6C00151C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1766176914;
	bh=ISXl7+FiT7byRIA7yYlu/U9Iqy0ggNUZUeAGmjheuUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbVe5Fqztrfkb/eY1o38OKuFhq5Pm9ZRhrEECWFJfRKpWe1UU7G/HPOfT0+SqbGwj
	 7oSmYuXG/v7ZH81/JTBINZQwqrNhN4F00+Bauc3KhQ43QvkxMorb3/jAQaVs7B0eMU
	 zHsjC87m7TBUB/orZPOvuM/VI9YNF2POBbtgMAMI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 079DCA340;
	Fri, 19 Dec 2025 12:41:54 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: broadcom: rp1: drop RP1 overlay
Date: Fri, 19 Dec 2025 12:41:53 -0800
Message-ID: <20251219204153.1015582-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <85167b815d41ed9ed690ad239a19de5cd2e8be1c.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com> <85167b815d41ed9ed690ad239a19de5cd2e8be1c.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_124155_636832_5A5C6D4B 
X-CRM114-Status: UNSURE (   8.98  )
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

On Thu, 18 Dec 2025 20:09:09 +0100, Andrea della Porta <andrea.porta@suse.com> wrote:
> RP1 support loaded from overlay has been dropped from the driver and
> the DTB intended to be loaded with the overlay no longer exists.
> 
> Drop unused include file and overlay.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/fixes, thanks!
--
Florian

