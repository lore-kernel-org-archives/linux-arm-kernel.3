Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08145C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtf8WpApSyaKuQAHx2tfmS1qYnx/i76pELfIV4tLlRc=; b=m0FhcGfmdeYHO/TOUj5k7hopzF
	/nPMlsarPCY1jTwcd3uIt5p9MnD+/OxNfFRr2OmdXcW4H5mBx0hWpUsNBQu2DLgUAcvqwAEW7NDq1
	Jokjf0lsgTmR3bS8vY0z7ldTWzm8lKigwqfWPAEPdOaniTuOSTZCLUpyqwOxe2JGjziCUdFIvOvIF
	aOv7SP3nnyEv1vmj7hEMpKVW9R8MBxt9RFo4eSSEwn2o9NxJ5MGCDwaeXP2fcBvIHcitQlV5Nbx79
	QDT8up+fBGqQe0NiThOR/i0vp+Sy2fKIJl0mXSjmNtb25RhCMy+C4OIghHkpp2re12SRcNqj74tZ8
	uaGq73jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBw8P-00000007Wym-27B4;
	Mon, 05 May 2025 13:45:29 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBw1t-00000007WHK-1ZeR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:38:46 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 01F27C003AA6;
	Mon,  5 May 2025 06:38:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 01F27C003AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746452323;
	bh=Y02v5bYxenlB869PlIG1Dt7fc3hTw8UXdBFKM/hXjHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m68hHy0eZqLEutbdL47gj9Oi0Sy77lOaPdRNrqNmAAeSJW8sAYNzf+MAGu287mgEt
	 HBgt1cMb9R388l0JlemdtXAewCCSGIi3ptiTOmhr1hexrbYpQYWk9Q6GiebKbUZ9eq
	 VYD9byfL1htrLqQPMcHO10FhvrWV1Yuab8acdk7Q=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 8FAB618000847;
	Mon,  5 May 2025 06:38:42 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd rev)
Date: Mon,  5 May 2025 06:38:42 -0700
Message-ID: <20250505133842.1140765-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418143307.59235-3-wahrenst@gmx.net>
References: <20250418143307.59235-1-wahrenst@gmx.net> <20250418143307.59235-3-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_063845_527176_A9533436 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, 18 Apr 2025 16:33:06 +0200, Stefan Wahren <wahrenst@gmx.net> wrote:
> The Raspberry Pi 2 (2nd rev) has the BCM2837 SoC instead of the
> BCM2836. Except of this the configuration of the board is same
> as the predecessor (no WLAN, no BT).
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

