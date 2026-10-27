Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZuRGF3Ll;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aRVxZp1k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=; b=ZuRGF3LlxmlbJU
	QMRfTQkmWycpmQMm5N1tZyexaNm+9b8kZs236WFi7HxG+hIdqqOXgX8JAVJ4deBrRWbPovom9VRQb
	kHv2KfqK0H9WzoMfX4ltbWg0oTZsXiuHhC7hUFn8fUTxAkuCBpTb3s88jXpduX0WFV1G3Po/5umOy
	i2MiDNu/3eI8iv1EWfBv8QopkeVIVa/A/e4tyn3zbKNwlIgpFgF8lDet24wK+xT3Rdku0nzYYsjPT
	Ikjj2TsKIp2R1kdJsLd7XBMvVqDrOT8Q7TTTSMXSniro7KQzgs5nNIVzTVaKMBxXqGwoUTLQZhmII
	mEoStvIb+6+RjOo5CFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhdb-00000004xZp-0Lmb;
	Tue, 27 Oct 2026 13:54:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhdW-00000004xX5-3jAo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:54:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c40e30c26a4so160038266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109285; x=1793714085; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
        b=aRVxZp1kO2fJU6L9BRbkKKDOO8G5M9enU1AKhd3wjfikPW+YlvYl+x548EdMWAGbZn
         7X1wEY/DVKkfM9N9DR36qqpgQSGcxrNI6FP/KL2A4WH5hvv7YFMn/KKPME81RyzLm9/H
         x+GqbFSyNzJekjDTBeG9Our79Qd7uVTjJMauWsFfVMr/LCTjQUXHMv/QWjBRSXHOH4U+
         euHUy0mxqX3f3sTYfVVIeCUjCAS16/0Kdn+imnVBdT0rgISe/7bnqjcvh6m4SFZLCfS7
         6mpiqnBr61BT31tZZAA6CfyOazwZe0ws7HH0Pj45hCuFtXMNkxIzAbImvf03dMFIcDCi
         K8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109285; x=1793714085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
        b=2rtAwo1EawidcCrKIoCFVsAHbnW3bKl2+Dv2ax7KNPuh2XQSmdHOQZ3oriQR3ypW2Y
         dsYlxusolxdpkjNQMk49cRBZ84ggW+PMiNPQ133Jh2I8Gv1g6GltI94Si1By0iE0TOah
         g/mlSCeFTifXOkHuzf61FlkzUd0XZskVOzThZDZvwZZgxZG2t25nzE13ICwV5vCbscQm
         7/jI2ah9ejZowAkxGIXjC/l/aFl6O1LuqeNNfIQP+r4BUAYDRkaJoCKYPhqsTuZJQ/fO
         E86WKrhWu71r5/OVQ2g+V0w2rOYlAQ0yJS9G/nybSfAL59Ki0YHhqgtTL6NFzG7USLmx
         YTJw==
X-Forwarded-Encrypted: i=1; AKwUvBxS7/2OfRDHyoVVdiTVzVI1sS21ijnkzBpAQPOwR9aJtgy2xDgweuCFgMroYDum5D4kh1ri87syI/+RuCzgtaCM@lists.infradead.org
X-Gm-Message-State: AFq9FYIcZWSTHgDlulrrE961Hm2o25EQSTyYh68P/I8TKQgtGQUIEqfr
	MF/PJN4dPrTFHXDjbzmiCNYZt8i9gOChzrF9RhYwQJMBLUFqDk1H2JEK
X-Gm-Gg: AYBFou2qsftL54xJbX/UbbFWKWoD0jz0TPPginWe3JOFlbWqDQaG0bPwCFTDbn8CXj6
	rzJpMvbkXKYLZT22jgNFm0j5Rb9CRqxLsAgQI77JvHzgqSm8uEp/qHSFM+bO27sj2gkJ+8IhwXM
	AxuJdn16f2Wf+mdgK7LJno4ISXY8x4trE9LBXLyvM2QScr4/pWqhA6rkXi+YK/p8XZ9a4KLXt7c
	8v1wJhnJcOT6f8h4w3qyTf3DP38HYZkRz6soKAMXNiW0D21W7eJPHwn9QEMfyZ+/6oY26E4IucD
	ac04LHJAqU8RIX3XiNvtm5uX9m8kGzvxSXlZVQ8+flW7cqj67ZSFwF27AskJlWZY2TMqYpwxfJ+
	TTgViT7EE1VcFgnzqi5jQkeFA+Dn7mrxT9Hk9DsVxK7IPaQ112c7I79SfN2mXr6E2TfcfS2qk2H
	iDxg8175Xmc19mApQW/JsCeFl8y2jEaWugPIE7FIGImix6x1/0+kWRQvtpJHyoOzl+R5TURVgF2
	Sttx0oqVJf8N6T0JeZndmSLSL79wjZG3FCaDLNWTKUtFrh0U8B8ytc49ENiXMmw9Kjh2Xv3/4E0
	ECBa2kvsimjEeZan
X-Received: by 2002:a17:906:c111:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c49a735d022mr244123466b.11.1793109284644;
        Tue, 27 Oct 2026 06:54:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm59352a12.19.2026.10.27.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:44 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:54:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
Message-ID: <20261027135443.575faff1@pumpkin>
In-Reply-To: <20261022193853.670625-1-ansuelsmth@gmail.com>
References: <20261022193853.670625-1-ansuelsmth@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_065446_949286_AB1BA211 
X-CRM114-Status: GOOD (  20.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 21:38:51 +0200
Christian Marangi <ansuelsmth@gmail.com> wrote:

> When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> stack data is copied and written to REG_SM0D1_REG. Equally on the read
> part, an unnecessary read is done.
> 
> Guard these extra copy/write and read for the page_len to fix leaking
> uninitialized stack memory.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/i2c/busses/i2c-mt7621.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 0a288c998419..9ea5e3f9a763 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -144,7 +144,6 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	u16 addr;
>  	int i, j, ret, len, page_len;
>  	u32 cmd;
> -	u32 data[2];
>  
>  	i2c = i2c_get_adapdata(adap);
>  
> @@ -186,6 +185,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  		/* transfer data */
>  		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
> +			u32 data[2] = { };
> +
>  			page_len = (len >= 8) ? 8 : len;
>  
>  			if (pmsg->flags & I2C_M_RD) {
> @@ -194,7 +195,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  			} else {
>  				memcpy(data, &pmsg->buf[j], page_len);
>  				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
> -				iowrite32(data[1], i2c->base + REG_SM0D1_REG);
> +				if (page_len > 4)
> +					iowrite32(data[1], i2c->base + REG_SM0D1_REG);

1) Why is this using memcpy() rather then just get_unaligned_u32().
   (Yes, short transfers get tricky...)
2) Have you checked whether the hardware requires both registers be
   read/written for correct operation.

David

>  				cmd = SM0CTL1_WRITE;
>  			}
>  
> @@ -204,7 +206,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  			if (pmsg->flags & I2C_M_RD) {
>  				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
> -				data[1] = ioread32(i2c->base + REG_SM0D1_REG);
> +				if (page_len > 4)
> +					data[1] = ioread32(i2c->base + REG_SM0D1_REG);
>  				memcpy(&pmsg->buf[j], data, page_len);
>  			} else {
>  				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {


