Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC2EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 21:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmHPFcJZ78hwHnl9SxGCphVe0yu9MYFikge7ywKMkGc=; b=u7/6ysvwWgArZ7e+qGmvRmz1nq
	Qkd1vFn8amZVI+MKjj8D/2BhNJT11NPDQJiXOQ+RTy9U9XaifLAnVCZ/Zn0RD0yFvYrGbhCiFkTyp
	3TGduMtrEsm7c9sVNf3RRmkEU4ldMKPZhXG/Groon68qEIGV9JyxnUevZw372SqarjWR8MA1KBW26
	90ubaOqXaBlUC0SqUV+m6uT2Go65S68h/ufqz1uZqjcNNdcL8XVotA6frTMszdBRf5bM2Zc3px1OG
	CTkq3K6dxy6uztYGGoW3/+Uq0gq4iLD29NcU9DtmZ5CgjaSpsUzfL5BdEKE3w/Q2npv0yQjJmkENA
	8uxNm0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttvvi-00000000eyT-31TL;
	Sun, 16 Mar 2025 21:53:58 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttvu2-00000000ehI-0xS4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 21:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742161933;
 bh=vmHPFcJZ78hwHnl9SxGCphVe0yu9MYFikge7ywKMkGc=;
 b=fypAfLWf/ME8dg5noGXNMp/8Wab4XTl193L0LFrXe1LPedPh+IgZy54rLjN3yg7s19P1/x6e2
 Y9H9b4M1Yd3qdyOeUEYLg/YGkEQEu7XFQQ8HbNs9uRXdL3wW0J9ow5sOOIdxVAL3hchuqFq8rcl
 CsSg5nwukEg/LduqdZIyDLx49ZQR02wZC+XD0Z7x2dtqjNgTcRK1z/ZC+unJyyreCG38URTI004
 m3YEaoaMPptqDQI2n/x5iidSUNwn73+8RrQf56fgDgjDoJ/As0dYzX8dG8GrnE0ZEJgBLJZQL/i
 OGWrnmo6ffHmJ0+dHpNgZ0DQFwAOk6+Nn32mWeVIGEJA==
X-Forward-Email-ID: 67d7480b615b196bfb50e07f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <8c697031-9978-40cd-a1e0-f40552db9107@kwiboo.se>
Date: Sun, 16 Mar 2025 22:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nvmem: rockchip-otp: Add support for rk3568-otp
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250227110804.2342976-1-kever.yang@rock-chips.com>
 <20250227110804.2342976-2-kever.yang@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250227110804.2342976-2-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_145214_394502_0A239E4B 
X-CRM114-Status: GOOD (  28.03  )
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

Hi Kever,

On 2025-02-27 12:08, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> This adds the necessary data for handling efuse on the rk3568.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/nvmem/rockchip-otp.c | 82 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index ebc3f0b24166..a04bce89ecc8 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -27,6 +27,7 @@
>  #define OTPC_USER_CTRL			0x0100
>  #define OTPC_USER_ADDR			0x0104
>  #define OTPC_USER_ENABLE		0x0108
> +#define OTPC_USER_QP			0x0120
>  #define OTPC_USER_Q			0x0124
>  #define OTPC_INT_STATUS			0x0304
>  #define OTPC_SBPI_CMD0_OFFSET		0x1000
> @@ -53,6 +54,8 @@
>  #define SBPI_ENABLE_MASK		GENMASK(16, 16)
>  
>  #define OTPC_TIMEOUT			10000
> +#define OTPC_TIMEOUT_PROG		100000

This is not used anywhere in this patch, please drop it.

> +#define RK3568_NBYTES			2
>  
>  /* RK3588 Register */
>  #define RK3588_OTPC_AUTO_CTRL		0x04
> @@ -184,6 +187,70 @@ static int px30_otp_read(void *context, unsigned int offset,
>  	return ret;
>  }
>  
> +static int rk3568_otp_read(void *context, unsigned int offset, void *val,
> +			   size_t bytes)
> +{
> +	struct rockchip_otp *otp = context;
> +	unsigned int addr_start, addr_end, addr_offset, addr_len;
> +	unsigned int otp_qp;
> +	u32 out_value;
> +	u8 *buf;
> +	int ret = 0, i = 0;
> +
> +	addr_start = rounddown(offset, RK3568_NBYTES) / RK3568_NBYTES;
> +	addr_end = roundup(offset + bytes, RK3568_NBYTES) / RK3568_NBYTES;
> +	addr_offset = offset % RK3568_NBYTES;
> +	addr_len = addr_end - addr_start;
> +
> +	buf = kzalloc(array3_size(addr_len, RK3568_NBYTES, sizeof(*buf)),
> +		      GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	ret = rockchip_otp_reset(otp);
> +	if (ret) {
> +		dev_err(otp->dev, "failed to reset otp phy\n");
> +		return ret;

This is leaking the kzalloc memory above.

> +	}
> +
> +	ret = rockchip_otp_ecc_enable(otp, true);
> +	if (ret < 0) {
> +		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
> +		return ret;

Same here.

> +	}
> +
> +	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> +	udelay(5);
> +	while (addr_len--) {
> +		writel(addr_start++ | OTPC_USER_ADDR_MASK,
> +		       otp->base + OTPC_USER_ADDR);
> +		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
> +		       otp->base + OTPC_USER_ENABLE);
> +		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS, OTPC_USER_DONE);
> +		if (ret < 0) {
> +			dev_err(otp->dev, "timeout during read setup\n");
> +			goto read_end;
> +		}
> +		otp_qp = readl(otp->base + OTPC_USER_QP);
> +		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
> +			ret = -EIO;
> +			dev_err(otp->dev, "ecc check error during read setup\n");
> +			goto read_end;
> +		}
> +		out_value = readl(otp->base + OTPC_USER_Q);
> +		memcpy(&buf[i], &out_value, RK3568_NBYTES);
> +		i += RK3568_NBYTES;
> +	}
> +
> +	memcpy(val, buf + addr_offset, bytes);
> +
> +read_end:
> +	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> +	kfree(buf);
> +
> +	return ret;
> +}

This can be simplified if this is rebased on top of "nvmem: rockchip-otp:
Handle internal word_size in main reg_read op" [1].

[1] https://lore.kernel.org/r/20250316191900.1858944-1-jonas@kwiboo.se

Something like following could be squashed in with this:

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index ea48d51bc2ff..0991a4047bec 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -54,8 +54,6 @@
 #define SBPI_ENABLE_MASK		GENMASK(16, 16)
 
 #define OTPC_TIMEOUT			10000
-#define OTPC_TIMEOUT_PROG		100000
-#define RK3568_NBYTES			2
 
 /* RK3588 Register */
 #define RK3588_OTPC_AUTO_CTRL		0x04
@@ -188,24 +186,12 @@ static int px30_otp_read(void *context, unsigned int offset,
 }
 
 static int rk3568_otp_read(void *context, unsigned int offset, void *val,
-			   size_t bytes)
+			   size_t count)
 {
 	struct rockchip_otp *otp = context;
-	unsigned int addr_start, addr_end, addr_offset, addr_len;
-	unsigned int otp_qp;
-	u32 out_value;
-	u8 *buf;
-	int ret = 0, i = 0;
-
-	addr_start = rounddown(offset, RK3568_NBYTES) / RK3568_NBYTES;
-	addr_end = roundup(offset + bytes, RK3568_NBYTES) / RK3568_NBYTES;
-	addr_offset = offset % RK3568_NBYTES;
-	addr_len = addr_end - addr_start;
-
-	buf = kzalloc(array3_size(addr_len, RK3568_NBYTES, sizeof(*buf)),
-		      GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	u16 *buf = val;
+	u32 otp_qp;
+	int ret;
 
 	ret = rockchip_otp_reset(otp);
 	if (ret) {
@@ -214,39 +200,39 @@ static int rk3568_otp_read(void *context, unsigned int offset, void *val,
 	}
 
 	ret = rockchip_otp_ecc_enable(otp, true);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
 		return ret;
 	}
 
 	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
 	udelay(5);
-	while (addr_len--) {
-		writel(addr_start++ | OTPC_USER_ADDR_MASK,
+
+	while (count--) {
+		writel(offset++ | OTPC_USER_ADDR_MASK,
 		       otp->base + OTPC_USER_ADDR);
 		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
 		       otp->base + OTPC_USER_ENABLE);
-		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS, OTPC_USER_DONE);
-		if (ret < 0) {
+
+		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS,
+					       OTPC_USER_DONE);
+		if (ret) {
 			dev_err(otp->dev, "timeout during read setup\n");
 			goto read_end;
 		}
+
 		otp_qp = readl(otp->base + OTPC_USER_QP);
 		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
 			ret = -EIO;
 			dev_err(otp->dev, "ecc check error during read setup\n");
 			goto read_end;
 		}
-		out_value = readl(otp->base + OTPC_USER_Q);
-		memcpy(&buf[i], &out_value, RK3568_NBYTES);
-		i += RK3568_NBYTES;
-	}
 
-	memcpy(val, buf + addr_offset, bytes);
+		*buf++ = readl(otp->base + OTPC_USER_Q);
+	}
 
 read_end:
 	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
-	kfree(buf);
 
 	return ret;
 }

> +
>  static int rk3588_otp_read(void *context, unsigned int offset,
>  			   void *val, size_t bytes)
>  {
> @@ -274,6 +341,17 @@ static const struct rockchip_data px30_data = {
>  	.reg_read = px30_otp_read,
>  };
>  
> +static const char * const rk3568_otp_clocks[] = {
> +	"usr", "sbpi", "apb_pclk", "phy",

Why do we change from using the "otp"-name for the main clock?

I suggest we keep the main clock named "otp" instead of "usr" for
consistency.

> +};
> +
> +static const struct rockchip_data rk3568_data = {
> +	.size = 0x80,

If this is rebased on top of [1] you should also add:

	.word_size = sizeof(u16),

Above suggested changes can also be found in a FIXUP commit at my
linux-rockchip tree of pending RK3528 patches [2].

[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20250314-rk3528/

Regards,
Jonas

> +	.clks = rk3568_otp_clocks,
> +	.num_clks = ARRAY_SIZE(rk3568_otp_clocks),
> +	.reg_read = rk3568_otp_read,
> +};
> +
>  static const char * const rk3588_otp_clocks[] = {
>  	"otp", "apb_pclk", "phy", "arb",
>  };
> @@ -294,6 +372,10 @@ static const struct of_device_id rockchip_otp_match[] = {
>  		.compatible = "rockchip,rk3308-otp",
>  		.data = &px30_data,
>  	},
> +	{
> +		.compatible = "rockchip,rk3568-otp",
> +		.data = &rk3568_data,
> +	},
>  	{
>  		.compatible = "rockchip,rk3588-otp",
>  		.data = &rk3588_data,


