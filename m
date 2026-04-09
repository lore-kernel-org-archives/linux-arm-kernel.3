Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A10E98FAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 05:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PLj+ODN0sQvKbs+LhHHadr4gFJ/fFfDmfKLE7tC0Fa4=; b=ljVpDLlyV0Ri5C9WpKHlQSwZ7P
	xomq1QjWC58kEvrwfojF6J6XQYvWl2JexuOtKTsdlzYcsZ4gV67X+s1jV2CSXYxyBZG6Eu0p2h7Wf
	aABL9UCvobpIq45j80sI4SUUpjF/wLRQm7XxzoyEIjwT0MNEI5uTFstXRDzIL5wYZoHAiDhALHd0Y
	ejEz+UpaxD5Nsft6svtObUbUixGwu2qmp/qzQil2HMLNyi5T59Hd2bwgD6DlYsBlR5hMLYdbI+VeV
	4AqBXav0DtslcM8NAkE1d7NBNSo1QE9R1y/1t4eK+zaZY+JADlPSUAMEd/H9RhtLC4NfgPV5Rwv91
	p5gadi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhWf-00000009hij-1DQm;
	Thu, 09 Apr 2026 05:01:57 +0000
Received: from mo-csw1120.securemx.jp ([210.130.202.131] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhWb-00000009hho-2mA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 05:01:55 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id;i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key2.smx;t=
	1775710898;x=1776920498;bh=IFtQPM0v9f/Ht9CKjEpstDFF8/yEsRtHzWVQ7oLLg2c=;b=L9+
	sxYOi1IiwN0AXCc6tAIsIFFrucFS4L45cbTALuP0Gsv83j/iW3EAeb67JQi0AkMXqJfwOB89HWWDT
	PHS2HVVpy2aPWfpDTakm1/6qzMjd32je4ZzUhXPZcfZVK35IHxfQEVSbVGwHo6HkxCL9nhbqO7qg1
	7jB0tlGm0c53Hiuj6W/J1KJXa/1WOAxbn4q0NeG7iOePbPonHGPFtkdpFIq/rvn1JW3FAGZmMCN48
	rzHAUvGTeJWuOE4lDqLd3V6i9uX0Mj94p07u5agUP1kfgksnGolMGA65TU3nzjekgpLa16Waeqnvx
	qmsJttdgVJ1adNqubtQHeXstoSmaL1g==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 63951cid702274; Thu, 9 Apr 2026 14:01:38 +0900
X-Iguazu-Qid: 2rWh3Ooo9YJKFhWMxT
X-Iguazu-QSIG: v=2; s=0; t=1775710898; q=2rWh3Ooo9YJKFhWMxT; m=O4FMvyWzWZhJO9Lh0QHrXbc2XKPM8LF056CAxSkliv0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4frnpS71rRz1xnf; Thu,  9 Apr 2026 14:01:36 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: jesper.nilsson@axis.com, lars.persson@axis.com
Cc: linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH] arm: artpec: Remove unnecessary semicolons in artpec6_init_machine()
Date: Thu,  9 Apr 2026 14:01:26 +0900
X-TSB-HOP2: ON
Message-Id: <1775710886-13833-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_220154_543375_82DF73B1 
X-CRM114-Status: UNSURE (   8.76  )
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

Remove unnecessary semicolons in artpec6_init_machine().

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
---
 arch/arm/mach-artpec/board-artpec6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-artpec/board-artpec6.c b/arch/arm/mach-artpec/board-artpec6.c
index d3cf3e8603e81..c27e7bbcd7bc2 100644
--- a/arch/arm/mach-artpec/board-artpec6.c
+++ b/arch/arm/mach-artpec/board-artpec6.c
@@ -39,7 +39,7 @@ static void __init artpec6_init_machine(void)
 		 */
 		regmap_write(regmap, ARTPEC6_DMACFG_REGNUM,
 			     ARTPEC6_DMACFG_UARTS_BURST);
-	};
+	}
 }
 
 static void artpec6_l2c310_write_sec(unsigned long val, unsigned reg)
-- 
2.53.0



