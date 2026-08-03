Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8E6C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 19:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQ5Wh6YqZ0YUgSt9/Q6fF0vjT09TafwrRAFtKaGqcZ8=; b=r+d/RJz5/rXqVvBBtRs4JBskW9
	4dfGcz0PMJZNXM5XA7JLmakq8EMXXTE6zaQutzXjsF/lDKYXbfH203IGd7ep3HQW40lOIm2sxFU+c
	DAppPpuYHVpQBdS1NVy5wxS1DNmxBr8hRgwE2K2jia1yY90pO2Oq2Pdb0fufyy5gK0j2NAPo49Jxd
	1D8sYxq42cu7mEtoHJ19vwuWFpuuwt4PKCX93mfsMgRP1NnTRLq5sT9V30URCXmo/ruWb4QVzh/mY
	J1uXNNHjF20jhYeIvVSUJUAHYqAGOIewIuQapPOWP+rihebyNuVdoR2njVELMPNamglIEFfVqYfgf
	yJDpjvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyeK-00000000SKz-1lFX;
	Mon, 03 Aug 2026 19:48:36 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyeI-00000000SKN-1dl7;
	Mon, 03 Aug 2026 19:48:36 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 07707C0000F4;
	Mon,  3 Aug 2026 12:48:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 07707C0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785786511;
	bh=ySQCAZcnRsbzAlSj5gSQtev7QJxmxZ1Dlv8+V9kSRGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=et7NKpTkdioeBbQXNvoO5BbjGZb8DyujC8abUpIjXF7WX+rElnbhxac2sAxPpf/I9
	 3z4tPnVMGGb8n+0bwndzJSPBebO3rATooXVLBzc370g8i7xDyXSFdugtlf11Mcy+0a
	 w5CYMMnOTqRTFxAEuccS6H5nz4n4HF+rosxAlDm8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 979E9A9A;
	Mon,  3 Aug 2026 12:48:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: broadcom: bcm2712: adjust display status
Date: Mon,  3 Aug 2026 12:48:30 -0700
Message-ID: <20260803194830.2964919-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801165430.598302-1-pbrobinson@gmail.com>
References: <20260801165430.598302-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_124834_531274_94E75A81 
X-CRM114-Status: GOOD (  11.17  )
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

On Sat,  1 Aug 2026 17:54:26 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> Typically non critical IP in a SoC are disabled by
> default in the SoC .dtsi and enabled on board specific
> configs. There are usecases, such as some CM5 carrier
> boards, where display output may not be desired or
> connected. So disable them on the SoC .dtsi and enable
> them on the RPi5 board.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

