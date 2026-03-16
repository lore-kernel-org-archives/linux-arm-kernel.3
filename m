Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8B0F53D96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js+mzh8ZNhq3w/AcBR3Whr4acaGKiAFnevczA7GoXDI=; b=f/Dtf66ZxYkdP/jMqlo3exlBBH
	r1Z+A0nNGL2d/nC/cKzr4N4po/cl47ZQzSu6kT3Ee/v4CVg/Q42H1w3UId+M6WM44nLalCKNKqfrj
	OV9liME8Bq0K3pdpmWEPcvZHDjo9bPPrADqsTg4bGMWTgVRTdM19yRORCZfpp5PQdUJruMJQyE2LK
	3j3IYQA8bEOElRwFLbjJVtlqWyM0WuWZxXjvuB/v4Dn7og85CwwRU6PV8JOdKMrnKczicD0uk1lQF
	OOYs1NMeEUzk/r2dTHWcyJIQtKLVhxgquz8t0M5EkHmellYSyNtq/zgfvn9iglfIXuwSbyvRe345M
	WOSE2iPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ExZ-00000004qm1-0LBd;
	Mon, 16 Mar 2026 20:54:45 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ExV-00000004qlF-3Q0p;
	Mon, 16 Mar 2026 20:54:43 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 944D6C0003EE;
	Mon, 16 Mar 2026 13:54:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 944D6C0003EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773694480;
	bh=fME5uma5DRFBzqVFOQIaRvnVYLilkqikxECnajS70uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7MJkuuXWpnqpP4qWr0x0IDCaXUPq7jU69ic4z5eHiVCgsi+/MK9Bg91HpGjjlIwj
	 RTzTkXVTBRr96uOe8DG97KsA2m4+5dg5AGJPBrkaeQOtUqh8vFJqYHdxrFp93TC8Bc
	 8IICXdREzJMpiS4QyZJ8PIQrqKlrsWQaenhauuOc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 30258A83;
	Mon, 16 Mar 2026 13:54:40 -0700 (PDT)
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
Subject: Re: [PATCH 1/6] arm64: dts: broadcom: rp1: add i2c controller
Date: Mon, 16 Mar 2026 13:54:39 -0700
Message-ID: <20260316205439.2146628-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226-raspi-dts-updates-v1-1-60832d20ff04@linutronix.de>
References: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de> <20260226-raspi-dts-updates-v1-1-60832d20ff04@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135441_927093_7BEB9A5F 
X-CRM114-Status: UNSURE (   8.47  )
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

On Thu, 26 Feb 2026 09:55:54 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The RaspberryPi 5 has 7 designware-i2c I2C controller on the RP1
> chipset.
> 
> Add the relevant nodes to the devicetree.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

