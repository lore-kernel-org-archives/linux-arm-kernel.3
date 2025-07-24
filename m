Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80193C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnsv3lN8DlbmZn3yUsY+QjerAU+aMz4ylZM8H3xwJJQ=; b=TBivbPx497g6iE1P0nCkUe9xJJ
	Tgp063uhFpWLhIBYrgBqnNhLLIAdt6vWHfBv6UHhW7390sbBQMDCCn9v8eLFpT3rODkvVdWBPEaPp
	/q/wNzS9yZI+idQKxWzm7UYpfbgiQlE9yWmK2Be56R6voc/FjLBeIKud7SViGpdLpBOC3h+Xmw7cQ
	vSX+4XSgkv70N+UYSj+z/NI9EQ46Jcl+zw3gNTUEeQ5ueGhqmmpSuB3GULDFlHoIwu7tJJEJrGKph
	4o3UKpacxTyVkvcLJ88qiko3V71CpnywdmAJHps7588MF0SCGrJzPXucxiGmHJWc0mCUmb5LbToeA
	8hYiSJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejh0-00000006ET7-11sM;
	Thu, 24 Jul 2025 00:20:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZd-00000006DJW-26uQ;
	Thu, 24 Jul 2025 00:12:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235e1d710d8so4585165ad.1;
        Wed, 23 Jul 2025 17:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315957; x=1753920757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnsv3lN8DlbmZn3yUsY+QjerAU+aMz4ylZM8H3xwJJQ=;
        b=C0r0yjP5ksV0zGWab1raOZOGl+U84qvv+6ioyFNAdaA/WIAgw4x0Z/h2515zehXtRO
         TdwFb3FRGy+lN05HgGMOi3o2JzjE+AY0JSkbTrD9C8jvNrT8gnLiAPY91SXH38uBcqHO
         T41I4z5DMpokyNcK3SRgQEzDSwW+LsMYAghM9A8pzXaGajzP7m1WCzRrUbv1LZZriDO0
         oBeq9IdGuaWnGFP9hrrUKrMvMRLkCic0il8qGPTE0cBtSEtwKm7YgtWex4rk8b1WbPD/
         lNI1FNOas63S7CRHoX6InmA0M8y55XdQ7o1qtFViXiuNZSYRyAfssuBAS5/Ro95/r1aj
         3Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315957; x=1753920757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnsv3lN8DlbmZn3yUsY+QjerAU+aMz4ylZM8H3xwJJQ=;
        b=wmozBwepZ4zhX9ocIDtHWbTzf1iHA/rBSfXmtjwdRtBNqTtOqS0s1dIihiawTXiB7B
         Cn5++DoH62891CjmGkl5O+00VjQ1bfX+ldsaYuRnryzCxgNoJBJWT/OQ9fTFqTD6ARnE
         CCajYtcqkSIxIVhzgdbfLmyRGLMUys1KuMnAZexD0yTChthBuF5o6nUnlSbaQ3XJVEz3
         moI4c3vgXT3zWc0A84L+FXU4fr1AOZ6CoeP8eUp5ppIeAt9dkKb+59QUryJKneQ6ICgv
         KWciLbd1O6W3IS7RimsTP5ethn423iDt86kbie7R/DwitS66m0WOvnyvisFApJkZGlqS
         MzDw==
X-Forwarded-Encrypted: i=1; AJvYcCV0s4wj6rGejLUqm5DxEve4CGIhtwVAzi8ZnhXMaHp4X+1VG+HwIuQ1L9C6g51qfA/7tzPrmqsEFAcxR4mnb39A@lists.infradead.org, AJvYcCVf/zulo0yRKWn6a6AZW2AqE5CHCjaY8Vc/5TC3/SZ6eIvaBMZswu4Gu9+GbWrDzaMVWFp2DH5TiKP0BqDRE3s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgaxAVQx3Q3/nrLi9irh5YABZHhh0r5GQfbya7pp4M692g/o4+
	ixD45iGgpq5PI0YUWLthAq/lqCNawUBgjbPtMvJDtUZIAZZv5J+qLHFR
X-Gm-Gg: ASbGnctHkni+s2Oz71ENfUbMVdTzenkhgc0fH86HwGZZGVkI2dvhUBpKRa+AZmHJcxr
	hlpWdKrI3rf29eMsLSlfG6mAnFqbA2ODx5+68w5ymqj9m2Ru5TCKE/GLmFgGtFfReUYo90kJmgK
	Cc0J3HPO6YqcO4Fhdc6iu2LxlWhIaAMhAUMhKncvQYgsVsJlu8HQ/1+w0jnxlq3Yfa72pGWoIuB
	JaEmbVzIiX69q4/L+LdVH8NT1CT7S2gwkV6/kKo+yC82lY9Zaenb8SWoXYRviChMkmf1msT3X2X
	Nsghtb3XRU2ntjQUlWdd5nVROQ3QzqfiuHoOtnJSnJ+XC9j0NTTU9Zu6jmMeYFsLbmpSX05H6F0
	o4HBA2B2paUR5zQ==
X-Google-Smtp-Source: AGHT+IGZ4DXoXxATu74tb3G6fvKGlcLQ5jkV6mUrbgM8vUEicuu7wE3mkHfegW8UEH8u8pBJbGBVag==
X-Received: by 2002:a17:902:dacd:b0:23d:ce98:6110 with SMTP id d9443c01a7336-23f9812c147mr79576845ad.10.1753315956702;
        Wed, 23 Jul 2025 17:12:36 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv6 wireless-next 2/7] wifi: rt2x00: remove mod_name from platform_driver
Date: Wed, 23 Jul 2025 17:12:27 -0700
Message-ID: <20250724001232.2275-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171237_552227_A963450B 
X-CRM114-Status: GOOD (  11.49  )
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

mod_name is a legacy debugging feature with no real modern use. An
analysis of the underlying MIPS setup code reveals it to also be unused.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 701ba54bf3e5..e73394cf6ea6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
-		.mod_name	= KBUILD_MODNAME,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.1


