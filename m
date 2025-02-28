Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D650BC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+z/hwD0xv70WB1DfpskxcfEOph0OOPc6FfcNrtz55wA=; b=g9kXeKz2csyd3i0PDXFu9LcWNT
	WwJdKz/BL2LQS+ssAESOrVvoMg28Z8PyXcrYy+EMjdxljGlcvSv34sNNmhQ2/f05Ex2WOXCPo2egG
	JxW+O1JvH/CNqVRVAmv159GKdH58vZr4/FE7nQGq9mvc9lIme4qDZV6XnNHBHBiLKyiqOojfQn0dk
	piy1hdVGzELD9PPsDiTKdAEkkNkzJ36NvhguCKYiux7Vi1eTDOEmjI/ylNR3iZa6gBU0OfsNrxGXt
	Glmn9Bwj10VaMNeZHiDgX7PZK3ZQg7MpaMLa6q6fMu6+CWgXb9mdNK7uUO40H8Uxsus66girNZzDQ
	9ymjPaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1ii-0000000BL33-0cvW;
	Fri, 28 Feb 2025 14:52:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1R3-0000000BHWz-2G2M;
	Fri, 28 Feb 2025 14:33:55 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so592225a91.0;
        Fri, 28 Feb 2025 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740753232; x=1741358032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+z/hwD0xv70WB1DfpskxcfEOph0OOPc6FfcNrtz55wA=;
        b=ZuutSxUJSdNAzdhdPbOhO6mQIiZkVWy3VKR2R0aqAsIpwt2ZiRkrJJRh4+ZT2G22fl
         f5hZC0ov2MzthmG1QbIb8LAf0FBH+WmTMlOHI1KNymF+W/T5ucP/21NdHv5moCh2yMPp
         uOUDm/nK1etIbYAuOR03AjEVsqu+4KQNnK8MuTKmYgufE+GthYEyHdnR2n0+OFtMUK8t
         DiqT5Nii06fTkR/4cdsNgGPdFqQOEl5cEVgsJ67pENIkPLjuGXpK2qvIae2qTUXG+pnm
         I6lodQ0quyjVLV0CBF/EmfZ3U/oDsK9GSV9kO+BVI4uXYeHv/vEk5s7D1Ri8uUEN8Kuo
         PesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740753232; x=1741358032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+z/hwD0xv70WB1DfpskxcfEOph0OOPc6FfcNrtz55wA=;
        b=nqKkoePqlt1jrXjXrUUaI+b3RRYc9gyz0jfgR8Q2qE0rkdoWUxbHhovolRxVqv5QKh
         MJp/f4NyCys1+yfy/3F0+t6xmNB7mXTWMBKvdZFjLAizKfLXt2769hgXKdA5iWq+Od8B
         Xsw0M+DfDEqKgAF4pPqULYHet7BOFCCdn4RDgazB7I6GomqrFRaR1Hpw0VP9cS69I35U
         VOlA/qrH3N6KzM+n2jpmVtW6JXjymvvY1PG+PM1vvgbaH/IXanxEhuFWs3NJgiZ9m1IH
         3sDVBOznKWEpTOTNTN/VjP7NaSQLa4L9K2E1L2RENl/SfV1urXGjpmh5l/ozveYExgdl
         qn3A==
X-Forwarded-Encrypted: i=1; AJvYcCUsYoPHfZD6QLwRmSozmBAnyakssdzmAGZUyd0JLFXdvVd0eGtP+Zpu47Wkv+jDAoeB9V2cNAE9I09g0fZR6Fee@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kt5rKLfLC3qhjlHgL956vZ9vgJ/t1TXZ3iHQ2NM2EiCjhSw6
	5l92tI+9/gLNOcgCbJipEKCQO2irernyE9ilShXf2+y7rVUyKc0jK45Ro/Ak
X-Gm-Gg: ASbGncs5IwgEawZWlQLvcvhcJ7c+0DFtaLEiHDcl84YIF3dqTyA8j0tMdE+9V7aHPCb
	V+vqvcBBiqBWDr7cuHivQnw1sEWjEChnDR2eV+gc9hxyXpvG6KUpIzwdyr9tApbSp68npQKydL4
	eHtQDakOJkPuUGGbqE/VW7dqH9IPoLYNOYXRbhBalcbw/c037t0wA9WY5KzfwSm3ohIn4YjmRgg
	YSg0QH5EhnkbO+dYxVmwUcQcG+YP37CCgmLPUa7zi1BMsLlzhXxWgSduStMzqZZRDdGn3EB6ERo
	4HdK8nYOIRDWB6QbLDQvlAyyYkNbNhY=
X-Google-Smtp-Source: AGHT+IFFK8iGt2zkzJRfvygeL6oG1AvM9o6uoiJiWNbIcylOAd9HzZ8vKfhy7zWgRggSdl3wMWsPWg==
X-Received: by 2002:a17:90b:1b48:b0:2fe:7f51:d2ec with SMTP id 98e67ed59e1d1-2febaa8d1e9mr2349075a91.0.1740753230444;
        Fri, 28 Feb 2025 06:33:50 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6752095sm3807148a91.1.2025.02.28.06.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:33:49 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: slow down emmc freq for rock 5 itx
Date: Fri, 28 Feb 2025 22:33:08 +0800
Message-ID: <20250228143341.70244-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_063353_593985_886AEA35 
X-CRM114-Status: GOOD (  10.52  )
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

The current max-frequency 200000000 of emmc is not stable. When doing
heavy write there will be I/O Error. After setting max-frequency to
150000000 the emmc is stable under write.

Also remove property mmc-hs200-1_8v because we are already running at
HS400 mode.

Tested with fio command:
fio -filename=./test_randread -direct=1 -iodepth 1 -thread \
-rw=randwrite -ioengine=psync -bs=16k -size=1G -numjobs=10 \
-runtime=600 -group_reporting -name=mytest

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 253b23ea9fba..bcefe5356936 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -724,10 +724,9 @@ &saradc {
 
 &sdhci {
 	bus-width = <8>;
-	max-frequency = <200000000>;
+	max-frequency = <150000000>;
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
-	mmc-hs200-1_8v;
 	no-sdio;
 	no-sd;
 	non-removable;
-- 
2.43.0


