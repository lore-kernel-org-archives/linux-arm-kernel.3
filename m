Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89997606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hQS9K/sw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zqg73gGA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHhweCVd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=; b=hQS9K/sww2bkEt
	qf9wFwqZYsKoFokSdYdBajTxv4kJ8pzYQ8V3sBmpuJFYkjHvBv+6lPPd8rHC3692j7tG2uuib6V8h
	ZqlndSX0P3mhLy3TckeV79qhtj1BdONdWX9WCXQJzfJhClQ5nSjJ7ZG9Du4waaibFHm9M7ubkn1ox
	kAUd2dUHDL68hGktqgJiQED4KxXCCMh8n/5wYFkL+JokF7x1xUos2x77ce9ytj3bfzLjpBxK6nlsG
	aEquZ8bGH+j4sFwVOHb+wqvaZKzHLMx9d5rlVC5caquPv068JbwieBMgmGhuET+Il9NzsLLTZsYTH
	CrY0zwTYPi0WZ8Zu/7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2es-0000000AEi8-1Tc7;
	Thu, 05 Nov 2026 18:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cz-0000000ADTL-02GO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=; b=Zqg73gGA3lH/4EcnFhg15NfjOp
	caH+f7iPdKBCyXVO9IheZ+3vB3yz2NRODdMFZm0BCfVvIW8NFXPVOsEy1GXWVDk578EovLrfOG4qE
	yTJ6rYZ2OKgOGTbRpewrc2+RrPMXrfr60s496O18XVOwHiKE2uL3TfIMFyJMYLzl/XJoWma4sp6kD
	wpT3jAK7ZE2h/CUc3lhVGba6hANAZp8BVripwksdDAw0rG3LwfnkjLTlnz9h5bd9xqExLqrF0FtmK
	71hB/MqtdunQ3AlZf8njodnv+I0K5sZGi0yyRohhPBNDoT6VAuzduoue2nTYTGXdIjxOUH7OKYgFy
	5gMtMaPQ==;
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cw-00000003R19-1Dbx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:00 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6f8a519e215so1084372eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904956; x=1794509756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=EHhweCVdesr1Es3/+EkNHI2cPRMER8H1TABySD8nFlhR/P4PlsjgL3VSrFC5e/O4ho
         z32p0MMaef6zhjGdsD1Al+BzrTvxmc+gs604lCHuAbyVbqgy/zSQqN7PbxV+OCigEwYt
         +FScxtiJjUnvQL+zt8ja8oJKCjrnM525PWKxZjz3qDfaO354vNbtGqAMPFfcyQqOIHhI
         hVgoh1bJ4gnLoFcefO0N9DXpR/Oq9CEN+FdZp29SAKp+9gdr510HtIO1x9TwPibIet2h
         uapzA0sputU0/OuY+7BVXtQXFyRki6NTNENF2jOXny05GfDyXuPibY7HQ4GMsfo8Yu+A
         R5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904956; x=1794509756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=Wobg41E//k6O5OsgxkX1O/Tdxn0GNYjxABK/qyxPfav4w9EPVbKrd32IJ1PgILKvle
         6BZnw751rpMWyyo+d2AqvuDbfoTzQx8sC/v03GMgVoqH8HeIpicfvU/OJL3Bm4RAWpNS
         GpuC46vvir8lRLTusR6l4BCpoKwPny2mlMyJwnX1XMH+53pp17GsQiFQ0ayerT6ZDQIG
         aXMGFNYjtC2VFwQZZEICmRfzdxxUnNh8YYQK7ZfsRTxTxrKa6H4kK2BNqnEOLtoehK0t
         nsHFyAhgtzmc8r3EsM/9nvW/QddweWZJ1Rlj3glPBWvt1P7wT6Mz4IHb1rtTNcgp+jQ3
         T2NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHxqyBh7TrKCY6YBhk6QbQ8Km6ZMR/kOmKngDYsYjLl8PYtoV03b5gUwrrOwvfPdPjE4y6Gm+6PiR6J22Jt5Jt@lists.infradead.org
X-Gm-Message-State: APuU4Z84SLopjeR6fl+5W6cTJGsgOfyn3ZydcQrsqxEWaZbgypdb05w1
	AmxVst00FSxoHfniPCdTuvpeT0nlD/TiVjoPOFeRezCCM/3SS8MatGsQ
X-Gm-Gg: AYBFou16HCVT4aFJRyeWYc/dP55ZvGBfO16EkzQ/69md1QdnCtl/7jtfsBTpDzpFv8R
	YydtcSkWaT0Wx1h9eqoNAkcvh1Jki8tou2KonScdGdQ4NW2bq5pPuX26STHyRdWxjAxCFLwx22t
	yASkWMeWMqYYka4DDBn3RRNMzpyV0wdQvfaqPMDWO2A4XFyYt5ShB+KIvuenyFGKrDp4Hcg9nO+
	cIdyAWgQTF8pY6Wcg42Fyev8VW4UvZWeaOt2kDc0sUamj/ZyxxNIqHMVdGyg+M2nk8v2f0hBeGd
	p99TH7m5b8Ew8fJts+dJQetnYJzFiRYSN3gM9PSO/4bORU8Al5IpHQugSwn/jJMnQWHz8fJMA13
	R3KaAnl/OBE+gk7z8+bB6GvPWw8KdpD3w0Yp3veTCOdAC7SCgkkNgdmUI3N/mxyemljtn2adkuq
	SAfHCQq7f18WVt0O3c9MiWMJCtXCcv1OYNNivyHGV2XjFr/mHI5NWk2UGKrz+vQJhCN03dR5VA5
	4S0CTKW9VpgdZj8nb6q0eaKXOkJmzGkLdz8gsTBGoqNu7ZLzfaGiptHhqBXbU+OBd4CdYFyPvKk
	E1pjnAqPqNi8DtDQU9Mi5EwFdCH5djEiYTRfMl6Qiad/Uf27lnSqZi6BPXGqKOk6HZq0hqJqbzL
	BNfnNzBiZI1HYCNIUlOm1O/nDNONYwxKdSy84dEo2L/Gvv/H6GgB/3TZTffzYYQ+IAerJYcAW6G
	zmnEuzUmJYRcglOU0ylAAVxE0yFUfSaFkx/9efCMyZ8pEojPBCG7hA4g==
X-Received: by 2002:a05:6820:a03:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-716e79e8336mr261121eaf.42.1793904956099;
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:31 -0700
Subject: [PATCH v10 15/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-15-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_185558_223596_C866F6E6 
X-CRM114-Status: GOOD (  18.01  )
X-Spam-Score: 0.1 (/)
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

nand_subop_get_num_addr_cyc() returns the number of cycles in the current
suboperation, not the end offset in the original address instruction.
Comparing that count with the start offset plus the loop index drops
cycles when the parser splits an address instruction.

For example, an instruction with ten address cycles is accepted by the
parser and split into eight cycles followed by two. The second
suboperation starts at offset eight, so the old loop sends no address
at all while reporting success.

Use the returned count as the loop bound and retain the start offset only
when indexing the original address buffer. The parser limits each
suboperation to the eight cycles supported by the address registers.

Fixes: df5057999f8c ("mtd: rawnand: sunxi: Migrate to ->exec_op()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 54377f1789a3..0b92bbe19c0a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2518,7 +2518,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0


