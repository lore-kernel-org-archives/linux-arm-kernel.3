Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D14C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZocKeaP4+m6t9O2v1jxFvpKpeZLmzryJkfebv96Xm0=; b=w2RpvG8kHrERwUsx7XME5i2avE
	F/pw54yrlnLYo3IVJ65eqDN+byxVgsukj1G1OoFuJE9eLr+mszi/z5hrohA1AM2TGuKiY0kttPzbw
	JfJ8+zk20ZI1vRvq0w1eTxburIx52FpxRoJSOBV08t0XQTBuVwIr6QE9DTQISvY/d5xNKqOW1CvoH
	PX3QFc/jTnW63appVQyaI6OO31/KY16ebEbgVTDtSo/pmCzJRnBBKgTwIiKto8EFsm5SF//rCZVmS
	OkwlDcsEATMgv31RDr6LgEgzf2IwUB8GY8zgtjTMm3C/NRfZ0L8LkLGLrnttgQphUrKZUctfXuL8t
	JRkzPo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFnl-0000000CD1Y-2wQK;
	Thu, 20 Mar 2025 13:19:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWw-0000000CAhS-1N7o;
	Thu, 20 Mar 2025 13:01:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-399737f4fa4so415998f8f.0;
        Thu, 20 Mar 2025 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475709; x=1743080509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZocKeaP4+m6t9O2v1jxFvpKpeZLmzryJkfebv96Xm0=;
        b=mLTwfYjmwVUJpsnaQ+Cb1ekV0tqtcqYAsOUXB8erg6oXTaoUmFGozXfgMcX9NzaCuq
         FSxx5PfxiD+zbefW0Rubye0T1EiLDM/iQ3kOy3LaTehqvqTvOO4uzx5z++KvDVlayCVP
         ZcgsAe6c9000PPt1ER7C6tMGXXi8qexrniLvn/xlYSPgCrdPHSLsUztoKdpzke/Q1oZV
         w1k+EQGSeSA70HQAxP8ag9cvInj9LaaRsbQ9oxxLZyXiGH2zmR+Jwe6EAhTWhNbDMwf2
         mgf2Rn253yhvm+WoWX2Uk8lNOjiIoABERApebHYXRwblJ9BJPF713Dm/8m5cMe/XzPsJ
         XWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475709; x=1743080509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZocKeaP4+m6t9O2v1jxFvpKpeZLmzryJkfebv96Xm0=;
        b=STIZq0y2yndYo+YqCxj/Vd4apQDAEX4HMJu1pIG3e4X0N/HAqVWX7fv8lQnKeHaiTA
         5uel5TPRTaAQKEBmBhdhzFRprya+f9LpIIzAGMHWugO3NMRdzwPpIU7SVgHQ9pt+Z64r
         fuXKiQdNnvE/ompQJDNJFzeOtW6Wm7sSlm1cEqQGhHpFIO2NmZisZFqgSTp03kYzpIUP
         MbXP8z7CHVNEV6IDlXLnHESb5K3Tc5XXmoAYMhyk5/SKan4olxxys9B6yic14U+C/bam
         zDZvFvh9fRwSan5FpQ60J2e3l/cWuzEn0D3PaRGK4WdPjS/Q5qi8KVB3+xaImLtnBV3L
         j/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUXbR4ISItM33XHE2yDA946t/FrRyKYYIBOHGgZro0V0wtBKYfcxuRYQoBDkj/TCf6/dWkFqCU9XBtO@lists.infradead.org, AJvYcCW1ppYp444yQznNuAqaymoIa5dSixp5A9cL/gD9NM1u9nmft8TzZA2hVOZbuaJVC37idjYUF1BhEPgRKB+4l54=@lists.infradead.org, AJvYcCWhTqpiogYS6Os1ggwJKKclBjIELPOiK4y1KI+bME3CdqjebCKXB6sQ7fKm1PzdYsK4kXEqi4Oi+s/oPuLDtOsm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz51uTP3t5JCeXFviQK6fJkk1ptWzyDOb74fjbHFPTiTDnTUKhi
	i2lnSx2qpfKajdPo+AKamEjMFqHafYmIr7LVo/iwNijr3c0NM3Ax
X-Gm-Gg: ASbGnctKyqkv48m4kINzCTc+wA5UUUg2AflC9y3I5rzbnEFt33z4ROZAVOjwg84I57j
	LHNkh7CmpD0xJ//QYXQJTammXxBqJjjEPxd2/8IfzmyCVEFsjlaBiQhBgL5FEL8JH1qbjanKvXP
	JkIYr/tGXDMnv71mMQsrP72cYY90BjS8q+qbHVnyQPlfoIXYSlB1qvcSc5qS2R9c0a13YIzEm2c
	Jg68WSOWdS+px76UE7zalUYNUA+rHp79H/fuf7WZXxrqy+KlPlt6YMdJHyi/HGi8W/J7bmWh/ml
	KKorDaiVKOv59SCk2jOtIayUQgyGCjkHIEPdmDB3OWK57xOTtE/6qPOODT8ELkJSHQrVYQPVfjR
	5OjPG/9QEuwwmfw==
X-Google-Smtp-Source: AGHT+IFwiZIO1zJG6xqsD6hkKvEBYIiPzPEpp2yNsbAclaZLwl3OGlaU/Gn9w+5dTLKNFCSQz4VNOA==
X-Received: by 2002:a05:6000:402c:b0:391:4684:dbdb with SMTP id ffacd0b85a97d-399795ad76amr2805038f8f.17.1742475707909;
        Thu, 20 Mar 2025 06:01:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 10/11] usb: host: add ARCH_AIROHA in XHCI MTK dependency
Date: Thu, 20 Mar 2025 14:00:33 +0100
Message-ID: <20250320130054.4804-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060150_364972_3C39CD9F 
X-CRM114-Status: GOOD (  13.94  )
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

Airoha SoC use the same register map a logic of the Mediatek xHCI
driver, hence add it to the dependency list to permit compilation also
on this ARCH.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d011d6c753ed..9d8626f36ca6 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -71,7 +71,7 @@ config USB_XHCI_HISTB
 config USB_XHCI_MTK
 	tristate "xHCI support for MediaTek SoCs"
 	select MFD_SYSCON
-	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || COMPILE_TEST
+	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || ARCH_AIROHA || COMPILE_TEST
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in MediaTek SoCs.
-- 
2.48.1


