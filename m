Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2EEEE6B43
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3hTTn8/BfH12xfKx3d1mYZAsZyDm33o8jMO2oagM94=; b=M26XGQA8STTTxb19IemlmHF06w
	vh1n8WGjhS76RM/b9VDhcDFAXcudwqr/oqVPt3mO85SyS2dQFCpzqHtk5w2Kb5GwrfN2YH4rKsN96
	s49KAl6lUN4Sj8+7wqQ3/90wEAm8lEhWfrHB2kU8GaryTuLH7mVgKb1JvwhzoF+gdS2P7+0i7Vp4n
	yKV3Zl0KmQ3kMrzJOCqdkSDHmQjOm8iBbvWFSar8BPXwepyVYgga8sE5xSEIgVUKIJg6z8bBA8eUJ
	cK4UTeyzUyJGSVlG9NNm/quFEwSY5A7ni0JhJ+EtAy6G4NL7DDVIPYQP1W5zyr8KQFvu3qcuB5q3v
	UU0Xw1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQL3-0000000BfGp-3NhY;
	Fri, 06 Feb 2026 18:13:53 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKw-0000000Bf5D-2JLt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:51 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b834e17c3fso947756eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401625; x=1771006425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3hTTn8/BfH12xfKx3d1mYZAsZyDm33o8jMO2oagM94=;
        b=ifThmxw5ctDIimZfGSdLOLrnbHyRZyRNb0EYubw+oroAsXveFgO56Jcz8V6cXpEBx/
         llFCZnBV4aP4xI6dckt4X8xBGmayqcZ2as+Tbwd9PsbZybx4rWEsCVh52YeVj4rDJeNn
         1+Jp65rmHBGkObyL0vdGAXM+TB+grxkrelm48sFm0sXTkN4eWCy8nhV7vTvw01y9Ns6O
         fMDdfINvIErEeXeIHxMKL7t01EZCgwsamoiyNPVN1I7vz5IcheBo8P16CoJMMkqqXojQ
         NM38kP53UO65ijhEH1a4xI6Gtx7RcdYPVPez3JaldSLFapVq5YPGD1YsiWUPR2GMWJRl
         ykPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401625; x=1771006425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3hTTn8/BfH12xfKx3d1mYZAsZyDm33o8jMO2oagM94=;
        b=L/vplHkyG9FLSWQsaeHYiqFeVLD3Kc3cvr8JqrKj6Ag5JBEEmecC8qbZvSRzuVotGf
         twBjhjbvdl0LWQWjqIOLT+vdN9q8SMuI1Cpib4c8jWRJne6zFfswt5BjWzoYF/G6a0jO
         MqpvEMoo45FH42ceWRgi+PcUAZ3dt7b/FxsfD9/co+hq5kpiVxT+pH8YVhaZItxJw+qj
         tjF3c5wQ8pIzZQJYZwEGLYX1+GAaUYWhCHz9FCmeIT9G2bJ0PCS1rvuiwCf/o84PrjIy
         bytingUZZgBJ5WHo4C7p9H+0h7qIFCZ/RJwJe060V3KnZEcUQdrXPiVxVGhJzniAn5Lg
         xcTA==
X-Forwarded-Encrypted: i=1; AJvYcCUZA50jFVSIT1C9myR/s8X56anj8shgbvyZZ+ghADm9TRJu3ixWxgltWw7eASbMe9bACM2FZPuQ0kVo0yLonrDi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4hyB6mXf68qqEKriAaDm02M81yt/G4qSgB8ThevFiAuVDzZ/6
	k0hHE53mXlzICQg35AUQWCducjRIqqV+V5HxCeQnvoby+rjOZd+W6gSZ
X-Gm-Gg: AZuq6aLvumhC7XfLjvBxVkTclKy2/tnyvORwT/2JnNGaG5Q8ARk/Gx5C+niZuqdVRuj
	he6CE/s6Ivlb/SRjK6CTHbJat9ifXuMG5uZyYkreQtKnXWpS3ColPb1fl7DI7CnIFRa0Gy7ygjA
	OQtpDqS6rIj9KcpphaPyxgIELShHD3dtNFY48cLCFUmGA3jBmNBMPE4kWgdTDSEwEgMjfefyyY+
	W7XB1ZYGwlHZ0B9XMqKeECyVhqOMALWA4iOyvrHQrU3spLJJ2+Y6JG4X5y475O/Zh9Oj8r9PzmF
	jfaiUvgPg4GDnGfoDTJjg6st5iRPlCifAFeNLPb+e7aVJ+m5sqqmhZ37dOGbVxx1ljk0wd8a+nc
	U2VNHuzV8AcK8ErYcso4SDbePDg5AUfiCBnuUbMYR9KZsmXFZXUUR1ca/vRChWdS5jjuhEw7bGX
	Iio65eSfWwZOHZs4nGojVC5G6m
X-Received: by 2002:a05:693c:3016:b0:2b7:3678:2d2f with SMTP id 5a478bee46e88-2b85683deabmr1506556eec.29.1770401625405;
        Fri, 06 Feb 2026 10:13:45 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 08/11] dt-bindings: soc: rockchip: Add RV1103B IOC and GRF entries
Date: Fri,  6 Feb 2026 15:13:06 -0300
Message-Id: <20260206181309.2696095-9-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101346_620316_6AC080BA 
X-CRM114-Status: GOOD (  10.38  )
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

From: Fabio Estevam <festevam@nabladev.com>

The "General Register Files" provide additional setting bits
outside the regular IP block register space and it is accessed via syscon.

Document the RV1103B IOC and GRF compatible strings.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 0b8e3294c83e..9ad7a60c659d 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -63,6 +63,7 @@ properties:
               - rockchip,rk3588-vo0-grf
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
+              - rockchip,rv1103b-ioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -98,6 +99,7 @@ properties:
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
+              - rockchip,rv1103b-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
-- 
2.34.1


