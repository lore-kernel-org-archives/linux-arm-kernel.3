Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4448ECD9AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOF//ASirxT4IYkkrfdpjk6ayaCFhALsQsVAb+Q9UIA=; b=Tfwu4DjIuVWMZWRGdOCQeulylC
	iKwx2ngFl3yGvbyEGgaGbCc2DrFW3mOE+tvZMLokZpsEt1AaX7mb9h4Ae2O5PUHqgmJ0vCeCwOciZ
	AvLalAwgD2Tp8Iti8O/kQyx5qGPXYvq3AQVAb8rv82TB+t4SogjFCIeMru8bbADoeo/z6vDZrkhf0
	+XoBT2AhlgVEV12ozmT8jlEQ0Xs3ADRJa248MTz61sJD6WignSbnlaLEo6zM43hiVKOT9CDS+xe3y
	9a6ZO7oRpF11gA3MUVCR+lhEiTG2FEAbvzQL8WDgXi+Q5YQxZhMhkK0eT8UlG/kDfxXO7NqtBXRrP
	VfCUly8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lc-0000000AV7S-2EMX;
	Thu, 05 Feb 2026 21:20:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lZ-0000000AV4V-0Ivd;
	Thu, 05 Feb 2026 21:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZOF//ASirxT4IYkkrfdpjk6ayaCFhALsQsVAb+Q9UIA=; b=IIazkHn0usGcsklkdf5nFrEu19
	gATPRxyDq9EAcElk8AH9anjFVK/UDc5ErVt6WDKU/TkP8orT89AGfei14m/cnEiZK5GVolMh/XD80
	xFCLy0qCbGPtb79kVvTE9VCKW4EbIPK64aeg6KxFU2wOYxSsPpFHoiPYRKdEyJ8uh416nk6Nuu5dV
	FCFfYtO0sVnn+gdjAzvmHJ0Rl1Pal5eFDwsiWIaQ9QsGC5DbMPbuX63R2e0D3GJVhS9Wnn9NGxB9C
	kgtS1dvyfnxIyUX8X5xpg92DsVX21Q8z+c1aKGGE2Ir2VA7Uv0iLElZ0oANMnG8SN5J8VtFL9MKK0
	cB6p23tQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lT-00000002oX8-16Za;
	Thu, 05 Feb 2026 21:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=ZOF//ASirxT4IYkkrfdpjk6ayaCFhALsQsVAb+Q9UIA=; b=eaSMbcqwVMt9yjzpsxTrnAkLIZ
	bS8/943Z8NMb4IKV652gDM6lHm9YRf7qhsIVdIo1DaFMH+gj1UASpJfuGXpYPz30y9dV3yUCDWBIU
	eJVE+tMqDYUgl+ctF7Pe4+haiBuiW7bXYAXN3VXBQOP+gWw2Osj7Wln+p9giBPJMPP7ceGwc8tViB
	1WzmqOf9yd2mtrJ/q+o7RoHvUprDjEjKZBox0lHdVLzL8PHgkKfxZsdqD0rWorZMiEzzM5qKWVkL8
	CWscPJlLnpayL/EDRM9xU6heCP6bb9TG0o4YBOxjURo4ZokEWF2YOrNgTjx/JnJaAlv5Bkkckojx4
	8FwiH1Vg==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lO-007GGK-OW; Thu, 05 Feb 2026 22:19:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 3/6] nvmem: rockchip-otp: Handle internal word_size in main reg_read op
Date: Thu,  5 Feb 2026 22:18:58 +0100
Message-ID: <20260205211901.490181-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205211901.490181-1-heiko@sntech.de>
References: <20260205211901.490181-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_211952_716271_3ACD99C0 
X-CRM114-Status: GOOD (  20.19  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Rockchip SoCs RK3576 and RK3588 read data from the OTP using 32-bit
words instead of normal 8-bit bytes. Similar RK3506, RK3528, RK3562 and
RK3568 will read data from OTP using 16-bit words.

The nvmem core stride and word_size cannot fully be used as cells is not
always aligned. Continue to report a stride=1 and word_size=1 in
nvmem_config and instead handle use of SoC specific word_size internally
in the driver.

Move current SoC specific word_size handling from the RK3588 read_reg
operation to the main read_reg operation to help simplify the SoC
specific read_reg operation and allow code reuse in a future RK3568
reg_read operation.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 72 ++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index d88f12c53242..45bbb6147fb7 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -59,7 +59,6 @@
 #define RK3588_OTPC_AUTO_EN		0x08
 #define RK3588_OTPC_INT_ST		0x84
 #define RK3588_OTPC_DOUT0		0x20
-#define RK3588_NBYTES			4
 #define RK3588_BURST_NUM		1
 #define RK3588_BURST_SHIFT		8
 #define RK3588_ADDR_SHIFT		16
@@ -69,6 +68,7 @@
 struct rockchip_data {
 	int size;
 	int read_offset;
+	int word_size;
 	const char * const *clks;
 	int num_clks;
 	nvmem_reg_read_t reg_read;
@@ -185,48 +185,28 @@ static int px30_otp_read(void *context, unsigned int offset,
 }
 
 static int rk3588_otp_read(void *context, unsigned int offset,
-			   void *val, size_t bytes)
+			   void *val, size_t count)
 {
 	struct rockchip_otp *otp = context;
-	unsigned int addr_start, addr_end, addr_len;
-	int ret, i = 0;
-	u32 data;
-	u8 *buf;
-
-	addr_start = round_down(offset, RK3588_NBYTES) / RK3588_NBYTES;
-	addr_end = round_up(offset + bytes, RK3588_NBYTES) / RK3588_NBYTES;
-	addr_len = addr_end - addr_start;
-	addr_start += otp->data->read_offset / RK3588_NBYTES;
-
-	buf = kzalloc(array_size(addr_len, RK3588_NBYTES), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	u32 *buf = val;
+	int ret;
 
-	while (addr_len--) {
-		writel((addr_start << RK3588_ADDR_SHIFT) |
+	while (count--) {
+		writel((offset++ << RK3588_ADDR_SHIFT) |
 		       (RK3588_BURST_NUM << RK3588_BURST_SHIFT),
 		       otp->base + RK3588_OTPC_AUTO_CTRL);
 		writel(RK3588_AUTO_EN, otp->base + RK3588_OTPC_AUTO_EN);
 
 		ret = rockchip_otp_wait_status(otp, RK3588_OTPC_INT_ST,
 					       RK3588_RD_DONE);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(otp->dev, "timeout during read setup\n");
-			goto read_end;
+			return ret;
 		}
 
-		data = readl(otp->base + RK3588_OTPC_DOUT0);
-		memcpy(&buf[i], &data, RK3588_NBYTES);
-
-		i += RK3588_NBYTES;
-		addr_start++;
+		*buf++ = readl(otp->base + RK3588_OTPC_DOUT0);
 	}
 
-	memcpy(val, buf + offset % RK3588_NBYTES, bytes);
-
-read_end:
-	kfree(buf);
-
 	return ret;
 }
 
@@ -234,7 +214,7 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 			     void *val, size_t bytes)
 {
 	struct rockchip_otp *otp = context;
-	int ret;
+	int ret, word_size;
 
 	if (!otp->data || !otp->data->reg_read)
 		return -EINVAL;
@@ -245,8 +225,34 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 		return ret;
 	}
 
-	ret = otp->data->reg_read(context, offset, val, bytes);
+	offset += otp->data->read_offset;
+	word_size = otp->data->word_size;
+
+	if (word_size > 1) {
+		unsigned int addr_start, addr_end;
+		size_t count;
+		u8 *buf;
+
+		addr_start = offset / word_size;
+		addr_end = DIV_ROUND_UP(offset + bytes, word_size);
+		count = addr_end - addr_start;
+
+		buf = kzalloc(array_size(count, word_size), GFP_KERNEL);
+		if (!buf) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ret = otp->data->reg_read(context, addr_start, buf, count);
+		if (!ret)
+			memcpy(val, buf + (offset % word_size), bytes);
+
+		kfree(buf);
+	} else {
+		ret = otp->data->reg_read(context, offset, val, bytes);
+	}
 
+err:
 	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);
 
 	return ret;
@@ -259,7 +265,7 @@ static struct nvmem_config otp_config = {
 	.type = NVMEM_TYPE_OTP,
 	.read_only = true,
 	.stride = 1,
-	.word_size = 1,
+	.word_size = sizeof(u8),
 	.reg_read = rockchip_otp_read,
 };
 
@@ -277,6 +283,7 @@ static const struct rockchip_data px30_data = {
 static const struct rockchip_data rk3576_data = {
 	.size = 0x100,
 	.read_offset = 0x700,
+	.word_size = sizeof(u32),
 	.clks = px30_otp_clocks,
 	.num_clks = ARRAY_SIZE(px30_otp_clocks),
 	.reg_read = rk3588_otp_read,
@@ -289,6 +296,7 @@ static const char * const rk3588_otp_clocks[] = {
 static const struct rockchip_data rk3588_data = {
 	.size = 0x400,
 	.read_offset = 0xc00,
+	.word_size = sizeof(u32),
 	.clks = rk3588_otp_clocks,
 	.num_clks = ARRAY_SIZE(rk3588_otp_clocks),
 	.reg_read = rk3588_otp_read,
-- 
2.47.2


