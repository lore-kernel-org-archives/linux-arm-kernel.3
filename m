Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B64C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wyHoNcgJmB5Q0ptaAAOWxxUuQR2Z8ZDBpSU/EFtoBE=; b=QiHl20CxXyRpbyXuk+wt7R3rs6
	hezN42BFQxXsY7C0pgI23puE4+PcFYA88n+gkYcB3iSMn6xQf77e72yns11sjlLw2oe+JWFYVUnTc
	6P0T+6ZsDveD0m7plp/mvJq46G5ZXOL3fhCyMDCVTgVrmS79LtKXEE6OKdjxfONLklCBBfR4+gvn6
	ueIxBO92lWGAklWP3UiuWjYlDLc/XyzknAm0hfIDtwX+0zNEY1R724Lft/678THpPYuQIvZJr4vJa
	2eT2o5nju6JQWvg/hsP63NR0KlcnOgFPiK/jo0rpCqeoa1n1buuGtk8CbN6T6n4/v/+F9mR1RGxPW
	pzywPObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwCH-00000007XNI-3C6A;
	Mon, 05 May 2025 13:49:29 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBw2E-00000007WIl-0gZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:39:07 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B86C2C00057E;
	Mon,  5 May 2025 06:39:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B86C2C00057E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746452345;
	bh=o5XJ0ORMHY7f8scgbSjvR6Xk0oK+80O29JiSpuvmXwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvb2ot7SVfk6THUHHdgESjrnDpB/Fc61DQTjfNRtYNvyuSn0p1Soop7XywRy07P4Y
	 +svjlwszWWiCMbbDLZsQqG44fntBebFN1yvl6Eukd+ouAcn+OFmfkIBndfcBF3i6Ca
	 du0dK0b6O/rQMskjf9aPb2eYgTD3FyU8KG7Rb7dY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7B097180004FC;
	Mon,  5 May 2025 06:38:35 -0700 (PDT)
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
Subject: Re: [PATCH 1/3] dt-bindings: arm: bcm2835: Add Raspberry Pi 2 (2nd rev)
Date: Mon,  5 May 2025 06:38:34 -0700
Message-ID: <20250505133834.1140684-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418143307.59235-2-wahrenst@gmx.net>
References: <20250418143307.59235-1-wahrenst@gmx.net> <20250418143307.59235-2-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_063906_235583_F8445A87 
X-CRM114-Status: UNSURE (   8.24  )
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

On Fri, 18 Apr 2025 16:33:05 +0200, Stefan Wahren <wahrenst@gmx.net> wrote:
> Add the Raspberry Pi 2 (2nd rev) based on BCM2837 to DT schema.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

