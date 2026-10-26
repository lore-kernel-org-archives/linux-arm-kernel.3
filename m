Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 04:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PaVGTAMI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xlqa7aNL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=; b=PaVGTAMI82yNPjgXogOz3BYeXK
	ngYe/juDnl69nL1HbETwnUX0gYUWobcK3Q7fNoGy+p58bCe2RQY2UEkbXrdLY9XIBmpABARH64H6L
	vjHVzzyPvATaTxmc8PDFdHxi2q1p3TNPYPzQ5GHhALBbeUg5gFR7yN9V6e6XzKq89aODzjw/HXrut
	nCkOMB7srJb7LWCbStGhHdgZ6S3TZcCLeuSAjQ+G433FOrgOBC9A/OqQKV15D+GcrB9KEkHCeYaIr
	RDIr6Di9oYVJKWEGHm+GyNeX7ejrXtPUHANQXcjh6eOHgpOuKy9aDSIMuo8kJW02qbQXwyrcELMAE
	vUS6BtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBv6-00000001h49-1Dv7;
	Mon, 26 Oct 2026 04:02:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBv3-00000001h3o-3zIv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 04:02:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e985106c0cso21670185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 21:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987365; x=1793592165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=Xlqa7aNLCn+xQRfNWhrMR8Zf8IVOeEdeJ37tjBQN44qkUC4H8bhgb5b7H3bakDcQUm
         fnKP82/4ar2vsjFSp5LurOrNHd4iyA1DU1CxpP+Qz26//8jTfPxkBsBBwYyB4h4BUkxF
         dGNSY7JrxJWOH2Fy/OF0tDxu4RJFfB80QbO5vvSrNboYK5QPP8c2bRg7TJ1n6N1bASHx
         P97XnrHU1O0CMeSbD02ZitVTdi4QGSDS5HI/M3OzcIxYaMBgFEMBBo0kKhiHNbOANf/R
         d4HcXPFNXDvRzci67rx6UTashwj72myarNDTKm9vizHFJm6gK4BNlea/0yNfEeb7UFT/
         cNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987365; x=1793592165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=Evl7IpiGlMg8+mOZemsKx0RJVaPK9chojxeWO24GYsBYZYZkyeszKoemT4X/Rr+hGx
         tQi9m0CYD+Rp7sRmnpZxtpDTNh6l6RQs5emvBhzIB68au3k+vMH7uCK1aKIQBP+fSFmI
         i9qjMipbe0mhd1WFKP58J7JvAnC8a0nBWeehzjdkezwhCBsqv6BQQn8/drAumMvLfwSl
         /WsJEZKmHUwDfufN4DIc49rtyGk2VSPln3ftwAJijxZzqq4z0GOQEbL6qQYXhgLoLez8
         +0SBVvmjekQ1bgMDFeTNYAwMqz9df6LJYeyzDA8/OuDHAN6wzLC872gjPg6OMpoG8C+c
         ZJ9w==
X-Forwarded-Encrypted: i=1; AKwUvBxcE6CqwsfwwRbIZF6kfN+93IhRZ8Z63CnWRmFlb3e30D9+afcKXMEZ/FEfHtUWd8Dmjt13mrmw0KpJYYBgeUaI@lists.infradead.org
X-Gm-Message-State: AFq9FYIowhv++X7gyLIOMg5ye+aZHyAHB0tAYvD0wHh74K1iLxiYHQ1Y
	RZW/aNN76sKWWwxe3SNXlVuw9Sp1bn07Z65YKABVol6NBcDgtzRVjd1E
X-Gm-Gg: AYBFou2P/y0VRZaDU7qqLLjlLm4PNnwumikURCcnSWsCXxxefHBcraJY8GpA89ueXSC
	DJorfcr5X71duEolFjGViYmZRVc86UeDER9PgHg3PryUt1MCiOE6gjKPiBNbxEhgHuJbSyjoaXc
	wqhF/jWVJuYz6D3i/vj1xWfx4KZz2+RUT45KodnbiXlxBUgnnSC6sd2fYMasuJzTxtJQEq09A39
	9vCX0E4HcM/Q266pA6yR4WA7CUj/eiE/YAaMOCG47F6oZ0UGYaZs+uqNkyqd/rnLATSFDbf4LUw
	f8BYyPznxkSSq4K+LimciQCQGfV2ilWp+jgJ8BY1NI+xH7KGsY0tDh9b79NcswoG8Uv4IrSJPwL
	eB8NNsu38pPPrY70r/2d5gKNUsg8hXbQGT5xg7+XXh+/UUHPQNs3supxhHgS9gIRdnyf6jDx7h4
	VtHq6K2edOppQdFhdb98IUb4EzkRxbYUl4afh6GZwyS5+Hw1wEU9+wvt/Zab2rvPw/7gC4Ho35E
	G5BM/jkVgVM53nJsKZYJPncZufikTi+TQGY7QeSEh0uji19aTL+5LLND1PrLivHrpiPsI1nfVWe
	AM98yHBig3gXLBtFc/4=
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr46730195ad.17.1792987364597;
        Sun, 25 Oct 2026 21:02:44 -0700 (PDT)
Received: from xiaolei-VMware-Virtual-Platform ([219.142.21.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b22416bsm10626705ad.72.2026.10.25.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:02:43 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	kernel@pengutronix.de,
	s32@nxp.com,
	linusw@kernel.org,
	s.hauer@pengutronix.de,
	sudeep.holla@kernel.org,
	cristian.marussi@arm.com,
	peng.fan@nxp.com,
	xiaoleiwangxiaolei@gmail.com
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
Date: Mon, 26 Oct 2026 12:02:30 +0800
Message-ID: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_210246_021213_71E7BEA4 
X-CRM114-Status: GOOD (  11.83  )
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

From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
of every pin into map[i].data.configs.configs, but the driver's own
pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
dt_free_map(); the duplicated configs are therefore never freed and leak
every time the DT node is parsed, e.g. on each (deferred) probe attempt.

Replace the custom dt_free_map with the core helper
pinctrl_utils_free_map(), which frees the configs of each
PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
signature matches pinctrl_ops.dt_free_map(), so the driver-specific
implementation can be dropped entirely.

Detected with kmemleak on an i.MX95 board (FRDM-IMX95).

Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 613552e35070..8cbd66950848 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -153,18 +153,12 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void pinctrl_scmi_imx_dt_free_map(struct pinctrl_dev *pctldev,
-					 struct pinctrl_map *map, unsigned int num_maps)
-{
-	kfree(map);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
-	.dt_free_map = pinctrl_scmi_imx_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
-- 
2.34.1


