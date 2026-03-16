Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F633F53D96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6f/gQrwURzB7ILWpALwI1zH8Az67kiOzrO/jGcKFzA=; b=YQYeBhWXoFgt1CLueoqMVqaBSz
	FU8MENngdry7WHSQLe+PSxXi/uPFdZeR8cPc4IFZ8pDUaUY1NVHpKrfZtNgmtUx68n0zBHo1zoyfx
	co5i1NYwiVHZ78IB1uWH+PaIEhQCi+vMJri0U7HJ31UJ/yS2udCCzLFCup/ZqpNZV00ziIN4/RKBn
	VdNla074a+LcEADSMtqDLCocxMt5LkwWH5O7oXuth9o54cAjNXzFCjCcAvZ6tNLtwXUtcp6sQy3qt
	aKxqbCOQzE793IufPFqlizUdXMHuSq1f1I6NTigHGT1P9cjz7vCvz49Sr8ZGluMMGKCBm9Asa9PCJ
	0Su2iDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Eyc-00000004r2S-2Uag;
	Mon, 16 Mar 2026 20:55:50 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Eya-00000004r1M-3ad7;
	Mon, 16 Mar 2026 20:55:50 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5DACCC0000F4;
	Mon, 16 Mar 2026 13:55:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5DACCC0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773694548;
	bh=+Gypk6LSRZ14nVnMC36x4t9UVeco+9/lK9C5i6Y3Pvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFwsakgwzFNETtgja4PKHvyoPCocMtBS/C2YuRGh9DNA6eNycfMBDx9Q9XlD1RIVm
	 QQKIAhiY5pJH0OC/1wNtfkjIUQ8bh8l18PPjxqos/blbyjaKbLkfGfqRhnn/3KGdYw
	 vIZf05xtckVSJ7CfL02PCpakAEu8Dh6rtElDGNxo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 31390A83;
	Mon, 16 Mar 2026 13:55:48 -0700 (PDT)
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
Subject: Re: [PATCH 3/6] arm64: dts: broadcom: bcm2712: add camera backend node pispbe
Date: Mon, 16 Mar 2026 13:55:47 -0700
Message-ID: <20260316205547.2146896-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226-raspi-dts-updates-v1-3-60832d20ff04@linutronix.de>
References: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de> <20260226-raspi-dts-updates-v1-3-60832d20ff04@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135548_925648_F422B636 
X-CRM114-Status: UNSURE (   8.90  )
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

On Thu, 26 Feb 2026 09:55:56 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The bcm2712 found in the Raspberry Pi 5 has a PiSP Image Signal
> Processor back end image processor.
> 
> Add the relevant node to the devicetree.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

