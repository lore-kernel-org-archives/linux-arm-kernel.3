Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F63C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/U2AS4ZxsJjRkMZL54cjrDONk9BBrppnYkpWzLE06s=; b=WHV5FRvCW59xArzoywP1iHU/8z
	u+t1EAulMt1Yji8WrZoiilIthrVaoU3fA4GOCGCzIQ3hNtUz2gzPtTAbUgjrSU2jzmloMxx3Jkh+y
	4ry2p0eN2MBHAAi+O4OyRGnofpsqZYWSloYne7YMqVEMzKHLvDkJUaVH+S3MscDVblO1aoxQkHOxm
	4fllWJrP647DTVDbEMIiz6P2vUCWa9MYoG2+hq2wBW/ZKnc3jY8WUWsZkt3A7xRaJdksdxf8DSOdk
	Vb8SEI4h5MjjsRcTNQv3eLBrqbpV1RxuM92PAE4J+h9vU+NTm730nrpmk27/fWkVKNkJzIWHhcOC6
	Z+4Nr1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOFJ-00000003Llk-38Nx;
	Mon, 27 Jul 2026 16:32:05 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOFH-00000003Lku-02HD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:32:04 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 66F84C0000E5;
	Mon, 27 Jul 2026 09:32:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 66F84C0000E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785169921;
	bh=2/RO3nDJR9AMWgwvPqAnyU3swl7joPnEBTu6AxeDEAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSRnAGjHpOHUKuVMFKpFp/sMeAPCFgKNKjpLPJ3RvC+ZDxCqByS3kEEndmlgXctAV
	 cX04Uq553v/WIlVQykcT5zcii5Yc6ZKNOPCQlia4l9EraQwKGmAOzGVTdCR4Y1ihif
	 j8KkAaeEhw5C9yuEG5grBXY6oNlhI0O+1VSORtE8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3C736ACC;
	Mon, 27 Jul 2026 09:32:01 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
Date: Mon, 27 Jul 2026 09:32:00 -0700
Message-ID: <20260727163200.1087374-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628231049.1248899-1-rosenp@gmail.com>
References: <20260628231049.1248899-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093203_066675_C0F15F71 
X-CRM114-Status: UNSURE (   8.91  )
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

On Sun, 28 Jun 2026 16:10:49 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Fixes:
> 
> [ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_nvram_probe+0x400/0x480
> [ 0.182159] Unexpected (big) NVRAM size: 1056112 B
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

