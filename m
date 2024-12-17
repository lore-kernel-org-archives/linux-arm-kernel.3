Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7ACE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJEdtk9H1w4g7inT5gUxr6SWCxGibFowu+wh4MuDWkM=; b=orPbirFjiyEJY8GNnybkd8d57y
	P3kNUR4bChdZHuwk0Y2f6/7UrOd0fM7vavLcmvyckW9wqrbY0kFro2SGVO6wuWgbQ3vcDEzbborzX
	y5IdH+NVANes9CFwQUNDb2PrB5pIwK+E8Wl+ja17WZueRnxm5ueWZ5A7xSPAjuUZL8GcALEjAM4Gu
	YOxrHIutR3WDnLInRwmCFvoETIWq8g9Db+f8wazQaFpBXjzEyYleG8nlOGddntecOz/E2H9lAcI53
	uPrHmDfi8eA8I/ItumzZWxXTliLFJAgu5IOy/i74K2eIRQMq895pNKZutW2a46EgjpyE3jfkd5Icd
	jaLh3KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNd2Q-0000000Ebvt-1PCj;
	Tue, 17 Dec 2024 19:15:22 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNd1K-0000000Ebsz-45xE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:14:16 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E2640C000C84;
	Tue, 17 Dec 2024 11:14:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E2640C000C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734462853;
	bh=z3O9X4cCETRNLKQE42m6HIig5AJctABu+gJD9WkgDG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhMd8kkFkRNFj2qmVJ4u8bXmDWWepJhvQ4Wookqg98ljKFkJXAZmN2vCM+7Oq/AVK
	 yKIJeLl7JJVsClJGi266erG+t87u8lKVCDTkdBxjNA9AgiyT+z/2aiwK6oRCNyc4v7
	 p/ddbLHB+SjXG+h9dcg9N570RjKrxqVp1BP37HuI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 786D718041CAC6;
	Tue, 17 Dec 2024 11:14:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: bcm4908: nvmem-layout conversion
Date: Tue, 17 Dec 2024 11:14:12 -0800
Message-ID: <20241217191412.872240-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203233632.184861-1-rosenp@gmail.com>
References: <20241203233632.184861-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_111415_091885_96425109 
X-CRM114-Status: UNSURE (   9.30  )
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

On Tue,  3 Dec 2024 15:36:32 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> nvmem-layout is a more flexible replacement for nvmem-cells.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

