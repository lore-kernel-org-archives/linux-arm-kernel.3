Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31077E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=; b=nJX3b9LLrQRae2lA+s2JuqHtht
	LYyNymqnCh0gZTjX7MbsZqc0wt8r3mt9jsRB/k2NrgW17aJEdENhJTyfPoShHDJPO/L87+V7zZrln
	l7oX651WcNF/GVFTfZJX+j9gLZ1PUAeHTecMhMpbBdbdLog+2R6jBDDKslMW0kDn6+OY2+5LXPIN1
	hcfMr+EQGEtsVJ0GllERW16MKTrksXuT80MEX461LQaF/3qxlMQotqnbopl9eddGI6Z9aWqP7FGpg
	0+s9mYSHZ8l8jBYS7KGJpAGwv7a3WUZgDzD0ptpFBtlHiOwv52rmri26bj/xzqkWR0iNo7nIWR1xe
	SrsbJuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCt1-0000000ANuv-2m44;
	Mon, 16 Dec 2024 15:19:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCrv-0000000ANhM-35ZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:18:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so2071945f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734362325; x=1734967125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=;
        b=mTTHVgvdcy/59vitpo1jSU4to65/HOhnBYdAlE9sh9O5/lUtIKAYtGMn7ZpiQyDap3
         RTcFSSjRpjispKqlQJA+eYwb2W5WlaCxVwvpUnyBMiSPB0CCjP1OpJhx13S9QhMckm92
         3XcHH7MwhQbWf2Ea+iraGcvjl//4pVwVzOJwtYlJOkkEUL+PY3WO6pARDA6gt03CSldg
         MYDcdwf/ERL8TmUR0BsxCYp8rcyic7LJ8reupiV7h/v5eLIfOwbxqoZJiALKtWhdC3Vj
         ira95nhguSDT+MMj3Fk8M0bu1pX0RJLXzLoKO6xm8HTU6adHff1lFiVCmEaIoYkjeUsV
         BeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362325; x=1734967125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=;
        b=E8Ns3p7U+UbTA1G0Se1cxA0JtpOzM74Wad688GpCvO6nYYEg5xQz6ZyuQmacmx9cDC
         rH2rxSq4Pcp7LUgMTqVg3PcznT05DD23OjD1M6lniA3scxhEBVa1dAQBP6zdci7JxAMH
         yxZA1vI/MtLkaAlqBY39J9lltvIIYyfKSFGbrZGSUqIzI32nEJYAvGqUby+prtTR9Nbx
         T3R6regj2yDpaR6EdtleW4A+sbz0fbidtSz6Wj1RJEy8fLI+heiE2w6b9UchLTQJqAYO
         OQPNooPZ+M66SqL2eRrS2SGDRC0ufIXa5k7nIkhqRatN/8h71ogp9j/sczDY2m+mgmTX
         l31w==
X-Forwarded-Encrypted: i=1; AJvYcCXcZRjymFkSNOZHxmfaAC7LcDtutjKidH5KvMR1HO/z/l9igCd+C8u6NF77xe42IZ0WKIucP8f+BqdHdGDY70fK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8xGAjV5c8U46hxBj/BxS664wKhPcd866fILvOxLYZB4ZeFRHh
	pWZGkugfhaTmFgvPAnMyGkGeO3WVoZXWre5G7QZAd0/zo7jHgnhU
X-Gm-Gg: ASbGnctTiyPEMuH1hdFwcqZx+QwyVAM44IPD5wOMQs2/L7mqG7OWWIWR58PLjiQweVy
	amjCGnycnd76E7ye2UfGa6jf6JdlbNi4ohHCABvOxFViwiRPpzLAw9zhMikMAK9jouaKNyNVupF
	lK6vcXpwUuExqPtVew4JSbIZRBxgp6RlYk/hAhphZzWF9qQKdX+zAwIFpADTTTqWQfJmMHCBc41
	CIjiDq0VWcjo0JmZpED9vVFDN997Cah0lPsa7NKQjHfApguJLWU+nZPwn4RB8qy76IBZIBR
X-Google-Smtp-Source: AGHT+IEr92SrsyLf8UEGh/qJ4AcuJCbiE9QwqwVLL1sL4V60D+nHXLQW58JemQqBLG51UkqEem66Mw==
X-Received: by 2002:a5d:6487:0:b0:382:5088:9372 with SMTP id ffacd0b85a97d-3888e0b88afmr11406631f8f.43.1734362324993;
        Mon, 16 Dec 2024 07:18:44 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:9096:1cad:6f4d:511a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8015f77sm8351129f8f.26.2024.12.16.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:18:44 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: imx: fix missing stop condition in single-master mode
Date: Mon, 16 Dec 2024 16:16:40 +0100
Message-ID: <20241216151829.74056-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_071847_777008_DA61A228 
X-CRM114-Status: GOOD (  16.29  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

A regression was introduced with the implementation of single-master
mode, preventing proper stop conditions from being generated. Devices
that require a valid stop condition, such as EEPROMs, fail to function
correctly as a result.

The issue only affects devices with the single-master property enabled.

This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
polling for single-master mode when generating a stop condition. The fix
further ensures that the i2c_imx->stopped flag is cleared at the start
of each transfer, allowing the stop condition to be correctly generated
in i2c_imx_stop().

According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
5270), polling the IBB bit to determine if the bus is free is only
necessary in multi-master mode. Consequently, the IBB bit is not polled
for the start condition in single-master mode.

Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f751d231ded8..cbf66a69e20b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 {
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
-
-	if (!i2c_imx->multi_master)
-		return 0;
+	bool multi_master = i2c_imx->multi_master;
 
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
 		/* check for arbitration lost */
-		if (temp & I2SR_IAL) {
+		if (multi_master && (temp & I2SR_IAL)) {
 			i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 			return -EAGAIN;
 		}
 
-		if (for_busy && (temp & I2SR_IBB)) {
+		if (for_busy && (!multi_master || (temp & I2SR_IBB))) {
 			i2c_imx->stopped = 0;
 			break;
 		}
-- 
2.45.2


