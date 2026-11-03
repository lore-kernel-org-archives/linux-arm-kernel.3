Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F267606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DRNXA2kv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjIvwZ+2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=; b=DRNXA2kvLSZCvJ
	eOYcL9Jc7d+MkWydRvFXq2l5EvZg4Gagc8G3+GU/cq1Vj+GhuWAGIZhj15p+lGVXsju7tODCSekVM
	fB1H49fSbsoqZkG033V3ZcBRH8BB22uqbETrKFFhKNrrXOjtfh6b8gRfRVaQVLILDJqqHoZ/j7uzt
	bTbqEjlxtCSsrkxr6VdEWk4cqrLf3LfmK8/f03mllWHllTbnCr2nNyD8ieJU+o3Dcmv9AvYTzwZrb
	ALzoe2o0K/+et05UyBLSVljX1rm+/GGSeJekKVcJibhXtpXE12LPNURiw6eQTvQgF8eNzU1R9pEFJ
	UEKKcCIKPqhwVihc847Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK6m-00000003WIg-0hku;
	Tue, 03 Nov 2026 19:23:48 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK6f-00000003WBS-1Uq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:23:42 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-845f3fa7f38so1974845a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733820; x=1794338620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=wjIvwZ+20t0+gNjslD4ZhTyUFMTg8vj/nzShLJaFUhF3bF0knvbtki0xNfIKIzf705
         kDXWWSQBw+5lMDWrLvp52nMancYYEod7T8Zc8byKx4vuKW7pL7Q9fLn4pN3Wa/XLDDMd
         tgk6RUQIlk5knF/6ZeB3QXi0CwPY5In/8sJhEXNORxtYnsrrqsaMvl3h9sLs9RtVI3M2
         R49COJVvJJ760YBQyr1mtq75EsaDbi/Lx4aR2urBu1zctyG7Uve7ewtt2sczUa309qk6
         uAPvhZf01S1H+We0BeqdC0MLZewZUHW55cubZSDOblkVRMhmne+c/JPTGv5oi3XshUWY
         S4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733820; x=1794338620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=bjhEvH+4fwcpewgl0lZCnaT8H2ft+4IjSTP79yBw75t1FK2DNHRzH5i2/7y9Yce33P
         0HmOBqFSa3ciHoQjcSBklnKV5RY4kP9XQD3Ib6yFbbdeflc/kldFJ81Z8Q5dXrfRPvd0
         OO9o2mZguaiClFTfDUvTgJySCLZdhyfmBzuroHWa5Ats4xj++A1HoB8au8XpwxvL9ief
         z9Hutj65aJLqMBMNTh5c0dZB1IvlAV8l3mR1zxO7IrKjmD1v7g0/QyQg7Qf9YsSUG85/
         AnlxZLyUU5evCrveEa6e2ybUTZXMgwnehkln6oUsPlF57q4PxTVpGsplxh5syzmWkiPF
         R/+w==
X-Gm-Message-State: APuU4Z8pCGYa2h4wFTXDxwS0k+dZeD9Y0mcqSGdKM33/DOgzKZa2IfBl
	ezZqNOxmEiok7zMWbSdPyy0C35VQQWIw//g3shlo6HqV1FN5xoQKQNxx
X-Gm-Gg: AYBFou0tQwIWqYSX9TfpvZzo4QYT1l5O5ySqfdkHkth5/Z5rVfHr2gFgArSwb1LfD0J
	rOvr1NSWCmnzdT9At3PGlBc1PDdVXTZ5+5lP4/5YEsYyiSO0UYfN1oBrDEqDUq5qJ/bnVdILCX2
	nJKfy6XhI/1TJInHti5zX7pHR5j24EXkSWJ4QRX7L9vEEq/xmaNYlPXunUeSthQEcLBFp9xyrDz
	Z9T5KFKBCZVWSX3lbCEqfiO8g7NWyotoQI6m4wIJB//0MQytlLqnS8SmbV/bUIocJJlYxsuizSz
	5Nxt+7v2u9bC4dfbYy6H68nw9tQ3UKYeZUrKnpEEu8LdOFdAKKyGISob1GW4BH8tzOl6V+pD2rm
	dXer23iPtZbEYdnANPjzR/UZZ0upwPGmTNmwXbNA752kWTHqrsXgs4OiyT/FhjpUb448OpdFPnw
	SXvslp71q1k8pRAA19KAaLdk3mDY65q9i3cO1XBgOvEiScR2A8sdzDcuvo13X2vRsa3ZK4+dVct
	++To/Cmco2wJXgM+nkbpkzzeii57X2e7KHpEIKXUV+q+n7kpihgvrWWeGuhtyNL0TJ47aY4J2Le
	wAZYOFtj9RjjSIURGrEFinMbaz0nMQ==
X-Received: by 2002:a05:6830:680b:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-85d3651d32dmr9328662a34.6.1793733820420;
        Tue, 03 Nov 2026 11:23:40 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue,  3 Nov 2026 13:23:31 -0600
Message-ID: <20261103192331.394489-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103192331.394489-1-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_112341_403921_D5853233 
X-CRM114-Status: GOOD (  11.33  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the timer node for the rk356x. The timer is present at the SoC
level and is register compatible with the rk3288 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee..cc3faeb9a86d 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1373,6 +1373,14 @@ i2c5: i2c@fe5e0000 {
 		status = "disabled";
 	};
 
+	timer0: timer@fe5f0000 {
+		compatible = "rockchip,rk3568-timer", "rockchip,rk3288-timer";
+		reg = <0x0 0xfe5f0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru CLK_TIMER0>;
+		clock-names = "pclk", "timer";
+	};
+
 	wdt: watchdog@fe600000 {
 		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
 		reg = <0x0 0xfe600000 0x0 0x100>;
-- 
2.53.0


