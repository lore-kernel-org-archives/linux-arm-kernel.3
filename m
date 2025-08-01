Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D0EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtLunnP4TedJqPo1vsBP+WsJ5NT7Bmy4r8DnYlq+CEY=; b=IPRnNi+S+aJ6Rbuzydo/Q2Pa2Z
	kHsbxeYteRE3z/7EoF9hWe4Un+5SD4nkep/s92eFX/Tv9I5nJx/JieSY1uwtOnvE1+/n98VaDajRE
	2vNbqT4p7CPzE0BJs1cheNULn3zFrlm21JbRBDoFvx1d3JV4c6+fRCj8mvJ7+17BYCSwVZepNfUdL
	d5MOPUACvR1MhL6uZL5ZUJ764QKwW2Kuyus7YFOoFj6lo7T0Y2FIrTClfVBgVJ0Fg7ujwGxThZkM+
	eXVVw5tZitXHRK2QliHO76ee7Uh03PepmHGPkxGMz9lnU1t25aXHCiJEYUI/401TG6Tm8x66+hMcX
	/7DuF2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlze-00000005MCh-3VDb;
	Fri, 01 Aug 2025 09:24:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhluW-00000005LVD-0uAv;
	Fri, 01 Aug 2025 09:18:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso9904425e9.1;
        Fri, 01 Aug 2025 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754039923; x=1754644723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtLunnP4TedJqPo1vsBP+WsJ5NT7Bmy4r8DnYlq+CEY=;
        b=gktohtqSizPKxTcY780wef8rVI1oWk4DpsNVtD399dATeToYHrt9lPagp8xi16V621
         nUfrg+bDg3xxstZZOnFpIGHqRpuAK45qm/EiAe7lqBEh7ZWC4UqESxPrvohQs55p4KzT
         erWFRp+H1lQgKODggRX/Lf3slnJkHotKUE+Ga6EE+0WNewMh+jUXXQzp7X2VmwIb+LU0
         W1tldRoEWZ86X05BWaciZCy3WgD+c9MtysdDYL71tnOOpjDqeoiFB5kJVOY2PVBgXYm0
         KnhHqf0TPrpm0eUrUGXmJj/JnUdl3dHkT+TMR1eODbMDeLMdnwhzjb45949BqHAF51oO
         XiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754039923; x=1754644723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtLunnP4TedJqPo1vsBP+WsJ5NT7Bmy4r8DnYlq+CEY=;
        b=OMFi1+1ej7VjndDo8Ev64nNTfakKCQEVVswl7CNaM/3B9sgUg5Z8sodcTwhoAmr+Mo
         kQCJzx3ypaoJstLcNv9nuHvhqKaitMGJH+zvEnMjRmAfgGJHVZAhbDWEhDx7QOSzuyPp
         EHuHawNPEFFx+XOvwsa1ya5HMHcvD6stcPKUBaGUcywXhUOC4I4l/BtybGX5QnOGjozJ
         xoglGJ5dIhTTeP8h/mZOiIJB7CUkdqu5Ap9ZsSwKw7RxXpPRrFI7XZAZKX1Hk1g8gEj0
         Ekoqhc9lfzx51YDbfpkPJJCqjvpmcoLr61YDIJXhCLuJ/siDEC92Ss+z05PmEXjxay02
         olQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjpx3gt/jdtwuMcbyAf3cIZwR9oYePS2tDYrZ49+wePXmbJqdgZIMR4/gxBRWfPSNz106aF72mCvjUeP4SMRO3@lists.infradead.org, AJvYcCW0uDz05nsMX+z+fl/1Pvdefmzyg6DQZGfySqxy1YEG2PlpwLFzfRt9ELcdN/q6JC5N5WtOzvnPzh61jL0OqA4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTztEcI4tTsSphtnJePFhC6A0zfFIYgX7vl1o2QgNrvqTl21/3
	at6tr/G46liZJyHvHGk2OOLhOYpu2qkWtO6q87UIi9NOpuDLJ1jFpHA9
X-Gm-Gg: ASbGncvB/18Wg0+NyxCeCbSUqNYu9rpBzpsofGenzGXlQZDgaEE12JZLK+OJQJzWnQ7
	nn2QIUo2FaWNapwP5ITE+quTL7KYa7+Zd+j0HFTm47DF9svGE8XsuEG3XJxjUrWYHM0V21UK/d/
	E68iE8fL+iAjAh/UnX2azMIEoo7pgcBLK/GkvCOauKUmcKR1y0Rw+k5VmhhB2n8LRGR+t2bPHED
	oi3DokeBS7jMiuOBllksUGklpg8a+LuCpUmjkHw7unwbXIBcGdlW/4nxu32oB7x/urCUXBP2cVP
	VvNamwOQmnXDwYfqKexc521txzLSa/a9fZGv1Xzk3tM+bb3tXtst+4ksLMrH90rp9fUMY1lyLiy
	RfKTK68tnvfXASvdr2xP95kwhBrz391PwrckV0i7rqKXY2CDmW08i/oDhUhEdt97+riLfgi+KtA
	R1qJ5eEP8P1kd4
X-Google-Smtp-Source: AGHT+IFi/skLLCRiAqQgbi5epGmUch5tPREIEOTjh2ICmnSbjfdG3rTwP7VXpgf+GU2FtdKGaxac6w==
X-Received: by 2002:a05:600c:3e1b:b0:455:e858:cd04 with SMTP id 5b1f17b1804b1-45892bd217bmr88566565e9.25.1754039922271;
        Fri, 01 Aug 2025 02:18:42 -0700 (PDT)
Received: from Ansuel-XPS24 (host-80-181-255-224.pool80181.interbusiness.it. [80.181.255.224])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458953787a8sm95789065e9.14.2025.08.01.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:18:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	parkeryang <Parker.Yang@mediatek.com>,
	YR Yang <yr.yang@mediatek.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Fei Shao <fshao@chromium.org>,
	Julien Massot <julien.massot@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC RESEND PATCH 1/2] ASoC: mediatek: move some header to global include
Date: Fri,  1 Aug 2025 11:18:08 +0200
Message-ID: <20250801091812.4866-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250801091812.4866-1-ansuelsmth@gmail.com>
References: <20250801091812.4866-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_021844_259491_4048947F 
X-CRM114-Status: GOOD (  13.22  )
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

In preparation for support of Airoha SoC sound system based on Mediatek
AFE, move some header to global include to prevent having to use complex
redirection for inclusion.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../common => include/sound/mediatek}/mtk-afe-fe-dai.h        | 0
 .../sound/mediatek}/mtk-afe-platform-driver.h                 | 0
 sound/soc/mediatek/common/mtk-afe-fe-dai.c                    | 4 ++--
 sound/soc/mediatek/common/mtk-afe-platform-driver.c           | 2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c            | 2 +-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c    | 2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8186/mt8186-misc-control.c               | 4 ++--
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c              | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c                     | 2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c                     | 2 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c       | 2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c                    | 4 ++--
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                     | 2 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c                    | 4 ++--
 22 files changed, 32 insertions(+), 32 deletions(-)
 rename {sound/soc/mediatek/common => include/sound/mediatek}/mtk-afe-fe-dai.h (100%)
 rename {sound/soc/mediatek/common => include/sound/mediatek}/mtk-afe-platform-driver.h (100%)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/include/sound/mediatek/mtk-afe-fe-dai.h
similarity index 100%
rename from sound/soc/mediatek/common/mtk-afe-fe-dai.h
rename to include/sound/mediatek/mtk-afe-fe-dai.h
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/include/sound/mediatek/mtk-afe-platform-driver.h
similarity index 100%
rename from sound/soc/mediatek/common/mtk-afe-platform-driver.h
rename to include/sound/mediatek/mtk-afe-platform-driver.h
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..de58ee0afe27 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -11,9 +11,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
-#include "mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include <sound/pcm_params.h>
-#include "mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 #include "mtk-base-afe.h"
 
 #define AFE_BASE_END_OFFSET 8
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..fc1681281ad5 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -10,7 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <sound/soc.h>
 
-#include "mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "mtk-base-afe.h"
 
 int mtk_afe_combine_sub_dai(struct mtk_base_afe *afe)
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index fcae38135d93..ce50eda77bd9 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -16,8 +16,8 @@
 
 #include "mt2701-afe-common.h"
 #include "mt2701-afe-clock-ctrl.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 static const struct snd_pcm_hardware mt2701_afe_hardware = {
 	.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dd8583df7d0a 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -16,8 +16,8 @@
 #include "mt6797-afe-clk.h"
 #include "mt6797-interconnection.h"
 #include "mt6797-reg.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 enum {
 	MTK_AFE_RATE_8K = 0,
diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index 7a6ad9116e55..640c3a7bff2d 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -16,8 +16,8 @@
 
 #include "mt7986-afe-common.h"
 #include "mt7986-reg.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 enum {
 	MTK_AFE_RATE_8K = 0,
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 04ed0cfec174..6c58daa0a963 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -18,8 +18,8 @@
 #include <sound/soc.h>
 #include "mt8173-afe-common.h"
 #include "../common/mtk-base-afe.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 /*****************************************************************************
  *                  R E G I S T E R       D E F I N I T I O N
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index e8884354995c..9e1fa40bcb56 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -17,8 +17,8 @@
 #include "mt8183-afe-clk.h"
 #include "mt8183-interconnection.h"
 #include "mt8183-reg.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 enum {
 	MTK_AFE_RATE_8K = 0,
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 3388e076ccc9..faba30a58e9e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -16,7 +16,7 @@
 
 #include "../../codecs/da7219.h"
 #include "../../codecs/rt1015.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "mt8183-afe-common.h"
 
 #define DA7219_CODEC_DAI "da7219-hifi"
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 497a9043be7b..5d6bcaaebd8f 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -15,7 +15,7 @@
 
 #include "../../codecs/rt1015.h"
 #include "../../codecs/ts3a227e.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "mt8183-afe-common.h"
 
 #define RT1015_CODEC_DAI "rt1015-aif"
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index db7c93401bee..2ffb64d88c56 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -14,8 +14,8 @@
 #include <linux/reset.h>
 #include <sound/soc.h>
 
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-clk.h"
diff --git a/sound/soc/mediatek/mt8186/mt8186-misc-control.c b/sound/soc/mediatek/mt8186/mt8186-misc-control.c
index 2317de8c44c0..96ee69fdc8a6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-misc-control.c
+++ b/sound/soc/mediatek/mt8186/mt8186-misc-control.c
@@ -11,8 +11,8 @@
 #include <linux/regmap.h>
 #include <sound/soc.h>
 
-#include "../common/mtk-afe-fe-dai.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-fe-dai.h>
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "mt8186-afe-common.h"
 
 static const char * const mt8186_sgen_mode_str[] = {
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
index fa08eb0654d8..4155db56c59a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
@@ -9,7 +9,7 @@
 #include <sound/soc.h>
 
 #include "../../codecs/mt6358.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "mt8186-afe-common.h"
 #include "mt8186-mt6366-common.h"
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 43546012cf61..9c47949864fc 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -22,7 +22,7 @@
 #include "../../codecs/da7219.h"
 #include "../../codecs/mt6358.h"
 #include "../../codecs/rt5682.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "../common/mtk-dsp-sof-common.h"
 #include "../common/mtk-soc-card.h"
 #include "../common/mtk-soundcard-driver.h"
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index ac4fdf8ba78f..30bb0cd34953 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -24,8 +24,8 @@
 #include "mt8188-afe-common.h"
 #include "mt8188-afe-clk.h"
 #include "mt8188-reg.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 #define MT8188_MEMIF_BUFFER_BYTES_ALIGN  (0x40)
 #define MT8188_MEMIF_DL7_MAX_PERIOD_SIZE (0x3fff)
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index a2a76b6df631..0801c26ef36d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -19,7 +19,7 @@
 #include "../../codecs/mt6359.h"
 #include "../../codecs/mt6359-accdet.h"
 #include "../../codecs/rt5682.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "../common/mtk-soundcard-driver.h"
 #include "../common/mtk-dsp-sof-common.h"
 #include "../common/mtk-soc-card.h"
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index fd6af74d7995..1498714ff6c0 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -16,8 +16,8 @@
 #include <linux/reset.h>
 #include <sound/soc.h>
 
-#include "../common/mtk-afe-fe-dai.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-fe-dai.h>
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 
 #include "mt8192-afe-common.h"
 #include "mt8192-afe-clk.h"
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index bf483a8fb34a..910ff56cc607 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -19,7 +19,7 @@
 #include "../../codecs/mt6359.h"
 #include "../../codecs/rt1015.h"
 #include "../../codecs/rt5682.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "../common/mtk-soc-card.h"
 #include "../common/mtk-soundcard-driver.h"
 #include "mt8192-afe-common.h"
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 5d025ad72263..a18fdfd9049c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -20,8 +20,8 @@
 #include "mt8195-afe-common.h"
 #include "mt8195-afe-clk.h"
 #include "mt8195-reg.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 #define MT8195_MEMIF_BUFFER_BYTES_ALIGN  (0x40)
 #define MT8195_MEMIF_DL7_MAX_PERIOD_SIZE (0x3fff)
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index e57391c213e7..9594689d935a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -19,7 +19,7 @@
 #include "../../codecs/mt6359.h"
 #include "../../codecs/rt1011.h"
 #include "../../codecs/rt5682.h"
-#include "../common/mtk-afe-platform-driver.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
 #include "../common/mtk-dsp-sof-common.h"
 #include "../common/mtk-soc-card.h"
 #include "../common/mtk-soundcard-driver.h"
diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..ddedf55e0d8c 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -19,8 +19,8 @@
 #include "mt8365-afe-clk.h"
 #include "mt8365-reg.h"
 #include "../common/mtk-base-afe.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "../common/mtk-afe-fe-dai.h"
+#include <sound/mediatek/mtk-afe-platform-driver.h>
+#include <sound/mediatek/mtk-afe-fe-dai.h>
 
 #define AFE_BASE_END_OFFSET 8
 
-- 
2.50.0


