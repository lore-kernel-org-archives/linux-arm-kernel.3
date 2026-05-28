Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF429CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=21KtnN5w1SmK93fOpkoeLtN3ezSRWi64MXMncDa9k6k=; b=pQZmF/ZNUp2vflUQSBsUgls+Na
	DrVMYRjWrkLwW3FgtKp72/EBUZ8IRVr9x44XgeL+kUr3Mw2ocHFeFA09fgylMnmLmT0Y1Ah3UXogH
	CUcZ2ZBmMjjUsABaaHdqo+fQnLAToLCsU5EC2xe0wOxIWSzU3CUE8JW4a6GY0N2FIcQCebPJeJuFL
	VUBf4EulTmOzlbAvEH28z+iTw66mZt8MIjO4jCJtbR/yVV5K7KnU71An4K0h8LJhWUwF595twxHVZ
	j9bJEMalmttOck7W4y68FSe0SdyZxwBzVSJ4HccQE+xV88yIN5vcpz660PVIsvkE3cu/LJ4doYYLv
	7Fc6/2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW3Y-00000005Njb-0NDf;
	Thu, 28 May 2026 08:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW3W-00000005NjH-2if9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:25:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D477D60217;
	Thu, 28 May 2026 08:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569A1F000E9;
	Thu, 28 May 2026 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779956729;
	bh=21KtnN5w1SmK93fOpkoeLtN3ezSRWi64MXMncDa9k6k=;
	h=From:Date:Subject:To:Cc;
	b=D0L7foUJeMBp/vjASghJC9iqQjbZZMcFBUWHDBD0O/o641y4bsH5ZQRLUuAE4FuLr
	 h7Il+V+AjR1AaDzfawGrz0g715B8H/YPDINlwGu5hSr/dbTBpdC2DTE0wYZ8IC/GXq
	 MY1WEdfCWStyLMl8Jvwma6QwKW0LN8Rre11kGZhivk7+0Go7vwHU/iCum6QO01atVU
	 DkvcC4COGA7bUvyKxrgkTxSKozgnJ4peDt+RU3x37Y64qsbgWKPTiS5a9axU49lZ+C
	 BMKxbN7KiVaqrl4kRWsw3O3wTJi/8IQ1PhGVXufbQaW1rsMa4BaH8PYsM6w7U0lzoa
	 GDtPSIKoySG4w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 10:25:26 +0200
Subject: [PATCH v2] ARM: dts: gemini: Fix partition offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ7CMAwEv1LljFFsSqg48Q/UQyhOawEJxFUFq
 vp3Ql/AbWe1mp2NchZWc6xmk3kSlRQL0KYy3eBjzyDXwoYsOYu0g54fEgWCvEFfZLEkhRSC8gj
 h0KFFT+TqiymGZ+ayW+3ntvAgOqb8Wc8m/LX/eScEBG9r52gfmqZ2pxvnyPdtyr1pl2X5AmWYh
 93HAAAA
X-Change-ID: 20260123-gemini-fix-sq201-fis-offset-f7c101a2264b
To: soc@kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

These FIS partition offsets were never right: the comment clearly
states the FIS index is at 0xfe0000 and 0x7f * 0x200000 is
0xfe0000.

Tested on the iTian SQ201.

Fixes: d88b11ef91b1 ("ARM: dts: Fix up SQ201 flash access")
Fixes: b5a923f8c739 ("ARM: dts: gemini: Switch to redboot partition parsing")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Resend to the right email address.
- Link to v1: https://lore.kernel.org/r/20260123-gemini-fix-sq201-fis-offset-v1-1-a046625f8846@kernel.org
---
SoC folks: please apply this patch directly for fixes.
---
 arch/arm/boot/dts/gemini/gemini-sl93512r.dts | 2 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/gemini/gemini-sl93512r.dts b/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
index 4992ec276de9..341dec9b636a 100644
--- a/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
@@ -146,7 +146,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/gemini/gemini-sq201.dts b/arch/arm/boot/dts/gemini/gemini-sq201.dts
index f8c6f6e5cdea..bfd1e8581ad6 100644
--- a/arch/arm/boot/dts/gemini/gemini-sq201.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sq201.dts
@@ -134,7 +134,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260123-gemini-fix-sq201-fis-offset-f7c101a2264b

Best regards,
--  
Linus Walleij <linusw@kernel.org>


