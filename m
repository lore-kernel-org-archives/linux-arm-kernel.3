Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CCB606D820
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rRZhS4Fn;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=EDt2T1A/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y8EIbelQmwDXNINKGdWYmBtsdh5/PXS0KvgWapyB5tc=; b=rRZhS4Fnm3bQsu
	HNwK/A8ZQXvPGX+evbbWYNuM2bjo3SsmhAU3ViiGpZDPC4CyauSwDxnXkFye7P4OwwxR2B2BhmmCq
	6EKVIPIjX6mx0FtpIGxwBZXTp+o3vQkABBtqoueZk0vMMocVZfLhT1mMIOPIRWbrYoP7w+WWTlh6S
	lSmfuga+BUf17OX9zp/PV6nARVeKC/xZU+ZI26mfgupDuzUZWHeztB9BTn7y8uJiidBCQfCdyYzj3
	kyEHSMVVymRzRuY8HZr2JV72pUOtAWVGuJoqC/Y0ZswbpiBRwKgPMQB9IVBhYdQw1Gqjr+0LiU1Gd
	hEJSrvPhb80ppytqtA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctc-00000005mQh-3wLE;
	Wed, 04 Nov 2026 15:27:30 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctW-00000005mNQ-3v8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:27:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B7B9C240101
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:27:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806040;
	bh=Y8EIbelQmwDXNINKGdWYmBtsdh5/PXS0KvgWapyB5tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=EDt2T1A/H/qJwI0uM0Q+PARbq4xwvf+KMlWwEPp1KbAWzflsfpklK0VyZQ9QDWsG/
	 Du+TAHpIWadKuRXNV0dwPkIUTBRjraUc5nakFGFu8tnGlFcc8FrwYFvf4IG24U/lK5
	 7BoQs6+WqdNocoZIaJMkpW9P5TrQBm9f2UCrQRrTHjAP9y8fKaUhIfP7J0HpZOemM7
	 vB24B750up6pkg1OtGDihWGd/dmwtTvYKwJn7cxnZhyFZqaLKCSuXcf43mlMYh8mtL
	 fJ/TZzEWIEgVqh31VSWjqBT23yd9CVaBPAWp23A8ZPnQKSc6F+X5SApDyBBdDxrAbm
	 k+J2XlW0tfedA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTny3vGQz9rxW;
	Wed,  4 Nov 2026 16:27:18 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Christophe Kerello <christophe.kerello@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 2/5] mmc: mmci: stm32: release the delay block before enabling it
Date: Wed, 04 Nov 2026 15:27:20 +0000
Message-ID: <20261104152657.14909-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072723_137292_757D6400 
X-CRM114-Status: GOOD (  13.15  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christophe Kerello <christophe.kerello@foss.st.com>

The delay block must be locked on the last frequency set. To avoid it
staying locked on a frequency used before, disable it first and wait for
the lock to drop before enabling it again.

Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
[Mateusz: reworded the commit message, added Fixes and Cc stable]
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---

Notes:
    On the STM32MP257F-DK eMMC in HS200 at 150 MHz, switching from DDR52 to
    HS200 made the tuning pick a wrong phase in 9 of 18 tries without this
    change, the phase was right in all 12 tries with it.

 drivers/mmc/host/mmci_stm32_sdmmc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 9dc51859c2e5..bb058e0910ad 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -537,10 +537,20 @@ static int sdmmc_dlyb_mp15_prepare(struct mmci_host *host)
 static int sdmmc_dlyb_mp25_enable(struct sdmmc_dlyb *dlyb)
 {
 	u32 cr, sr;
+	int ret;
 
 	cr = readl_relaxed(dlyb->base + SYSCFG_DLYBSD_CR);
-	cr |= DLYBSD_CR_EN;
 
+	cr &= ~DLYBSD_CR_EN;
+	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
+
+	ret = readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
+					 sr, !(sr & DLYBSD_SR_LOCK), 1,
+					 DLYBSD_TIMEOUT_1S_IN_US);
+	if (ret)
+		return ret;
+
+	cr |= DLYBSD_CR_EN;
 	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
 
 	return readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
-- 
2.56.0


