Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4691D68BFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2rhcVqQ3gOj0D2uwbGC/hSv3INJNZTunbq1oAlWn0w=; b=nIrEfkA9Rd1AAXw2/d/D7jFopN
	dRXdiKesmrbwsFfx4b6Txx2zumxBFzLBcS7PaQUalX+J4/H+4z4cEDHd2ltaZf1NjPNsXlDBotiT6
	Ck2IOaMWrFY9NIiujPUCTBKijw9iEqyrHrwSqvyaiV7mC0GUj1eKiQ5Ytf44p/TcNl5NIYh35joP4
	lHZbqms74LHXwKLLv+ToFhy0Na65t+/Jx56veJFKtqgP0sh96Gx9T1GLtaEqcksJYMWrQq7yoAYDB
	RkacePPP91OawK2bhNbCK7NWePoWgV9KPZzh/kJkXR2cum5bplRvp9kQQc/WZBAYLexZikV5TcdIf
	RJL4doIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGyT-00000006Tb2-1qWo;
	Sun, 24 Nov 2024 18:04:45 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGr2-00000006SOY-25Us
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:57:05 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B4057C0005C6;
	Sun, 24 Nov 2024 09:57:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B4057C0005C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732471023;
	bh=N36m4qf0vHUJME/BGWozQi52Ppm7rtH1eadVRTL7itw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IxpkEali8i4S2LiHQdJ1LYooXb3+eufGcBdQSgtKFEMm0PDE/wHPHHRhCxOt85Gn9
	 kK6SYPAsZFy5PTL68GMe6qVy04/Tc5SXgGrHA1i+7M5/qXJ7mHL6DPfAHiVIaYGVU0
	 lV+UzEg5gCqFzqdMCjraK0eldMAz5LdS3F526tUU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 4BF3D18041CAC6;
	Sun, 24 Nov 2024 09:57:03 -0800 (PST)
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
	Sam Edwards <CFSworks@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: bcmbca: Add Zyxel EX3510-B based on BCM4906
Date: Sun, 24 Nov 2024 09:57:02 -0800
Message-ID: <20241124175703.718707-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009215454.1449508-2-CFSworks@gmail.com>
References: <20241009215454.1449508-1-CFSworks@gmail.com> <20241009215454.1449508-2-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095704_610067_BBBA8896 
X-CRM114-Status: GOOD (  10.24  )
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

On Wed,  9 Oct 2024 14:54:53 -0700, Sam Edwards <cfsworks@gmail.com> wrote:
> This is a series (EX3510-B0 and EX3510-B1) of residential gateways based
> on BCM4906, a stripped-down version of the BCM4908 SoC. Although Zyxel's
> marketing materials call this a "series," the EX3510-B1 appears to be a
> very minor revision of the EX3510-B0, with only changes that are
> transparent to software. As far as Linux is concerned, this "series"
> effectively represents a single model.
> 
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

