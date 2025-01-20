Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5875DC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kemYtUEz1zvjOhFDJKfAsLfEWEsWSV34vtPdI9CAeRs=; b=qxrw+ETmV9Z+qi9D34D9uab4aK
	MSUj1zskOwrK8w3+5j+EUbw9Ff9sMd88dyLnc+1qE28a6y5jI7tnTSyv9nF8J7GXWw6yOqPh32YfY
	BagrC6e79mhExYKh3ZYwoprpPd+yLbw+7Z0JCDoaa5y7Oh8tFDc5ZUdlmLSwV/c8sOFHdoSi+5G8R
	KvuxH2ANpAIxgcZ981G4A5HcQGg3Sxm286CoWdr/bGY/gOVuLpmso5PDqoYO/LUbAYUnm8aiAcWey
	bj9hHSijFjOzKvQ+QnknvSMN5B2N4jIcsJOUEROzkyI+9mW+9tMYj3ErdT4MfsF4dxM959qY7Ex20
	/fBR+LKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnhu-000000055nC-1OGF;
	Mon, 20 Jan 2025 09:04:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnfP-0000000557R-1IbR;
	Mon, 20 Jan 2025 09:01:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4590698e87.0;
        Mon, 20 Jan 2025 01:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363713; x=1737968513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kemYtUEz1zvjOhFDJKfAsLfEWEsWSV34vtPdI9CAeRs=;
        b=TjHx+vQE2SR321vSt95+7U7xPeX9v7ZVWfKkxhlurWS8cQnU3RbV6+hyJ2xMihNa8m
         4ZjnxU9IJgr1T90g+WaL+soAQtHP/f/FPMokvtcp0l2z6ByV8CK0j0/wxSMTK5Qzu1Dy
         C9swClUWxbrIk6e7bNoEu6ajSKLSigzvlLM9LJGmBEvV15lzqXuRtVHHDBKzXIkVOBJR
         rGw/ZaPkGrpJfwxp2WS83QM/nRmXQMvNSSnwv12Db3YDgSRPf7QuYIrDE+WSSnbj3aQz
         Omt+wo6eRaRAvXRU8RUeGNPlNTyitupsyAUjDHxz+JaSYg2q0j+UeXUdJNh7cs96uiP1
         CpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363713; x=1737968513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kemYtUEz1zvjOhFDJKfAsLfEWEsWSV34vtPdI9CAeRs=;
        b=uwSvnrA2w6WxZo7XsVSFmqQe35LHYK5PgZGX2EtHRnvGgnQEDNip2pxMnm0XRxNiay
         ufGhhO6T6V1NNCZB1mBo12FzJIft+e4WHgLyTMt3yUERCbWE+eeLmFrg4jH4RtECeejs
         J05zZo9Up5cVdGCfPBuXKxErF9Ih0oqVJDLMSsYv2WzmxzAdK5m7xxsL+SUteFYsyS/8
         R7kb2oZDd28rmtLQMbP0NhaBXH5qcpm5rYo5GQNgNqFLYXQaZiFUPsnzQMo/ptHUvIYf
         Hg0ek6WBPNaNtSj9TwlZB5toaaAh7Dx979BQjHJNrtmrv75jpww+G1CcTgWSr9y4Z4up
         SA0g==
X-Forwarded-Encrypted: i=1; AJvYcCVBxCvgF/u7+Po9tbEE4o8koILK4VIJ8OrC5fK3jxpRcOuxT1l0OkgQlpyCTk0yvbqNdLAU4KDr0M/+mncd+Z0=@lists.infradead.org, AJvYcCVycEM57iADikSg9UffFRx2u9RjyMQGJSLf3HHPha7l2mluF7YI1BC+mnhXUjtRa1MJlOMzVvKl2Dmie4YY2/jQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzeugY1v/rU7G2wK5f3c2l4b81XtmzSPpeBTYomvjbzQDG1QMmE
	4PqdgDbA88V0oJlcMeirVULxWVApVkmtz8V38LAYATjzO2Gt9orcJJ4joQfKjZsRYg==
X-Gm-Gg: ASbGncusrw49mX6ryXdmT++npUZ/ca8xH+JUO8xmhCcjFU5rzm43eri/FXAdE9jp+ok
	AMtwyn596/wI9hmKs9y/E/lman39vJIPk0PHJZcP3OGEGEyc3TJfwURTHbnkmoA32GhX6r84JPu
	32mRQG1GSC3b0a8Kw5NB+lCkFb+VfE+GbTSPSPdBIlGD7Q6YlYew3mK4Nu7EFFTuMz8k0W2/evw
	JH967Rg/1I6q4i7js7b5x8xFQIR5tCKu7dQpHA2vQOxVv8Bi7Y/Ljxi1lRVc0S+984tdz0=
X-Google-Smtp-Source: AGHT+IEx9f6MEs2aC51GCXj2Q1K64ptJHmYy+Hdi/JLLomjH/N/gqY/c0ZG8Kw+1i2PuSCCfvwdWcg==
X-Received: by 2002:ac2:4f8c:0:b0:542:21ec:ff02 with SMTP id 2adb3069b0e04-5439c281fbbmr3440206e87.32.1737363713091;
        Mon, 20 Jan 2025 01:01:53 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:01:51 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 13:01:27 +0400
Subject: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588
 SPDIF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=938;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=n0u1NUx3/2UHHzCicOPQE9GqysOtTemnhrpVN1uAmqo=;
 b=iOT8mfJebuaPxft5/slu2bZvjmAlbN8O5ZJoNP6fn6QS6SeeJeEnugY+DXOnUfshXSK/96d7m
 kGJMVQz76eYBd7mC7FBE5UzvhfFLd2uZaV8z1itL8wAbE2e0t9pertJ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010155_359623_30E5EEDF 
X-CRM114-Status: UNSURE (   9.95  )
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

Add a compatible string for SPDIF on RK3588, which is similar to the
one on RK3568.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index c3c989ef2a2c81eba73fae3d1ee4bfd18a8e5d29..32dea7392e8d49fc6402a64fc9f7115a47a8b8ad 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -31,6 +31,10 @@ properties:
               - rockchip,rk3288-spdif
               - rockchip,rk3308-spdif
           - const: rockchip,rk3066-spdif
+      - items:
+          - enum:
+              - rockchip,rk3588-spdif
+          - const: rockchip,rk3568-spdif
 
   reg:
     maxItems: 1

-- 
2.48.1


