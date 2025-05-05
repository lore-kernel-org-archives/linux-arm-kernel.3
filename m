Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FE0C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngd4R0MSajso2Cz4x2Gaw7M9KpoyfqpnC+Gqxpib8Ew=; b=VAkpF9it40RiloOUzTItldCGlE
	HVt+SB5dmWdOAe1pPPh4dfzrOGsINw7U1KvJD6ulJjaXle1VpawWMhIdGRc/JqdeugTicJZ21FcRI
	msZfhnbYigMvWfljExwa3fWKgt3wHEueqL2DqMNWAkCzflISgIjhBGgpsHy8NUvpadJNRl+I0Sxwf
	450NtGEMn0deC6qVSPr9xLtryylxbDIa9nqYUfYfEwV3a173P2AtbNYUGAinLhgqhmLNxeRfb8t/A
	ZAbn8KuvE08+Awn9GWXM9g0hu0zGUgIzEoxE0H9C4iyz9b0JR3Gk3pK5aEw9lFuEzf2kkSxtCEjhp
	k20hRUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwAL-00000007XBR-3TsY;
	Mon, 05 May 2025 13:47:29 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBw27-00000007WIK-2wCd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:39:01 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9EBA9C000907;
	Mon,  5 May 2025 06:38:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9EBA9C000907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746452336;
	bh=gMioFIAUZaQoL1UVj8FghoejDT8EHwOCyQJXBYdyvZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2C4wR13GmL44/GtN3HKKIXQcIgoJv9MMMFKydnUSt4VnkQ0yZBQja7ULivWnuOKC
	 /AQvKssQBRzWmJ/kq3wqXG2wmpUQR1JkjR6WdwoRiY47gTUcHIrV2PNW0mFYZQMFmA
	 +3sNJ9oLDiZ8GgS9IcITh1bhVexe6fj+VBHgdubc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6C4AD18000847;
	Mon,  5 May 2025 06:38:56 -0700 (PDT)
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
Subject: Re: [PATCH 3/3] arm64: dts: bcm: Add reference to RPi 2 (2nd rev)
Date: Mon,  5 May 2025 06:38:56 -0700
Message-ID: <20250505133856.1140890-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418143307.59235-4-wahrenst@gmx.net>
References: <20250418143307.59235-1-wahrenst@gmx.net> <20250418143307.59235-4-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_063859_764564_D5013703 
X-CRM114-Status: UNSURE (   9.69  )
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

On Fri, 18 Apr 2025 16:33:07 +0200, Stefan Wahren <wahrenst@gmx.net> wrote:
> This adds a reference to the dts of the Raspberry Pi 2 (2nd rev),
> so we don't need to maintain the content in arm64.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

