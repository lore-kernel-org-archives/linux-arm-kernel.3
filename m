Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF43606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RmTkW66k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZHta+VN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=; b=RmTkW66kz0Fn4v
	R/Lj9TRYKQzwijpNxwfeorxNXwp/HbfecJOvU7ZnkyTgxlyECNDMLjgTy6drLqpgRbTYlY3o0W9zg
	Uys/6r1Cm/i9bZb9j3gp5uEVnl7AG6oQyCZmJP2lQECyoA/ofb88oyOoAEe267X1RcNDR+ntljAh0
	H/D7D6illHrGWWlN8XwV6k7374u9RbHPQKOqeWRv9MXv4YRK6YFLCxIu8ebmxCwXsnomojJUAdAlW
	a36aQPQSsR7yZ5XGnHYCSemt1YR5wIQ39n36QuHvJC5sN7IVm4gyc8HfzBpXP5dYXgIIHNmMUcy7d
	3GUVE+i6oXJxlf6jnn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2ey-0000000AEmo-1BkV;
	Thu, 05 Nov 2026 18:58:04 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cn-0000000ADKs-2PnD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:05 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-70b875f6f13so2019251eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904949; x=1794509749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=CZHta+VNyKrp5mp+BxRIABLYr7fS/yQz+ERvjTRhJntxn1kxdpNP98ZSOadE55nKEh
         3vSdXt9sAk3WYfO6KzhOr07z4GnmUJHx6q1JfaWhFOKa5vDtGRFISl3POGRWzt0ZafiD
         HYFHHC4ROHYaZaGDQrkvUFLBjALes+OEp6xQua16zTMaeA9enL8244UNGI8lldn6b8+X
         IJWNec3qt3wsaajkBBiL6RIkQEItkW0yQDBu54/IqTkWdAu6mlO6yV18brqt6Vt81WBF
         6pxKRWqqD0mzI9u+51yXDOsBMBDtXVsVsaxtWyEAGj8Rz4KCzahVM1EOMYcYKU0mUKuF
         W4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904949; x=1794509749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=CR4yWXP35VVDzrrYdoTUxX0vLlsfJGDN1+xXFg5rfPCv+nzhW/G9UO3C7eh+sDXHHZ
         mvjdxVNc1jwEkg1Ig8OAmN9jvfojY8RaaRO0XPdJCCTJFsoN1GDXU3SFkKHiBaU8yIip
         NemkVo4we5tO7RCybBxuzv6zCEAc9WUnqOMp5Bv+AEHT6FuFM1gfP9xkqk7S9F7v5g0p
         iy8X3MCDy/zjJcRZad3jDm/MtzW5y6kshlGYzEhIOGpbH7W4NX0ewXLf7VqVYoziU5MA
         P1vBalWwaspYKWsBPE4V7DUKb9Mr6RUU8W/5a4LLNEHObrCQflcFTaB7XSrnusq+Y1MC
         4D1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMaPjps7RZBSJIkv4B2BVgHCpivBCQx2gOZXa5+CeZDsthbDIU5w0VXf9bk8M/2K1EtAdSQioXWvld/LUZUfV7@lists.infradead.org
X-Gm-Message-State: APuU4Z/baqKUmJb1njPC+ZLS4IfZyN71pL83NAnSul9M5u24y/35Z3KJ
	pO9uUKnC/ssg/Jadpi/tBAl11bnDfo6njmkCsev9ck2wgLLBLZXTPD/y
X-Gm-Gg: AYBFou0neaNZSyODEzpBTucnEv7HliKBQDAs6A+0Y7AIUQIx/vvPDaXyJ2vLZKll+zG
	uHXCHe6fMXiIMPpr6hybxaLFaT640w0uCgrZZpJ8i6Trbs4kx+IC7aJcLT9i9a+br/xJKp89AZv
	TbYUj1uW3TGk/TWvzWs96yUYRMdX98C8y5Ut5nNDy0Fs6EXShutIz7mLA0RmvfKwnPiRvlpYySZ
	tOzj8tBae4w14UfNeBdzflcgv4QXN0mkpq/PmiZEW/7bGuHM3WccmNUbyumqeOfm1LN8wu5DnQK
	vgpeMgYuyez1BTaXQ2VakZhZ6Zaf+bEAiUDGa50DtxKdW0i8MB0m5XdEBkg3CpLDhExcZOV17Lr
	J8IXZPv4bf354IiD2SIASs5XFG/UX7C/E4P3TU9Cf3WTSRNYVTY1vta5Ap/LNjugnOBjcMy9O1q
	SrFCtUtrbApCsJ9ZEQwAI9fi0wIgblRY/iuNYZp8sfDQ777GqNqzUjH3NuPZ9dyaMU0jZCpocE3
	r5CgUl7EfAHPJPmYr6W8Ko6gm8Kn1WksC2snz/9ZUSz9mYrkRbWGKKItKaIbdoZRn/8YvOytLI4
	PFBmkcOiyRGzwLio7HK2MCUSv6d3nl71LWNxfdOkvRKK+fz65H/8VVZAIzHE+YsS6SazNtQwMi8
	iB+2neyIgvSUymrq4+RwbODSRw6T8Rtvk/SZIqozEZYVGgEE7r5/pb0x7ri9P8TWIR7TRPxCZYP
	8RaU7PxLodX+Y/DBWjMyfV5jTDRSyoSA2DI+ZfsF0drCwf4a8z0rPZ
X-Received: by 2002:a05:6820:824:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-716e744f8bfmr419274eaf.11.1793904948781;
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:26 -0700
Subject: [PATCH v10 10/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-10-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105549_750380_03ADA2F8 
X-CRM114-Status: GOOD (  14.97  )
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

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e952d7f6abef..e79fe46926d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1236,8 +1236,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0


