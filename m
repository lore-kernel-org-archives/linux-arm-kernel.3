Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD391E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0R3xI1UN2GRunhZ03PNs268H2M6C30q31a5zdZmWMp8=; b=SCpwtCcVj/AePgLhScRcmkn1+1
	RevovvAlZZFVsGw69sQW9IeflzkdpRic9WX1U+t1UtLNdUaotH0zqnEgyPCMKBtZSc1euTxrTeoys
	0CZiyiV9mVj0c/81/nd8QooFIBOWNp7iMFFr0wSeDFSIDwbGFtm61IGE4z5agQyqCC+QdAVfcNoEv
	bqtChiLDhkiR7AfqDb0+dHXTavAH/EqKbZICm7Oic99wZ/DB1HEroJ2kKTUysp9I13iCTANktlTUN
	Wnu5swqcpEcF3sBECIDggYl2s7VGyT55G4vVoo0sojKkUQpt0bMt7OTzPhajSFR067o6VTBJnXKfu
	BxTF8kdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaAN-000000070vQ-2lqR;
	Sat, 14 Dec 2024 21:59:15 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMa9J-000000070nV-13Ym;
	Sat, 14 Dec 2024 21:58:10 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b6e9586b82so223392385a.1;
        Sat, 14 Dec 2024 13:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213487; x=1734818287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0R3xI1UN2GRunhZ03PNs268H2M6C30q31a5zdZmWMp8=;
        b=ZoWxq49FrbkdFfoy7SiQiVPXauqm9uWlFVTe6f2Y7PEWgldVO05dFNJCqkyyPa6lE/
         4Q+GK4PFVAMgKTaGHjZ8blTH71Bv+rAd11SCjaJ2RyzUhyva2elQeqtikuDyQWg4p3Jc
         LymIs2UI7R0bcy9NYcj2xY4+XauB+B/2QK50Yr6LCbkMrGAaeDC3uBFMm+jfCne30KBQ
         KnaiJDhXSbZi8eLrr27oGBKtXqHANkcs3f615DscK1xqohyOKrfFLR08Eyq0PW2tgaSr
         fza4LwXgiSoQ4Yim5561kIZhy0bLIIzGc4TJ7mB6EUDhbKW4RR+RvdVfu9lL7HHaaG3V
         FtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213487; x=1734818287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R3xI1UN2GRunhZ03PNs268H2M6C30q31a5zdZmWMp8=;
        b=aYlLVwnL65WlAMMkTFkAQ9Wl6+SXisaYRSihk8zYyN5oY32WKibf4s9Iyrxi+spfc1
         EC/+ChpC9xwSwmrnB4gydsR+hWZnhpQYZIA9afUhhE7RoqHVtUHHl2xM5HVw9j1FUP8M
         9a2IGyR7DFkvPK4coU0IxoIfB10Vq/0T0V/vPMvlQeSWrbeKDld0DbqI817DpAftLcP9
         6WYzaV9p3UrvTlTa8DBS86bWOLEp5uy456XcbNCR6qN6BHkbiboFyAeSJohmRGisxIN0
         l+ZMUdsfKpR6gMC2ceJfGqfoQoRdxYR8AKBOC16Yvm/i9h72nYTyaKhMc/SUE1BIBKma
         zs+Q==
X-Forwarded-Encrypted: i=1; AJvYcCULZISaEo8hxU9PttJld/vOjpfY7/wX5WajBeQR8WtKby/rrOnyWuuCNEuC5o8FdIU5hRROC3VP3uG+UZruZ3w=@lists.infradead.org, AJvYcCXcU4v+MbOj/YwRrV+GTZEPVEUoB1E1tg5o4H4OlRdRqGBhZnfHcH7zclDVcSug/S93BhKQX9MZzBO82lA13T0j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx24qP5JNqTWdLgSYqYCNojoCziSN0ePzEG3O+9JXjqSmlZ/VWq
	et7L524jMiPSIpLtidz6d0gCxECRatA/6aGraxWub+L1ffI05BiJ
X-Gm-Gg: ASbGncs82nu6PIoUzx5vB57tYBIigmDoyOBU8xiLnxgau4SoJ7pay+wvveQf6XoJGNd
	7wcboGCprZgrMrq5ska8p6G5D+ZZPCkZngjN2b6pyRZxGPd7PammtaKN7/0a2RH3MEANCf5T+/o
	DfDK5CQn0VdMV0vx5DAldn6yYpTy/KIx4xj1lJhAiuUOnrHNFakWnxdmozgrohA1unWRi0RvwVq
	nJ22eBT58BYodJPmwpLom19AdVNPbzDQ7z6hpz0NGuSfJLlg8EAVT+cF48ahx/MAkG4
X-Google-Smtp-Source: AGHT+IGt/f+i+UFJ3O+RvOd/bRwD3wpdtAD3wNHRnq4t2hd2j0+Yy4uR/gvcC7FSIKX3AOr1aEX9Ug==
X-Received: by 2002:a05:620a:a005:b0:7b7:68c:cde5 with SMTP id af79cd13be357-7b7068cda7amr362626385a.1.1734213487439;
        Sat, 14 Dec 2024 13:58:07 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.241])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048bb8cfsm95536385a.76.2024.12.14.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 13:58:06 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2] pmdomain: rockchip: fix rockchip_pd_power error handling
Date: Sat, 14 Dec 2024 21:58:02 +0000
Message-Id: <20241214215802.23989-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_135809_291136_07ABE5CA 
X-CRM114-Status: GOOD (  14.24  )
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

The calls rockchip_pd_power makes to rockchip_pmu_set_idle_request lack
any return error handling, causing device drivers to incorrectly believe
the hardware idle requests succeed when they may have failed. This leads
to software possibly accessing hardware that is powered off and the
subsequent SError panic that follows.

Add error checking and return errors to the calling function to prevent
such crashes.

gst-launch-1.0 videotestsrc num-buffers=2000 ! v4l2jpegenc ! fakesink
Setting pipeline to PAUSED ...er-x64
Pipeline is PREROLLING ...
Redistribute latency...
rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack on domain 'hevc', val=0x98260
SError Interrupt on CPU2, code 0x00000000bf000002 -- SError

Signed-off-by: Peter Geis <pgwipeout@gmail.com>

---
I have pulled this patch out to be standalone and rebased it on
Sebastian's pmdomain work. It is now dependent on their series [1].

[1] https://lore.kernel.org/linux-rockchip/20241211143044.9550-1-sebastian.reichel@collabora.com/T/#t

Changes in v2:
- Rebase on Sebastian's pmdomain work.
- Handle clock cleanup.
- Clean up commit message.
- Pull this patch from the series and submit alone.

 drivers/pmdomain/rockchip/pm-domains.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 31c71b6fddf1..9f6640063fda 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -602,26 +602,29 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		rockchip_pmu_save_qos(pd);
 
 		/* if powering down, idle request to NIU first */
-		rockchip_pmu_set_idle_request(pd, true);
+		ret = rockchip_pmu_set_idle_request(pd, true);
+		if (ret < 0)
+			goto out;
 	}
 
 	ret = rockchip_do_pmu_set_power_domain(pd, power_on);
-	if (ret < 0) {
-		clk_bulk_disable(pd->num_clks, pd->clks);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
 
 	if (power_on) {
 		/* if powering up, leave idle mode */
-		rockchip_pmu_set_idle_request(pd, false);
+		ret = rockchip_pmu_set_idle_request(pd, false);
+		if (ret < 0)
+			goto out;
 
 		rockchip_pmu_restore_qos(pd);
 	}
 
+out:
 	rockchip_pmu_ungate_clk(pd, false);
 	clk_bulk_disable(pd->num_clks, pd->clks);
 
-	return 0;
+	return ret;
 }
 
 static int rockchip_pd_regulator_disable(struct rockchip_pm_domain *pd)
-- 
2.39.5


