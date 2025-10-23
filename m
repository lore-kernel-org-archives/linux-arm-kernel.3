Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19530CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViiYTadCC5HwWfo1viya9cr0SKdI+RgvnHat1NQKGIA=; b=381aeI5nxgkGxFk8x2o6FadAkL
	cl7m9NaxNcmTRIeCveXLwnq2EwJE6//7tgdZ12N5tC3KVlYZuNyiNyp0rMbx74bov4EUwi7zCS1Mp
	O1FEpc5fKysV7qk7+2XOawkeA56nkCqR87EsgcLGoK7xDivU0Kwijlx0d54lSSDERA10umuMFtc7P
	6nIJ1GIctdfwGNXwPjL3caHptfvGw5rp2gIzEAivlr26gzqrBBURLMks6/7ag9G+s3RBiSPjuhHYn
	OhL4E8XYpzp1Pwy9jjMna/6QlKYGwqDfl/P+X+aktU6NdexmReZK9c3NsdHEeRpSK7hSvrbdbAHqo
	I+609EnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsd1-00000005uCk-0pyJ;
	Thu, 23 Oct 2025 10:33:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBscp-00000005ttk-2hS9;
	Thu, 23 Oct 2025 10:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ViiYTadCC5HwWfo1viya9cr0SKdI+RgvnHat1NQKGIA=; b=jKrkbbMQtI72mLRfVqWjuBLGhD
	5gdDnrtC7CH0TsH9ze0mZQk0F7/l2rdDpMoYOuseiSDsol31+Tq7m+5M1kGbfXb7YcpNsjKhXoN/n
	/naIyhyNKPW7XdeKJIe8aPSWhY39UpwgBskkc4M9VG0yYzZy2xsNx3tT8xv7pDCP3fhHPPOagYDQ2
	Zph/t2pwlFRR/2W9AnZaWldp7e54Od5IeNsoIeUqgfEEs62gbNdNyhVl+8LEMJSEpGQ+zP9CH9Ry1
	B7Xlr5sYZSpVesMAY7fhJB1Hnv4ZMvBJd4jzG45tHBKDbyQE4Fp1pTuIFuqqkzkUROl16fHJsEvme
	OGQJyT8w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrl3-00000001FVV-20BC;
	Thu, 23 Oct 2025 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761215564;
	bh=MQSK8eGfZb88NZ3j7UoADOEH321wqDKatMU6JULsmYg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n44EJIIXeMlyRQO6GFwEtVAy8Yqx1E20uEFWIFb0rzsgl5roh3hbVOAH9ELifEV6c
	 ufEoQxe41PfutgWhOjKD4Q4SSFVvhiJn9ff6SiruK3S2jlg081k1UZnzdk0gVPED9M
	 KzYfw5bRFrAflxpPWTJ5hFpvE6zdeIu6+xP6WGjZJ6V6b46+NOpLsWbXk8FNOM6h23
	 6JY5DC/8UExUyoUQv6tFwMm5z57xt9y86TFgIyqG1TdqiZAWrpjSM3uf9iapVnWRDB
	 0m9rJXx0BWw8kxqtb/nnutlB3XYI8GBtoHeVdtOX36LWy66GyAJKf/L3AtC1KV82nD
	 pyHu3DemrpGcA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3BDC17E0CF8;
	Thu, 23 Oct 2025 12:32:43 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 23 Oct 2025 12:32:34 +0200
Subject: [PATCH v11 08/11] drm/mediatek: mtk_hdmi_common: Add var to enable
 interlaced modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mediatek-drm-hdmi-v2-v11-8-7873ec4a1edf@collabora.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761215558; l=1712;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ooyxyCrBJchtLibasSNhjEb1Q7PQIVAYDmD7Jp6t8XU=;
 b=KzQIqWedLyDZ6Bpa5QjWOcBPAqPgH0S4OcFpdkTeChXSy7obIj2+73rcLMaUNKtfechrnP/6c
 nmsyG145JWSB/WLcAVhELKoxnAjG2WeuiDd7kBvpdDiP58ZgyuAlUba
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_103722_548069_708281B3 
X-CRM114-Status: UNSURE (   9.58  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
which will be used to signal whether interlaced modes are supported
by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index be63f33d39bfd4625a5f1edd83c873cc20ac0018..38986ab61795c22b5b0659ad2ca258b923034a34 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -421,6 +421,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
+	hdmi->bridge.interlace_allowed = ver_conf->interlace_allowed;
 
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index d3de8afff40f2b1a16e87b157859c04109b6da9f..38d1bdf4c77e4f6684473abec0e8c1e6ddc7db0f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -131,6 +131,7 @@ struct mtk_hdmi_ver_conf {
 	const struct hdmi_codec_ops *codec_ops;
 	const char * const *mtk_hdmi_clock_names;
 	int num_clocks;
+	bool interlace_allowed;
 };
 
 struct mtk_hdmi_conf {

-- 
2.51.0


