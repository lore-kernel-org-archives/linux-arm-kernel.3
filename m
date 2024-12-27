Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC88E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 03:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sbDFkDnkCYP25YhC98DgH+FS2tPhMY3Ac2FnjguokY=; b=kY2Oj14cunDRSr7Tn2VA7Pwyyk
	bT4Nt1qS8SIeI9/EzcA23TVbDZAjXafqsiw2iorGVM2GbWAMR3l7Am3eUdNQb42LmPy5xbxqROMHU
	whsMP3vP+ULDHEaQHPJ9BX1NpkBvHn6oS+Wa746SIrqnAltOOXA61Trr9VnA0YakrO+eWOJt3s0wH
	+vs1NMqxjdVjSJHK/xbG06hPzPX8+CKUkx/TXMdxpIFSkL7MAGZ+nApwX622pgFi7TyOLDb3/HJT7
	72ZMnRK4SyAKX9AtN6n8BwB1ihx5lM/UUyin+TohCfHyC6wwlEtkdiV1dHtGLYIVOAkZA53Y2O2O4
	ucgEsmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR0mX-0000000Gw0w-1nG9;
	Fri, 27 Dec 2024 03:12:57 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR0kA-0000000GvcN-32ZC;
	Fri, 27 Dec 2024 03:10:32 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30229d5b22fso80807471fa.2;
        Thu, 26 Dec 2024 19:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735269028; x=1735873828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sbDFkDnkCYP25YhC98DgH+FS2tPhMY3Ac2FnjguokY=;
        b=NPVFG8ZJuzu3rHrL0CzqjBJ2lLXarhv0sXgnJl9QeldLMeP2r7PHeEhqU+IbqCa+Bw
         LCoLKowCX4KQOxtyW4QliU1GmMZpn65VSfwN2ycdSdBlTx3wCM6vOPqU5d10nHyZZYp3
         jVkREwKrTNu1jJH7srxvxwVkuMsxRvVEKO3v/pC8OaWLKw431y6V7POA8YW42oVrScbr
         FA0Vo94PjiCV3klvTzSPqgzbaWfOGE5HksJq7FXGEzjhudL748s8vdIxblk30AV5OVzO
         dC7b/khrDarhPlBEwipkT6MieAvsiNDF5iN9WJJrnFv9xFkMOwKx6r9inzASG7dl6/xq
         FMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735269028; x=1735873828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sbDFkDnkCYP25YhC98DgH+FS2tPhMY3Ac2FnjguokY=;
        b=lnuOVqFaeh+/XEmRM88xb8SewfCNYdGma5By6PJASEQCeojjoZmrORuZsG2sURHLCo
         McD13f+SPcpqurHpKoF6Y0cW3/Wkx4W/INjB9Szye9gplZdkeoYUFkg29YSgfxZI4h4H
         dvIWoKtRwY6nCrwhm3yyYAqjOVBkvxkNfG7T5NbPpryiTQvw8OiQ4lOBF3oFhye+6bfp
         kFEgXfFKSVz1bk2VgHpOUI0E5aayWO0xY8oF2Ti6jjv9LrhKsfVQ1vZsHxUs0NVewywH
         khQFPMMusEoNeuesxThmjStX0pLwgNC491HVZE1l2RtKNTrCK6MdsyOwqOrZ9jdGMphD
         e8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPppqfEiTlOfXFVjzE8ElLyrgbA/QQ6cbRsiLJsn+SbCFTHX1w80PBgNeltcg2UWH9UWXIGCl/wEv1Vt3/Sns=@lists.infradead.org, AJvYcCW1rujgQoxkgeLdCoV99JXyGgSslcw5xJXPgvrn6U871F7FVhcIKL26ndCI1wvPE8zH/eem2nY0bCFU5suYG1nP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpm3cY34FMlIZg7oCfgabEBoeRrrHtEeMjSCqw8PoPTMGov3oK
	wJqmm1XOBPKG/a0W2kyC9zB7eGULgKY56IeTz69mhkCdEy9uGh89jKCMxBY=
X-Gm-Gg: ASbGnct+hvlv7P28VpGd96YYiYyOrr5UNSP6f9weJBxI4YSvmiiE2aeC1hbYCdgbADr
	3h4cBtThkqPeq5CmvfYK0ei779F1yQd7iOcqX0WyoVKX4DToOAE1fFPHssyKNoL3XfrhxvP9hov
	Q7j34o68oys0rPCWFf4rQ/fgm+3BgO1SVLwg2A9agMLPStuG9j5Ma/hq6degYF4yh5xQmgIW3wZ
	oJ9H+cXb5e0aumfXiMRnC86hQf2JUqeqV1FYz4eRi+OdelYd8EpA/YkeRw=
X-Google-Smtp-Source: AGHT+IFp0hUwzEvdI84M3ZlU+5PcWHgcj+st1Q6smg0tEtOHtQwhGA4VOM1BqLtbhs5hk/4Z/PHMkg==
X-Received: by 2002:a2e:a991:0:b0:300:25f6:9b3d with SMTP id 38308e7fff4ca-30468542ddamr74919191fa.10.1735269028169;
        Thu, 26 Dec 2024 19:10:28 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cccasm24326141fa.1.2024.12.26.19.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 19:10:27 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Date: Fri, 27 Dec 2024 06:10:13 +0300
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2 and
 Pi2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-bigtreetech-cb2-v3-1-91c556adcffe@gmail.com>
References: <20241227-bigtreetech-cb2-v3-0-91c556adcffe@gmail.com>
In-Reply-To: <20241227-bigtreetech-cb2-v3-0-91c556adcffe@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=eZY7s59zRGufOHwhRf2+rkN8ue/jAjm+rs+cgeE8RzU=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnbhqivExZ+Jq3gxJLjvHIzzDBbxC+394uKwHnA
 fX9ZknH0MiJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ24aogAKCRC8310ZUDOW
 /R3VD/0b1VV/C/tIp+9Owh3X32blcfa82aA/HpBd6PaUn6guINA6wHhSOIRN9BJDnyX8Q9jdp50
 9lG4urt0xEcko6phFDyWt391G2L+6YXz42rjI5zO9RLsGORO1az6iPYZ2ET8z2vfDiUO1PFGbUi
 GdMrK3h32vCirOUWOIa+eNG+z9PyHd/k5nY3JUrfnCGqILGhKCgT9bL00/eBR9VYQgTBJEzQRZj
 Ng+zWt9US8nZpbpc2DsTX5XYJJtqV0C5HR7nCLn34YOI6WVeHghUaR4Ml9lxbQ6+UyP5+tnk5IL
 96rEKdLeXNqt4BNZD7y1E4BkMfA5y3C2+cD+H/gu1DjzprAt/PE5YqDmFUegXYGTI35EIdoPs89
 AXxyGjhU2btLvyNyEfWH7RRGQ/PDghKMheXJBYrwFOD82xj9rnEbB2GSYkirxM6Nvk1WmDYxCdq
 j0gJHibBVMKrXCrkR/+zbvsgfNoAu4k9M/WzrJV8nYGcdwGaAOtSkc3G7hctC8e9uRg6QUuEuc2
 Di3/M5f6hQLXt7BMGTh4vjs4L8vH8KwW6zFyT60f8BwtP1ysXRyIaj4U9snqPqQekS2/nrvv83T
 XQOVkhd2yHaOI/GFTa7QGdQgiNvV1GXp7/vD7Q8vb7OldIC2zR73OtbdAvvp0d8nesnSMaFCAef
 JW0+5oSLhpeNirQ==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_191030_768593_5BC944F9 
X-CRM114-Status: UNSURE (   7.48  )
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 based boards

Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..349453b1676bfac45abf5cd49d6bd9f847281213 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -81,6 +81,17 @@ properties:
           - const: azw,beelink-a1
           - const: rockchip,rk3328
 
+      - description: BigTreeTech CB2 Manta M4/8P
+        items:
+          - const: bigtreetech,cb2-manta
+          - const: bigtreetech,cb2
+          - const: rockchip,rk3566
+
+      - description: BigTreeTech Pi 2
+        items:
+          - const: bigtreetech,pi2
+          - const: rockchip,rk3566
+
       - description: bq Curie 2 tablet
         items:
           - const: mundoreader,bq-curie2

-- 
2.45.2


