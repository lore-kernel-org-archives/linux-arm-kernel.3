Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C2C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stGPs5+6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxkQ5Ehu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oKDGcISKRXyb1sB9uqlDY+pTllRaTOFvJWwaXJaklRE=; b=stGPs5+6+ZlA4g
	gAtQKdMfSB8vgj3e0cxdNVZFTaHkLRvLZiwwQQYk8uEzpMC/HevaiN3SDS6Q3gS5kt6yk/YSnAd/l
	nGR0xnSxwkpyhzi/hH5v/pkrNT9Vj66dIj1zyjNQjRQGUXOpomEk8++mgsndpgvsLHqsclc4GaFYm
	v5UNJEboEQK7j2ISIqwmusZv/kybySxeIWwyZCY9wk/fdLPHtcgE4dd2eJ6tAIHj9zmS5WJwUCxqj
	VS+ewM0gD+mlYz62yiaw0AEAAW6hxtBbevW5P4QlYgscDIg44p0fRNzUv5vWyKsWCby+8ZVyWNbCk
	cBakuagit80WIlxD91yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5X-0000000FoQ2-0YkU;
	Fri, 23 Oct 2026 07:53:19 +0000
Received: from mail-dl2-x06.google.com ([2607:f8b0:4864:38::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5Q-0000000FoIS-0NFt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:53:13 +0000
Received: by mail-dl2-x06.google.com with SMTP id a92af1059eb24-14b4e009173so10958c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741991; x=1793346791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKDGcISKRXyb1sB9uqlDY+pTllRaTOFvJWwaXJaklRE=;
        b=OxkQ5EhupjeipoOrzSjp+SNdWLyQqGWDSJIawjDuRGY9aAF9vfggvjGI29GfDR6AdG
         iQ9fn7CMvivl0OgB79vSBsPK4O4BnRt/VYCniafaap3UayIDo94yKxDakKtTtO3DQS7M
         geFTie7ATAUakEpPQeGdDShblD7zE3iMHV5TgOVyNvDezq8B1DRDUZWInxwhXQj7Xzfg
         lLPdA+oO/FqBhwJg1ne+C4jqWvCcb0OLe23Du/I3232yZmCtZ9KiuERGfWpPARDDwgt3
         VpCE0WnJyRjOhVC594TjNhsKKThTkOsXeNUwWEJw/Ue4HIhup1AuzNN6y2bT9r37HY+a
         AecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741991; x=1793346791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKDGcISKRXyb1sB9uqlDY+pTllRaTOFvJWwaXJaklRE=;
        b=ZEtvSRJQMpPf+MKH4Wasx5ISwfWLk/a9q6Y83kogm09mV4ESjM/naphEhjHSrB3a2j
         p9yC9xlQ3dJBQk6OKng8ewq2V8tYKJXD/lIED7irufcCbnM+Ngm8wBYzX62LESLrtsBp
         vZTflopMtcTUcZWtj4ETJBpzfVFFu+5829NjZ2lkVBudNGfmgQIVHqdeAytCY3Bw8e3q
         4RgM/B1W5a1mUeepv80PZWTi8wr8hJoy+fR68EQYfVJ06tQlfwxUQlAAbgOky8sMh90d
         i4aX9RdqErWc1/KWCBrsq7b/ejz+I/BDTkg/8y317i0PwKIa20SAfNXrAQRsRHwEZqxQ
         /UXA==
X-Forwarded-Encrypted: i=1; AKwUvByL71F4ftvih4z7CUfqg94CCjQkvfBfpSb/onjN5DyZq0udFUmfNLXYi8KudUAGAV7115K+82gqfB2nHbiK9Sc+@lists.infradead.org
X-Gm-Message-State: AFq9FYL69qf45vmVYSfkYvZEZfmMp770PHSkOawe3A8ISStBXnohVwRi
	RUu41l4R2AOKFzn1ULDog7ieGITsqSbxMwGCka0f/IzcoO8uaB7lImB1
X-Gm-Gg: AYBFou10s0OVgkASNHAuIZcqfWUfQ3RM8qV+LndR0B7Pds2ZKibADmPPcB7wQQwOMrb
	df7usb+InAj9Cmq6gu0uLYXjUa0N76xedLYKo2DUjfPCNGzdqmoLxMlfJ9gFOBRAypRU0bG97bn
	oAh9nZl1VmPmaADcXeFlf904FeO3IK1Mm2mpszhP2DcqJTB3fyIPkVoJEp265XR2k9JIzjKy+wk
	VRXFBP9RlBuNjgIZO0CpSnnko0le2TXdCnTZU21pDWqPqZEYLYeExDMPNNiYKPDJERRFxpg+zqg
	0U6/3nlUjTfvF4mhguSqUGa+Igz8OPy9SPPS6IhxjXxlnji2RUOZ3qnUqEbazZPW0r575NczPTD
	vSd8gOcjL5DPMF08TY7YtZamLrPzOXA/LWyOzwYj8Beu5YdRbSZ3MTsPR3kWStOXcP1tWYNHYWl
	HD+SudWhOXpqXDdGcmrbuEWDsmNQqFI42hO7SUIb0eUFaQvR4sO2S+JIqwGFtJBBYAsIfbzWqPB
	rMtQuMus5lImJAVnfM9pLP45d7ORUomoX1kAp8665LU+2qyuXaLz0A=
X-Received: by 2002:a05:7022:3b89:b0:196:b805:9546 with SMTP id a92af1059eb24-196b814d873mr867259c88.10.1792741990964;
        Fri, 23 Oct 2026 00:53:10 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:10 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/4] net: pcs: xpcs-rk: fix cleanup action error message
Date: Fri, 23 Oct 2026 15:52:14 +0800
Message-ID: <20261023075214.1793922-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005312_139339_5CAAF2B4 
X-CRM114-Status: GOOD (  13.04  )
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

The devm action registered by xpcs_rk_init_clk() force-suspends the
device and disables the EEE clock, but the current error message only
mentions the EEE clock. Point at the cleanup action by name instead,
so the message covers both parts of what the action does.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index 698a43b75334..6f0a110e32d2 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -365,7 +365,7 @@ static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
 
 	ret = devm_add_action_or_reset(dev, xpcs_rk_exit_clk, pxpcs);
 	if (ret) {
-		dev_err(dev, "Failed to register devm for EEE clock: %d\n", ret);
+		dev_err(dev, "Failed to register devm for xpcs_rk_exit_clk: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.3


