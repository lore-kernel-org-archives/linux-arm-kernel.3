Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DbYGZZH6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/MwlnWD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=; b=DbYGZZH6ZkCwSKofqkuzEs1Yip
	R7Djn/1kExfRCCBk+Z7OqNHBOOR58dzlNEJFYa1D/eoCOqitMJisEETQ2mfvj3NpSVZp0/Y/+9Rew
	iKmycvI4VYI7Paar1dNFf/dootox3kscl70YL4mYkZHakQsTaikuN1m0MKhLZ1vpcsM/ieasoYxq3
	H6h6KnUr4W6M11b5jm+KD2AkcvasROmx4r5NdnA4wkDcUF5QrLhTEnyZDz8vXe1XWRYY8LPdCGs4t
	FxiIHxpAnGWSmxP1L8RXboXXKZJSQ52Y6wlpqsYl/IQyr7QMpoIo8B1V4lBsCU2bGLX4GH6s7wA9T
	S4+mP6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPiw-0000000362M-44oE;
	Mon, 26 Oct 2026 18:47:10 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPiu-0000000361g-2Okm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:47:09 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-820ff812cd8so609990a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793040427; x=1793645227; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
        b=I/MwlnWDI2+5nMUKHbXqu+Ic1Oxmn4x+izUY8uIgUQwZVjDfcDCSVul3wEIduIajIa
         Lh9WhTcT79/m0/cx5EKIavVT+f3vEzvGJ9MeuYOPaCQlwtd1B5IEn5ta4+oCEAEpXAHj
         Z9/p898YjWwialXMPzvJ5vCnoskCzMhDe0PFusBW2ff2w1N5v2Y3/JyrVI9bE5RKEphS
         sYUZ3gXXEIZC7/PXQo4vU0SETbZR6MP7giVlTwq9lQ3Uz4n0669PFcHDm9BQgu2LE8EN
         xTrrWAOCgiVEGJ/8oZSz80HAba8snZPEibif8FPcmVWjecehtIteuUNoM6LBU1XPt3zK
         SzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040427; x=1793645227;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
        b=wFlsi4Ku+KlBy9ieuP4ILDIEnwz1Axr4Bs8E/8kYel51eEgY+KzJ7v91PZLFliMRrA
         jfS3IyJ0n7h7tf1H51u8ENZxhTSU6evYq5bgw2e4lP5bw1/V2lgz7PB9MpN79EXcYCB2
         ohMU5o2C8XBwVZDwNXPQlzNwd9VmUvUaZXM7fWrikBg2cy9QRcIIOsuc2vGoZ39oEvW+
         Gx1Kqr81X30vrY9ZlXzMHD4Y0uGWXdgr1/xfjqMIGG7f6U5EvLTPi6d8CHy38y4v5Ig0
         hLY3JeT3jEXTyJzKPeF99NGxIQ7VcXkb9M41r25TKiYZKPLtp7BtMh7MKJp2/ccU+hjj
         PvJg==
X-Forwarded-Encrypted: i=1; AKwUvBy6SuwoF9rSZ7JhL3fGdi9und91rBkuyB+xYISWdhe86K8yD9S9pXOqA5gK494JshsNiL3pDWHUazSBffrt9YWM@lists.infradead.org
X-Gm-Message-State: AFq9FYIwT5yxum4NbZJueh+Q3TNaakRnkR4AXyULdb0QIaRibSJSYSO4
	XqsxDisKRxunkTaGLhXUKWhxXoCGBYBFFaOq8Qo10xei/3/wYy8bMCbW
X-Gm-Gg: AYBFou2sSi7p3jx43pcQB+OEWdhfmNo3s45mf6XIcNFOLXipsROdNea1jHQ2wmwMk5K
	KAYKETl6+RmVSK5JbJlA+v4kMAHV4uMfbo0yNP05GqFK5UbqNAkTEJ3TS+1lib3axUDfvlNgmIU
	SE6J25heNcuDIvFtqpTKkphVt8oecYJCxHUv84LdYnD3kxQ7VChQGG0F3IZJIhO+vNTL5Ql+8HU
	9jVtkxuzQ2Jt/ADxfCryIqyFNY70hhRNrspWZT/ieABRx9e7s3C4oex3cMVueZq8B+X9AhNNKaa
	WR3DQCtcUZSl3jgOjNaOPEKDmfH/mb9oHP1UhPzla0W7oMbLp95paMUn5ZWwdcSjTdOKEGtr/7P
	WhLE5kWgdKtkn+kU0Nzg5hgEvBJq/5zNE7B6XT5VFWJM34rF+OFMYDJJughli9lyCrnuIifflil
	k7xCz8/38Nfoqd+Mh3Fg6hwMN+LoDY/VJMZjcfiw+ehARHYworiuczqIqN1PCI3PWG2Mqt0D1Ci
	ad5aGqS9Q7FrmBERSjtSwKMhn8ugmMFmnnKx1k0r1cPGwM4K5yD4RBQLHyC+m9eO9b5RDAAOwo/
	y7qivuxc57hiUlcmZ9bxGd/nEwEUX3hJv8hBjgHZobx+Ig==
X-Received: by 2002:a05:6830:7199:b0:7e9:5022:3639 with SMTP id 46e09a7af769-850fe7e59f0mr5417002a34.15.1793040427069;
        Mon, 26 Oct 2026 11:47:07 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb64a8c4sm9452605a34.15.2026.10.26.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:47:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 13:47:05 -0500
Subject: [PATCH] hwrng: mtk - wait long enough for the next word
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mtk-rng-timeout-v1-1-551b4b6b4f86@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NWwrDIBAF0K3IfGcgSh/gVko/Yr0xQ6sJo4ZCy
 N4LPRs4B1WooJI3Byl2qbIW8sYOhl7LVBJYInlDbnQ3OzrLGrSD64JPXAv3rTbFlKUkzu3NWhI
 3yVh7Y8wuXOLV3kMADYY2xSzf//V4nucPzSaWZXsAAAA=
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-mtk-rng-timeout-ef2b4d517bbe
To: Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793040426; l=1620;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=IuMYyT08pr1KbGdmcYeCjFIAs9aPWMDDQq2g+dBxKsA=;
 b=BCpb00G2sXtwWwzQtszJ4RUJd1Ta33TQmQcTVF3zzAPw45ys60thfOxpVhdvg3QQhvsHJxJ9z
 6H7v43IoIqiBTpDoHSkWDe9HxC6IzvLm5WkBpWdBPuigVdYwpCdGc8M
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_114708_627189_E7D04647 
X-CRM114-Status: GOOD (  13.22  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_rng_wait_ready() gives the generator 60 us to produce the next
32-bit word. On MT8695 it takes longer: timed over 1421 waits, the
median was 82 us, the 99th percentile 92 us and the longest 225 us. So
most waits time out. A read that fails on its first word returns -EIO,
which a read from /dev/hwrng after a short idle period does more often
than not, and longer reads come back short.

Raise the timeout to 1 ms. Generators that are faster still return as
soon as the word is ready. On MT8695, 20 reads after idle periods all
succeeded, and a 256 KiB read returned in full at the same 63 KB/s.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found while bringing up mainline on the Amazon Fire TV Stick (3rd
generation, MT8695), whose RNG uses the mediatek,mt7623-rng compatible.
The board's devicetree is not upstream yet. The timings were taken with
a temporary print in mtk_rng_wait_ready().
---
 drivers/char/hw_random/mtk-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1f9793010e6c..8e3c99e5db3b 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -25,7 +25,7 @@
 #define RNG_AUTOSUSPEND_TIMEOUT		100
 
 #define USEC_POLL			2
-#define TIMEOUT_POLL			60
+#define TIMEOUT_POLL			1000
 
 #define RNG_CTRL			0x00
 #define RNG_EN				BIT(0)

---
base-commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
change-id: 20261021-rbrue-sheldon-upstreaming-mtk-rng-timeout-ef2b4d517bbe

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


