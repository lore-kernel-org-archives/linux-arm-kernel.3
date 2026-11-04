Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEFA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 05:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NVrxESMP;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pjz1qpNc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LOG7AOmS6IRRfgPKSJTi33/lfhAOaV7O3VJZu3BP5NY=; b=NVrxESMPS9JGYEIgF+wtq7aZU+
	KCZRagrYgbfe0kxDP0/raYVW53hgJT0psHhu+U4M89g6jWSlQklx7htdO2tt0rEbzrlAzoM7Ej9Is
	EIjsqkA3zqRaB9uw5kD7ymU8N9w+4TJFklJm7pePT042GLlQUaJjFP67UwAbbB/CE6raHKq9iU4/D
	A5A7o9+NTqOmkNf29BU9dZg+OSl8b3v2y2HTurUxAJOQdn0W8SGS9cbO/Ni96VeitWCq6mbJt2OkX
	nMSIHjrYvCVxSSSBMmVFDGjbWauMgEIapVnurLGNEpv3KFiChS7W7D046DY3KiByV3T16q3Z+dygc
	WyXKj5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTUt-00000004LQv-0B79;
	Wed, 04 Nov 2026 05:25:19 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTUp-00000004LPb-46qp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 05:25:18 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3514b90bb89so591501eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 21:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793769912; x=1794374712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOG7AOmS6IRRfgPKSJTi33/lfhAOaV7O3VJZu3BP5NY=;
        b=pjz1qpNcu7hVC+5sNKI7MPsCNa9kFFTxFFwrn+B0urMOPSbaxUUxFuxIjKKTnj7+ex
         eN0us/Ro2akgBTI4N+CFYMCgGtpT6gCDo2cet8EiBkuqdo1Qxz6J8rxOlfe6bFyA9ajN
         8kiQuIb+MloVTE7A39UHIPpiYVmijQRypSogAkL2yBg5IhmIoPfoU45jXOwzCphSYIsJ
         9kXPyzvKmtvdnVHYyauR5q8W/zPwJ4xZxPnir53Cbjl2Xb6TkXoTeczXiuM4yTAZURjZ
         I//M/rsp9wMI+x6BPQjvAuZYC658QtCvA8r0bHb7jq5W/hCAS8B8EP41jKyYQ2zTL7Dt
         0x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769912; x=1794374712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOG7AOmS6IRRfgPKSJTi33/lfhAOaV7O3VJZu3BP5NY=;
        b=spVYoBGKqq5dmfler9j7HDzWosTtLpiajaWVS7SsGxTxYC6tG1BsAQDNWbUxm2LTnz
         Ig0k9ID/Ns/v42xgCr6423HojuVmmO+Fv6pEI5Xu84gZd2vZ46rQ/RZlznW8wzKYgwLV
         sA5wpHyMBvV0nVsnbsdoHFfPOJm6mwWoX2ZUm7JrrpFJ+ZRYFLr2oLbO0DGNemxem2QN
         PR7wiHJoSjXGrVI2EqyG6Mxmi1EJGXovxSqSQL8I9PV+V4LdHf60WF8HilWKUMbr2Tgu
         a0ridj/aXAz4UQ7XrgXnEUtyvy8p3ukdNoCH/iWBwMlDvJaiBJzB0TGhSpLsLsmPCx9p
         +vxA==
X-Forwarded-Encrypted: i=1; AKwUvBwvVnaeClunTEsgIr1XlXPpqT4tq73lUrhEZgWrq+0q5L95bpBOf45EmaDHJvEcczcQnPGhzMDd0z2jnZX2H1gg@lists.infradead.org
X-Gm-Message-State: APuU4Z/SP1TggqQBQkJr6qC5kKB5muXspU5Oula9su1bGSK852pxtC46
	YH6lRyqdXi7wuSPnypzqWA28tR00FWaPPM/QkCb1uwGCn4UsLaGVwmLZ6+4XpHZEag==
X-Gm-Gg: AYBFou0tqbGdWNMudxOXco0ziTAFz9bpLFlTxEXNbQPZ8+y9gZi+K5J9gNyubDXrVjM
	xxm+qLZqJ2u8PHaCUYelH2wwdb/S1GNIFmNQR1H/MIu3yFEfvH8B0QKdZV/9fKun5j2ipaRLHSc
	kIz/djQ0rbA4HKROd4BDixe2DCdFn532Vpp8YnEf8qxeNHK/nGvArreJlbFCCA6IUTuI7v4VNEU
	pdoMZmFTKqg+5s+B/K0Mo8TVAtjODf5Vs1N8AnWjxiU+o0NgLQ0yfgVxxX8l+Xx3iokoEVqF07H
	dS+dqG+WI2IatSSqgZkX2WxSRnjCmsfG9+NlJwvwvY9cbdVc4nCKV94PmhvhqpoWtSScyBgm5mv
	mjmy20Wu2SnZRfsYWyVxWk8gxB3PXMKc83pvgrztJ4K3zaCKKKNs6jhw7HqJenm7i0Y6iSg161p
	wWZwFADugnqiux35s7fVguOlKKSs7lHJmbX7yHmSqDAcGhMCy0dkpBkdhd+3X6NpXfBERrs8Pz3
	XK6vsiWrqlZFVNVZeAta4+sf9XyA6l0kwoVmgCAlbnautirKUYaKd4VIol6qCDyU6Amvj/x7+51
	aV4iHLZCOvYbjlAxpHHmZbtW9i1dNKh+mbfQSHgP13JVZzs9v8UxTXYeEVOEj3cgJ9iffKn+MeH
	74uzgedNlTsApP5UbXA==
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr21775375eec.5.1793769912239;
        Tue, 03 Nov 2026 21:25:12 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm3405176eec.29.2026.11.03.21.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:25:10 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Wed,  4 Nov 2026 12:25:04 +0700
Message-ID: <20261104052504.1886335-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_212516_370960_3E53FB0B 
X-CRM114-Status: GOOD (  13.94  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
ptp_clock_info") modified the PTP core to validate the supported flags
of external timestamp requests, rather than relying on each driver to
check them.

stmmac_enable() and dwmac1000_ptp_enable() ignore the flags, and
neither stmmac_ptp_clock_ops nor dwmac1000_ptp_clock_ops was given any
.supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for
this driver with -EOPNOTSUPP, where before that commit the same
requests succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.

Tests on an NXP i.MX 8M Plus (FRDM-IMX8MPLUS, GMAC 5.10a) show that the
auxiliary snapshot inputs timestamp just the rising edge. The reference
manuals for the STM32MP13 (GMAC 4.20a) and the Cyclone V HPS (GMAC
3.70a, which uses dwmac1000_ptp_clock_ops) say the same.

Encode this in .supported_extts_flags. A PTP_EXTTS_REQUEST2 for the
rising edge then succeeds, and one for the falling edge or for both
edges fails with -EOPNOTSUPP.

Fixes: 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to ptp_clock_info")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index a37405534beb..31a66e855d6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -277,6 +277,7 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.n_per_out = 0, /* will be overwritten in stmmac_ptp_register */
 	.n_pins = 0,
 	.pps = 0,
+	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
 	.gettimex64 = stmmac_get_timex,
@@ -294,6 +295,7 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
 	.n_per_out = 0,
 	.n_pins = 0,
 	.pps = 0,
+	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
 	.gettimex64 = stmmac_get_timex,
-- 
2.56.0


