Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19982606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NowRlvJn;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A01MUKeV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=; b=NowRlvJnVcYWg6
	RZgTx0Q0iTboExPBO8mijFwSffFSoLT5g8W94impBTW8InTfek8gXtSVAwr8jxjT1ya6N66Zu/OCo
	+c6XqIgDlKD4x+IQuPSOa5rBb99UnJdzj/YkcXbLgF75Dut3NPaY3yLE+EPiIT61fWEfcYPrTBDdD
	y9Xw518bhQuEdsO9KDP9oWjN5/g+8hJVpKPs2tMSbqrABPYlwCnGRX3fR7SRxhUKeP+P5XWQzUdno
	Cfg9oI1PJEHqYwmQWc5i2W0tSZBJ1mJntoMeE4i7jCYYcjjdD9/giCvoG0iCMfcbPXi8Ib7e+J6K1
	YHIOoEeSxbCaHP6wVN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyjz-000000015s1-060i;
	Sun, 25 Oct 2026 13:58:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyjw-000000015qm-1fnq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 13:58:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e4831c028so575131f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936702; x=1793541502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
        b=A01MUKeVwjNQ6XEvJKhYUVreWZNA82HtoBsBdbTjVecDg3TrczSE624U3+hNeefciR
         2TcuSIq5C6DEnakzQTReKju6RBK8DVBL8HmgxZXmW+ffzir7w+ePmelkICfeUT+leJ7R
         s/kOgHO4hdVsigrtQQqjtQC+auNY/vqak8nHvLmRh7P6XMTx/CGrAAygjHih7vqBbR58
         VeHP7mSuKpAUmmN8GU6IbOaYZT531Om2wAB0V3p0MS6B+VSOw9qJO+GzygCsSbk+km2c
         1I+tVTtVQgQHRCDj2+5sFbUGuoUl/T9YcGrkOmeufTuIxB2KUdiY6u6HTR/I+Um3KaST
         /nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936702; x=1793541502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
        b=bmF803SgfltjUU0xE2j7J5HpggizxAx7+CZLgl1ggkbZbBfndc82MFiVeoEOLXuxOV
         /i9cad6iZs8WmsgKDnvAdVDlzHVDLlpbD72IZIaF4Fo7+LbguBtBOeb2CvZMtFFkcAGo
         1KQoh4utAnNj8bjOSss0Wt7R8U+AOKRehwf0hJeveVYLkhvN0P31ZQVWhy1d1pmH1um1
         sS3hFxC3AWOvHW5ZQ+5rnXWaoQ87MzUZW5F65WDB6EKdWXpC5ORs5otvIp9CaWYRhXuq
         2ziX55xJpdVQS0KviWFM8dgNcUiMw+bdcrQ5tliaDaEMw+as3AToVJOljkTIokwdmA56
         VCCA==
X-Forwarded-Encrypted: i=1; AKwUvBypcCcAfdo6rpTV5Ei4+C2PoHVRCvPQv0H6gVBu7QXh8OFoPlAyfG3XoM5tQiB9ElmB7LMvNPEKDckQV4U5UVk4@lists.infradead.org
X-Gm-Message-State: AFq9FYJix1u3eg1mGk46/PdOICQaAbEslvLwJzT3zYUuknG4IWxSf3qa
	pkq29xSwgkQM70EZSmf0bHzXHBO7t0gsOAoGCx4n3zMYCQ+YFjxvUFI6
X-Gm-Gg: AYBFou0ueJEaVobTTBE5MksYEtcF+IfAn7id8noKsA43VHtaldhyQE9/l57wopiTyMt
	tiJ6cRK7/SmTTf4TBDjTUD/0aSZII/QJ0p5hf/LHkr1CZ3N7UQZwm+3qSq3rsVhQo6W+T1PiZGi
	FGA4LmUxjdE6BwCnP2t1XvoYVzr66s8GK0W/yRFqMbxfsHuCStYEvCR1lZpf6SYGj8aZdZlyN4y
	KrFGrLfq6HrLqI4eKwth0UQjV5erm+Q+t4HEE3xHyrPfB2lNXwJ7KpDBLLIpUQeE/hU3O0qoG8T
	wpb2i81xSx84ObFJNItYIkjliIaraW3l5CazYnHSvTFgfkm1XCO8w7oKuX9sQ4CfR4KkEszLH+X
	xOPgeOiuakJU0HvNil9PwDMumpoU295UCjt/oVKiAwPUtwtGH4/qtWvEVJQ9136XC5363el6tPE
	WUaSwIa5GmKBoK+IIvwpiogKBdLUqwAKSTNPB2hxtwKR9hIv5SCwtD3vnHtC7Y31kOCnkxX1hf1
	Uz4XEOWeWDrgpfYnkwtFn1W3fxYy8DC440SJXX4uC2TrS30al+65GdqjTP7i1v49a9h2zlQtHMR
	76mnSlk4Y0fM5Q==
X-Received: by 2002:a05:6000:46d9:b0:48d:f498:91e9 with SMTP id ffacd0b85a97d-48e3eb615a0mr4599278f8f.9.1792936702426;
        Sun, 25 Oct 2026 06:58:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:21 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:43 +0000
Message-ID: <20261025135745.102970-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_065824_454482_2C66A407 
X-CRM114-Status: GOOD (  17.68  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. This also fixes PK on both, which was
numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93d..940942bf6f95 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
-- 
2.52.0


