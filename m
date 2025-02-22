Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7212C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPcfkurtbMpldzDsTGUmb4ViHTY8bVGf8RoBJkJSMuc=; b=Wyow62FH7O5QNDO32bYb/Mlbgr
	a0BTCLvsFuSLEfTHgIPv/0PZiLFQWkuqbIhLFqQ3JYOWCpJGDgJ74OPigSeiOfHU9G88LO4C5baGA
	dZrKYelHDIu9Vob6GvOGyXmnmb9leZaIVOA++9iE5TipLZUo7KwfF+QcSzXERFCU2sDfzxSLaRE2n
	yScWOQ3DP7sLbxnC4aBTOtJZETuHZ1+Eyfnwm2/pM4QbDcdmmWSYm2NJKIBELiZga7RJJkeH9aiJm
	phiG/hWweO3xIJPNnRMAjzeglD0o5XD8SWWd5eMrT2FH7Et8iXlIB83auDn/2l8tBfrXdp5NxISgm
	qbYkw0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tltNE-00000008SHw-2Rtp;
	Sat, 22 Feb 2025 17:33:08 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tltJ3-00000008Rk5-2n20;
	Sat, 22 Feb 2025 17:28:50 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5fc447b03f2so766045eaf.0;
        Sat, 22 Feb 2025 09:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740245328; x=1740850128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPcfkurtbMpldzDsTGUmb4ViHTY8bVGf8RoBJkJSMuc=;
        b=esUqb286PcEHxQnAjdqNIHKNJL4CVJ9/NMHr1sum/awauRedqHrkGJ/2o3MVEL3/sE
         NvOgl0SJ2aM8549hmM/Roc0+ajQomrrFYdutuwVCeXuAJJ74mzTXwJ9lSJtBIZSu0l+o
         5RSZ24DorHdWwbS3YX6Uo1gxKIb/SCw66sZefaTfh3xW8x33k/0e90+XiaRfeBkBZB6H
         GR1tg88J0u41KoX7wvNHmk2FyZRI5UvHkgu6obReZeaXfSrpCkBy/GL5mAHSJwfk700O
         caj6XkHq5wsEpOot8Uu5YmLdBws9NA3flwR2Qzp3IXQHR5AWX2bni7maCjDGHfZhZ2zT
         xTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740245328; x=1740850128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPcfkurtbMpldzDsTGUmb4ViHTY8bVGf8RoBJkJSMuc=;
        b=UgJ+gwTLaDLITy6JxdQ9fQTyPesNVNWyi/Qiz1a3YI6CsXp1lhjHf775Ze5+/DD1QB
         5oGR6WUPS5EQSMwr5bn2GXSzFAwTIMgmGhv3RPXroO9HRWW2cGTosH2CvE8rdbScnbg+
         tZfNh3rkliBfj7uT8/5T95mFKDuDmZVFQ4uVjaF/3T53CVTyxd3Mm5FWQOuNAdgt0WMX
         E4ChoR6I0iV19GxfzNCk7MlhEFm3CzBie41InriFthf8Xj7Hfm+AHP9V/gN3EdkgOLG0
         aARQyp9pGywQMgKgI61faDE4W3wQOvZnmK2tqzEFu+Ii5iXy8cIMnORxzgEqleC2sIz7
         P1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU79BtfVHOk3UP5HBf8e41NDQQtTegEXyoPcJc6e+O4W7vVaZhkylsBdfDHi9tQJigmoyTuPTmpdY2FFpa276jz@lists.infradead.org, AJvYcCWWr1kpRVfpcInfrdGuWZ6ESxrtLetaFigjZ7kEACGMU/p/DcPz4oeWvLUhXXDPYIvERIb7b3KYCnMiUqIv1iM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXJSyy8wlJ83HqmcpEH6rgnorlHU6cKrEq4aLhSNlqFFbJOopU
	zwG7lBgHjbAgqdjVqnMFSSIqQzj8YqnFX7mn8TGodbij1vm7NPyf
X-Gm-Gg: ASbGnct76CnD+c59jScaTFbr/I5QbtNH/zh/doIhV9z6TuP1BpgjK7PPoQ0EYJ62aId
	WmXgd7JLopSehdixWx/9IAO/j0ADpVZpoXPkN3TiejHy5OgN/Zp5scY+4W8Nb8DwEm/f40GHlWv
	Fcxjo0lTgjY8i6gmpjMUGqh6blCOfdby+f+J1+SG22Nv0YIS/uLB4sGb2AZLo8dTvJigdVxuL7u
	TjKcstJY/PQjiQci4WiTMU84PV4r7/mFewKrf5O47kxOdI7wornQp6zWzapYnhzhYA2xa5rbf8a
	AiKl5nj2/T16c3axPxEm1+nmhn4mDL3+Vvo=
X-Google-Smtp-Source: AGHT+IE5vkPsaaulzdFkWGm4Q5tVKjSsDlLUDZVTraSy9IbqB1tgml5CpkXqxPPTBT4De/+93snqRg==
X-Received: by 2002:a05:6871:7b02:b0:29e:6bdb:e362 with SMTP id 586e51a60fabf-2bd50d6bca5mr5576474fac.17.1740245328373;
        Sat, 22 Feb 2025 09:28:48 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:996a:132b:43a2:f7b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b963a0ac4bsm7244238fac.47.2025.02.22.09.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:28:47 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 2/5] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 11:27:49 -0600
Message-ID: <20250222172752.6254-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222172752.6254-1-honyuenkwun@gmail.com>
References: <20250222172752.6254-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_092849_718124_9AE08312 
X-CRM114-Status: UNSURE (   9.29  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.

The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
for HDMI IN.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 23293344d8eb..c9914725264a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1141,11 +1141,12 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Max/Plus
+      - description: Xunlong Orange Pi 5 Max/Plus/Ultra
         items:
           - enum:
               - xunlong,orangepi-5-max
               - xunlong,orangepi-5-plus
+              - xunlong,orangepi-5-ultra
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.48.1


