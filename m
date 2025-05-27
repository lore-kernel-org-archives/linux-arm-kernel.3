Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12FAC5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7XytmjT0QYoYbr62wTzvh2jLYboBuJySkJ1IHPxAlMk=; b=QAMaZrN1dkrebzuIEopmoWjVZQ
	5wHwH3TSqslCgQD3NLYEYMXTabdo7G+h1yoc8t1tYV/aXgp9Ez2mlY7/3XFZryEwM7Y3zRfwNBSIg
	Afv6OIHv4wEGgf9gCpFkOgEAQUnhZD/16qaqJ6+Wv2g3DuyaczP+kRHf1dLY3yzVIsCn9BWo3jASV
	/ZYH47v97EqEMTCloxzuEvW/0yJwOQ/mY/UtK1yzJcunWV5aL2IH3da5Z3suLiTtgzfin2bLgjwKF
	nbM3/lhKjQb1EStHRR86REyIenElZ41TMzJ/KcPWMBNSoOBiCFP3lcMtDbaBH0UueDfa5wrrWE5C2
	kTX4qnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2hd-0000000BhXo-3E8A;
	Tue, 27 May 2025 22:23:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2fU-0000000Bh1V-065r;
	Tue, 27 May 2025 22:21:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so51033485e9.2;
        Tue, 27 May 2025 15:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384466; x=1748989266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XytmjT0QYoYbr62wTzvh2jLYboBuJySkJ1IHPxAlMk=;
        b=nk5TllOK4hJzwgiIxbL54tzR1wLXPIQwKZugB82TNXqXl2cgl/f6lkX79tENJrEYIK
         1owvwS2BdSwAc89ta2P9HDyVV2pJXWHe/9whwfQGmF7yNMd3O01UKHeRC0BEe7q9+YRK
         iPSgqlDLjhHEAC9bJppSi0rxBEp5k/PCCsyDgoiAdt68xEICBq0ISU6v/kOv7iDK0624
         fXyrNTdx7tzodU3vlm4N8EFFIzAsqjBGfvKgk982JpJvEQt3Qbmty2pGG8EdkJgPVgqX
         DaB7NOzWoYhn/g0jaDaDDpqvHS4d7tntAxMk1+3nSC4Pazs90WIP8/T/SL+aS1jrFSbM
         0xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384466; x=1748989266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XytmjT0QYoYbr62wTzvh2jLYboBuJySkJ1IHPxAlMk=;
        b=nxFPT/xvo4DFtxfGUboIRWoepseb1cTD9aaB/qoc0TVZZO3HfkCOkrNH2usstBEN5p
         hyF+ntAwfp05Qh0RUs2TNRNionjEPuECQKPP8umjMlRgGkiHmMSzXA91ApE4QL0i3gxp
         hGlSJAno5DFNC32jyS3qxCToL2lrQKhfGo5PXYGwSyO3BqDQzl2F79EPL3/Gf5YHoZoh
         cXPrcUqzFQLJXQS/7KyrO5/BjdV5f6S7L+dlml8gE7agKS+32H/k/uUUK2N89hCILeXp
         3YT7xy+mP397GKwCWS157+GQ+H/HJAg+f18C64awhwusHbwvY2OzyIJ0Hhsu7iX3y6s5
         cuug==
X-Forwarded-Encrypted: i=1; AJvYcCWxy1OkJAEGqwHF6d86NyAIYRm2mMsZ+4d4HQ6669U+UZBO8MyCjAFkzb5d6OVq86ZjxU+XJgRqWPNZ71C8/jo=@lists.infradead.org, AJvYcCX0KimJEDmtSjmAuqUQujqKwtUQubUm3tluwUE4m6tPPasoLSli1oY9x0M27aC1i3tO7beu2oy48JEk/iySe+X8@lists.infradead.org
X-Gm-Message-State: AOJu0YzefnzwStmHuAY6cOCjid86hlqi0UN4EZ1YkEChEtZIGEpzBnUC
	Kvbk1PrvvwFpo5JC7fahR/rqcX1yzGP6eL08wBs3LZ2KJ5/TtbSmL8Wp
X-Gm-Gg: ASbGncu0wdPwIvR/VH9kt7nMuc/MN3FfWkYVudY4TMdPfLW0hnNMqXvzF1qeeeFcl5+
	SX2OLSdtXDLs9CNOHub2w1M8HcUmurt7Xq3YHv0V7ShxFirLFV6D197NSQC39JcMWkCS6f0AxBm
	M/gAVKIj0Ple/7g5veVdsfGT00H4unVTJz7LKbeg+2qxD+9me/qvV7e7xhxeIHk+0fXasA0Uusj
	3DK++EzPJp8UQxqmjZVrE9o/lx5rP7z0dYFA8D2fomhZ9FuK/wzTJiP5z51P83H6DOZdGll64AG
	jx+K+z0PXI1EqHF26mK7Ko2eKHMwaqnm/AqqHdEkE3b0hPanQffGKhYIDBiJ2l3yZQqw0+HEARw
	9yZryuBoYRJUrsywt722jX4Pg2qM9rW0=
X-Google-Smtp-Source: AGHT+IFdKWU8GcSeLjuTkimcHYGLyMLF9mUe1qrsMqtPgGlIFwLTef1kQexYipsKO1mCIPUpGPKSqA==
X-Received: by 2002:a05:600c:1e02:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-44c91dd0981mr170619255e9.16.1748384465884;
        Tue, 27 May 2025 15:21:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/6] pinctrl: Add Airoha AN7583 support
Date: Wed, 28 May 2025 00:20:32 +0200
Message-ID: <20250527222040.32000-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_152108_063783_1DA5A40F 
X-CRM114-Status: GOOD (  10.15  )
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

This small series introduce support for Airoha AN7583 pinctrl
support.

Most of the changes are generalization and cleanup of the Airoha
pinctrl driver. These are needed as all the array in the inner
function were hardcoded to EN7581 and didn't reference stuff
from the priv groups.

Everything is changed to match_data and priv struct so
adding AN7583 is just a matter of adding the structs.

Also the schema is generalized where needed to address
for the small difference between AN7583 and EN7581.

While converting it, it was also found an additional copy-paste
error for the PHY LEDs pins.

Christian Marangi (6):
  pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
  pinctrl: mediatek: airoha: generalize pins/group/function/confs
    handling
  pinctrl: airoha: convert PHY LED GPIO to macro
  pinctrl: airoha: convert PWM GPIO to macro
  dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
  pinctrl: airoha: add support for Airoha AN7583 PINs

 .../pinctrl/airoha,en7581-pinctrl.yaml        |  297 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2497 +++++++++--------
 2 files changed, 1489 insertions(+), 1305 deletions(-)

-- 
2.48.1


