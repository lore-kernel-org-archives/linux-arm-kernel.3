Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5545EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=ain8pZnpCz4INwQ4oczofA1tRn
	I00AD6dKB3DxxDx16mnu4CvMUuXCuQAxh3wwvmvUnPOR86U8lFFOlifQn2/IHBtsZx0RRc+rd/yIa
	/RxpDNHBX5TIbNY66BhytFMzt4bvxxJ2cHZqyusqCILHR4q/ezWOPuezdRsIQL3pzAi3QLbJVhdk6
	0uEtY9YyulscbCQYLai0UU/2xNcjMJPZpoAhPyMGC3zllUMu1iQAzdOM9jsZuzQ4goVWisre34O88
	14dMz1kyEhsmlsmjyxaEHnObfeG1+vljTBdIVkoAP+xd/Hpa7N48OgQX2T3s4w0Ez6Algdx/udith
	MtbXmOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcuR-00000001nPB-1duT;
	Mon, 10 Feb 2025 23:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWy-00000001iXN-2pul;
	Mon, 10 Feb 2025 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=LtduGbVOEg+ihZIE+tHHtz95Kn
	b0zE6tZiF6dFNn9vtqYuCL1NaXUqRK4E1Vchfuupu7pgCX08Okd395DpRIOqH37GHXnPJLlO97UO3
	dWcb5tXAVzvBV374JTvrLx26SvFzPhQhPpeHI7tQn34UA4xoFKXA6SHjSkycTgk3j+MqXaq5EddxN
	rF8FXT4NhFGSpI0pjOGuhFgVr359NArF8QMHmekOEfO74yeaLeUPVn+sUiD0jg1WOfgb9kYxoTOPS
	FULFUsJgBGW0SOAyjOXEpp+4ZXgLJXS/jxWoy84IAYg1aGAmzzVAvm3xI1vog1jCL0Wu4tlGZUtPJ
	ME/ZcDKg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWr-00000000L4L-397k;
	Mon, 10 Feb 2025 22:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=YqhHgqVH1KmLYmM/0G8Qrd9shE
	QrvKslLO7KYJHV7Y5VsxF+kqxmBz0NrRW/VoWvt45H2dm0gOjApe63HT0gmPgGr5xg4ccsYi80k8r
	3TY2tNpQBPHPlpNh2p+HKUDtulJK+3Dm0CxBkKGy3xpM2qSn7FNWva7lTJHuav3wx+QhOI+Sym/Yk
	l7QzHEKP9ICHj8w+wvm38p67E1QLwq6talLoRL5hyegiaBXJ3c2/x/DEbfJXib4IQn96KgTpst02Y
	BD7QmLQxVPR9t1RcHyeNC9y0yVCqxp050KdLnAps2PcN4Eou+9RzsULU1MsKYJrt67YVvK7jnq/2C
	LD2Gf2bg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWq-0008Re-Si; Mon, 10 Feb 2025 23:45:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 5/6] nvmem: rockchip-otp: add rk3576 variant data
Date: Mon, 10 Feb 2025 23:45:09 +0100
Message-ID: <20250210224510.1194963-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224527_705719_DA4B5150 
X-CRM114-Status: GOOD (  11.69  )
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

The variant works very similar to the rk3588, just with a different
read-offset and size.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 3edfbfc2d722..d88f12c53242 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -274,6 +274,14 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const struct rockchip_data rk3576_data = {
+	.size = 0x100,
+	.read_offset = 0x700,
+	.clks = px30_otp_clocks,
+	.num_clks = ARRAY_SIZE(px30_otp_clocks),
+	.reg_read = rk3588_otp_read,
+};
+
 static const char * const rk3588_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "arb",
 };
@@ -295,6 +303,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-otp",
+		.data = &rk3576_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-otp",
 		.data = &rk3588_data,
-- 
2.47.2


