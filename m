Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC21C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLdsU1KFS3tVYEAjIFsi6WKlfhYjmE4PjmptYahFlqM=; b=A/2CAdlzaqGoAdIAzAj2DbE+ee
	mwle7T2HP6Fp0ML5bdrNEvFaOK534J1sm1kd/5nF2whWVfEIZ+8o8VVry+olnkD2PZbf2qbXLZSLk
	67jL6j9oWZdDQc1tJ/SHFz/+RkBehK9G7ZCOdEuRfq3KaJ3g4+33HtJpUatW1FJ9a2nYkicQh382A
	XYKafEQ5VEwQ7QJ9NpQikZVMfIIbyBgYPs1O89jbr1EUmHT05v193svaGNOPfzT+jDuroWCgzSQjL
	47p45GtN2V35ZV7vQ6VsW2YX0Top/XYhjj62eheEs9ru+TCl/nLO8Q/23bZGx1oc/fWk540raxRfM
	FvY8jO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thc9k-00000001dZ6-2yhJ;
	Mon, 10 Feb 2025 22:21:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyl-00000001bNV-1JYq;
	Mon, 10 Feb 2025 22:10:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dd93ace00so1136207f8f.1;
        Mon, 10 Feb 2025 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225410; x=1739830210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLdsU1KFS3tVYEAjIFsi6WKlfhYjmE4PjmptYahFlqM=;
        b=KwgFL+/FGfOM4ahLfhDzRCiLPIgc2qQ6vc0KeTArrKppaxA5icyfoBIBtfDl+c+xSZ
         PuB1aG3W99px/3+D+VGGF7bMgN07MoVzkjd2Z8o0vl25DXXrQLEkFe1FZutuGixc+1Ah
         Yn5R2E7dcKimkwIrPOJ7iW+zv9S8NFV9xd6k7xtsk3n9xT/X/g/Z9bw644IoUDwjiluX
         4Sp8aDKb00O1fhlgfC0c9JhcrxBn7hLOnMleCmFdemGvlS6CrrHPThG6WI2l2bgWG7cQ
         AZ+QCcKt4bh1eJ2cnY7Pfio5gkp/5E06C7tZZ1LVVWTGpHltc6/NqD4LxfCPcMV2gq+L
         OrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225410; x=1739830210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLdsU1KFS3tVYEAjIFsi6WKlfhYjmE4PjmptYahFlqM=;
        b=IhvL8HB+y8lg5eO2HNnBT5vw8uku8etR623lO4l+Jp6BN6syeGV1eDXa7EqIqe90L+
         ZBW0C2FFheNx7jNo/iUuXsZ9EtzB/oMzWuVBjjy436sqGQzqVje1edzTpajc5pY2EO6k
         m81ZWF1FcC1cbNI9fqY7O3ymudSlRNz9QzQyG3w8yGB/9lmfD0EZYbpZWdgA/jGC2dOh
         zg61HZQzIvWYGAH0EP4C/Hxf3WNreHsqHSHpexImeDDZQrinsytBqJ9/ynCrKnyhZRKs
         YvB8LWcKeyHyuTPmD+V081WpcjxObcktR3S3SJjIKTd/AOEcxfGhIjIoESdTGM6dt93Z
         aeVw==
X-Forwarded-Encrypted: i=1; AJvYcCX/tzvcmNODyOM2aA0MiNlh2ZVZxxsu+dpEcbsrguyLfn5MWggHAFt721OQeeg9J7s6suiuo1RWCse4k3kr3itb@lists.infradead.org, AJvYcCXtKBgb5PE73ZCCasgWfKw0Co2l0fBhkGDnrV609wsLmj9W/eVodzxchcM6pkzOBeqVwUeOt+ojAJIOreE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWqxjr3OJ5R5Jadu5Y6s5FCXcXJOoJ0c9YZRA7suI5IcDcg+9F
	C8jf40lIf9NK1eMp3ncqqzWbHJvB0Am2VUXyeVdukCP0Z2egIIp6
X-Gm-Gg: ASbGncvMjpOqGAKk8k9DK+N3cRJ3y0ZmYK6FTD2GJI4+SqAhdLGZG1fUImrftff6phb
	5koMf/yJstJMnsc2gQcN+Q4gwmRW7mqr1LDnO9louo/3ZiASj0xsdIzKRwSaBafSyg3vjWaPwMH
	LIe7g5HPIMfvFjITsPJ/TPcTwpQjyMoQjIrIF+wwFB2KDXvI1dgBEwhHcpF8N9znWaM17+NW8+C
	Wj1f7UV01CbI5n3L1UMXownSWWahYXObBdM4QVcZLwMPYkD9oT8AZpBEAvxwIQHc2iy/H6uePNH
	KEs8ne5lj0SJbjroeIf2pXcwEDc2
X-Google-Smtp-Source: AGHT+IFfMKN2DVPrE11x3bqwtEzG+jwRwo/EFICUaXgsePAhWGKTTHB2d0A9/IHfN0+E/tAfD1+HjQ==
X-Received: by 2002:a05:6000:188f:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-38dc8daf01bmr8379732f8f.12.1739225409620;
        Mon, 10 Feb 2025 14:10:09 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:09 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Mon, 10 Feb 2025 23:09:47 +0100
Message-ID: <20250210220951.1248533-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141011_354260_E7C091C6 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..865625ccf2c3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -650,6 +651,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1398,6 +1400,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1517,6 +1520,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1


