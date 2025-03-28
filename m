Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE5AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7sWk6+gH+xPv6hWsk9jKOmxnq0d/4WfddQq/XyS6Q8=; b=YXgyTq6IsB/RrsjOo9rG8Thge/
	yXOBr8iuY3glm3899nyV9iQLUaN0mUVWBpjzm2HTNPc/A9BAl5oVDzEI/ue/qyJF1Am/ZgVt1uIzd
	uK6YJ44dZNNRpXIquo+YvM6Ybhv6pHyG6Vrw5fIgKrSZFz//s/ZoN2tHpR7XqkXdAW7crm6Zl/6S4
	iDfS6/WO3TNk9jT2JopHFLuAn520o/X8LATTbI+pqKRndASXbmEv5wwiRoD75NrAzjl4uvOo0TGBr
	DETNSc+PuTb4pxe+C6bN0F6ijojLriBV32CBWRjCZ/5s6bIdGiLifyxEpzDHJu7r7kb7jXnxoz3y1
	1EecuThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6tU-0000000D7VU-0EVq;
	Fri, 28 Mar 2025 10:24:56 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6rh-0000000D7Jb-3JjR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743157383; bh=L7sWk6+gH+xPv6hWsk9jKOmxnq0d/4WfddQq/XyS6Q8=;
	h=From:To:Cc:Subject:Date;
	b=WZ/XOZ5niWH36wxsVjrgp8Lcr7CWAvAPDsdwPAxEmHGUk+VpZfIH3j5ne9BGuYPKm
	 mxhV7ijETBKmE/Zn5rSs6barFJN/BzRJuVZ0yFe7C4PRWvvUrNHGQOZmw27Nx96Qd/
	 0uFir4BdITpH8Pd1JTdgpfkacG+BoLGTCByOourY=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 5B3A0E05; Fri, 28 Mar 2025 18:22:51 +0800
X-QQ-mid: xmsmtpt1743157371t8duj5cn0
Message-ID: <tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfErfRwW9hZVLIiJuKDL01gKsSwVU/PZeKssow3wgAzRtr8JwJr5
	 Ht0XTqPtE7Tw6GINhJVrQbbPeB1G170OSsOc4HBAazDzIhVGrxctkEeWDkKVeWyIWL0T2+bCOHpj
	 249NYCosn5gL2cldATlCIvhMmQI4MPTZXdjmszVoQgzNoQPvm2DGviV/khO2ILV+vAKHIc78GB2G
	 YkxkYKrs+BTcVJh0EDEro5a//98AqC75Gl5CoamrhVwR5FcGmAsqUt5l57HB+N8xjAsNfy6lKPBT
	 UCFrsAG9Sr84apQHPxcgUKmkmRDDc+2z1RbwU6q2jUEVUNCwBVwRkippHef80XerjJ0BCUEB9bWS
	 T073hm3F8gX0EYfsEUJPRSix89o4uKADgFPhg12FUBnrkHHjNtVmKhdlx5lba/pTnaGZ6vwPi3B0
	 3+EbzXGtd+B6+9PdShwuuuJgt7UgxHg/2yV8wsd8rBeMnoO4r64AE5AWa6UMAuXDNBsuN5815KAf
	 Ft8VNOM/ddE1Xw8Vd3VKgrll7N9sJAGT+lI9mt6ekIDhnapuk9BeLWcCQ5JLQmJNIRYbfPlOBsAi
	 Au3pzNwnDTGbrS1ZclqtLCDlMhXxotXDYjRfaCAHZ1yOrIh3NBodB/i/HIttM/b1Iug3fqcU31RS
	 Q4rBkcfdRpJhdO5gthuBut5PnsqklqHkT6swzNFeIrnoJxedsfzeWeaNX/K7P7VdXgjRDcomgcgO
	 TU1mWjVwqmhytCOs1YKOyKx/Pakh5kgDyGR2kU5SkITHVl31ebT3Nm7xxF6ZMpcfCE6im8s+CbG4
	 hW7DKWZmL/XN6kSeblcPpyBUWWorjFR6zy4BMjJH8haT+0lfwtDLOfgm+qIvPdnWO0rldozWVcCt
	 l451QTx6n0mAHffENAqfNBySVcr9nSlAmNKA8pL4tgOkIRJuZx/3cn1hOyIhefANjowkmyzLS53p
	 HTleWgek/6x+ZFNXSUgOHJ1v7xr8x5naVWtLAYT240emlQbrLnBkisQKufN3Jkx4++Vtvs7ozfJH
	 a2DhGJoCFOkRnduCMt
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yeking@Red54.com
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM64: Add back and fix support for CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:22:34 +0000
X-OQ-MSGID: <20250328102234.53211-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032306_836590_0A5BB1C5 
X-CRM114-Status: GOOD (  11.85  )
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

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

After commit e6384c398459 ("efi/libstub: Parse builtin command line
after bootloader provided one"), the behavior of EFI has been consistent
with FDT.

So add back and fix support for CMDLINE_EXTEND.

Fixes: cae118b6acc3 ("arm64: Drop support for CMDLINE_EXTEND")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/arm64/Kconfig                    | 6 ++++++
 arch/arm64/kernel/pi/idreg-override.c | 8 +++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..736280eb0251 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2427,6 +2427,12 @@ config CMDLINE_FROM_BOOTLOADER
 	  the boot loader doesn't provide any, the default kernel command
 	  string provided in CMDLINE will be used.
 
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the boot loader.
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index c6b185b885f7..cff403477ff5 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -382,11 +382,13 @@ static __init void parse_cmdline(const void *fdt, int chosen)
 	static char const cmdline[] __initconst = CONFIG_CMDLINE;
 	const u8 *prop = get_bootargs_cmdline(fdt, chosen);
 
-	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !prop)
-		__parse_cmdline(cmdline, true);
-
 	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && prop)
 		__parse_cmdline(prop, true);
+
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
+	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
+	    !prop)
+		__parse_cmdline(cmdline, true);
 }
 
 void __init init_feature_override(u64 boot_status, const void *fdt,
-- 
2.43.0


