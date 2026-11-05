Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F3606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qo721fdF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2aInR3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=; b=qo721fdFK69PfZ
	cgt/NO0UX5Bqq8wKCxxUUzKO5I3+JBNTQHVENgt1LXcu27ns6cq0THj+ZDKGHqkcDex6f/x4ithmN
	AUJxtNI/oIouNH87FYwa1YWMCNCc+i22Any7nO+SXuEMdV90zRRLUr2+jySNSLdhvOU3K4ZjiyI+7
	lF2LOHuhkTpP1l4s2dCpOLIaVQWPyjvcPPkjtGOMlVQ9ZW14/qUrJ4hBVbzpjsPLTqZ0hPxdnh4qs
	jBXLJHtEpqbSCDtlg138X06o2EPAU4VwCZn2jzqluZBXFjd6+E2S4BdVivH5sEQahI56H47P+zgO5
	RHAi7oPB3cdIIXG3tGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2du-0000000AE64-3hjX;
	Thu, 05 Nov 2026 18:56:58 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cm-0000000ADKe-0Xnk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:53 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6f8a519e215so1084210eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904947; x=1794509747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=x2aInR3cevixV9yM+0W85z/n3GzNe6sXXmZeN0CR+e7xfoQUGzvEOEJBX1wmfoDFFw
         lN1Vo1KeC/10c+v6JBll6yigPkhZj3gYQ7fIv92H2zJxiz2veSfL7hSrTN5vojT8FFop
         CrArlvgn/4kbp58WVF3baLVZwlzKcPfT2nBpObDhFHr237DM/N1OI1QIGEavZeglavVc
         LhrUJ5OjO2mUXh87usQnltr2eLvRA1ofdXViYo3d7dRIzQdbCYbEDRD3xEL9Zt+2HNhr
         yG9tz7aI/nEGCRBXrMbne//XaHp6wnQbNRdA5pZzddSjvaSLnNHvPP0wDJrkD/POWuZ9
         eKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904947; x=1794509747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=wb8CfjXArzSb7VUO03gNKQvuQKWUrvYzf4ejkRF2NIroIZI81XbCdL7bRJD56KV7tb
         DfKJ+2by5KhyXcZArrvOuRvKgZvxeAxYwRbaiIXFx+jh0bd1R9e8ZPakSpoO51ZkYJHp
         9V4vxBGVjtYanty0soqBdEUtCKgnPBThFlYH+CRoS/mh5kHyFh8vPxGFHRXM9lo47tyV
         RL1kv5HKwL2EJAqP4MTiOqbekS5C3JR3lDZkotGLixdhMxVxEFoHqUz/r9e2ZZ6HWrnP
         MVNfPpeKbWNhMAM7oAS/bRFuK/Q8qXv3TQqHUBx4a0i4fojuO89+CCgVZVY+M0O+AyWU
         9O4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqK0NzTygD7hvrnfJ0fceYwwsT/J+q7kdteHr/A+SYwgeYeIdx/vL4Z0bp82s2Ai4IG/vt6Pok1HBSVc1LgSIk@lists.infradead.org
X-Gm-Message-State: APuU4Z8L5AyWwd/EheCBT9C2yPy0rrjFoskkFTw2Zfe2fkoweQQBgTed
	7rjHNoHScj7jFT7Tta08f8DDl81+SikGuJxlQneEXeWpZClBzn79GefW
X-Gm-Gg: AYBFou05mHaOilWwhHkct+2gIFUYUqInLlyOxC2It8F1w0xeKTxEPYBFz/NxnFG15ZQ
	+1pUNGbJMOqT4ok9h/okvnIcxDr2gwf0JDzI4mDFrW/AfugN8KsSAc1QqxiTWBAggO9O2GIbv01
	hD7HhEcuUE5/73c6Zc3/jc7H1dknsaO2TmOKEn6N1NaR5xddJYbZ90hHaJzK9tjHvt+YfHg74GX
	YwPsHMDUFQ5/WRgnPVA+/aXTwjcVffMFNHahsldYHvCrD6O6sYl+UnHqzUxUFzyz7kdzXTJLIp8
	svEdrUroOTNbbSd6F5xC53EipsgEp4SVZpJ7N+HJD+nb1YSMAa1rUk701VHLDJN4h6ivZWW99no
	ib9bCHVhECa0Znk8QWiel9cwDvb7V8W/ih4IgbMuk0TrJmjBOBWojSS33eA1UgLOgxLYbS0sCfb
	+9CV/5JqLeo/PRR3x51umjmqCTTq0Tvh8C3gK8WehRTCRJjDrml0D0fCPKMWnL48/nMdRB0gWvP
	l0bqr9cBQ25mwA+zMK+ZPwf/JWj/xB+ZJB7ceuDuTu/ncUAcr0yAWqbgNFGw3RxTsM87Dtirlro
	+OBj2v201NpELPrsOLO6k83TwmJOX4Q4tMm4PCykasIeQoq9lr7x4UTbpeRzy2VtPid8Nr1JbgR
	Vifd2n7slQb9eE5UArYKm0Ow7JZzibFG4iJ2cDyCW5DL2mKmy3xAZAaSFqx8Mqvg2Uhp4cxwAn/
	R7msA54d1Cyx1so0t57vorADpB9rRRrpxeTzHsRLI3VmIQRqzijdC7
X-Received: by 2002:a05:6820:2308:b0:70e:177b:eafd with SMTP id 006d021491bc7-716e78881b2mr244556eaf.16.1793904947324;
        Thu, 05 Nov 2026 10:55:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:25 -0700
Subject: [PATCH v10 09/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-9-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105549_631559_AFC409FE 
X-CRM114-Status: GOOD (  15.43  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02aa02d2cdb9..e952d7f6abef 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1125,7 +1125,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


