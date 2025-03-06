Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3066C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=; b=WjW8PvtCyoRQgOqosP9yxoKp8m
	/G0p0B67aVgdgXUu1EpN1KO5M7ZUTcn153PGK9ZTX2ktKOSL1cZ/DNaVCCngkFMmMd2jl3EZ7tuVC
	uCxf+7xWf+m6sgR6tLr3Bht+XyZzv7mniclK1JHjFaxvozSh+kS/bl94IqBPbsuz1CDzhC3a8ACpK
	OAkpklSjfe0zoJtADvx+qSfJSZN2ZTa7epuChTrLjuBtxVJP8z79S5K+XfbnvRytlFvFR9bd4KYRc
	01lkzvUto4dwip9D2KG3HJXQZVAf8aemXixZkVZAL27pt8y49Nt9GmffDKQ0Lzl+Ch/nTL/zz0KdH
	BHBdFxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9wn-0000000ArWV-1tSc;
	Thu, 06 Mar 2025 12:03:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RA-0000000Amm7-0PVh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso3034675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260646; x=1741865446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=i09gSUXEbA8y+ayhBdgKHbkLM6axrBFYeu3qK0pQYFanrfcYfKzmegZP5+ae1SArzV
         Y3v7ABFoAGs3sFH1lKVfr9mLbzEgf9blSJ2bnSZaGjzEIUMVtp+PLhh0ooLUmJCDAgkN
         RwL5oPKlwE4LvkAK7ShqJd/jW1lYOydqYc8Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260646; x=1741865446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=sK+LE+eoD46RtI6bxkT1fB+pvvmTuWl8zSDAuJ8U+0XM2geLHJVl3J5+UkjGbdF6+8
         jC1cYvdWd5RuamUYD49OaPsC8d/qd1i4XGUe/j2vwiFhi35Y2pN/eIhGQjkdfgmOlyH6
         Crb5JtuBDmF6SWPNW+vTR4vpbCXumpmnVnPTTT4/rG3Ygrg9mj052s6ZPZDFfIMv7gvK
         J5aumEVg+VVP4doH/mc7kxc+qEjFBhJFDYsLwrJuZdElfZs0kbCOOb2GY/klZtYCurY9
         fHnMV9+kvgK/q0oSXkvrwIeaLU5wbnXRWIsPGKN/F+O2DeRJ/I4JMJodxRBZD1hyX56N
         tFyg==
X-Forwarded-Encrypted: i=1; AJvYcCVRpRGm0GXYigPDnvoz3QztT268QIPrcEhmGhGKtl5b+acXC2UtFwljR/LdePe3LjJI7swQeiZ7ca4wn/z355hB@lists.infradead.org
X-Gm-Message-State: AOJu0YzxPv5ngP+AHC+PRkzsRR3+7hKrBOt7D92HA0bRcnoOEUDgvs1I
	85oHI6pO0a5foSoVIRhKSvrJmnDkZH0skp44adE3gY5aa6ABL+YDzVDOoGK3CXM=
X-Gm-Gg: ASbGncvFKFGk4OTN8sdf/l0D1gemmeG/iZ6g+CAg9zU3Zm6CRb8YIJ0QqTsfc26A8p9
	koNaX4KSVeXkX3ygFjXp5eri6vEPrjwsVOcHsOLbory+n5EoZA44oXWOOKYUrFzTjMDbjCi5l/F
	sC0tRME8daTvvVfsdipglC1axDRnaac/6q6MlOKkme2Rwv1gLMk5Z5ZqMWPiRrWGSrIQhyYNka1
	Co3IhcfWuwM7vCaw46ZyVSXuRN08K7ou256Ts3NaO0Cem40LAyKTGTsrs4Ohdyg6GRIlf17Njkq
	4x1/IJBXrk6caMtuqZDF8eUGEzXl5YOLPwsICISk0SYIp16+NLBKl+mF/5jy/6zChwThveb8JwV
	QQm4DmQ==
X-Google-Smtp-Source: AGHT+IH78TpklUwBDK3WnRiDd3pPrpHVptMGkVV2plYHJnbyxlkTLYCF4Q+vemKiKROYa/bzJLhC9A==
X-Received: by 2002:a05:600c:5117:b0:439:a6db:1824 with SMTP id 5b1f17b1804b1-43bd29d6c7fmr66278975e9.16.1741260646580;
        Thu, 06 Mar 2025 03:30:46 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Thu,  6 Mar 2025 12:27:59 +0100
Message-ID: <20250306112959.242131-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033048_136137_DC08CE78 
X-CRM114-Status: GOOD (  11.99  )
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

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

(no changes since v9)

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v7:
- Add device_node type parameter to imx8m_anatop_get_clk_hw()
- Rename imx8m_anatop_get_clk_hw() to imx_anatop_get_clk_hw()
- Drop the gaurding macros so the code can be used also by i.MX9

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 15 +++++++++++++++
 drivers/clk/imx/clk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..a906d3cd960b 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,21 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id)
+{
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx_anatop_get_clk_hw);
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..50e407cf48d9 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,6 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
+
 #endif
-- 
2.43.0


