Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54458606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=klwuAi7P;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4DLxkZ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=; b=klwuAi7PkvBgqXwK4fjW5n7ZmI
	ljDBAk0jtwREIhEk4i9FYtElZeINaemRALIunRbzZOUjVmkSKBllh4IymIiWHLOyoD8H0Dt+ah47o
	H0QR92U6H7vEL/dScW6YLlkOVzXQbrBeR0B4bR5KI7mvjlrhXGpi2t/ZMd4BBuZP0hYFc0y3R9Tkl
	9cYwYLFV9HDOxx6Jme35q03HitS43uoKcK4MDTX2OM7ojsAhg3UUGKphtt6Ubqhhm4GXqCDQyZpZM
	As1upTDUiINBIW6fdiJKuYfIrgotA4miALNERJlRgl+ee3VpiAWSa45zR0KYfunANwe/GIUWxku69
	NfMjR5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4I0-0000000D34k-1KkJ;
	Sat, 31 Oct 2026 08:18:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4Hx-0000000D346-3Uxq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 08:18:11 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cdab938dc83so607267a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793434688; x=1794039488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
        b=E4DLxkZ1gcrh5tQYjcvdy51K5dW8kitmaEQTLdT8QJmuyQDA2VjYQ8twLKbHj35Pop
         8kFjuOPd2f8D5yVwLKMrj3iahJ57AvGHhvJy1S+JJ3NIWRE+e3U+TxzYjHGiMcgw05AX
         XDlJBubwxPvRjdJY6aTgnXpbuLpvxyNjC9xyyqof67ug7Yya4MqFZVZTe40tdu1tMgBU
         g5JzvhgOJjC6P2LK+AdYsd9u8h6bi+S7AmEweAle+un9pRjSukjuTVOx9be0thFxcey/
         jBPI9EKeOhwDN5z6F/okumTCVmUvo9tRWDtX78jCquOsm47TorRUodWhJZbOQyk5rfwO
         1jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434688; x=1794039488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
        b=jwNek8jvvGfgWC7kjpdGocy6ZSaDIzjTjQ9Wchkk9r7u4B8Tc6v/tvmITvJFSy3x5M
         xSfNHh9BeIxm5IPblgsXzMCvYyGZoiXNU0eCCt3Yx/XTcWNQePbf0WkXZksBGgwYf5qw
         RdMYVJ0GFeZvIRSzXpEjs74BhkyXOHR4A74YmT0N8TtJRvpFxZXVZ6p3ixnFVPgJHR4m
         PSH1aHJWkHw6cNeAxbJlQfi6lakXDM0LJXQMr+BA0fnM7bJh57IpC8dNxPV6wmYyo3pg
         uT5Pe6GM/KAGZdEXxb7XsYsYuKkuwyxmnmhEyv1/1GMU64TrYUHwcf1Fr4NcaifM0Zin
         moqw==
X-Forwarded-Encrypted: i=1; AKwUvBxgagLY8n2kkAhHWQkSnmOr8GWxGsnLt5vVruE19+lJp1jFuw9M/kafqKfuu9x6O9bSPddeQDqw3b53WPVnKiHQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKbPUxIiafbDYVdzJpKvODvMaWIFknpNDZSN3AjOArhhNdWzwdD
	DAHqdxTID1C90zavYhez78sBogP+7qr7ZQM7B+8RY7pibqwt+gYLfgqJ
X-Gm-Gg: AYBFou1DMrXhVAxyfLM9V5ef36o5WEKFqS+tLqKFikZPrSumrmaGWUo1EFXD1+1usmk
	1ObK6Zy8krhVa9aZbQ9chlHzAswPYfjAtemcecFsv/B4ezbvDbkX2+q3a6mLYUxxisWkRpV1ZK7
	CDf5KUcYe6TU3ceqhe7F3FXK3lHr6o6e4RRiWog9bQ0o82kyBqw5MZxSrICjc2sykgEa8Q0zydH
	GFweCZPfzDnVzosq4f3lRhoSfGfwP5gifq93xwThSLmSjan6G7qKCL5NfYGnj6l65o4AJccQYY8
	T4pgJfLDcOX62/1hRyaAds2lL7vuRfrgv5TE8AW8Psi6FsWHGS3hvlJeQ/AeWFehvApMOIWdSBQ
	NJw+Mwe273T760lIgDRmJCS5CrIhyFSAh77EUvmB9PNB8JH5Lkx492oAjX3S7CKHy7y7tk/2ziC
	ZPAnb7ILZQxT0U84EQ2wKPwVwbzx4RIgY2kL+6kIABRii0pQTYNr9lbb57sryOAr0YI7TfZ5M1F
	KwifSlP3ja4mNTh3xVjLK8oubOH6LXhIpEWFXuavNB9ChbxEK3efB5iYLerN+4vvfLgdbqCGlkt
	yRlgI5EOYsb/j0t5SiE15aKHWYPkxhQ9zbC8uSGQ+STYrZHbDo0krCq3rz2xSC5ST6E=
X-Received: by 2002:a17:90b:43:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ae8979de24mr3720019a91.43.1793434688533;
        Sat, 31 Oct 2026 01:18:08 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm11288897a91.14.2026.10.31.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:18:08 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	James Tai <james.tai@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Date: Sat, 31 Oct 2026 17:18:04 +0900
Message-ID: <20261031081804.218566-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_011809_877942_D3EE1812 
X-CRM114-Status: GOOD (  12.01  )
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

rtd_pconf_parse_conf() maps slew-rate arguments 1, 10, 20 and 30 to the
two-bit field values 0, 1, 2 and 3. However, it shifts the original
argument into the register value instead of using the computed encoding.
After masking, these arguments write 1, 2, 0 and 2 respectively. In
particular, the distinct 10 and 30 settings write the same field value.

Use set_val when constructing the register value so that both individual
pin and group configuration apply the existing conversion. Leave argument
validation, field offsets, masks and regmap error handling unchanged.

Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input voltage and high VIL")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU kernel exercised the RTD1625 MAIN2 pin and group
state-selection paths using the real pinctrl callbacks and a synthetic
regmap backend. A slew-rate request of 10 wrote field value 2 before
the change and 1 after it, while adjacent bits were preserved. No
board device tree, physical MMIO or signal timing was tested.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60222339726b4..656c281c557ac 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -438,7 +438,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		sr_off = config_desc->base_bit + config_desc->slew_rate_offset;
 		reg_off = config_desc->reg_offset;
 		mask = 0x3 << sr_off;
-		val = arg << sr_off;
+		val = set_val << sr_off;
 		break;
 
 	case PIN_CONFIG_INPUT_VOLTAGE_UV:
-- 
2.55.0


