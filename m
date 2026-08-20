Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D46C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=; b=BlGDD3NjoG/NduLNbdR9l0oPGK
	tW+YfEDMsb7N91Jah1jOgy4T8/LUjV9H/D37S3Dme3cM9FNgqytYuMYdG0xnP/HDqG2ZqgBuagIRu
	GaN6CbCoqnDiLX9LCKNtkKuiiGf07WnxdKwqGracjvOnQ+81VfM6Yi/s4vkzR3PZzyB4s0/8P34q5
	PLikOk2T1R2JM2J/FJUwvfGKx2Z3Cl6VvBybKyPA82oAU3rptPBHy3a5VgEQvzLyHUDNaMLiL3+te
	k1ppqZoYELy0Fr8As94fRg72fj7oJlY8yyv2a7DcSLcvdzaUUDL6w8SMbK+sHpuJmPjP1mujo/bZu
	EWprH8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyte-0000000BEqm-45Ok;
	Thu, 20 Aug 2026 09:17:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytc-0000000BEoy-1RfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-472326ca506so1358040f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217430; x=1787822230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=CwVAwotla81mYbWdUbEVtaH+c6Ie+tiVo0xma7+E8Fub2KM/G/P0Ntm+exUP44phNe
         2oHynkRXyV+eOK3R+BrgqKDldWXtwUoZa9MMQZby6Y+wpx9qDX4taT0H+N48LPBfTUxR
         UBR7IEXsvfBE1HBrus7W4XBQzQ1d0fj7tMKpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217430; x=1787822230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=V7SrPGcevbJZayDutNW0FXsMU+2y68lmDBZOZPAYwLz1GMeROzoFT6Lr4tuXirhQfo
         +MJhVde7Y4wmxEqFya5fUY+Uv2Rk3jgRTec4V/LwdxW+g+ktfTRyO14ytBGLxVTFz8w1
         wJhmOg+C59IvnnpYIy/Csi4GO/xf9QQA//UhAqJxyKjE/ecopCaLF3tDpFpMGUMzLemn
         Ie9EUSXBhcWPHXtU3FVDA3C+Nz1cxYH4/LRKwZD/Oap0Tec471GEBG6uBWTSSNvNHWO6
         3a7NfUn/Gqig9lVD1CVU6US/VhTulUS8ZaYARL+77WRYNvPsKNXBjFLoHv61ODX5dDpt
         wX6g==
X-Forwarded-Encrypted: i=1; AHgh+RrVzs3wngy4q3onFc6qj0eDYlX5K+UKqAaMPKC/GR+jYMqKWo/LGY7LIlueZousZaWl61QDQUe897RFTfVyGSG7@lists.infradead.org
X-Gm-Message-State: AFuF++nI+mcMoyMeUl3gFowcpQRAweuiEmEHlACaKWHv13B6pyD7GCK8
	BqWSKGmt/BAgZl9NqQwBdj9VA8VI2ltrVb/nlbHsRyoUbq2LbsEg67WwyoON1K+WWAs=
X-Gm-Gg: AR+sD11yABM5bxez7C5XkGDlgz1YpXLOJOqjEgylL/J2MfUwxoiyCOLuUqLKnfVXgvv
	FCrv9hPRYbHd9o8C1lF8mZtJAsNLkDL6O1AjteeagwSOH89eomjbCyre6w9MKzsc908u5jL1sE8
	E5yKwqBgkaAN2D26US7mqFss25dUJVqITTc2o4M8e2mIV+uipeefzTTwrrG1uOjiKpXKQj5nbqi
	aj54OINFpb+APKtMZsr09MFA11tbesQ79FyBpG+TZxwDon6ocbKxGcR/xnhkFiXbzJSPwx2KNp4
	uls+1nZD9qS8W2szMot847mV0DAvdSnotZJ7JO4Kew0w5pnrDxr/22ZPwv5bZ+HdIfm0oGsxrIB
	THaynpKuu6ZNh7adBxuKyLQYktAQast4fZXZC7GMIpjiFuqWlu5Txwq8h+rEkCF5pNThh/gWFmA
	mKkPcyj8pCHcjKfoeEbiT5wJWElitsZ0MEpMJ6qjylrD+vaCrh+7spQFGeJ3LpPr1mAuzdGdr74
	tGWLxG8J1d2X1V6wLCHi6SOV0+dMQb5nKx3Ll5LvBWplsUJtv4NNEVQHVzqdQ1QNC0tHKT1LWJU
	3XTUEtYsV23esb52RqUEYQZJyX/WsG1uqkrMEf6UVESkxR09xQXACkuGveSjkg==
X-Received: by 2002:a5d:6f10:0:b0:481:5ba5:994c with SMTP id ffacd0b85a97d-482b1ffc276mr22851058f8f.20.1787217430423;
        Thu, 20 Aug 2026 02:17:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Thu, 20 Aug 2026 11:12:10 +0200
Message-ID: <20260820091652.43541-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021712_397344_F68CC0BA 
X-CRM114-Status: GOOD (  10.20  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0


