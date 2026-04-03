Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C437CE7E348
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xwQFTLyur5H+E/ecDZXyPFLcjgsddNgZpITPoKJi25Y=; b=uaFDAlhLR8hdlyw7UbgquiZMTK
	QSQWTHL4+O1Y+wG/pClgdWso7/95GHBCJIpeMOIZpabNkB2cH/Rjlysg/1VXLCP83SaFeUcVHLk0U
	Uwq+qFxlts6LDVCpduWbSuGt3oxvFOn8DU6+fWakDCxelKBrwIKmG8DPYNQcU6DE8RvYHSQ8IaHlr
	EyZUh+kM/A9i7H2E7cldQFfqLRqE1Ywuq/8bJvieQLG39xaw5bYP285C2afdvapm53fFdkn8t/4lk
	glt/at8Cu+c0h0R2D9Adgs9dK3fiYUx8YLroPq5xb6Cki1Xb48Be2hsnjWWEPS/WjttKXGr236ZSu
	K/VdJSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a62-00000001jIP-2j72;
	Fri, 03 Apr 2026 08:41:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a5z-00000001jHD-1p0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A04B42E01;
	Fri,  3 Apr 2026 08:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDD9C4CEF7;
	Fri,  3 Apr 2026 08:41:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Date: Fri,  3 Apr 2026 10:41:28 +0200
Message-ID: <cover.1775205358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_014139_530556_A01F2671 
X-CRM114-Status: GOOD (  15.14  )
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

	Hi all,

This patch series contains miscellaneous improvements for SCMI quirk
handling and SCMI instance iteration.

Thanks for your comments!

Geert Uytterhoeven (3):
  firmware: arm_scmi: quirk: Improve quirk range parsing
  firmware: arm_scmi: quirk: Simplify quirk table iteration
  firmware: arm_scmi: Convert to list_for_each_entry()

 drivers/firmware/arm_scmi/driver.c |  4 +---
 drivers/firmware/arm_scmi/quirks.c | 15 ++++++---------
 2 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

