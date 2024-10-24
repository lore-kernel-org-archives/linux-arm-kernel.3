Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A289D0BB63
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=; b=irQl4h255OnLo1GnNqtlgW3gkD
	D8oK2TgfEdntGhIj0x+QwN4PQ4Oka+Tm2cqh7eAn5ueVf2wzPtqnhjREJzw8ZlneOXWJ+xlNN8g1P
	ah2Jg2MqZqJRRYZD2FoLpQfLJkCiL/HTr/KtJsx4HcNw8H3VU6ANi9a8QjeADi2AUJJCdqFrHueXr
	xt/96F882AVyraurTvdN0nfezF0aRUGggy3R8Nic3qzylmT7LxBR3rwOxgSIGamqALIiU0WgA5KTD
	+EyV1XSawVhelvKBT2kZBMR1baPyLyCRItefKETEuykA3kBlrAGi94lVHGf9yivaCAsyBR+K3hj/i
	6TZfH9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rCi-0000000GtlV-3QVB;
	Thu, 24 Oct 2024 06:20:16 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r6l-0000000GsY2-2UMS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:14:09 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e0082c1dd0so11563987b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750446; x=1730355246; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
        b=xLakp9LDgPw6u/JgaXLpCgqQgG97e1imMYD3tlOJh3yzwVzXsDBUFJazeDdsnYaa18
         I3TEhbYtt8mibexjODfu5FZYPGwjG/a/g/y46yKd6XuDJQ0SCblBTrH+paKoTVMrbkcd
         optt0D0JEVQbHUNo5LneZE+7ABdZ/BwbCnd7ZlQR+RaiFuvyTo8FycOdmV29InVyGEQB
         5/Da8JnZFPm1OJunqZqHesEt9cP6uRodTFVFNOlR2RLY1OsZhD2D99tO2hXIYQR9lWOo
         9FdCDuzp4xzqABDPeoOfO075gM76IicVhnBAJnSRQsSJAwSioytaw1GSoUffJJXFvLDP
         swGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750446; x=1730355246;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
        b=UWhlRXj7ZIHGuIoP7h1ABI50RusAvcFSon4z5pSrcdQgkqV0oU4y5g08pdiqBveR3Z
         xaQ9vd4+tKzSSh7953dByuvxtuvXRAmiGAfGhOiX/Y+MGH6+ywW9uBNFDHfEF03Hxthh
         MXQ89kjWobX1+btEyUUWqHv0+bkRHWGUTRF3ghcP4T7+m/TC3fob0knGtcalIilwtY61
         c0j4mw6+8i4gozd0JlLXC8PG8uaFVoyhcsGwZf/5PxRTPvSPhpTGMen92s3mGNIlaW0l
         /tuOAaI4esTHHbTS5+0Zr7wUVOpzexbW7pDCo+6yFtrLepAVmdNsy+RhOMjTTq384rVc
         4oRA==
X-Forwarded-Encrypted: i=1; AJvYcCX9pGIa2oaXQtGKrYBGH4UJgm0hcHHQ07QC3YgirspXFurTjtxAb9v4ap9GkoNTNT2cgzV+EyJVIBpOT//z1Z/k@lists.infradead.org
X-Gm-Message-State: AOJu0YzMfByjODnap7CyM6ShcF2zllsQM2xlq7thKNtGn4zRCifzGL2/
	XT1dZT00s/D6nlVZhntOR5pmp4nanz0zl0o8PVTVzAXqDfGE0rY3e61xzYjJ2XcajTyNQqucIzH
	DFFGduDKTO+1gBw==
X-Google-Smtp-Source: AGHT+IEJXaAAeZpuDAkTsefFXLL2kex4B2AlfwjdclQcvPn636A6m5nX8BurNhgR4ykV7U+QaaWd5sb2nHuey3k=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:3749:b0:6e2:4b3:ee22 with SMTP
 id 00721157ae682-6e866359b6fmr171667b3.6.1729750445961; Wed, 23 Oct 2024
 23:14:05 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:44 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-4-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a bit
 more useful
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231407_643335_EFE2E916 
X-CRM114-Status: GOOD (  13.69  )
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

It would make it easier to debugs issues similar to the ones
reported[1][2] recently where some devices didn't have the fwnode set.

[1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
[2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a4c853411a6b..3b13fed1c3e3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device *con,
 		}
 
 		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
-			dev_err(con, "Failed to create device link (0x%x) with %s\n",
-				flags, dev_name(sup_dev));
+			dev_err(con, "Failed to create device link (0x%x) with supplier %s for %pfwf\n",
+				flags, dev_name(sup_dev), link->consumer);
 			ret = -EINVAL;
 		}
 
-- 
2.47.0.105.g07ac214952-goog


