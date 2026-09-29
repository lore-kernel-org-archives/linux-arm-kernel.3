Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CBCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=; b=qrkgE56cNz7FprsifvGFQ6/Uwh
	KeGE0c3HEC2gwG93vDsmP6IFfd3TGBIkoV3FUAdbbiRDFs1RhyTy2+RALO1f3aR0HrCsNxBGuFZAG
	CQ460ujptdDtdW5+UvIH099d+Wb+9OUI31kYvlUO7v8WP5uMKzyj1ku9W3vK61uEK/KuUnHz7hESL
	Orbpj71Q2j98n0mmx8Gk+aeWYjeDVhFgV9ym22Am88zXXACmTW3SY2YT5gb+/0PrJHHY/+s6IAh69
	avI3SDyJlUIT0PyCxCs3wlKvuEzQJJ/UPZrTMdoTHpnslCPbadw3q7KWUziDmWDtwGnLC1BZxzCkV
	9N9f6V3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTyw-00000002wr1-0cE7;
	Tue, 29 Sep 2026 09:18:38 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTyi-00000002wnS-1l0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:18:25 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so10615525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673502; x=1791278302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=LNMla3ALcfaBxOmb/6rh+waY2BLlNOnS3nKglNVmiDYmDdX+IFHWipoHz14s+QEd8O
         R+7JPixcKG+lkx6+slTmOaVXwdXOab7g2oqv6uetXlrUb4bWCpVDMUpaFv0O3vDEsrfT
         RiipemxZwPdMhoo2hZBn2n/G3Pr/MR/30gWBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673502; x=1791278302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=QvnGPXJdoVkqDYwTdVdqeyHZGbuW4E3RSQOFQMSwTgLW1k3rfLlAn1ynw1yoNimV+q
         1TmiAvfdcEbBrEajTMf11Uk8gOMoBXo7ki7il9+Rvy/wV5VR5s0fzfiPFHpUscdFDvd2
         HqSaHNCX0CLy7amz31JdI2muHFpqhTKds1BVj9at7fW+x0sEh0mELVrIG2dpAYk/iySr
         9zIJkIv+lC5IfNpAbekeKpGmSFTHzLa5BZWgAf7xRVT6nT24sVB18GTajnhxpxsfz4nu
         VsJW37Zb0+bQrR3jHxL8o8n5cNJA0A5AlhGdRdGRzq7nBTa+U1VJtShFLd51cdM+3MKY
         1xdA==
X-Forwarded-Encrypted: i=1; AKwUvBwkLnNqdN2xCTt/GTZr1BGG/ppNufUGbN7FcDSRyFI8i8Tq+taz9jwgOLzdUMMD0xwMQmf+PxEBf/K/OgCKFNiT@lists.infradead.org
X-Gm-Message-State: AFuF++ml6kghynTya8BSyRikH99boJAYNBTAmuiyHDBhQvQNqHWvHY1I
	5Yi5XwNmAgwZFZp16Psn6wWAF+4oLDQGP5DDLGnKJjgAokV3b14Rn5PFhFc11KNxUpc=
X-Gm-Gg: AYBFou2DgRzLuFPNppAXDI+taprBbn1jiEeV4+HQZYP+f6tQYGvSyRWyJkBSw2hqmtl
	7XRq2u4vDl7aPVM/xlmSCQXj+98hwWGnP0pWlwcpFgGynxmHy6mDVLSMnDTMq1iFEFy/CYoF9HH
	jxlHYDR989PzwJM/MtA6xaOhbOEO1sAq0yviCqqvsJ9V9c2FSE7e4JNeCqfAxnlcltW1i1DZkPW
	y9aDuiqQCCzDQ2q7rWwmEAO1OJPOpgJRU20zCzj8cnB3mTid3a234G4nW3vN31HYnOMGt1o41l0
	or8W9/Gm01a5B0tAU74N3gqm1cF3shGaQPkq9vu760orJ8IvzJZNvb04waJrLNMIjIp5WpKFnVN
	MFJirRX0h2M/7cBPqJsFwMfwejXgxIrFvmj12lBeqHcMl8MmrQe2bk5g8yK6Ro2Y9x6iC4NpN/p
	PJf4btm3HtgixeccDyT2nNZjzgKs4OGR5EL1yrsCoCz3f88NDde6OgsVJBCpfbkgs6RzI9QJ6AV
	2GlsNRvH0uXGrk=
X-Received: by 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr212016085e9.5.1790673502310;
        Tue, 29 Sep 2026 02:18:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Tue, 29 Sep 2026 12:18:09 +0300
Message-ID: <20260929091811.3735201-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929091811.3735201-1-petko.manolov@konsulko.com>
References: <20260929091811.3735201-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_021824_471087_27572DBF 
X-CRM114-Status: GOOD (  10.73  )
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3


