Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VH1YE1sJ;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EWdyuEUY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=; b=VH1YE1sJA6TrMv
	uPQ2y3Sc0nRE9eg6urGrG/A/fuoM4rpprBkGmO+j3vqh9FkO2z/9h8nwkxT/WtSSdDGTKqHj8l7c+
	JmtQOYB/Z74aRrHadKIizI0dCMSriqjh2ZzN8X6yMS/hd5n+IzawYl41vvBUox133DIEwvuM95GAf
	sO8Z3ym/6/Qo6Ws25BqGqKUdRSuUlUTT/7exQ4XB51jqMiFe6cqxLE43jP7osbZCrIU7NUXn8lADr
	rt6agjs8Iy8mk8vbsRm6ykF1EwB3nGUzriCH4gbvOyzdUCpd2ue/IfNY7yFzM7SZ3mudf3YQmvgFz
	jfbxcxkstTfodpGU+6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRzH-00000003H2O-1sSZ;
	Mon, 26 Oct 2026 21:12:11 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRzE-00000003H0U-2sfk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:12:09 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1137175a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049127; x=1793653927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=1u1IddPq97+5nI2jUps5tnbpImS8WsYievoeqo05/7pmS2C1KGGND4lRVURB9jgyAI
         7bI+crMeSng069qtEsftvRHzPu3r49cBuPV2SsfDX0XqS4DTPOcnb7ixfg3ni4Ryuyat
         SMV5FDFYeLBHr8Gczp7SFrwJQferaLn4oOGc7Wv9v/zN6gq1GvNrLB/3X/32G11ylD2O
         +higGqoMX2yimVViXboDeQMGNokf5pPyd9xVuRSqdQk6c/EYChhQADSYeVajykMh4Rpk
         YBm4tmALLZvhTgy2BIEeBwchESA9VG2+/VIjLEKamAvqVnOLQ7SuwlvYINf+SbCwzlAa
         x6WA==
X-Forwarded-Encrypted: i=1; AKwUvBzIPSSJ01vIwjKJwuGne1AoSU4pw6krgg2N0mcfKTMLkRakxbUvPCL5C5hW5eDOgZg8DXbYU2ra1KHxfb4ywenq@lists.infradead.org
X-Gm-Message-State: AFq9FYK65DTxnm3E5u6cLZ3cSd2GFSb9EtDfnmnTWh5v3FfwYNg9tdBy
	E20JShuyCJXbrleMLtU1CUymptcRzUg0/WyG8T/OvdVmdsd2+1Jy1qU0flV4RBWo9LfLPsuj75G
	bYZ3JBfkmDh2eoxoEM2H1G0je9KjchD6fhQI7wtiFgZqkPTjIEJDQOOyMjHcbXuoiyGtJawPAfk
	u5A1rQytGytaWichqUInE3oP55hJGLOHRvv0KvSTc5/jeDcndvw2x8gv4CsFxgS57ZU3eYUnoTR
	QN4kVn40ZH0cKMS2PrxM2K377/TaTZIZT7GoA==
X-Gm-Gg: AYBFou3sKAv2nPZk0RSMRRRj/1GmC8mTp955D8Qzk75SisZ9QFjd0UXUTMtcXI2TRIp
	kQVXQYkiaB5GLlO+hywzXEAbddHlqR04NjIuuW+tuiOFQf/aQGEN/Lk0t/BveZ0SzamKAZNsZ7q
	0J2Dprr40sLb5J2oOD9BGdCVyuUpzR3tNHfUDZGUxG21E9TSiwSEHBbABFR0e4JQYBScVeGOqIy
	QCuT7iIBDQIHvF7JdVXmdt7tvn+j/Qpyl6iNTEbbhFpWLxE53UlrB7qXvxT4/xCHMRoKoU2yfuO
	rnKZ7JaKbd5lvTUdiksLjsZnRCEc+J8Lb9MhkROS1HwTINqOguA1I33nw474Ex0PxwUS85V2Gzy
	/fxhfLuj3CLd5guTvVbF1cKP8VSqBq6GlwDFFI2WmzgCostlLVoWzU15NsDFgFkmlzudxYMiRI8
	5A5WHG3jLDVJ5d9UXG0j/SlEnvQPaw4/Yb93/Fd/DV
X-Received: by 2002:a17:90b:4a86:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3adeae6dc28mr5939428a91.11.1793049127511;
        Mon, 26 Oct 2026 14:12:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae404ce25fsm582504a91.1.2026.10.26.14.12.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so4093036c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049126; x=1793653926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=EWdyuEUYZR3CxDabXpruV/XTDdBKZ5i6QsGxCWweHxilzMx6tPR8OjRCnbqGjYPlUR
         m86FVc11q+nnRvXz04GqGapPzpWYn/aEG8EDJPqid4hJkMIlLhqu0E9qM5VQ2ALjUcTw
         7LlF+U1TKGcFFj1FRAswmLNlC89UtdFNDK+dc=
X-Forwarded-Encrypted: i=1; AKwUvBym9ePnEPLeXjJhhO7dPmbmqJUYfM4ibYcqe27wWRyhpeRB7K7OmxByhQZq0Bqm2XWtqpEVLlyL3lAWkWiZHgPl@lists.infradead.org
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277901c88.28.1793049125719;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277868c88.28.1793049125085;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:12:04 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Mon, 26 Oct 2026 14:11:51 -0700
Message-ID: <20261026211151.3212237-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_141208_727740_40CFB7B2 
X-CRM114-Status: GOOD (  11.78  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0


