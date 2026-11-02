Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HoZ8sVzL;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CIJhpzp0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9/IoYRffQKx8mihWgrVfNglvfRURCF4HcTZULBh6CJs=; b=HoZ8sVzLarJjuZ
	olnhaN0XRa5mgoD8yNRz62gHs3vHdvIDxtFJ7a5h4HzMdLQse8I1olw6fSCbH0VhoG3qN6D6uveOU
	rSEKA3Og2kHAyA0MQtAs/caX70IFQc6zn5ulfirJQYtwXRPd+E0R+W5MDwUrhJf2GjXna+pj+g7O8
	NZXZPeA8oUknbxxYwUreDkdr1hBPTqiT6UWnwKUNan5yLn1pniBl7/j63r/vO2uRx8Ff1OqTR1CrM
	R295KGs8T1LTDWXOnX9fWAehsZ86nXfPkFf2T9lSDeqDlJmEm0LmjudbM7776uoxUWGa4+0d5IQQD
	p7aoa9a3OBDxhCSbYZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpjF-0000000GESs-3kVa;
	Mon, 02 Nov 2026 10:57:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpjD-0000000GESE-30Cd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:57:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e47347279so1658023f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617043; x=1794221843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9/IoYRffQKx8mihWgrVfNglvfRURCF4HcTZULBh6CJs=;
        b=CIJhpzp0EOu73vHJ8g2tH2PedjkJwBAldEwNn1VsMqLBSQpklmonV74CcmMhcdplgc
         qDYrvxV1ppEzKXypO1DdhcBdTDaVZ7Q89Q6UEBReVaJQ5aC/NIkTbNYllJVvGw1RA/sX
         EGwTam5ny1r+QWXLKSNvV4Yr9QaSsbihnz92TV2MKR4ASyoX4svXTx160ac5WuqHSAVE
         ZUQkgWVJtPDm12ol8Pe/3M23UyixFQKR4/nOElpChoffRJCd9Pm6LAR2CFEa5tBG/Ea4
         2a8FYkL5JNkhGkVMA+lHVgbUKS7qo5siO1+9L5lAxeT1BQztoBpX844b9+hwGA/FxL8L
         OYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617043; x=1794221843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/IoYRffQKx8mihWgrVfNglvfRURCF4HcTZULBh6CJs=;
        b=xz1161EIHnLndo4ZiJIDXy4R3weCln+yWEpA9M9yu4mUzmSi8xO+PQfFocN0h4D80k
         PP/UjGSldfOQsdxr03WgBUt2+wy75Agr2SXss+r3Il54AXAZgfS06xQCBn084HCWcG4w
         dbua3r7uaFtBblbdoNw6g31wZhQAShE+DpQQSqdBGCUSN8txE+KF3jyIF5FZymZcxRRt
         Yp4kwG1SwA47ZRZ7UmhVq/5ikCpX9TLFRY9XOOor59PPJw7avUSvT+0LcAX5590zeqaf
         RmuBHPLeBlaJhtxCKhQol1W2m5k/e1yVRmcTi4FGsTFI0F0V3PsUW4+UXEWntNidRPMp
         7ibQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiZe5JqXtW8YBvkfuqVoJfK/cLQOa9ecuQQhb0HbBHu8IZ/X0r6O8AC/RCmEmhspmrOFDrzR+1DzUqBvWKHr76@lists.infradead.org
X-Gm-Message-State: AFq9FYKwBwrRzVMvc8PT/lDYx02GLsMxDuA+Oz/o8Dg8aa3poJ5zWuCA
	Y3H6o9Sg6KYUYUwkYv9FkOqv9gRIRvswPxEbKkiWDsFiBHAr6wUizCXNOmxgdGqcyag=
X-Gm-Gg: AYBFou0i7Og0rSSOOLUnGiPV1nB0QvTS5puHuvrUd1RhaVl8EwbIoB9+phKdMOnWfag
	QUwJJcXoQY+vHpkz/iDTGCkxEdy97TrgYR3WZeKs3g349PwNrV0n/737Y1Kxpi4kBXqN1vsZFFd
	3b0xP7bcQ2l4zbSREiQD1kQwcWs1E4/9qxO9w5iWtjmjoNh8FgHmHUxBn58oO7sAszb0UtkCicf
	LxZ1Jay9NXR6lG9nfyzwCIKwNDbjLpqUweq9TYRvcPlykjuVustCKMyOmNvecbmSQcoOYGo4uFn
	jLm6QTFiYjhoc61QM+wzmlaaK3uhyHTzu1rBNERquNhbhpO1OpRKXSuFQeJwV9JYkAoTXEewbc2
	MJzDezw8HFsXw8CAqwKK15eQ793tOhzz1k8lSgIRQ2yeUOEjUesMFY730rLQe/EICtRlaTGABzF
	5xffIDirByxN3mG5PTCUKWNOrkvbK80/K0t7adlbSF5DPSB4oD+3LQLLgshQsbykkZaEDoHK8yx
	IP30w2a2q0DYSVRwlh6sGl8WkxpBOM5F3RPNM6AInEzzBnty97lMKHU/BmfpUGKV1UrvZM6jNv3
	rDh07g0/09tn22SknDJURNJdHavGN1oaWM3h42evme7rCMpxBeEu
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr3653145e9.23.1793617042662;
        Mon, 02 Nov 2026 02:57:22 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:22 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH net-next v5 2/6] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:52 +0100
Message-ID: <20261102105703.111844-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102105703.111844-1-marco.crivellari@suse.com>
References: <20261102105703.111844-1-marco.crivellari@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_025727_774011_E25BA7CC 
X-CRM114-Status: GOOD (  13.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: MD Danish Anwar <danishanwar@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
---
 drivers/net/ethernet/ti/icssg/icssg_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
index 7159baa0155c..7d6d6692d819 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
@@ -69,7 +69,7 @@ void icssg_stats_work_handler(struct work_struct *work)
 						stats_work.work);
 	emac_update_hardware_stats(emac);
 
-	queue_delayed_work(system_long_wq, &emac->stats_work,
+	queue_delayed_work(system_dfl_long_wq, &emac->stats_work,
 			   msecs_to_jiffies((STATS_TIME_LIMIT_1G_MS * 1000) / emac->speed));
 }
 EXPORT_SYMBOL_GPL(icssg_stats_work_handler);
-- 
2.56.0


