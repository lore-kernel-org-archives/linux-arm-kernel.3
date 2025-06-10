Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B4C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lXimT891c1SD4e/coc/t6TXoaM99Pwhsz+eumaac4E=; b=iv55D2OiUpbHPPvVt+T/y/DnBg
	hTedSpN7qCK/cddcCbo7VR2zbXi2xHRlDVPloajBas7NquMuyY8NrvtRF1k/By/Thsry26Nf2zsgU
	6uRih+7JO173OGEGBBWlG1/2ySbBgQE3DdNxS91CF6M+MhvLR0IGpKmxBrcBq3zfbk2lxnJI8AWXA
	7/LZdampS1RJhkaMO161ji/FckOKyshX70/WTh9iQDuMZHDvDGE88Hccx7xfilc+V4xOqR/S+wF4S
	29ZEVNNnrqtgiHlII3aNqaSCv1XH1drqrgCP8Bb0BIpunsGtqGrjN94UBdnzsbd7jPnQjmlRwrA1D
	F4CeKhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lU-00000008F9b-13be;
	Tue, 10 Jun 2025 22:48:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP36m-00000007hO6-2lvR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:50:02 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 92749C0000D0;
	Tue, 10 Jun 2025 10:49:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 92749C0000D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749577798;
	bh=pU2TVlS9NicsYGkGcp7LE0teQgsE61GXl4hYMMJ+Hso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AkXZAxeSTF7vkZR2y2qGfiH1/j1xhYv3XH6G6PCpaiOwgXhtvDdLNNarmnqkvPYcP
	 5R4IvqyCX/R0/DS/36bP4NMWzORddlzJQxxSWVeQDyGXkF5wfh818a09O1OkI75v/6
	 kBXBqw7waXQTwL5EPZyrN+BHjYldOFEOsPatHggw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6DA2018000A5F;
	Tue, 10 Jun 2025 10:49:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent"
Date: Tue, 10 Jun 2025 10:49:57 -0700
Message-ID: <20250610174958.3482215-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609203705.2852500-1-robh@kernel.org>
References: <20250609203705.2852500-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_105000_726266_1BE336D5 
X-CRM114-Status: UNSURE (   9.95  )
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

On Mon,  9 Jun 2025 15:37:04 -0500, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The default interrupt parent is a parent node containing
> "#interrupt-cells", so an explicit "interrupt-parent" is not necessary.
> 
> Fixes these dtschema warnings:
> 
> (arm,gic-400): v2m@70000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@60000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@50000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@40000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@30000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@20000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@10000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@0: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

