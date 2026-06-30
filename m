Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE76CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=; b=cXXy1xXanxVySNlU3vghSPjZ4g
	V4HC8nUFV7moiw4h1RcgjgTLlVERe/yrGtLt1JnU7HLDWRHXo8LmHnrRwibSMjhKWFKDeOE6p45E1
	9yO9Yv7jwCJr2DJjYVuIQuRVdxJtcfFJKYs6RiDtc1IVSDmt0xMMCZs62kWO1P0k3I/USvuIPtAV6
	epAdpLvPlW79heVk54cQSi58ou6RtJTUxO1iu0Ri/9bTOLgPZi7ETmJwUNOC12CFPT9ULq6RJT+SR
	Ef2Uz0emUPi+sGD8/pNu4tnZdoVPHZ0oWAJt8PuYkQkhk9/MbUU+bbcsxc0OZ3WZRvq4UpXJVproG
	qTWrbFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjs-0000000GPTB-1yGT;
	Tue, 30 Jun 2026 09:26:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjq-0000000GPQP-2HKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1137427f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811600; x=1783416400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=nCe+Z+0WVFIYxUIlVXcyU+xU+vfjhmPGFZ4DF5GerOZk+WfNqYvkY3CYMY98JMFEE8
         OvTNx+NsUkHR8LhG3O7L4jBZI+I/CdH5Xq4P1gEeAvk9uXilE5x2kEw6vhDU5z2Td9+6
         VJ6q2EM13RPo1hgwEa47/et5VAXqXQWKHbdiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811600; x=1783416400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=KMFNySUpu9s8dw845OsV9qKcatS4ocn1RL0GEfbS6DrZ7f7W7LGE58l0tXSKpUeQE5
         HrimLGORq3ceg3H0fCwb0lN4YtzDWslPPOm7JrSqeiGwsikDuCTDgM6WkQ3lNYRTcVKH
         GHH0DIJC4h2Wo4DcwFMX6MoZ2O7q0JcM37yWwS13PURWtNdBQwYoIUsaksL1f/D87oeI
         b6pX1NvW73oN+bCz/VmqypW7z66AqSCQ2GOsly+Pvy0kVF7mYTlAk1QnCGPtQ7PGgcnE
         9l5PtHTE2N1wDTvvQ0NSXkAOPWkSHchc6fufjuLNM4i8doNunneDw7YHI46qG1UdxOqc
         u1KA==
X-Forwarded-Encrypted: i=1; AHgh+Ror9/xL+ix9Sg0klOzu8m/SG9xUpzcXph5WivbuBmpVrMGn8kv5t0USzDtQHWYyfnv6oAL6k0agCfJvDv2RfJDN@lists.infradead.org
X-Gm-Message-State: AOJu0YwFyanpQZayQeJD5fONbPlz6D9RJr7Ryr1nlEqUt8vEN9aNWfDt
	Z3GnSD1yj97SLvCCZ0rOnZAyU/dNGqRAXfkmbenZgZNP/ckYrh5naDFS7AoqcO8lyh4=
X-Gm-Gg: AfdE7clUoE/GH2cjJB8iPUU+TJrkJgA0lvu7cgaBiwB8IGDKNwJ6o4ftf/7TvFHND87
	LbHq1Zch2jFfr1vKOjSq1Drr2U4VLNHE/aJ3fHg2ldC5CpB3Nahp/mp/r6AQ0iDxDgKRUCeVq/s
	cp0BZV8SPfMMxfAzoeIvlOL3ZF/UcMNQBrwnkVl9nQ+9va8Itp3qoZ6l5GzwsG5sos6kacdqDrp
	jr+Hy68OXJ6oNIKJimV0zeMXxLR4F28haHaumtVqLIe4crQhDXUl1vAbtz1vsg4LYJcFOFkT9l8
	5f1x2OHwVfu/4T8Jb83vDH8dYodQF5+dwYQWHlPyW57Nbl6tGjMAtLXErG09KikGS9bCs/FRpTz
	pwrvSxM8526h/4EjeWWUfj9ZyzUEp0q35VA/lySZcW64paCBRalpFNcDHiK/U/MIOu6sI6k3j+a
	O6/qzjTJl/BVv36Nz2kjUHuTHwvr1V3iQTqm/49/sJ4Pb+dUDXM87dTGjulq3wtwfhUKckTZXN3
	VzRJpp7XqSjmqDmgzoHqfQiuVVYuRz35q2wyh6UBT2pWZUPlDzBnZvPSHS+Tr92Q5GpXGTLyYok
	1TV4KBcBvDv8ww==
X-Received: by 2002:a5d:6e5f:0:b0:472:8343:7f5f with SMTP id ffacd0b85a97d-47552c52c13mr2544868f8f.34.1782811600443;
        Tue, 30 Jun 2026 02:26:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Tue, 30 Jun 2026 11:24:31 +0200
Message-ID: <20260630092628.1695560-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022642_624679_C2344688 
X-CRM114-Status: UNSURE (   9.98  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0


