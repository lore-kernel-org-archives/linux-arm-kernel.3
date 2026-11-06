Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67C606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jm2hnqtx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbK/cwe6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=; b=Jm2hnqtxl/aZxu
	IPnTjJILy5MJ+iMZyybQeF8wBEr/dsMIDGy5sdiD/TPf5bVQ9ybployb/vcKgTnqZe7PT4e0K2tg3
	fW56bkUbw402P74ng+LA46JlK1g/O/bWC8A8W4/5rffIs7QC4Qd1kd23BQvjzZjWRlLTjlh0OO2tZ
	/mLQ04HvkZZSBvPGvuzIb/Hu43/HtYnXq7sf3TD/eYPwDcp+clNJmjnxBS6d1LxauqhJ+dSt5Rf98
	heZboc6klfaD1tMyvOtwty0pIxPBA3zcZhxTUHWd3uH+iHa42dohWTKrftj1R8njEJ792GiTY+quJ
	fFHmBLHjCw5yE0tXTXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAEz-0000000B8N2-3hTd;
	Fri, 06 Nov 2026 03:03:45 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAEy-0000000B8ML-02J7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:03:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8a06454116eso68082b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 19:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934223; x=1794539023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
        b=kbK/cwe65UCr/Ap+KqK9/h6zHgFv5Su3qiYPB81+t/B1esL5cz7cW4A89ONxLrgrfU
         PoVVQUCCx1meGGNy/e6/uvYxaIwtfEilpzY6yM5xe/jqYP43El8N7ypSwy9MGL2h9BeX
         WbH1hk2Vf6NvtKMqXZGgpJcjLR065kNdgnRYRoddv2M+fLBFX1mi9x9382TChfx0WRBe
         xnjtalD7qoDcdS3rsc1QdccqsDZTbuMdXrHqGHsyskkUb37Um20wnypdWQCHqUxgwOu3
         as6R4DCqc63RGgJwC9aYs9KEpueyZTVC0W6grAPnPBueQ0bZ1JXizOSnYpm2PXgXpXp8
         EJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934223; x=1794539023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
        b=NEtU7+nn96alUqmtwMG5bNPRGYgSGGIxWcGSZnVgz++Gr3hlerdZl23toxFSZQqeLe
         JRUNh+OUQAvFl7er89mAY8hFeCi9kHyDWrLx6CvlsbLqr2OxRdnM5a7XEyKrel0wN1yU
         sYZiV2gFQaqBkNUG9T5orQHgFE54ehUlODqxsM4Nu3/gDH57CXSW4+1PzO8IVVvJV2MH
         07F1uAhRNbd0tY5B7pdOlJCg3CJDlwoPs15yE+LAK7fa4KAUSzNWb8yqQSWxkuPzTyvs
         FNvb6Y5ro7DnE5CyFSUVhlnX9DJPycOTogMEmEeZU1jKCFFnTYbG9LIKDcJTPVkOXOHo
         65EA==
X-Forwarded-Encrypted: i=1; AKwUvBxOkD0qWTSNa697e2k0b3WfgxgHS0oJ1OQ69FsMvmOADZa/E7uCwSnblCINPOdoSdT5S3mvNBgKKY1p+Og4PGVH@lists.infradead.org
X-Gm-Message-State: APuU4Z8DPpVCFlxGn6+omGPg5Ji5kjkpDPfseVflPQ+RVGQ0Nqa4GZOv
	pbweiA7hrg7KYPTM/xs3yXkAsiA5JitfGUtCfDxLppkHP4F94f5eNzGVrlqnqQ==
X-Gm-Gg: AYBFou1dD0wHXwWTQm/2F6F2TsmLYBaQfe3ffqIgpnTKvPcQGEED63Ts2LqEmcGxVZe
	LXyR8oTdgIhX3tzG6aXZfbFN0w4H1sn3RNmC/8jQFFhv4V9duzwLXiKnbKAYyA3NVZZV2YVVQMR
	DM6VVEQSfNSg3zWBX8IAXLpsdNd6BTuWriEt9DZzcOEiznm5m579KZgl0EmIn9FLGuI/uz5PEpP
	HuMCfTMl3qhKcfsKcS0wLSWYjEJtCk49Wi4ZsPT0Y9ezChY4xH5NCh1QDF6AtEnZydgZ3ctNfPA
	6MiLCVSRmITZi2TkrgjRYfq9H0QA+MvHlbqV2fTZVjoMC3vdo9RFB/q+BbXOBeW+4VEo5m1e88X
	nVKnSGd/y/LMUj50CZaFI1bstiBdi34TsB/Q/ylp2KhF4oDwwyQH1clsWwT20K2yOQWcCH7iTor
	qRCkwfNHt+HpxK8Hn6XsMwB07Zji0CUlRZHdNEjmjsxJnuKXl8pBHPVxZf+TeVQjPRpN4nBoT2N
	T3zNNnYs937kMvcaCiKjapbqdiYpM4v3NOonEy1ltTcoMQrBkbycm3IojB4gb1hQoErShSOMBk+
	27+Bzj4YoSZfD0bq5Gn73xxIqCDT8yCogS7D+Pvo7xm3WT/7yuQlTKcJBxzaPSB1eyCBw55UkLR
	PGZngi2LAEjZS1A==
X-Received: by 2002:a05:6a21:6b05:b0:3e2:799:f2dc with SMTP id adf61e73a8af0-3ebb2a32f99mr1584310637.40.1793934223023;
        Thu, 05 Nov 2026 19:03:43 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:42 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:03 +0800
Subject: [PATCH 2/3] ARM: dts: aspeed: ventura2: Name the COMe presence
 GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ventura2-dts-update-v1-2-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=4Jjy6nPmm/6tj8SAdf81ahe94whURxI1stwQZrqpyWA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVNgrr8sXF9pbSJR2rRAI+WNwaex/opd0PN
 eMqQVHYIh+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gVLVCADDgwQyaqhCkNk4V4yZiqInsNBqp1YSJdRkVsxHS3sXrdepMRzW399viEf0lzpq4iLclfb
 icaA9RyeB+vGZJ1EWW9ZSeLncM8W1RQp23YEIgE1qW95PKHE88GqxSleX8lRXKSd9IDffeu+lAt
 8tznjeEnV0RdpZw+T5s3e3hpJs6wenS+z+l7AqanMVTx5ABSYWgl7v93qDJ01nxd+qfHXauz5TR
 H6QK8SZTncBv+ULDWVrKSqyshWfqGnmrC6+umFUjSecbRL2mpBu3swo2YOg0ECurV9y7ldff4Bb
 zEQN7xfd4xJMUJBFPZk0L0ZWLUfeK4OZkluS3QH9/fmXKHKT
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_190344_072103_9D65A457 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Line 9 of the PCA9555 at address 0x23 on I2C bus 3 is the presence
detect of the optional COM Express module. Name it PRSNT_COME_N so
userspace can determine whether the module is present.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 50e652cc37a1..a9c5990ef969 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -625,6 +625,17 @@ gpio@23 {
 		reg = <0x23>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		gpio-line-names =
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "PRSNT_COME_N",
+			"", "",
+			"", "",
+			"", "";
+
 		interrupt-parent = <&io_expander7>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};

-- 
2.34.1


