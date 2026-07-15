Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F20C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=; b=1Yq7AvPkr7LeyyrYJV74MySqES
	9LGvcPQZFBFJ6w1xN2DtlafjKND8kLPd1MF8KUT1eHH8f38Z9iZVbDa9RxC3wC0iZuIHlXYUu072h
	EXUd5GUUPdxbQ839Z7bFz2L/ns/FXNjc7k52a60iLEN2Et/ZZwf3MZCXzB7Vms8WfHAn2+DsiacWy
	61rnqbaoFKYsTDNo5jc3LheCXahf9ChKye+cnDh2tmxfYRzXpoXguqoSCerxbpKmDjCidCtPBmvVz
	6m+OZzxynbTuEEZ6fofCsEd+2kD5JvlhYtiQqrMU9qwB8WQzXbz1W31o5l320wd10eG1ATsg7t+BV
	uyAL45xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0g-0000000DsJc-0WGb;
	Wed, 15 Jul 2026 06:22:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0c-0000000DsHH-0Y7C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15e2dab83eso277184466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096536; x=1784701336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=ERfWdSUNSHtwqMIlHILjPdoicBJcUbJxPmotmz1SlNeUZiLxx7X7rTQ1nSj9Jp3hME
         VYMblpF9BPXPZqyaTBtpxs7ZFeRhoaS6+kX+mVt21c960tjMf/2AfOv30lJvPM6/XgLe
         sQbnUEzMidMcLLuWrYoKvV68vVgmancjqa+EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096536; x=1784701336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=Sc+7TI+lV2NTVi+hyVZLPq1zBZGB7vSUxhAo6/GclA40iEBi1h7gDy87msEX9KVmL0
         PoroZ4vUc2N650+Q+i2EqTnds1siW5zaEh4r0XVawoyhKkRunz3TrJjPLthcfCNoeZNw
         T6c2myq07qTP+aFhso5Q5XGkq7H3SoPEGE47PhrvSeqxg9+jhF5+yeARZOh6L2hTnGuQ
         7im8i74KRdr842Z86oQ6uy57p3G+bvH0agg3hb9B4RUCSgurAyqasPvebi0+deO99z+J
         PjN6MSdZzwh6jBbGcRLr+iePDCTeo1Dd3aBoXrmxibRaNGi2o3Z7fdWNuJIbWkEnl8F3
         2swQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLeb7sQHWhjweIMVvEdu7YRrVKa6ZP6WdvQdF6oFzbpASfhti+PSsdC86m26p5OpBdzysLAnWiDKxiEaG8ky8P@lists.infradead.org
X-Gm-Message-State: AOJu0YyPb45ttYcIijcZYkGyIArQ1ciwbwKS/laTH53SjM/SYnqgojes
	PSHHUM85akOnRljMUnO8Cxrs3bT/16PZRy8InfMrmXiJO1gGRS2aUzNhvheO3XHg5M8=
X-Gm-Gg: AfdE7cn5KNJ8T1j3iGOXpo0JM8QFInu0zmwOsBkJe5DnN2XzEw8MsTygWnmHCx7pU8E
	De5wxJYdYstHPsuLO6fGlSL/fABPApgdCSg1cPGwOmRE9OfI2nBFYaLkTm7s5U0PF8FZI5RPO6M
	6P25Htvj9Y/dfebhsCCkwbctQ+AC34Ndaa5fqJATndIpEueymgI2wKj+aw1MHsTungbQ4QzMU59
	zVicsiA2A4Auv/skwdL8XpG5eJbUDdCyiBdNQWkK75CgMhV9rzJ4jMeG4A4nxG5O53kVpLLFJBQ
	CqM2QKtE+NUEtz7rOPp0t4S2hZgPucd54oD2BX2emOXW54BIPL4KrljQ2k6HJzOkCrEj60YgguI
	V0CuBONnk2GKsvIruCS+8mZgbHH2iIvxzP2KD9zFwazrQAGIZou77P/QU6TZVehjLiPvmgj3nCw
	Sk86ujU+PZ2MFbLUlOkdKdPfDlbrCGcRcm3z21TWq3jVMEcG+4qTDnGDdkQwxUc5/5LFWBIcL7C
	tKiMFOZ6Lij
X-Received: by 2002:a17:907:8b99:b0:c16:3187:997c with SMTP id a640c23a62f3a-c163187a0e0mr757455766b.1.1784096536252;
        Tue, 14 Jul 2026 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Wed, 15 Jul 2026 08:20:19 +0200
Message-ID: <20260715062201.3599458-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232218_202786_7F0CF943 
X-CRM114-Status: GOOD (  10.29  )
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


