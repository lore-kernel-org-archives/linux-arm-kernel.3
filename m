Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B274CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VqBp2YLsM32E0REqpNCDe06V2yuMHSi6VSGKJN37n6U=; b=4w1dUABa98kzy2MXp9xkdKrw32
	sXsXOyoyrW1eWl7FSKQ/jl+K39dWmVwyIHb9UviS2X+AZ6S0PFukxCwYEEPNszaokRYAVJhD3MtFz
	4okO/IbqU1tuFzIfMcaFKaoC6vIybht6uPy+Z7Y0xCzwOt2ECTMacnzudacRoBhdB8LuA5A5xhr7n
	kjWxXz8T6+7DunUA29gA9izNp/mFme6Zq5tK4ytKQdVg/aPShUn6NWDw+pmpvbK4sUf/DXPy4SQVS
	Zp0QFkF26qNuyZXwtHiMmMQnbV2zSNQal48XQX76zpjqtnlE/Spbm5xFrmLiDSr1rWMTaRRXDrVJt
	eiLZs4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZXxp-0000000GBiv-43HA;
	Tue, 16 Jun 2026 17:52:41 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZXxn-0000000GBhe-1ULL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 17:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VqBp2YLsM32E0REqpNCDe06V2yuMHSi6VSGKJN37n6U=; t=1781632359; x=1782841959; 
	b=KfVrFEhuyPKM1ABtoRmDF/D62s37xAaDegwYZgQctQhMuUFLigEg7pLGhNHRxTK6sR8XyqEO6cb
	N/iJYL7Q3Clw1fQddUJU4CDNklpn4fVVjqughugjvAnqL46j3BhwYOz/G6Y1LCRIbrARkmxVfuKmj
	ZyqBAtiQwneqX2eJpbcw0atg5OsAd6r5v5njiSgGc1OC3pnSAOYtkwsr55COXT9fGyg7dDWQ0U//L
	OzM9S4PL2SefDTUYmu+bnjDNGR/DU+MfKHWPyBpDqpxBeW0Ll2mhMSPXurMNMJyefkKkcXCvBAXy2
	hqLJ9JgYAZpumDk3vHQSArPW5xLySefaXT3g==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: enable things required by iwd
Date: Tue, 16 Jun 2026 19:51:52 +0200
Message-ID: <20260616175152.1373709-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_105239_393737_2B12C9ED 
X-CRM114-Status: UNSURE (   7.57  )
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

Several crypto related things are missing for opreation of iwd, turn
them on according to the list being printed out.

:~# /usr/libexec/iwd &
:~# No HMAC(SHA1) support found
No HMAC(MD5) support found
No CMAC(AES) support found
No HMAC(SHA256) support not found
No HMAC(SHA512) support found, certain TLS connections might fail
DES support not found
AES support not found
No CBC(DES3_EDE) support found, certain TLS connections might fail
No CBC(AES) support found, WPS will not be available
No Diffie-Hellman support found, WPS will not be available
The following options are missing in the kernel:
        CONFIG_CRYPTO_USER_API_HASH
        CONFIG_CRYPTO_USER_API_SKCIPHER
        CONFIG_KEY_DH_OPERATIONS
        CONFIG_CRYPTO_ECB
        CONFIG_CRYPTO_MD5
        CONFIG_CRYPTO_CBC
        CONFIG_CRYPTO_SHA256
        CONFIG_CRYPTO_AES
        CONFIG_CRYPTO_DES
        CONFIG_CRYPTO_CMAC
        CONFIG_CRYPTO_HMAC
        CONFIG_CRYPTO_SHA512
        CONFIG_CRYPTO_SHA1

Apparently missing USER_API_SKCIPHER did also
hide some things for iwd.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index ad5ae1636dee..fa6fb8b27f93 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -257,6 +257,9 @@ CONFIG_RXKAD=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_GPIO=m
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_DRA7XX_EP=y
@@ -703,7 +706,15 @@ CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+CONFIG_KEY_DH_OPERATIONS=y
 CONFIG_SECURITY=y
+CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
+CONFIG_CRYPTO_DES=m
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_ZSTD=y
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_AES_ARM_BS=m
-- 
2.47.3


