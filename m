Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B37BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCFp2lYeOoGPK6j9Vs/BGohOlR1yzjoa4BcTTKDuiC0=; b=1YG5PCA8kB4CZsF2pBd7ZX/MWS
	ioCnFyfYdHtoh0pz0oiWw9uM9Z2/5bl1JrFTqBAgtgrLLUo2xx4PZDo9YENYFYY247gebmCz7Mn2C
	sQA16yXVmdn53jJkfRHS8v5dQ7gb7l7uJNsqt3WIE+Wc/Qt34C+jHbu90XX41VsFNDNucuoz5YmSZ
	kgjdBOqQk5iS+c+hgdPVPODxJY4kIWElkn7Y9g5VMR8YhuI+bduZoQJc/3hPrAkxAL4iGewNqlbxB
	EUBmhlaLl402Dd5gHJ3qca7QnwC+7CWu/W7MIGw5fO7GFOBSX72GVoxFbgIgUnGVgFWWqzvivFSZp
	PLVFjBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQu9-00000004LaK-0MP3;
	Fri, 09 May 2025 16:48:57 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOcn-00000003w6u-3CQv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:22:55 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by albert.telenet-ops.be with cmsmtp
	id n2No2E00T3X0DE5062NoaL; Fri, 09 May 2025 16:22:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Nh-3HGe;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADD-1V9W;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM defconfig updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:27 +0200
Message-ID: <cover.1746798748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072253_937979_7BBCC82B 
X-CRM114-Status: GOOD (  16.34  )
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

This is my second pull request for the inclusion of Renesas SoC updates
for v6.16.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.16 (take two)

    - Enable modular support for the Renesas RZ/G2L GPT and MSIOF sound in
      the ARM64 defconfig,
    - Enable more support for RZN1D-DB/EB in shmobile_defconfig.

  [GIT PULL 2/3] Renesas driver updates for v6.16 (take two)

    - Cover all R-Car drivers in the ARM/RISC-V/RENESAS ARCHITECTURE
      maintainer entry,
    - Identify the Renesas RZ/V2N (R9A09G056) SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.16 (take two)

    - Add CANFD support for the RZ/G3E SoC and the RZ/G3E SMARC Carrier-II
      EVK development board,
    - Add support for Ethernet port A, 9-pin D-sub serial, and USB on the
      RZN1D-DB and RZN1D-EB development and expansion boards,
    - Add sound support for the Retronix Sparrow Hawk board,
    - Add General PWM Timer (GPT) support for the RZ/G2L and RZ/V2L SoCs
      and SMARC EVK boards,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

