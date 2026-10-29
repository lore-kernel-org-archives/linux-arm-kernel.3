Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24256606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j52R7W5j;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aSront95
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=; b=j52R7W5j/1RxHX7dORMnVFuHfH
	AdJxU2rDPcPFqHSCSRvnK+ZI4yjKCGvGAJdSlFPRR6+ulN8E32AU6iToer4i1Esw43vqSqIy8y1JV
	7pQ+z4czS1c+3e09m3kNSjausYd9zc37+cClT/urc7asSNicalzz5sJ78kLSGy+e4xAknxwtVF3KQ
	LsBYdobUrJpDICOQuIFKsX3Y+cJyFzBz/j84j3bXtAYyDUOklAG+zM8XGGS2hhZpkyYKUC7parCNT
	8PljFhMFljCzgBIpLgM9I9y4ntqpvUV7XdBGIh8tl/c2aTwkFvh6BPP8qtZwza9eOqv6imvfyGUVn
	21hWbq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0e-0000000A7lR-3GLy;
	Thu, 29 Oct 2026 18:37:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0a-0000000A7jY-3eCX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25515775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299070; x=1793903870; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=aSront95VFK6YF893jZjPM4tIrSInqBYZJLlaMyRTJ79/Mo8RPDivvfjjrcNTLoK6C
         R/pfqnqKM+y9rp97tAx+eDNXMX/ApgatVj9Z8AkA7E9dR6zZJdz7E5cvv9FELUut1ilb
         /2omkbKJ4/WuYmqAg3IMbRM5LB7PMoL6G+AL5N4KyIomPnoH0YdNdSQZVOzeQdDED42K
         l6q9zUHFbc54QPxtDoemAGHMcPhLonxmKwlGkJBX3qjd5FU5gkGZKWnt9nGkcgqqOCrI
         sYlBRy7eIMrYS3sbB1NCtc64p6mGIU/F3Q4E+eWPTOnJywuIP9gL9UYTdqiyEvURijkk
         ZkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299070; x=1793903870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=EGPiurLJBb94fqBbO5YDgaMSAtllopMIMDYa4FnLDvqZlVpeDNs4sKK1baA1KItGJR
         xOELB+k7fnbBjN9d2eVwmTkf43V5/daVvDoJyB3S5vNif7zBYWsePK+Grljvr51sth8H
         3dfROatJEbaplq7Tp5SufsyVkLnFp8djHic840frIcD6xKFanqXNchh7te06wVsRDW9x
         68C6P5hPs9daHAjtjxXY/2yr6bmBz2L/gcu9x7ADf+JrQNlLsXA8vlWaHEzca30B6hT1
         1nSecBT3N5X14UPBotKRzygo+NkzolUu/3cCQXTKEr8wl29RFOMfjw+V4mBUyMfh1/db
         JrXw==
X-Forwarded-Encrypted: i=1; AKwUvBzXfJlmXJ5ledzI1OAbPs0pAW/PUu49+3rowVQ1JWNXfETtu9pGuDa5bkKwG9rNhUv4OtWHdBdeVFUEsPEPES+3@lists.infradead.org
X-Gm-Message-State: AFq9FYJz0cX4gmCRzi+jYdFmKPWnhXRpnhxCzNlOezpOBCkw9DCbrBYN
	11x6u9lfrPzJh6l3hJfgKr4DC368pg00HDi2jI8i68/O8Bf8L0Ig7CootEPrHl/hBj8=
X-Gm-Gg: AYBFou3SRfO3Aeg5GDJDaM44Q7ufJGUv4HUwV7aRLvmM6Tsa5SF3UW/ptUQZ/1N18t5
	IPOKhbUAKbT68Ku0R8m2eTb2lHEZ8Vk4Qd0HBlmKSzkSdkFPHxOcBOdop/eSwiaCB2z+b8UKhsp
	25W6/8p32Tu78srQgD3PHfr0/Jx+3ht8bVmKGSDIAcIBxyz9mMwkYNDKfXghll8zlgeIPAZb3Z0
	hBqtxgWvpaXZtnmsQc1luZ6xeD2hm44lyp32MThgPOXY2XUbKQW8hH5m9M2+RWfI/0EYXDh3esL
	VKLzeZbw12uLUd2lwgafNvd2+aBdukyWIkJoqtPFcm/MqyofM2mPHlcsnH4cn7DByCAJB75WRoF
	glnT6rnmnA1fzhjH8hUlQ1k4qF8/cTUB0Fq9ZSARhCW2vRSdo9KrOuYq1JK5sDPyBOazIv4MaJ2
	JCCl28Vp5FATfm094JQCseImsEAJm32oyWyQ7h53/6ZPQBEVtr5AU33XslXteuGGSEtH7KV6QcL
	S7u+VrD4i7s9M1XvRhZ+LJUgAQid1qwjvASXS6GsY4fhV1qKwTurjxGwrX2EVRQ9kPTziiyNX0C
	0fD34AHCTyQEMuMiMTcJmtLbEgyAbXBf1QjcdOJX8kBnGiu5nW6I55R0LXI7e6b/zKZn9/79X7R
	t4NCHNYlvVPpnigSoCQ==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr155468995e9.11.1793299070403;
        Thu, 29 Oct 2026 11:37:50 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:49 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
Date: Thu, 29 Oct 2026 19:37:33 +0100
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBQAr0K69pm2GCGuvIdh0ZZXecqn6StEQ
 ri7gBdwOclkZhGMkZDFLVtExImYhn4DfcqEa0z/RKB6Y6GlviqpNYyBU0TTgWvfgL0LwNgCN+Q
 T+BoL43JbOizEVggRPX2O+qP6MY/2hS7tyd1oiNMQ52M/qd377zQpkOCVVaikyevycrdmbslGP
 LuhE9W6rl9nsblj2wAAAA==
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113752_925302_04822E6B 
X-CRM114-Status: GOOD (  10.20  )
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

The GXBB, G12A and S4 clock drivers place the ENCP clock select at
VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Reword the S4 commit message and the cover letter: S4 has no ENCT
  encoder (Chuan, Jerome)
- Add Chuan's Reviewed-by to the S4 patch
- Link to v1: https://patch.msgid.link/20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


