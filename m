Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F8ACF45DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ1oqR6flngVgQCZ/N2fRFagRwftgC8EzK5dR2TavOM=; b=A12MLPwlLXc6sBRyDFgRSgfvyS
	irH1iS+bisise2u+NOXLfKyfi9EAh2zcgZmliONIWtYbnINXO2UmanWvVbWWUZ8TJ/QVMC889YOD6
	PLkmG1MepP5Ifba6Hxo8xeKNO9YV42s3mlWTIoUiwp8UPCI/ICOQQk0r2vq0N07COUzV769o1rKZC
	PmMcq/ejy9Jy67XF0wrYWwo+f0Ou3hzHLiv3lw49GosUeNgDqm8XmyI/vC+W5eydgJDZ3E+s0GvYR
	qbCECj/XyQ+pXlVrvy6vxoPFm8TYRPfIlZ1kdAvlmvK7selTRhoRZvLRNSwprCr/Q9f7icBzshxm+
	SQhYhHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDl-00000006HyN-34Q0;
	Mon, 12 Jan 2026 23:21:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDh-00000006Htn-1kY7;
	Mon, 12 Jan 2026 23:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pQ1oqR6flngVgQCZ/N2fRFagRwftgC8EzK5dR2TavOM=; b=dTGYv6rsfKPqBs4mA4T/+oIsmB
	oIOv949BJdcQ9KhaI+hoersyd4oGwXwgXx3ThB6kxYdoElWxmTASxbM9yVR/RFaidu+GjTjDRT+Ji
	MwNp9NeC4ql96D31W5ueoTjh0ZsLkvnaBrAzMfW6SLjmGTGNcPUodsI3v5jBYUFZbOzh4x588bJGt
	P2WGGxeZhGMAiCq8my4+t1LSwM8fo+w0JOLfb14WrbAMl0iljhjZvZrfpnHxjSJzlcy757xapzdiT
	XkxUXKHmNWEUr3QhVndiuhIp1a8EqonqLE6pe6jIhnMJtREnglNi0q1OpDlTIS1j3d/XNhC7KHF0w
	5oeJ8bCw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDa-00000001oNh-3ABN;
	Mon, 12 Jan 2026 23:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768260060;
	bh=KLY3/5FYOtbcL49AzwCGiqkdVvb9UF8bBOYJdOQPcj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mGtV1XaDKqRCqM/DF3TmwnR/eIh9+7E6Kb6rMv9zzWxr2HHvwyRkwo93SlgoYvSI0
	 v99g7DOatsU1RqVdzrN1MSCrJdVgFUdKJ0R4VGNDOKew92hOJO02/EZ9VJhDgkCStw
	 SadAWTj7EKjAhpKgHTlCkw+68PcjawnWtUi4Cb2Omksf3l4nxgM8SA0GP3XAmhWNW5
	 jklrT/7MFpULWLT4ktbAKtugF18jjGyLrJ9/UzS+8un+RuIvMTgTc6cPgJ0PndJuKB
	 EjegJvMom84a/qKasP+212soyKaAbMnzBxT565AEc0uW7RgpgFx+XVs/T0wjAAS3/1
	 KSN3g+ijL2tzA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F29B617E10F4;
	Tue, 13 Jan 2026 00:20:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Jan 2026 01:20:49 +0200
Subject: [PATCH v6 02/11] phy: rockchip: samsung-hdptx: Use usleep_range()
 instead of udelay()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-phy-hdptx-frl-v6-2-8d5f97419c0b@collabora.com>
References: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
In-Reply-To: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232103_151630_B9F2CBCC 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

rk_hdptx_dp_reset() is allowed to sleep, hence replace the busy waiting
with usleep_range(), to allow other threads to run.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index a65e96694237..89710066d70c 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1042,7 +1042,7 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
 
 	reset_control_assert(hdptx->rsts[RST_APB].rstc);
-	udelay(10);
+	usleep_range(10, 15);
 	reset_control_deassert(hdptx->rsts[RST_APB].rstc);
 
 	regmap_update_bits(hdptx->regmap, LANE_REG(0301),

-- 
2.52.0


