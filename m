Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9CCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iFvxqbbRTWoZ+TGL4KkSwITrWYOc2TJu0vqqiXJT5zA=; b=Ykqm5xDHqQIlSzV4yWk2rRpV0n
	6GoGvTqy+3UbNWTTjNcekRP98atKw5dzm39u4nvhi1MNueL8I3BRKpZZxYz31oNfAGabNQjuCp0DT
	kQ+Q73Ceaussit1gAkAlKVof6+F4bYP36SczQWAAZk5T4aQtv5+IcmJ0BxkDvs/whf/9FTRHO938V
	VTlZO39NDlll+hFz6FTHqhhZdH8iN9wCKkrPsd77Vj1qVEMheQpiDqTwrhq7/g4QssBj/X6VVvx/A
	fD3SCUJvaoWgokD4rLZ3pR59Mk9NxqD2C3zHzxwkTY3GP30dB3zr6Vcpv7ALatsAF2cuQQTsgMEAx
	kHm75qjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMo9N-00000007vG7-1GWG;
	Sun, 15 Dec 2024 12:55:09 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMo8H-00000007vA6-1ivg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 12:54:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so664635566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734267239; x=1734872039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFvxqbbRTWoZ+TGL4KkSwITrWYOc2TJu0vqqiXJT5zA=;
        b=cwH6UtRRmCEFvhjWr2xoTQbZpx84C9qOmv5KDvPmKyB8ru4U90tbPADNbIHlXHkY5f
         avFNW/CEj1GIXLplg8WEBjEvHdjRRduYkrrhNLRao49h5caGAnRCjME9uB3WtueYllAI
         sv8b+m3B+pmsLMtgE4vVYbTeztdfxitpQFrT82VJ3x2+lZ16jmr+hUyBu5rs7TxFpw6U
         lyQwZVj5MSxlS33tgWIYBWqcnkidMnGATTbE/lMR8tynI6nXQxydq1YWniazIklON7O/
         Rb36grbvklPgyqviDVxtzi+u9rDIzZ9xnp6JjBeVqj+sZtekvA8YTsupY2LUYA0hJXUq
         +QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734267239; x=1734872039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFvxqbbRTWoZ+TGL4KkSwITrWYOc2TJu0vqqiXJT5zA=;
        b=ifx3RlWOrCJmdbcEYo9Yl8ZIhNSH3OZ9YTZZSS0Y7aWu3Et/dqPzZBZe/mSxgTlt+k
         njskV5DJJUCrr8DdNVKp1A51MF/chwA/3TNwji556Cm0pFpfi71UMtFXwdb5aySa/Rur
         ATRPqdI1rtGJdlXcCRZAJ33V8vzse49URa6oMNeDdWOKPznk6X+Q4ylOqJi973iljg3g
         Manw5CJPlh+/DTi1RR9t58tM4Cv0ICga1QTfj8IOffXFZBXXwmsTMxEso4Ib1u1n25as
         K0qH/wJqsjp42UaI/1YuEaazzcYH9qgfalZHOtZZnrVHggdhv37IPeo+T2AigDK04Mb7
         xjtg==
X-Forwarded-Encrypted: i=1; AJvYcCUgSct9ZuOefqz0ySXNiW+JcwhpGhwujq5APVol+7pGzSj8660OZoUcNj6yqj5fqh3Rveh1SGebP1GFtyQ9iLUo@lists.infradead.org
X-Gm-Message-State: AOJu0YzzRIVLWxUUgZEHjNp4B265VYgPUuqIpXgCtz16hSgM7czHSoNN
	QlfffS8Rco+lahWBZgsCySCtlAYwvmDBfgHjYYhYGAFXDQzWOtXE
X-Gm-Gg: ASbGncsAGi9e+EeQibcCwamHb3HiLHtwXA39Km2PuuXs0xuvPRjYftuUkJaoXBxf1Fe
	27FgREABzNiriPR1VDtK81YsY+9MnVSwiG3TUhH7BMKNWF1pgOqqfVzLfLa9uNry3wZqoyxj+o1
	IYOl+MERF9snax0O7k4zka0F5LVQPnIUEb0MeWiv5TLQ1BqgnWZsi+YyPD9CTGdTffn0XmOFKip
	KnKxGRc+NXgcGPrqOFsIvQ0hz2PBAAtv3o/ibiOxlDUo9G+m7w8w6lEcw/OzAu+ZRw=
X-Google-Smtp-Source: AGHT+IGzsljMyjy3J7dXhJasGjwSWHymnukngwVrGT5+zoVtlmSyNURrevS5QQnQ9x8fAdVpqXhemg==
X-Received: by 2002:a17:907:3f97:b0:aab:736c:5a7 with SMTP id a640c23a62f3a-aab779b4b90mr941982466b.25.1734267238510;
        Sun, 15 Dec 2024 04:53:58 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963910f7sm204578366b.166.2024.12.15.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 04:53:58 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	michal.simek@amd.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCHv3] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Date: Sun, 15 Dec 2024 13:53:55 +0100
Message-Id: <20241215125355.938953-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_045401_448834_E3213286 
X-CRM114-Status: GOOD (  12.92  )
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

This patch fixes a potential integer overflow in the zynqmp_dp_rate_get()

The issue comes up when the expression
drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit
Now the constant is a compatible 64-bit type.

Resolves coverity issues: CID 1636340 and CID 1635811

Cc: stable@vger.kernel.org
Fixes: 28edaacb821c6 ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
Changes from previous versions:
Added Fixes tag
Added Cc for stable kernel version
Fixed formatting

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61ee88..56a261a40ea3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 	struct zynqmp_dp *dp = data;
 
 	mutex_lock(&dp->lock);
-	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
 	mutex_unlock(&dp->lock);
 	return 0;
 }
-- 
2.34.1


