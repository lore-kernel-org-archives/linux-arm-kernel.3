Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E6ED68BF9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBJL4lyxdLBcQ1e8L59cNMmzafmUnyjik4oVsyMEbQU=; b=UUuAfx+tvz032h3rpUcu/vikUq
	FmRB/3r99t8mmsF3PxhJEdoUSw3n3XiKhhyQMk9CxsHHeQ1eHQ+5Y16IbwYS3NigZhE445yWHD9Z/
	wW1za2KNPJfN6md/6JyY3mvzDkgQsJyzvVGQGTfvwHLgDbk2LPhsDTM9L6C/C9p8LW8W3uHClzqNI
	xlxZqDG2aiOVTRALq2CAXHtuxMq99mKfPl+HlPD8dmUlSHwOpDMiI1OPF8S7aSbCRKStL6rh5pbIb
	S8gpVIrnklqD/ileTdPeR/1xaQPvGdRxHBbY9UIdRPZdE5gU1ofktxc57oPdvzNwBTbZYU+bKaJxP
	HlsQOszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCc8r-000000077er-0AFI;
	Sun, 17 Nov 2024 10:04:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCc7v-000000077Zy-37ai
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 10:03:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B76E1424;
	Sun, 17 Nov 2024 02:03:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBAC33F6A8;
	Sun, 17 Nov 2024 02:03:21 -0800 (PST)
Date: Sun, 17 Nov 2024 10:03:11 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
Message-ID: <Zzm_X0o-TkkGQeAN@pluto>
References: <20241115230555.2435004-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_020332_037998_DAA51D3F 
X-CRM114-Status: GOOD (  24.79  )
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

On Sat, Nov 16, 2024 at 12:05:18AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 

Hi Arnd,

> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:
> 
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_write':
> fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_read':
> fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'
> 

The SCMI drivers, like the newly added IMX_SCMI_MISC_DRV, generally make
ue of the related vendor protocol like IMX_SCMI_MISC_EXT, BUT the SCMI
stack is designed in a way that NO symbols are needed to be exported by
the protocol layer (to avoid a huge and growing number of symbols
exports)...so usually the current DRV-->PROTO dependency is fine.

In this case, AFAIU, it is the SCMI driver that in turn exports a few
helpers that are used by another driver fsl_mqs, which in turn could be
compiled and work with or without the SCMI stack, so with this patch we
are artificially reversing the DRV<--PROTO dependency to solve this
scenario in all the compillation scenarios...

....BUT given that the IMX_SCMI_MISC_DRV is the one that should export
the missing symbols could NOT this solved in a cleaner way, without
adding the fake reverse dependency, by instead modifying the header of
the driver with something like the classic:

--->8-----
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index 9b85a3f028d1..3a7a3ec367c5 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -17,7 +17,19 @@
 #define SCMI_IMX_CTRL_SAI4_MCLK                4       /* WAKE SAI4 MCLK */
 #define SCMI_IMX_CTRL_SAI5_MCLK                5       /* WAKE SAI5 MCLK */
 
+#ifdef IMX_SCMI_MISC_DRV
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
+#else
+static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
+{
+       return 0;
+}
+
+static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val)
+{
+       return 0;
+}
+#endif
 
 #endif
----->8-----------

....to just support compilation in all the scenarios.

> This however only works after changing the dependency in the SND_SOC_FSL_MQS
> driver as well, which uses 'select IMX_SCMI_MISC_DRV' to turn on a
> driver it depends on. This is generally a bad idea, so the best solution
> is to change that into a dependency.
> 
> To allow the ASoC driver to keep building with the SCMI support, this
> needs to be an optional dependency that enforces the link-time
> dependency if IMX_SCMI_MISC_DRV is a loadable module but not
> depend on it if that is disabled.
> 

...and maybe with the above additions you could avoid also these other
dep changes...

...not sure if I am missing something and I have definitely not tested
any of my babbling above...

Thanks,
Cristian

