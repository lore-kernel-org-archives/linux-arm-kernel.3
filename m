Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EDDD1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taOOxR5GBghOPO3rw+sprR7WiPXtwHL0J6odXhh4a2A=; b=1kq8PINvVAwcuyptlcJnFCd7U6
	49Oty91TQpd4rn04ejkv+OVljbolvl5xbiV5rLiXKP8opMLDIAde+9CYJtA3ROIiEn8OodNbUyVuD
	6qNJx7j49JeMC7EvltbRWVmRJPjV46wgSzigAdDMajO/MtFxehqi1NgF4fkDy87vHfRB+1rm/Cj8N
	4GL1r25CsSKEFmUWD5wAb63jcYjxHcRAdGRib0ETVf+RkRSDmTgdA27lzD319MULarnwfWnjrC6iq
	ivFDQtgBbfGV2gD/m/+J9/lgcP2/gwW+YxjLHdMZpYycH3/Kt+TGVOzO8iR1y7FXVaRPepWyJBF8R
	HeB3VIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdttf-00000000QgB-0hIq;
	Thu, 08 Jan 2026 17:34:07 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdttQ-00000000QWO-2OHl;
	Thu, 08 Jan 2026 17:34:04 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9291DC05F2B6;
	Thu,  8 Jan 2026 09:33:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9291DC05F2B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893631;
	bh=0dYNCLP+iLu9aUT3nOreZPUXXZNRN/UbIGDKR9EQhcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8u42McTENLIPQAqPdsfDpPiRmh5w0VFOpee+ZLJzgbR3C0HzuSRALpcjm6HECNMp
	 P5tTn5cjdugSjOpXT5+v1o1/8uIjvaOTzjxYpWCalZR0k7mcvMjkVR0eodO3fASJ6z
	 gYMXiGrI5qJf1x0vnauFt2N7jxmecpwDPGZ86thk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 675891CAF4;
	Thu,  8 Jan 2026 09:33:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] arm64: dts: broadcom: Remove unused and undocumented nodes
Date: Thu,  8 Jan 2026 09:33:51 -0800
Message-ID: <20260108173351.3784288-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-4-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-4-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093352_633557_5CFB2062 
X-CRM114-Status: GOOD (  11.65  )
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

On Tue, 06 Jan 2026 20:09:43 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The "silabs,si3226x" and "brcm,bdc-v0.16" nodes have no documentation
> and no driver in the kernel, so remove them. They can be added back with
> proper documentation if there is a need for them.
> 
> Note that if both USB ports have similar memory maps in relationship to
> their USB PHY nodes, it looks like the device controller should have
> been at 0x12000, not 0x21000?
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

