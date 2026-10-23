Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A0606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xBXTNtPe;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDwaCfQ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+997DNCqR7ECKcfajWdY1tQzietg9A83Oqx5Q3IXzQY=; b=xBXTNtPexk3ayQjpaQg148KlNw
	fjIBri/5sx81dRFT4RuWQGphVQcYwTAaSADFldMqAGlrU2HaWsvWhOTEDfhFP6vT15jW6weXJynmr
	G3vFViBSxT8CcmXy3xsHqNwDpJIFe9tTxiMIrWXgFvPVhpi2x+IQ5GhnW1lOsrgwfJqI6j0g/2B+C
	vAm//kr70umvw5YtG9bNVnKuwByMYvNCvz3x0BdB6/SvxP670bsVRqq8cRLU6iNxMGM26F8UW8bc0
	TRgWEy3FJDUMgSdZY1zJAs2b/Fn5QjgIfT90/oIOLVFZuC6CjkHL2Zi8+eJePxVOjWtEtnj4OROmm
	5b2hh6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEnc-0000000GKB6-1wmK;
	Fri, 23 Oct 2026 12:55:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEnb-0000000GKAE-061y;
	Fri, 23 Oct 2026 12:55:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24BB6602C3;
	Fri, 23 Oct 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792760105;
	b=Z0y/XcU6+7xocWqmVHdAobbexcTTxmna1K590qxC1Qvz7DwK0u/Sq79AXJ2I419T4O1r
	 +dEldyi+C0NQM489/0fvYhWIMptDfZWB1iK3OqeZBZq/V3aN2VpPZq0wyJB9btkZMtmX6
	 0B/ZCbE8DN2m9OPvM9KuX9nej+pL+jFUfP8pM7/N5IKQ4Dy/ls3yMb5MFD4RWWTvTHFsj
	 /M4C/+Zn6PbKSfQLAouXddNK6Srup2IdW17ApCsBzD7D2sGKLh1u+vn6tHq4ezEIhim1l
	 zwdO0u+ZTG9XngZPMXZTKyiVcO8vcibA+h8TdPBN9k7WX9IQ+ttWwp9rP+h7s30mMCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792760105;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+997DNCqR7ECKcfajWdY1tQzietg9A83Oqx5Q3IXzQY=;
	b=F1858SvgBMC0cT0HDWQoLy7vU3HSsrS2N6PPqiC1w0+4CNPy7UCWkGzVghX2+n2JCHde
	 1OAUV6+SxJBWXw1jl6UQfH/h2icCxsu35dlZaEtpoQxXuDRUkGZjWOQFIGm/gPC/R8ghc
	 YODxUcQ4TxTCMBQNJjnsX67nzPBManVGu/LuJMGSIJcB+JqynsWc8+WCAI807EU100VGh
	 AVZZset87mMve3YX8Q2NVKlMaGcpRT5g0RAvlGgET+YV58qYtdyDN5pTRYc9XOvSNP1hR
	 rhtHZpScpdVn9YvwPC3qgPZU18d0CZo9sdLijBdnBqULpyLJMSzDYDIg9kL7xJhQiBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE5FC1F01829;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760105;
	bh=+997DNCqR7ECKcfajWdY1tQzietg9A83Oqx5Q3IXzQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EDwaCfQ4f1QZnD0XAPgf5tJV/085B69uIZ9mEKpe/xC1m01GVwDojdn/iDp4uwcIm
	 bcYUdjgamgFyg+7H6Yem6Fgues4fauOUQ7lbaIH1zQRxnap386hkb0qGyjiMjzDwFL
	 z9/Co8KjzR5Nw1HZbOO3rtEKarptkI1jouNlyR8QSVgKdeLZ8lUquqq2rBRzDMlPGo
	 hy2MoXPNO/wc/Xt/LlmoIpoYre0I3EwDxJMsuDL9dBVE3FsSkw0RQ+nzTUhLi2AKJ/
	 nHgCEQ0iJttLYnOH1nTJsW67y/nO+i7YqcAk6+u6a/S4kF9ZPDkwYCp2w7KzjL7d8L
	 xSS5c0vxgcDMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 54B6644517;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 23 Oct 2026 14:53:51 +0200
Subject: [PATCH v2 1/3] clk: meson: g12a: fix swapped VID_PLL and
 VID_PLL_DIV clock ids
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-fix-g12a-clk-v2-1-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=2dFhwExwBBCr5nuNL1VrJSQXreYDqbsyvEBqlLalx/E=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9btSGVuZ3ONeevX/mYy+WN19cemgF9fm4Ob+E/IvTv+b
 vPXLzxbOkpZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJfC5hZPhScHntV127Oo9g
 Xbd7x07EHHj5Qu3q2tyXmlPz1v1d1AxUseTk0n96Ol9svUXkl07J27JSepd4yboVgjv+JH9kPJp
 yiAkA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In g12a onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..57fa086b9c8b 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4622,9 +4622,9 @@ static struct clk_hw *g12a_hw_clks[] = {
 	[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
 	[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
 	[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
-	[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
+	[CLKID_VID_PLL]			= &g12a_vid_pll.hw,
 	[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
-	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
+	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll_div.hw,
 	[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
 	[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 	[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,

-- 
2.43.0



