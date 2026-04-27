Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E29FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FwBDxvhhf1dytDgVC9wEZNucPdGR8g31jisecswPi0k=; b=LaMAZwgKJ5387H95+97PsW4eiH
	xMtapzmz03lktM5G5EWUTdfFrfo2dff8pr5iOF99I32J+zPdViFZS7avcAfq2QqxMtmuiAJlLV0jQ
	i3QWibSQ84SxJ/BIynNoZggtS0jhiz5oRMbuAJlMIKuc2MLrHQ5UaZj5L3r6/WFOzeSiFRw1ldh//
	p4Jd46ZsuWN0ap4GlQAi3j5PwpPsXpDxjfW/sG9tPaEsu8H/045I3NETtWZvogU14lbCMYNv6S1Y1
	XML7zbEq8X54FCZkdxoQdGOLt2pZXPHzOFmqp+HAS0mvKi/NtklOU8v5/+Hu3Q8vRb7cm1mMX8JmC
	o7uDGW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRKH-000000001vV-11gl;
	Mon, 27 Apr 2026 19:09:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRKE-000000001ue-3N2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 19:09:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so131321635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 12:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777316937; x=1777921737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwBDxvhhf1dytDgVC9wEZNucPdGR8g31jisecswPi0k=;
        b=h8LPolDyunBRtntegMvKJ+uSxak2biUwHtQgWADkgCl2+Vq2+7ced/Ap2iaefX9aa2
         zmuxnEZV9knRW5XyP1+2mdaZXFotCCws91elly9ISdXWiBlb/9SzPzI7aBrH0az6upF4
         pA3oj2n2H5PfDBr39xhBhWWP/ikrG3/xvjyf/cxJU14SL2xC1pdb734gSVL7KJcYDJLt
         +1pwBHEj1cZEzfZRx+ofjfypqtzJ4ETxyo1bcIF6ZGTVGdic50tkm2tPV8lp7Z4lXZmk
         0T82mmvAKgzQFMLBvD/rBVrB7A0ZL68uDUWtEPZ1F1P4eVhuVHCsB+eM1DjgPP4kPc07
         viTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316937; x=1777921737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwBDxvhhf1dytDgVC9wEZNucPdGR8g31jisecswPi0k=;
        b=gt1/7/AXLXpe0QdWL3osz7MpdrhbHRGfPqZRoC4+syNUpXPN++o9CjJ/IpRJA8qtMA
         jv/ZHkTq0tilKx9Fa2X+/kZJEFfbsPzs3NXeWK/wVyZc0bXfywuAgvq4t9FRdL5oRFY2
         Jvxjxt+3G/3E9LEp10nphJdBuvgZdp4o6IT75o3DIGWoEGVK22zBIqapkdxedQxBj43P
         wNyT3tq2OX0Yeu3C6GV9dsT9MH0KZ48ODzhVCMrVaEluF4TjIpij/pLZ/yWC89WEpceg
         AEnbDdZHJn/EkyQ2K5XHP6VnoPq09U1dk9b1HJQz+hEQ1TL0xiNLKucCls2cWDvW/RcQ
         KNKg==
X-Forwarded-Encrypted: i=1; AFNElJ+fJGpFbWsS93rpeskSvaRt2HOQQCyILjwent4nCT4tBUt6BWrDw52y6p7zV9IBkABZKL8WGurMTQspkbbGUfN5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz4jzvE7aA0nsctDWjecb3YF3BnsC1MtWdCxftjMDuuPsfEkaP
	e+rIGwTB2svjq1YCQSa0MlPrOyD2z1nbiswtgsSWDXdoo487obynNqjU
X-Gm-Gg: AeBDieueI6KnllUAc26iKO26d2xS4+9bJ12nAAuHljSPjaq4/IMJPHClGMTPIYz4lo9
	KmQJKW18N1wv9ihW5xaYQga5h9ziaV+CRtNgt/AEhU5v0gh6DslyN/XLJjbOmX/e1dP5/Dtv7bO
	sctQl8dKa+s/tFlSj9jgO9PKyLy1rL4cae/pF9Ek+zQTAEtoY+uWbciWCnTqLXSQRTuT+jsRjwG
	QCIhOLHUcOo4mGFIKmA98hMv60rQfgd/r8ZsOqNk055bQ6ibEdz+kcHJOMltxbJBbmQDb8WBoOO
	pVvs0vdzQqYdQS8QZvgbJ/Ppf4HemNwRVPcMQM7Z+GlxGVo98gVFkWtM7hJWtG1EhcVn3wsB5si
	jax4b1ybt32lIKE/9m49Du723SlrYL3QCvsaEdd6Wwyxm7pMI58pevYIR/g2Myy0mMitmPBbcNY
	HMn2NosNULE5iQBfImcDQB3bHlLVW0AcDpzSBct5iu7ec4m2xf
X-Received: by 2002:a05:6000:240e:b0:43d:6fb7:fee1 with SMTP id ffacd0b85a97d-4464aced261mr153573f8f.46.1777316936724;
        Mon, 27 Apr 2026 12:08:56 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59d5esm504286f8f.7.2026.04.27.12.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:08:56 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v3] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 20:08:49 +0100
Message-ID: <20260427190849.14963-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_120858_855305_0286DD62 
X-CRM114-Status: GOOD (  16.86  )
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

In mt6358_read_imp(), the variable val_v is passed to regmap_read()
but the return value is not checked. If the read fails, val_v remains
uninitialized and its random stack content is subsequently reported
as a measurement result.

Initialize val_v to zero to ensure a predictable value is reported
in case of bus failure and to prevent potential stack data leakage.
This also satisfies static analyzers that might otherwise flag the
variable as used uninitialized.

Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v3:
- Initialize val_v to zero at declaration instead of checking regmap_read()
  return value, as suggested by Jonathan Cameron and Andy Shevchenko.
- Update commit message to reflect this new approach

Changes in v2:
- Added Fixes tag.
- Re-examined the entire driver for unchecked regmap operations.
  While several regmap_write() and regmap_set_bits() calls also ignore
  return values, I focused on this specific regmap_read() in
  mt6358_read_imp() because it leads to an uninitialized variable usage
  (val_v). This makes this fix critical for reporting correct data
  to userspace

 drivers/iio/adc/mt6359-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 6b9ed9b1fde2..0e52effa55db 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -489,7 +489,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
 	struct regmap *regmap = adc_dev->regmap;
 	u16 reg_adc0 = cinfo->regs[PMIC_AUXADC_ADC0];
-	u32 val_v;
+	u32 val_v = 0;
 	int ret;
 
 	ret = mt6358_start_imp_conv(adc_dev, chan);
-- 
2.43.0


