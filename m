Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCDDE668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuILljQP5oWYxicxJ9TlAei8hdsqRl+7mqldjJvR5pY=; b=Rlwsvh7flZAFHV2LIpZ+mFMWXu
	gRrrbMuC2kh5gE8HlBmZ1ztlv7ypZDd3tvrub/64FRfFBYgYgfkEn9WA9Qz99YXwXT6nzjNdlb/Xj
	lMZWRr5F8zh5SMtjdc9MHhJ1yQsT3FQaVxvvRoFna73WLsQsab24UxvBOJqVQQT2VFr9PVDqlPzee
	OwU4EuDxY93p91Dxd/TTgJLO6tK2qkYPok8TBnasZIyiECikBUrNVFh7gwdaJF2WDRWjcWokuzDcC
	8GJA7jhVLWIggz8mSMPlzQa6z8LIvCr2sdoQQw/PiZr8xDM2KqZAkwkQuOmTPownImOQha0udHA1R
	wq0KWstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGhO-00000006RIh-0TR6;
	Sun, 24 Nov 2024 17:47:06 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGft-00000006R7J-0PLA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:45:34 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4372AC000C6E;
	Sun, 24 Nov 2024 09:45:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4372AC000C6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470332;
	bh=KJiwNKB+6HY4s6PD4bB+NeEGvWMCyutvgtWEsQJTrvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbZTG1Mkb0L/Jx10XXxz7b6ZTbbN8ncH9TAxu3AwewBIkWOT+sMwAKfPZtKCIrP4w
	 YFYGPPcjt820H3YJ4g6xLTjl59uB7A8oOf4Wy5e72PBB2ugkanqrq1wgZ23yrgV+by
	 MiC0NkL/FEVyeHrM2CVBxYu6j7EytreyBk0IM0SM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D296718041CAC6;
	Sun, 24 Nov 2024 09:45:31 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: dts: broadcom: Remove unused and undocumented properties
Date: Sun, 24 Nov 2024 09:45:31 -0800
Message-ID: <20241124174531.716317-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241115193904.3624350-1-robh@kernel.org>
References: <20241115193904.3624350-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_094533_208903_B0059955 
X-CRM114-Status: GOOD (  10.03  )
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

On Fri, 15 Nov 2024 13:39:01 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> Remove properties which are both unused in the kernel and undocumented.
> Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

