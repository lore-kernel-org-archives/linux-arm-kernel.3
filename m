Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/eirAxQalaii/uid6/Wqo2nQvbr2ZxwACfAXn5KczM=; b=QgxkMTBrjBS7fDoo315YvgswBm
	EBH0PR8+fSoVFEyds+daat+7kgbvaUYYTr4YCXLj9TsedlOjKitWvDHQgr/V21N/WU6A1hZjiS0Xa
	MsPMMbA1+9MK4Z2HjF+jqPKV1IVp6/nAzliLUECbAg+dWcp8ndJit7b4e0+mvmTpBMqoJGDDz52G/
	cQEYXJfHIqaR61C38CVzwhjrhmoT2jOT5X1G6j7d47q/5bf/VWmVP0UhLsn58QF/0IQf24lbo6plP
	5reYJGaq3I5cpBXTPSlMqTV5NFEcZBXexBDhGEY6CZnBs5Uadtp49y4yNQGk6hU0KBEs1Y7y6E2wg
	V2Q8razA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DOF-00000000VRV-3oT3;
	Thu, 03 Sep 2026 19:46:27 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DOD-00000000VQm-29Qv;
	Thu, 03 Sep 2026 19:46:26 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 26FE6C0000CE;
	Thu,  3 Sep 2026 12:46:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 26FE6C0000CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464785;
	bh=uHPojPE8uTxvqYvxf0QC0QEyxmavZ55R5St8vUJd738=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYJiow2a2l+9RsOFaChDDgM6xkZ81TXgn+If9Khu3VsCKsn2TnpQc9+B4jdBgWd2M
	 Tgu77ma8xqj7KCByeJ4HkdUegP+CDyl/e0RqxES75o+3S2KiTu6L5ZNYIPbeeKBOvw
	 peiuXtjL3gOzB7YvImv7aOBvDWYs2flbbT+WXk+o=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EF1A0A9A;
	Thu,  3 Sep 2026 12:46:24 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: rp1: add spi controller
Date: Thu,  3 Sep 2026 12:46:24 -0700
Message-ID: <20260903194624.2038562-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811-bcm2712-spi-v1-1-4c1708d354bb@linutronix.de>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de> <20260811-bcm2712-spi-v1-1-4c1708d354bb@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_124625_566368_803FCEED 
X-CRM114-Status: UNSURE (   9.39  )
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

On Tue, 11 Aug 2026 18:04:15 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The rp1 processor found on the Raspberry Pi 5 has nine Synchronous
> Serial Interfaces.
> 
> Add the relevant nodes to the devicetree.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

