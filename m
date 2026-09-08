Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15119C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGyFWGbrVk08pEuM/TwTUU420m1oJLXxdjsy/v7Xrrc=; b=mJZDzmJKkH7gbOE5ffdLYjDHuL
	hIbtyvZKNH8QJO5w5tzHfQDa75FsMvn7xTA1RfIlzWqg1jAVKAQl5lnLE2mBktuqjsu3J8E+PM9BN
	zgnRWW+GZxiktAS9u+0UQ53Pr0b24Ag4b2FepPdtxVs4uCbwrJsbjOWgfwjRrc283VELAJ2WYnkk0
	wKxNS0gIgUcRski2D8yad0ARy9GIKUjpF63OA/yXSrIvW8E/Swss8/InFfXIxFqz2G9ZXt75jAj9h
	fnabPndM6bb5xTed19iXssqDvdDxDQ4pRFvITFNXZduUdLDVCPNyFMyfALSu8mdSX7Nr8H0QIGK0n
	DCek9Q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wma-00000009GpH-3R5d;
	Tue, 08 Sep 2026 14:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wmV-00000009Gmo-3eEV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oGyFWGbrVk08pEuM/TwTUU420m1oJLXxdjsy/v7Xrrc=; b=Csvp9r1S3yuEk0ZJD5xbSN4kJO
	/7Czw5l4085xRagKa6e+xAg8+FpSYSWFnsurqtqAiU+cpT5Nc+vqjs0wmMPl1LHMNtRIP0/lslZYn
	e+Wc/bN53lZwx5i6eubM/HnBMJVDQybgtYzC8TL4+h5um1V0icWeHKZPyq7v/n+R6ONoA+rpQMWOA
	yJfA2qlzHveZRKoNPoUxsh+Ef3C5yOxvka1a0jmWdnHLVwbfmMRadEw0aDWGiZnVwWWeEctBs5U6G
	Cqdmkr6Xvb3jtNucvR9L1pHU6hcLRHc5INKOgwBUMdxTwCcHzSZeRQXwbrIMnl2JB/GlgFscbwd0H
	gVCs597A==;
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wmT-0000000HXFi-0QEd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:26:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KVsuIyiH5SB/1+xKdlUgJ1F2EW9DnV0+Qj4eqAyuRUo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877594; v=1; x=1789482394;
 b=g9hqNW2LcNLLLCtn9UMeGlfa5Q4h4g98K7xEuiX+kheDKs71iCgh7uXLixB47QWqiqqCKhq9
 gy+s+dfT1glSMFh68f7+n+PTyvclNwUCE1n29sxKGAJaez28Latuw6RPbuLeOusxg/je1Q5s2si
 /8Qo+waJGUEWl3uhtA3vWTrE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e08221fc077519c4;
	Tue, 08 Sep 2026 14:26:34 +0000
X-Mizu-Trace-ID: e08221fc077519c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
Date: Tue,  8 Sep 2026 15:26:31 +0100
Message-Id: <20260908142632.2795308-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_152637_299604_C75439D8 
X-CRM114-Status: GOOD (  11.61  )
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

GITS_TYPER_IDBITS is five bits, so id_bits reaches 32 and
min_t(unsigned int, ...) truncates BIT(32) to 0. nvecs becomes 0,
its_lpi_alloc() rejects that, and its_msi_prepare() returns -ENOMEM.
On 32-bit ARM the shift is undefined instead.

The clamp is correct for every value below the maximum, so only that
one value is affected.

Fixes: ce9e40a9a5e5c ("irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af235373..81a96149f9154 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3484,7 +3484,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	 * Also honor the ITS's own EID limit.
 	 */
 	id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
-	nvecs = min_t(unsigned int, nvecs, BIT(id_bits));
+	nvecs = min_t(u64, nvecs, BIT_ULL(id_bits));
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN);
-- 
2.39.5


