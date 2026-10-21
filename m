Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D0606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M/GcD26P;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=rZdRt0Rg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=; b=M/GcD26P/oTCoupT6rHfDWfdgF
	eqjSlHWim3kN38jXSyRUWW0ZtcT/tIMMQ03lGQi8Dwkf6GsKb3QCLK25HZgTRyP3yg+dDbWNc3zFt
	4w+UlMQuDgP4YEUPDcjvkL21AJPd6wNYMyC+LQVMhXAvy5fapdqtdrhjH9U7pnGTy3zDKx40gFOXr
	zrttCr5kJFyGoxLavoh0UZeJ55/Cd0KXa4E+3hiuoVB1gGAWJqPe/9xEKNENeXV3uywqXMy/iso5P
	GqY5KZRiP0Db81Xm9tqNPIYtZiXSqDu7mldKZ420vDyHPtLxKmNUI9iEGKn29gRERjfBvGWQhUE/l
	QednJjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSWE-0000000BTqU-1laV;
	Wed, 21 Oct 2026 09:21:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSW7-0000000BTnm-3j5l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:21:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5459665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574510; x=1793179310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=rZdRt0RgoYZUUhdvnbX+VMzfZjB6tSDH023fxedQfuvGb0kh5eJNZifQtLTvzNKUG2
         c7KA93RHjNiXwiyb4FOEvyUPbZkDA9ivq1Gvgms3vzbP5d0KLZdF/Un758UWNVCDdC8Q
         TK3PkvtEcs9kdeE99RhTiSLBVLDmA5Y+LVYYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574510; x=1793179310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=M/pgTGgA/8S4nlsubAb/Zm5uBqRzuCRyG6XhkmEQIAV1ksD1Mq6boaC23HktuI6qr6
         wVRsXZzLiR+J+6xV+gPDADTCdjEldWI43jAREBBG1lo9zEYDaz4IMHAOhAxDJ2bI2/6o
         c7MpIukxmW9LgoZGbnWKwe76qV8eDwSOOETNXvF2eG3L97XzhsB6fmN2BKy7Pv0kZ/2T
         RaZqY4asaJ/4DJ9E3VLwfoLZcj84Au9dbCrTUjq1Y83uIFeWRvYnUmeNkoRX+GQKGyY2
         JQOYKdtyUuMfP0P/EBVceOh6HMQPYGLMpGdDadvcm/JxjhDDW9/LybYI3eaAZ2gqSdl3
         Hg0g==
X-Forwarded-Encrypted: i=1; AKwUvBwV1Zo+CikgVeoy0DCQXkYehlmWM/Fj7WAXAv4/qqqi2TD6F/tTh7ZDm9foBjeIY/3E3r5x1ZT9aZrjmRmlH94i@lists.infradead.org
X-Gm-Message-State: AFq9FYIccqpnah5+jRakg0IRlJk7BYACrDSbAxz8KyV+t7HDF4itivhr
	tR6mOo9OYBgB1cKF0qIon4NoMgg4xWpK6chS0CBsMyvuWOLsAtioEqRXpHjHlkbS3jU=
X-Gm-Gg: AYBFou1xbu9QIVI/4Rlyu5mbBmxrf0CoVvaHvVhKfUpwIuknArmGyNK/HI2PXnXXx+l
	+EmBy1LG7fzB//N7KENQ3bxL/kpS/gevPJp6IdYnx5wlUzqpk6YLwj2ZQJWIPyNeNzyO1bToH2j
	c4LR5I0NdQ9fU0QtnSoZbrhnJyIpfxbBMO7+QUDkIbvCScNQIFhgd6VxeXiEOJ5nIBJY8cHErfQ
	1gyFF8V8iz0ELsnk+vtNXmA+9Xejl5Ad6oE0cIgsCLVdlKiB8mYQuYdvMunmLzVmTTdyzZkeKhZ
	78SVzqrWUfC6lwE3gcxKUvwIP5sdfQbWuUSovVgu1fu63YtoIOwLKYQwfu3+CY9Fbm198/oeOt+
	CGCEdLXenHNrJDO176l5Khm16pjMnllT2TOQv5ryl1k/Cx7/ONmy3LxbGC4rbeGDPSZsSNqVLjH
	LNZk3A6CbiFErSV7CqyEezOXOtuEWhXl0rB7Y7wFIpUP9B2U4pK5MPBvGirv174fMl1yhzq3BWQ
	7XoCcBKauu23TN8ZVEzb8lT86ERfkcuMcxNwqDkIrXpVvg52ksmQeyV84xR9GyCwyVtRttrPnoV
	uyuNpTFjXdDE0mxaig==
X-Received: by 2002:a05:600c:540f:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1fd8cb92cmr29337195e9.2.1792574509972;
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 21 Oct 2026 12:21:37 +0300
Message-ID: <20261021092140.4142493-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021092140.4142493-1-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_022151_940897_5938A185 
X-CRM114-Status: GOOD (  10.50  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


