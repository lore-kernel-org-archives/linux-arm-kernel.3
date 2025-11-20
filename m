Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D046CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PMOlwl2RSWqdhQ+OAtCN0AHF22uOPsne+hE7m8m1HB4=; b=zEebU1Dyo+rQWMsJHm18Au/Lns
	DM1MCiX5gi3PaBw+gAe3fKQAi0lrLqj/dcakqaHTG6PcE7j/kkYIYekXPCqd1rtxPJfO3z5CoOpZ/
	a2vzTptXmVe01e6C/xqsD/NRQwOkwP2fcEjKDUxAyZ1Phb4pViSATE6L9smUFpzpGqlw6q+G3Nd9c
	2my7iqih//EuMuaU49T89AfjbBNsUWLWPg1Y05lxPquyML1U2VK2MxaHiA+gx5Vt/ckmZRaedaMdj
	OZZn5DUf0gjzNLTOKaAnAHwmPN7ZVbe3lKE+m5xQn2GRCgrSW4BuUI1rYA1sPzAkDHxvWMRyKGIav
	nUzRniBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1AK-00000006RUe-0l1w;
	Thu, 20 Nov 2025 09:41:24 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1AI-00000006RTB-0r5L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763631677; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=PMOlwl2RSWqdhQ+OAtCN0AHF22uOPsne+hE7m8m1HB4=;
	b=dgJqCWsCXXy1NlCOcnnV9ZmRw6YT2RO6lGaTMvN9G1pyHgyEl9jPf3VzE+T+FW/3PkCsrv52k3Ldhjej4Cpl05405b5GPYFyzFA4UjdYj0zfFBXVfI30ab8dsvG0esCql5LH1hDvbCw2ZNrvoFIm6f5252GXYgY9mT97UvU6LGg=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Wsv4huQ_1763631666 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Nov 2025 17:41:13 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] coresight: remove unneeded semicolon
Date: Thu, 20 Nov 2025 17:41:05 +0800
Message-ID: <20251120094105.2766068-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_014122_385982_D8FFACA6 
X-CRM114-Status: UNSURE (   7.63  )
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

No functional modification involved.

./drivers/hwtracing/coresight/coresight-priv.h:238:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=27327
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..16f0cee8cad6 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -235,7 +235,7 @@ static inline void *coresight_get_uci_data_from_amba(const struct amba_id *table
 		if ((pid & table->mask) == table->id)
 			return coresight_get_uci_data(table);
 		table++;
-	};
+	}
 	return NULL;
 }
 
-- 
2.43.5


