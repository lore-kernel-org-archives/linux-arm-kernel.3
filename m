Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB1AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BdGiGyVMQ72W2cxj6XmVpK1LYAs6CckiMLidb3Qg5c8=; b=fI3G3GnjESmtyrWMyapzvvTcUP
	dKDmk80CCn2rNtkxt+DW6OuA3aOScGU/MF0GWCxc7OdjZkt01oHT+OKCA+h13jq81Lxu9eSAoR0UQ
	ZC0TM6W2M2bzNMmnV1P6VDJgWeMCtgqGoo5wZckEkS+5lFqQhrykYuDg65rdXFcwYO95yu+lw0CNp
	OOT2pVllbTlVUQpoRjcPuKx+kNMutqEDVA4e/kuBDDR99DI5w6xHeu8l93Y4qflVu1nVTQm99Rj6I
	kbyW/nJpiWihVWUDuGEbGBOCDlGfJWrUaduoTFT0JF5D7x0H4WvGEdd1rmLJ26bjCkBp0ARzzyztE
	ZqGv+iFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWNu-00000006Hrh-07cI;
	Fri, 21 Feb 2025 17:00:18 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWLK-00000006HOt-1ucZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:57:40 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by laurent.telenet-ops.be with cmsmtp
	id GGxX2E00C0y8aK501GxXFX; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsL-3MQD;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqh-0jKj;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v6.15
Date: Fri, 21 Feb 2025 17:57:21 +0100
Message-ID: <cover.1740156736.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085738_632566_FAE98AE3 
X-CRM114-Status: GOOD (  16.99  )
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.15.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v6.15

    - Supplement DTB with ATAG information, for older boards.

  [GIT PULL 2/5] Renesas ARM SoC updates for v6.15

    - Remove the legacy CMA reservation code on R-Car Gen2, which causes
      issues with highmem.

  [GIT PULL 3/5] Renesas driver updates for v6.15

    - Add a driver for the System Controller on RZ/G3S, RZ/G3E, and
      RZ/V2H.

  [GIT PULL 4/5] Renesas DT binding updates for v6.15

    - Document support for the Yuridenki-Shokai Kakip (based on RZ/V2H)
      and MYIR Remi Pi (based on RZ/G2L) boards,
    - Document support for the RZ/G3E System Controller.

  [GIT PULL 5/5] Renesas DTS updates for v6.15

    - Add support for the second and third Ethernet interfaces on the Gray
      Hawk Single development board,
    - Add Image Signal Processor helper block (FCPVX and VSPX) support for
      the R-Car V3U and V4M SoCs,
    - Add Watchdog and System Controller support for the RZ/G3E SoC and
      the RZ/G3E SMARC Carrier-II EVK development board,
    - Add initial support for the Yuridenki-Shokai Kakip and MYIR Remi Pi
      boards,
    - Add support for the spare UART and PMOD serial ports on the RZ/G3S
      SMARC Carrier II board,
    - Add a CPU Operating Performance Points table for the RZ/G3S SoC,
    - Add boot phase tags on R-Car Gen2/3/4 and RZ/G2 boards,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

