Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A4BCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fIqCE6mIY0/CBMbtErt3OlL2eYJgNS5KhY7QzO9qeg8=; b=BwQsBkYd6xzHEauv+Zz9y+F9D1
	fJj+jA3lm6x9Yr8KzGLtCIHhtSP5QpIOR/HQUzHQ+Rf1/Jni6v3tUwxKn/mCA00SKO/SQcZ+NlSNF
	hnbOBtvCvHsXo/a0kI9uLSwvgQcYG+w4rQL/QDQ0usTE+egZdVNxmgItVpo3kFDiyGWtj8PXskDKP
	tJEd+8Pl4MrETnUKbt8pbPjeZrqvC9s6huVyhs97njFrYggdTsjt3I+FJJCZ/9GM6TRwdDMqeTRp3
	E3mytf3e/Edx0OxmMSIj6TZj5v9EaUMSHLHix+Wr7yftBHYdxMO1z7BQg2a3gzfgMN6ZvQ+uE6uJR
	nVPio0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKLF-00000007xnJ-3WEl;
	Wed, 10 Jun 2026 14:55:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKLE-00000007xn7-3hPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 14:55:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1657600AA;
	Wed, 10 Jun 2026 14:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33641F00893;
	Wed, 10 Jun 2026 14:55:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Paul J . Murphy" <paul.j.murphy@intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] arm64: dts: intel: keembay: Always use decimal interrupts
Date: Wed, 10 Jun 2026 16:55:34 +0200
Message-ID: <abff7cc5aa2e66524a90523e07e11a42bd3e9e58.1781103222.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace the sole hexadecimal interrupt number by a decimal number, for
consistency with all other interrupt numbers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/intel/keembay-soc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/keembay-soc.dtsi b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
index ae00e9e54e82cbb9..b6323ebe7a5f46bd 100644
--- a/arch/arm64/boot/dts/intel/keembay-soc.dtsi
+++ b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
@@ -71,7 +71,7 @@ timer {
 
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_PPI 0x7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	soc {
-- 
2.43.0


