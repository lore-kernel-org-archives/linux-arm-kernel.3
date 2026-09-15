Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF622C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=; b=KGqexYS4JOn5Y2GldZsHW+o3gu
	S23NXcmTYESLHOdsUkURw8ihApghAfyqs8DtQ1wcEicd6q5eYligxt5Ikns4mtyOcYF9INFW6YOR9
	drdTA9iQ1y8a/89uYdaZfKBRYqCbQRBYlP3CIihw54w/uIW4I16QW2H/yTOMJ5h1efaepVDhpwXv5
	2r7hedZoBI6BYEYbY8VaTfH+AxxEbq8qJHYYRiA+VEIgOiLXP/CCVbwbAsj6LPaScTEOAACeI0m7K
	dW0cdY2FX6lLZflQJh2tyo/vyRmMGWk1wOKJA2+AC5GpHEzhv39GLssuFREUxETbFzQwPSmyehpyu
	0m/moXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qdf-00000005xf4-0zYy;
	Tue, 15 Sep 2026 10:43:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QdV-00000005xVw-3j4m
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=; b=coNuxEOhEG5WlWR54ID+FB2yG6
	vOqiH/ai/h1Z0s8S6Gjhnn0H8KsjWEQV9QKmLSBLYI6JRiNnYASbi8X++yRV8DrIywWXFZH2Z//RZ
	Cbg08CigJg7leovf8eMnTsERExxuXtlFQLyVxjPR15sStERCYCtoLgvHKMwL0jNq37jZQseIXs2Mx
	EUOnyXw7VszkcsMklPeiBoXWaaTd7fPLzYt2viu/6+Sw/Vsn6F+zzIebst29/cZSG0yrbm86z7Jy0
	eB2ezxnrlrCJ8zpq3JQ8vCA7dsNQ00vegAltT8E5cmH4ZQvVwRc3wSMayQSMJRK1iIVUUltkkEVNE
	4Y2t/jyQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6QdP-00000006ZhH-47Jl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:43:36 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d391aso921525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469011; x=1790073811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=;
        b=h8Zi4RixYEw38nyHmWUJFZKa4GaSCP6SMLV7Fnr1NxTbNbDQFiJBx0BkEdDDArk/wx
         SzgVEfh4Dt61P4yjXpA9darHSdF5v8G0t7B/Z6oDUS4wM/9NZM6ie+eWhsfKN2O3SfPb
         m5TGk1HOTwacDdfO7Ov/vb+GBQFrp3jaCQM7hPlNnRCauDLULeRhHDUDxCs1rESUd40r
         WW2nJogRAhTUgHGx5NIitkXbIlvv+Z4JwKNS573Ak7DunuVgfulkhyCF0+Rw5nZF6G3x
         zaE9dglf/BpeCWXAWpjh663zUBwQ6gMPjblUDNF6foDtg/tgInSQUttS6almGNHJFAs+
         +Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469011; x=1790073811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=;
        b=yl/7Q4lcINBnVVhJqfH/FJd90bWXE0UdZKHSp39qaDaLluG7uvKxnr8+Rea4ospRZh
         k5vaGI86EY3eZaB8OHxIBS9vSuIadL0vc+u61KXqo0tXTsNLpc9+8TUxUQQ3h9sJ/RWA
         eU40WwfqdVmD0vrqUTIdIP7BV1GTW0/xaGiuEGA6jpC86WCj4Wq+HqrX2wfwgA0k9EB9
         RWSArkMhXWJXTvASphaTiBYu5ebxvELUjbPmssg6LgpsYVBYewdW25wcNi+3o7GAJ4Rc
         PARaREE61/M8kuZjTT7ClMZZq/aCusAqWgZHovOjEQnENv9b5FDto+BWukthIx8I4jmP
         kGdg==
X-Forwarded-Encrypted: i=1; AKwUvBwEGGxlJtbDyoC6l+yJUClRIqkZXfIrv+egLQOILX9e3lH/0s26qVHhaP6LeGTexqx3BckaJqzDhAAsu1v3nbCV@lists.infradead.org
X-Gm-Message-State: AFuF++kV06ijkG4le/WAvgGv54pijfWqoajTzjhheRIuPTb8q/kr/qUC
	UFwXhIgY5U1T1MqRw6yZHW8z6RdWHg+DmdZLf0R1bU3HYY4LKEKb2sAVH3r3ig==
X-Gm-Gg: AYBFou1LiFYeOkgIjK8kyVb+AljTuxSgD1g3TDdzWIH4LzliQVsqVVfTSIigdYkKtYT
	OLH5GT65etZb7qEcRfjVsya28yzakO+nKzrMkJB7wLjG1U/QnDqBs+8iqDtrarBvMiWDpXObCX3
	ZcNPO4zUn+XvYp33F9MnTC91dxZTB7B52gsZsRlVUAQP/y61+K460TnguH06QEghKhgRAlhrS1z
	5azCKdHM0i9aLq0vjlomXrx5xVi/aqD7PEcxY8Z3VeHyRfw4LLPQ/ctfA8M5wPqDVwhOCq4uzD0
	tMLc47XnGYwmSGCCcFjW8okb29Vw5C3X4bTq01UsR3PmtF3CdqKIo8TepXLw58R8ADq5Q82iikM
	AKYlPVMH68jq9vPVIYvEFJMyxpV2gjgMJFGrWMqtcQRlNGXicL1Jdpb8CCf1WalJGY/w2qzwv8A
	3SPAJ5e3Pr0ShrTSFEARCpZxlSFEEhQUaRgmxK7FwBibN6+YwPBTJ2hRgoidcasMw3tjUZ9hvL3
	xb8cMmyHy9cEhqcAZSs0Th8/NK7OYzFrHc3PISeqLd6mbUmRBQCLO2AiO+EGCpf0UeMWr8ULar1
	Jw==
X-Received: by 2002:a05:600c:3516:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e82210b64mr9351345e9.8.1789469010714;
        Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:48 +0200
Subject: [PATCH v2 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3576 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1842;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=T7svtQCEZR4NbRSxQOr575LmZrX+L5qTFSBrf8JfOqc=;
 b=eQvDxheF72tsvAJS32ZkaFvXX6NNWm28Bsw7F/w1Zy5QmGsgwEi4egtVnZZRjBKNhf4WjFbAW
 h0O3gsraYFIAa6PT+HoD2V4W8Tz+gYMZVjRPi9SOtZsJl8Lzfm0kax8
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_114333_783191_48C2B36E 
X-CRM114-Status: GOOD (  12.01  )
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

The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
phy-rockchip-inno-csidphy driver, but they need their own driver data:
as on RK3588 the GRF control bits live in a dedicated CSI-DPHY GRF at
offset 0x0, while each PHY instance only has an APB reset line, as on
RK3568.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..177beb685f70 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -403,6 +403,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
+};
+
 static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
 	.pwrctl_offset = -1,
 	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
@@ -435,6 +446,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-csi-dphy",
+		.data = &rk3576_mipidphy_drv_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-csi-dphy",
 		.data = &rk3588_mipidphy_drv_data,

-- 
2.43.0


