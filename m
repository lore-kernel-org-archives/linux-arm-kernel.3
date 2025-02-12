Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99CEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mOqaSz1QymNVqvSoXI2MUMGj2cHYyqzoo6sZSnsPqGQ=; b=eaRSeKH5466nosq6PsEW8c8n5I
	qHS4YdGb9dpIDGbzW7TjPVx4KoGfpYVvfsKq2hI0MTsiptU9SO6rQe09xIs0UsGDZz3Wm+XloN0au
	BpRP6bI9QnbJLb3q7f1nkWeoIAc/eXbOYLDh2COtv+D2+610TWm+WASKGVRtQLcx7RyqrqziL16c7
	bUGMUOH8XXBQ5h7w4i2HWX0CblZi98SH8sPC1xygRwodFl4G19eWJBdfZkw687Ma7PPKDMFgKPnyI
	eajB93ux1BcIHykKM8/B0i0Z1YI/qAQeCWzxEwpBKyZdQ9ZqWfGbWn3AYZDqNy+5ZHzwsuUZLs/6t
	K5PrEqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIBo-00000008bU5-324z;
	Wed, 12 Feb 2025 19:14:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIAN-00000008bEg-3ZNk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:13:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220c8cf98bbso260015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387579; x=1739992379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOqaSz1QymNVqvSoXI2MUMGj2cHYyqzoo6sZSnsPqGQ=;
        b=Hj2bhqalPGZLL8tjaAA5hv5UciKvojPI9WSOJPjC9OrFfCl20Oi6PkWxmUR7eINGNN
         mDXo29pVbkigtRPrjHxZDzCuezMxFN9SfyU225TTnsqgktO9VVIaON+a098LBgAJT14G
         X/vL2oo+5WpmfYimcFkGJSUu8D6UNMBLJ7q+qyZWgT23t5rV+zg1PUsI9SmoqqzgCS/h
         +9aofM42cQeZWLjpiKYFWDE/fxYYlnuY/a+pdvxNTQZNYzJGzyucsfvA2mvgrWsRGTI2
         Ai5YHFdklkptHB4FwXZd2rjysdXzZeTWdlJlo1TIPV048O4f7WtqoF76+wTKWtG8zdGh
         jOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387579; x=1739992379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOqaSz1QymNVqvSoXI2MUMGj2cHYyqzoo6sZSnsPqGQ=;
        b=Ul86hdriKchCNzOjS5xnBrXbfCvmALEo07PdV5VeSVlLsayW4YiTokCPFuz0u1c5Vf
         1lfPo1oNVmbEcTozN5S02+IBpdRuRFDSIm8Rfnu2s/9+jB8dmzwyj63VZAO2Hoa5ebeH
         x1d7oZC/kij82tUe+17LM+dSWVhg3+33dh7xiZgSdbd6aRuPXG6bGYF9v4skTZLm7UF5
         T7uSkCwxpbzrQgpBa1XimDRvY7Yn4zAe1eoKyTW7uPOWYIOrvgc1tSwnOisPPQvf/n80
         q0mFkiDkkgLHUYkjMlKLJIkXZKCaCIAEEyP/nevv5B0/z6uIhjb6uSDWJpecE3jHZzSc
         X70w==
X-Forwarded-Encrypted: i=1; AJvYcCVVE3d61CpnbpVJPS6MI4bzMaVLG8A0BBs31CHb8iz28kpAYpficfUHTkxJQj+XFpbBXncqrFATByX6WJb61834@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdx26ttCf0pmF2cGVIRc2SMI0SE9XgB5aApdpfsV8Jt0NrNDvm
	5c1IL2VRyLix9705dDCerFrwa+hzlgcPvGHUBlrwtnuuacAXAHlQ
X-Gm-Gg: ASbGnctX1D3cylSLTZj8tNllzDiEQ3JwRCd9nAyqUvP2YzmqZx7ZdqKcINTA8twgSs2
	nZeQruMpNzo4MdhaQHUq4ek2DQtFyx+9qXvMbmYi/3wPu550O9PV19jSgsKtv2UdCG3A6wdNTFA
	8ByUdcnuiW+EAS/0dOJDa7rXresS+q8n6HuEoZweoJkaJYDAhw+qcjwo+rwFZxJ9haMeANqzYuU
	Lt+cn0EWFwfC8Qd8aR1fLNEtAhXzHBlDUkA6XgOkWP8iztbahtUolCzEd0NTxofxfubEX5fDqp2
	KoH0iltyMPtxxzIC4zSoig2IDdgIv3wAlBwc7+QPi5FsINYAZtaY1gp/TGbQkkq3WnxIbR+p48E
	ENQ==
X-Google-Smtp-Source: AGHT+IGicZoPXxTU+S/YqxVcCZyaJIpp3N0yw2wFvTf/7eomyrPkUvq5yeOuzReT4CyOnDWYxlOxSg==
X-Received: by 2002:a05:6a00:1709:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-7322c383fb3mr6100608b3a.6.1739387578796;
        Wed, 12 Feb 2025 11:12:58 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f79sm11536944b3a.77.2025.02.12.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:12:58 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 0/2] spi: s3c64xx: add support for samsung,exynos990-spi
Date: Wed, 12 Feb 2025 19:12:39 +0000
Message-Id: <20250212191241.280-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_111259_889550_317462C4 
X-CRM114-Status: UNSURE (   8.70  )
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

The Exynos990 SPI controller shares similarities with
the GS101 (Google Tensor) SPI implementation,
but introduces specific hardware requirements such as
32-bit register access and variable FIFO depths depending on
the SPI node where it will have to be specified in DT (Device Tree).

Denzeel Oliva (2):
  spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
  spi: s3c64xx: add support exynos990-spi to new port config data

 .../devicetree/bindings/spi/samsung,spi.yaml    |  1 +
 drivers/spi/spi-s3c64xx.c                       | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

-- 
2.48.1


