Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33DAF013CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkOoSQ6xnhNsEXymDnt/JlPwMCjTrRpZyzgc4ICmXUU=; b=na3w7hY6j8nK1xhpou9c9nBZH7
	k3xsb2rcYLCxTkD4MCn6Zy1vErort8s3z8JwE+DxCHsHcyP7tW8x/ncEkOS7Eia4OlpfmOHgaJ4Zb
	+ErVPlt0y/+v3wIp6MYQfkaUm3bgcngVSJd2Kyq9j9tEW0q3OsfjBP6Jzj7P4PjiRKZdoR0htdhdG
	FMB4oR2M1m2NqYJutTH5/Ic8S3QAkTXTk0W/8RS4hfOTYrnbIBQgjnkrxBpkXQGOcMnvcmoM9rYIB
	6fdyWnpQ/LynPrgONW9TuBrNFM6bwqcaMVhPcFr+PFl3+71/TFCWGmOM3jNUUGJt1tc+HZXUK79OD
	uItRtRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Ks-00000003Ybf-1cfA;
	Mon, 16 Mar 2026 08:30:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Kq-00000003YbB-1wwK;
	Mon, 16 Mar 2026 08:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96A2960131;
	Mon, 16 Mar 2026 08:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870B9C19421;
	Mon, 16 Mar 2026 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649799;
	bh=ZleLRHDOHBip+HjzKZfgbCdexqRYELee4obevGjagA4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=kdnn4047r/PTpjAKHd4omIMsOpl4ztjzFI5kQfAUHqX34ZPsmSn81reSSVgRSu89L
	 23+I9JxdTSXW1Dtu8OD62Jknq6sVuNAgNgFFG5QTKl3P9oWtSnR5TnzkAib8OoB80m
	 IzP0p4pdzZwAEvZFrBftxiPl0XRkbYaXutmNVoJUxk14TYt9HSiD/Ud4M8rgJcJiWt
	 Jjrsf0NhBzFKRsgH1b9oxEFZjq0Jv4BOfLXqL4n6qn8PVHGsXaQwxoXgwDZYY2uT7Z
	 eOGFtrH4AuPzlfaTtRpXuNRMih137kjkvsYvuaEcu1V5czsaiYolnUDslf/GhryY+g
	 z99YJ8m1u/W0Q==
Message-ID: <76fd11b2-7789-47c1-a832-12907155ead1@kernel.org>
Date: Mon, 16 Mar 2026 09:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
 Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Bartosz,

Apologize, the earlier patches for this fell through the cracks so never
made it to v7.0.

For this v2:

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Do you want to merge this through the i2c subsystem? Or do you want me to
merge this patch through the media subsystem?

Regards,

	Hans

On 23/02/2026 09:59, Bartosz Golaszewski wrote:
> Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
> avoid a conflict with the upcoming i2c_dbg() and rename the local macro
> in the saa7134 driver to saa7134_i2c_dbg().
> 
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7134/saa7134-i2c.c b/drivers/media/pci/saa7134/saa7134-i2c.c
> index 04e85765373ecc0f0759eba539c20bcdc9716ca8..1164e91cbb7b7f5250dc02bc086f5cc06ea8f5a5 100644
> --- a/drivers/media/pci/saa7134/saa7134-i2c.c
> +++ b/drivers/media/pci/saa7134/saa7134-i2c.c
> @@ -28,7 +28,7 @@ static unsigned int i2c_scan;
>  module_param(i2c_scan, int, 0444);
>  MODULE_PARM_DESC(i2c_scan,"scan i2c bus at insmod time");
>  
> -#define i2c_dbg(level, fmt, arg...) do { \
> +#define saa7134_i2c_dbg(level, fmt, arg...) do { \
>  	if (i2c_debug == level) \
>  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
>  	} while (0)
> @@ -84,20 +84,20 @@ static inline enum i2c_status i2c_get_status(struct saa7134_dev *dev)
>  	enum i2c_status status;
>  
>  	status = saa_readb(SAA7134_I2C_ATTR_STATUS) & 0x0f;
> -	i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
> +	saa7134_i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
>  	return status;
>  }
>  
>  static inline void i2c_set_status(struct saa7134_dev *dev,
>  				  enum i2c_status status)
>  {
> -	i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
> +	saa7134_i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
>  	saa_andorb(SAA7134_I2C_ATTR_STATUS,0x0f,status);
>  }
>  
>  static inline void i2c_set_attr(struct saa7134_dev *dev, enum i2c_attr attr)
>  {
> -	i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
> +	saa7134_i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
>  	saa_andorb(SAA7134_I2C_ATTR_STATUS,0xc0,attr << 6);
>  }
>  
> @@ -160,7 +160,7 @@ static int i2c_reset(struct saa7134_dev *dev)
>  	enum i2c_status status;
>  	int count;
>  
> -	i2c_dbg(2, "i2c reset\n");
> +	saa7134_i2c_dbg(2, "i2c reset\n");
>  	status = i2c_get_status(dev);
>  	if (!i2c_is_error(status))
>  		return true;
> @@ -198,7 +198,7 @@ static inline int i2c_send_byte(struct saa7134_dev *dev,
>  //	dword |= 0x40 << 16;  /* 400 kHz */
>  	dword |= 0xf0 << 24;
>  	saa_writel(SAA7134_I2C_ATTR_STATUS >> 2, dword);
> -	i2c_dbg(2, "i2c data => 0x%x\n", data);
> +	saa7134_i2c_dbg(2, "i2c data => 0x%x\n", data);
>  
>  	if (!i2c_is_busy_wait(dev))
>  		return -EIO;
> @@ -220,7 +220,7 @@ static inline int i2c_recv_byte(struct saa7134_dev *dev)
>  	if (i2c_is_error(status))
>  		return -EIO;
>  	data = saa_readb(SAA7134_I2C_DATA);
> -	i2c_dbg(2, "i2c data <= 0x%x\n", data);
> +	saa7134_i2c_dbg(2, "i2c data <= 0x%x\n", data);
>  	return data;
>  }
>  
> @@ -237,12 +237,12 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  		if (!i2c_reset(dev))
>  			return -EIO;
>  
> -	i2c_dbg(2, "start xfer\n");
> -	i2c_dbg(1, "i2c xfer:");
> +	saa7134_i2c_dbg(2, "start xfer\n");
> +	saa7134_i2c_dbg(1, "i2c xfer:");
>  	for (i = 0; i < num; i++) {
>  		if (!(msgs[i].flags & I2C_M_NOSTART) || 0 == i) {
>  			/* send address */
> -			i2c_dbg(2, "send address\n");
> +			saa7134_i2c_dbg(2, "send address\n");
>  			addr  = msgs[i].addr << 1;
>  			if (msgs[i].flags & I2C_M_RD)
>  				addr |= 1;
> @@ -265,7 +265,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  		}
>  		if (msgs[i].flags & I2C_M_RD) {
>  			/* read bytes */
> -			i2c_dbg(2, "read bytes\n");
> +			saa7134_i2c_dbg(2, "read bytes\n");
>  			for (byte = 0; byte < msgs[i].len; byte++) {
>  				i2c_cont(1, " =");
>  				rc = i2c_recv_byte(dev);
> @@ -286,7 +286,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  			}
>  		} else {
>  			/* write bytes */
> -			i2c_dbg(2, "write bytes\n");
> +			saa7134_i2c_dbg(2, "write bytes\n");
>  			for (byte = 0; byte < msgs[i].len; byte++) {
>  				data = msgs[i].buf[byte];
>  				i2c_cont(1, " %02x", data);
> @@ -296,7 +296,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  			}
>  		}
>  	}
> -	i2c_dbg(2, "xfer done\n");
> +	saa7134_i2c_dbg(2, "xfer done\n");
>  	i2c_cont(1, " >");
>  	i2c_set_attr(dev,STOP);
>  	rc = -EIO;
> 


