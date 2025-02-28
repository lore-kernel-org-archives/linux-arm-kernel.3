Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB2C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7n26wdVU8SQRbAvpWaWjoeRo0iE4FcXJm+y2KLzS584=; b=SdFCiqon+GPXll/q8kN0GDLAU0
	RjPCpA05M6ufkNlNYm0WXbZ8+KhGeE9+4mqL0QSre9cQoMwsNAbAijNqV5SwpNK6vERj1hEf8fern
	D4RQIbjLvG+hOIhMQEM8a3QmyoVSbfKP8YBeO6rDryIISVPfK2rYa2qd0R8/PjDRWEelpwksThJG9
	xMhCIyV2Ngb34wgk1tGhsGPWG0/YeKpt5F+B6CExeqv7c5AMj4c7jLmRQW81Wm9vuJTH6jYh81FJj
	vyxA6a8WcQzvKmt4CONtpQkPXQeHJvVLHZ3AAZ1HLQPcML4F8p6JpWs/HxU1eA7yBNSm0B67LL2ah
	Q0EoB58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0Ga-0000000B3aU-2puo;
	Fri, 28 Feb 2025 13:19:00 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0DO-0000000B2qC-49Z6;
	Fri, 28 Feb 2025 13:15:44 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740748538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7n26wdVU8SQRbAvpWaWjoeRo0iE4FcXJm+y2KLzS584=;
	b=iPwmjfn+AoIhFiehSak7UatH7pEhF6iMh9rHX3pGtsEzmY8aLCnaoX8+5lTYtfqTWk5XpS
	B67LQgX4EyBGv9f5AhyXr4ZgWd1bMpgchsopcmhqpYbTQxAJgq2aDTYxwrNW0Wsy3v4y7T
	eiFPrke0MReCjoVI0fho2vJfj0gXAx1H1PpPDS6ZEyiamx7KVF0trP3TolHGXe82Fe4uRj
	/r8OxfXk9uUfurrcSCXagZE1ncA/X6iApONGpB5A5QyAwnGTSpYGGvqMvs2VXjyedijnAl
	fIfvdrU1jBTdX36F3u/GCJmV79P0It0aO2YD+TlrBcSRd3DyqCb0O8q+YzuYEg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [PATCH 0/2] Slightly improve hardware description of Pine64 RockPro64
Date: Fri, 28 Feb 2025 14:15:27 +0100
Message-Id: <cover.1740748439.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_051543_173006_E57CDF91 
X-CRM114-Status: UNSURE (   8.04  )
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

This is a small series that introduces small improvements to the way
Pine64 RockPro64 [1] single-board-computer is described in the DT files.
This applies to both production-run revisions of the RockPro64.

The introduced improvements boil down to eliminating some warnings from
the kernel log, by adding a previously undefined regulator and by adding
some missing references to the regulators.  The PCI Express patch from
this series may actually result in some improvements, but the jury is
still out;  the patch itself is perfectly safe in the meantime.

[1] https://wiki.pine64.org/wiki/ROCKPro64

Dragan Simic (2):
  arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
  arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board
    dtsi

 .../boot/dts/rockchip/rk3399-rockpro64.dtsi      | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)


