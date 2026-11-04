Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB2606EEA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1f1k9HJl;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=mtUGKV5l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sb8csLTb54AiSajPEMKOf5a4QjgIr+ASzkGpD5GyLyY=; b=1f1k9HJl4oNDNC
	Cml24D3H86ZRKtE4PGpCYRWJdavx65Q2UY9TTvSn8fm6LZuM42ebKXV4g0tRZREJH32kpxNyk2Cyg
	GdRRgocEqk2slyD0quMmrnQW9fjh+ufpDWs7WpyMfabQh4bTo2b0IePVwS7jH0EntRhEeqquMt55K
	xr6imJJr5tarkNxhVO7s3hEgAXEU+LqYFjTZts3Dm7Xec3AxHWcHT11ZsEjcEABvpWxiTjdE1OqEy
	izJaKtWBYaUN1zFuzJN/y8Pbf2kgLNwupgXCkEtU+9jasu8/28P4r2zuModR0/+vhZquef58O/OID
	tfrid647UVTZzbPkqpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcte-00000005mS0-2Vcx;
	Wed, 04 Nov 2026 15:27:30 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctZ-00000005mOK-2ECI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:27:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id CA5CF240110
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806043;
	bh=sb8csLTb54AiSajPEMKOf5a4QjgIr+ASzkGpD5GyLyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=mtUGKV5l1vWz9FL79nOJ8L+ZokY4TmBmRbi54B5F0a90FICXMu/9STlt1efOKhsut
	 iaEfmAjE7lhe8wGfZe6vWGWAAk5MmqMA6hsvb+zKVCRH8d63NLaD/QVLq6GL4J7dRK
	 IEwlFHspBrnqgxHuqTWmlDaNGzz6l4xcX5lOikgawRQn8b7JE2++TUh7N3PcQfI7Zk
	 tjmMZgQ3n5oKLyu0o0VjUcdakioOAQyZrUnYX3y/B1qeXBRpAvzIj0dih1T6slt6oe
	 nGjzlbKWaaAKdV1Qf8UBC/P8fh31wpAhcVf4Z6IE6Ct9t5SaaLuIlfEUawi7iNL3nw
	 Ap0EVBcfqSSPw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTp14Xr9z9rxN;
	Wed,  4 Nov 2026 16:27:21 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk
Date: Wed, 04 Nov 2026 15:27:23 +0000
Message-ID: <20261104152657.14909-5-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072725_727955_44C10CDE 
X-CRM114-Status: GOOD (  12.97  )
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

The eMMC of the STM32MP257F-DK was moved to the faster sdmmc2 pins_b
groups because HS200 at 100 MHz returned corrupted data with pins_a. The
cause was the delay block, which was used at 100 MHz, not the slew rate
of the pins. With "mmc: mmci: stm32: use the delay block above 100 MHz
on stm32mp25 SoC" HS200 works with pins_a at 100 MHz, and at 150 MHz
with the delay block.

Use pins_a again. Their slower outputs avoid overshoots on the SDMMC2
clock, which can disturb other blocks such as USB.

Fixes: 94911ce62b45 ("arm64: dts: st: enable eMMC on stm32mp257f-dk")
Suggested-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---

Notes:
    This needs patch 3 of the series: without it HS200 at 100 MHz loses writes
    with pins_a. With it, the eMMC of the DK passed every 832 MiB write and
    read-back run on pins_a at 100 MHz and at 150 MHz (see the cover letter).

 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a8f18508db3e..3776bf915160 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -357,8 +357,8 @@ &sdmmc1 {
 
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_b &sdmmc2_d47_pins_b>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_b &sdmmc2_d47_pins_b>;
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
 	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
 	non-removable;
 	no-sd;
-- 
2.56.0


