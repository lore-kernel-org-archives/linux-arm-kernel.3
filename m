Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4A6C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=milCblzzV22WWnRAsPChts+TblEkiAOBKPefNK0F9Xc=; b=uJ/EXqlT4i8TxFAFrcHaENzo2B
	TNcmX6WHE8H09oxdVkDmT3MDWbkwOLM+zJGL6ecmfA2WM0cNNyfH3hRYvyv+Rhg/wIsU8VPmVI0t6
	qAGy0MVNMUNPdKSyKHBeUxVMMAdmaCZylZaYFEyap+eEbsO0taSeVIFVpbU43CbDudlBj9PypMVAI
	rAfkd7Ne5aCKe8HVosGE9Jq5v4sOuuhF4Cwv747U3FDHIZmrjqvRy1Q53zdtpAmwhRZfzN+I5uz3B
	ByT7xu0NMzTWEP3Ym3phxT2UFiY82LcshWFQK3EOvM7aORrCWZo5ynkq8WIIJjqLAqHGEr09RmkVd
	AG7WB+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37V2-00000004p4k-3RsM;
	Sun, 06 Sep 2026 07:41:12 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37V0-00000004p4N-0WI8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 07:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=milCblzzV22WWnRAsPChts+TblEkiAOBKPefNK0F9Xc=; t=1788680470; x=1789890070; 
	b=dfqRBLClf5Wmj2AW71MN5j5gtAJd9fDjzF7FFIQHr4O1L+iglUVskg9Pe/WWaLOaRz5mg/jCO4z
	f3egjozzC+gQ7eEQanfer6zr0xLt4pqkLaL92E+jxldNqXplem0aV9u8W8Y67sQLmbunmZ2hHrKhP
	GPjycJyZpA3iTI7z2yqlT6hdDZUIftuWQ4ndYTThxMR3y1Z6JzY6IhaO8JXIcLrQV9AhzqCQ0oyKE
	XPI9A+/lfp+OW+SvuQIhWIVBpdi9eIXwtSh9A/ShBD7en4TetEQlSTc+JC+wkmdofjW4cW4d1UkOc
	y1lnO5c1r3+NhLrrBzH3S+zgfr+0gap025Xw==;
Date: Sun, 6 Sep 2026 09:41:06 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Davis <afd@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Kevin
 Hilman <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] i2c: omap: Remove unused is_rdr and is_xdr
 variables
Message-ID: <20260906094106.41f8d2e7@kemnade.info>
In-Reply-To: <20260904131252.2126353-3-afd@ti.com>
References: <20260904131252.2126353-1-afd@ti.com>
	<20260904131252.2126353-3-afd@ti.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_004110_192916_8E250B03 
X-CRM114-Status: GOOD (  13.55  )
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

On Fri, 4 Sep 2026 08:12:46 -0500
Andrew Davis <afd@ti.com> wrote:

> These are passed into omap_i2c_{receive,transmit}_data() but are never
> used, remove them.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/i2c/busses/i2c-omap.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 72f979eec7311..68b0a043f1e51 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -993,8 +993,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
>  	return 0;
>  }
>  
> -static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
> -		bool is_rdr)
> +static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
>  {
>  	u16		w;
>  
> @@ -1014,8 +1013,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
>  	}
>  }
>  
> -static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
> -		bool is_xdr)
> +static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
>  {
>  	u16		w;
>  
> @@ -1119,7 +1117,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
>  			}
>  
> -			omap_i2c_receive_data(omap, num_bytes, true);
> +			omap_i2c_receive_data(omap, num_bytes);
>  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
>  			continue;
>  		}
> @@ -1130,7 +1128,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  			if (omap->threshold)
>  				num_bytes = omap->threshold;
>  
> -			omap_i2c_receive_data(omap, num_bytes, false);
> +			omap_i2c_receive_data(omap, num_bytes);
>  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
>  			continue;
>  		}
> @@ -1142,7 +1140,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  			if (omap->fifo_size)
>  				num_bytes = omap->buf_len;
>  
> -			ret = omap_i2c_transmit_data(omap, num_bytes, true);
> +			ret = omap_i2c_transmit_data(omap, num_bytes);
>  			if (ret < 0)
>  				break;
>  
> @@ -1157,7 +1155,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  			if (omap->threshold)
>  				num_bytes = omap->threshold;
>  
> -			ret = omap_i2c_transmit_data(omap, num_bytes, false);
> +			ret = omap_i2c_transmit_data(omap, num_bytes);
>  			if (ret < 0)
>  				break;
>  


