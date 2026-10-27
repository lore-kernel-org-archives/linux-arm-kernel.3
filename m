Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4395606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40rsTBHH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=REqLEcWu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=; b=40rsTBHHcQ2XE/
	dZhvdJM6ZlK2VqlsSrT6FGNFhYWyvC6BAAZXEoIKVVHY73fQk+FBaOJPCDOrBLtLIDVlBAvgOP8Xg
	EA/xEqsJjIyfg9UsJL5f/7i/YT7SP3m3aCqivh0EkHb7fHcSEwHrbfJcvwY4VqZ19eBeWfIW2HWus
	QtRi7XWLPbs5pGK+L6gj7+VTQ8jNI4B8KaE/rnd397XuUBoz0e+5Hv5qDDjx1NjtV+MEE3WjeCXoR
	fADguYSVqbNeHDv8CwCowdM9NHjOEJ6AckTEUmskKgT24TwSMtsCPwJyv7IT0u9uohXudnGcFm4K0
	m47+A2wrAc1FNVO8u+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYBp-00000003iJC-3yMS;
	Tue, 27 Oct 2026 03:49:33 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYBm-00000003iIT-42k5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:49:32 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-181516de561so374546c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072970; x=1793677770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=REqLEcWund0xYhj+0wzaMBYxumWf8c8zfRCFkHwvXnzAx00GbHsuAD/ikPTnbRMr0Q
         HkBumtLY+FbVIofLPd4cGOEX1xGN0reuTtrCut/A06mA2MMAFd67bMNM9FWAMBgPiUPe
         xRi5uojtBmaLf0VzosMurBorylGpp2AqrO0QbY+nAZRT9j56ZMVN8uKpSgh9AMkCvBqc
         KzjmOkX9TfrvtyjwttXmN6ERfgL38fsl9ZtpPW48aO6p5HDJVscmffdloFPJq2LwbRfs
         Xo+47ZAELFK/y2zr+DLqwWzv6vr8OGk0J1FLq+elspca3c/4U3Qb2mJNJ7upHOGOHUE1
         G3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072970; x=1793677770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=K7u4X8tCq5vOkf31Rc99wmL29zKMTryBd7ks4vfcZKbZu3ej4OfGJnVjf1IEVLoLra
         wfw4hy44tBPwLViq3GQGjsz5Qh/KB0NsAdzeKOWe88WJqJUSDJQ0r0ZSV8sNJkSVLZ1i
         vSDqs4hFxM4GYNfYQcBMa+hOIwn6BHX0tVQgH7QbBUROOBrqSpzdqq7PphNPb7c7VjzB
         pKC1aF7f7WMpaf+4oI/xAROL+bhgSgYw437FlT79KsLlh0baXIBThrrB1AXqcMU4yMru
         qJfacietsorsnL/gKyW+KIReBqcsfE11AaAMhLaC+1gsk4C+dzHSX4qebFrcfpwapqIF
         260Q==
X-Forwarded-Encrypted: i=1; AKwUvByvMFLpPMyczX0ra+kv0ySFb9zTwEh7Kk1Jlx3wgQ97nNRAdSFJxuCctC/QV1mU0jpiiVqAgmFSNfeJBChZJLzi@lists.infradead.org
X-Gm-Message-State: AFq9FYIGuwHobzsco0gy5SSp/eLD4dMWcLs+caxHUeWe5Zu2V5HSie7U
	F14iUEuTSNL5HLw52WO6LrWUKrFd/Eeqea7iPXhppwOXOb9F6lJj4lxH
X-Gm-Gg: AYBFou1hs4di2oh9G/8bmD+V0WF166L9Wpkg8hZ9Pn9KsRp6ZGJE0/a8T2097SiVCnV
	rAWpMC02rlw+mBHiSTZPzR42A+7gsWYaFwebvfPY9GbGQLeaDV77vTIzGJ6o61KalZFIXh8Jlk6
	yw0ql7Qe+H9+kNcH18/9hK6rh7yfboBlyekgHZtlW8Lijn2MGLMr/js6r4lJMPnd6EBx6pmnapz
	R7IBPcYpQ/FenNmly+qhnsZtitL1zGsg1d3/ncKbd6zSkhFjEfc42/EA0FrfuO+/AXXJqNPRA7Z
	6OiypKm4fOKnhaWUpqv1jdmP9+vkx4ICIMK9mZFdWWQd9M4x+ESCiSjr6o1yWZwt6bkAeumaX4E
	LDsLDAG2Rlrk6wwhKE13uwfntJne4DxUk0ZTnuslbD1UNZ3M4W7XrpA6jjhdWkIpU/pGobLGFDr
	NIx8JLYuFY1bEE1nw7e56uJ7PNbHh5R91zaItXZzc8eWvsLUKdnzfx73Ee1SSghfuc56e40BqEI
	I63R2cZGD1ndh96iSFY/A07RPXCGUI1N4BSl1bzU4FF4fGoGa65ljG/TXzVHr94f7B4ZJI=
X-Received: by 2002:a05:7022:47:b0:14e:5e6b:e6e2 with SMTP id a92af1059eb24-1a3c904cc2fmr2284657c88.18.1793072970015;
        Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:29 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 27 Oct 2026 09:19:10 +0530
Message-ID: <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_204931_008902_0158BFCA 
X-CRM114-Status: UNSURE (   8.73  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..3e6133e2b 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
+              - asrock,b650d4u-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,ast2600-kommando-ipmi-card
-- 
2.47.3


