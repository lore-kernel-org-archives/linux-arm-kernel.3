Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097660A3807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pPLzqEeW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hN+u4XqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=; b=pPLzqEeWMaiQ5D
	GXK9dTiGZvmxm+5hMJi+GV7LqYv+AGBLwXN5/viW7brOK3lES2oD/jUkzPexToVDNTgkVV/uaFYHx
	uTSURhCNTRM0eParKyjxoEoldRqpnShL3rJNki3ruzlQ71TlV1xpshwQxYDuTDe9LY/J8eZxcg50y
	7fcy1CsW5YP0+IkwsY30GDfkKZogmoSCtPkyG4xJ2F/AG2iEv2X/Q5JqsRttN5zH3HsCwSF99Opeo
	RUzpsIB8g5TWN/zE/RNYkfTXX5u/n1N/ITCisDGa6KhRNKS8Fh6lHMwfv9E6wPkiMP26fhFlVNIf7
	Fl4JjzL5zPY6B+ipTY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZO-00000009S5g-3NqB;
	Thu, 29 Oct 2026 13:53:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZ5-00000009RpF-1YKY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1625656f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281989; x=1793886789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
        b=hN+u4XqAS5BsHcybnBSZrhzfJ/j1FCuuxOv9+qeez+zbP9jAzxh24y7LoGz0mI5rWw
         TUbC+woaA7LMyxspfc78uOw2WkY8Tna2OlDzAF1mrGVr5PaLfIg2pjQwe1Vuj7qGM6qM
         BPJJe7aChkOjOkGiTxIa8aJIHEmf3Y5qcfm6sywYRRRTAkVy3p0HIZmWUwoyNqcFGmrB
         E4ByRS75Le87lievBlfvBjNQaM9K7CB3hB7NJ8gnw/5DJEoo+xOgkvziUl5SzQUtFDZM
         /Z0VhClpJjgJnTVequdJgxyRzy8IkNnzf0LbY5tW1rJXDA5UBYp6IL5WAnSNJyEI43x3
         ZTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281989; x=1793886789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
        b=jdMWObwzu36hl/p+7R845KTtmJd3iJJyN8qi4IQoUGuReiQrzkJgj3zcJd6iflIZ2v
         BNGZoX1zJAexTPczOahRY/tEZBQlbxPq2OGQqmdTtj91I7OaqdeA6hA11tIXgu1AVyny
         8uJ88mX7G4H4/324HLmhvFLJKL95eQDL1Ki+uMCxuJi7anQbjIbe2OugNh9DGdtXsK9C
         /2wSceddtbzn8BY8ZY9A3n2bHhQ1NOBjzNTRGIwhnZn+KIBufXSbSPy8W7hiWji8qIEY
         EzwqFKhm/ICsjSyZET7UU4wxVdEeD2HOBH+SILiLonTd+5K0gQBq+VLI/b5l+OeSiTuz
         p4kg==
X-Forwarded-Encrypted: i=1; AKwUvBwiyO1BzmSYB6MKW5lK7NrWWBg8/QStSj9M0zM+MeVhBHa++2Ls/jnDyp3wGFUZy8RIYQa6fozJRo1vTfXgWBAP@lists.infradead.org
X-Gm-Message-State: AFq9FYJp6Abm13Y5ltufQVRpQhKjRPQfaLa1E8lntY/cJI1CHuVwSCJl
	/35pqOQ8ReOTlW8bEnkIR0wL9xXzjJGqziosw58rG0/EHbxeP3NG4jY=
X-Gm-Gg: AYBFou0588tXdxsvf2TdlCESKO7QAXJncF7O7Sn8z1JRS47r4wjfOlFt2+SIROzvaeQ
	EA6iKjNDchM6h3c5LsC2qpO6YveZPXhDK1eQvSocvGBBc78p9pJ9bfnahdpk4hoimdOLubm4Dze
	yue6wj5KhG/VwSswe4DkpA8Sak0/H0tGsTDDrCZoKvQPyC2QYElVZrPttjurIquS2M1lyzbVlQg
	00/C46TVLBQ6vheleXNoMNDfx2qvICvd40+ygDfq7A6sen/dtph4mBcZylVIZeUxymduZ6Ww6m0
	QT7VDoEtxFmH0cIyjhf2Zi2IY/E1jQhbgT3CtYpMtrTJmPKiTwpkkjMPEkzi6Mu5yhgmix7LZEY
	jX4hgNjVerjVoz07rV4ePjW5lHmZQVw8Kqukez6jzQgpz5nMcGKKlib+1yMyy7LC1fANhN1/nk6
	qefHOtF7yMGBgW5VOPUL7xNTKYv1/4FsdZwDWiVLSrk8Fda+0cGufLQm0N5fB6iSk2ctmpHR4i1
	Nz0DRLPDaBna9R5K4tA9DNcFbxqByzZtpQC2WUrahAhJgR+LYBAGH7VsUMcKZ4KD6z5DYoJSfQO
	5PI3ckud7m+TLT2U2c5nT8HZfcup833DS64l2TJYwEwAAw==
X-Received: by 2002:a05:6000:2806:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e5d5e237bmr9297013f8f.47.1793281988693;
        Thu, 29 Oct 2026 06:53:08 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:07 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:41 +0100
Subject: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1186;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=m8LjyZqlFLsxlRip5l3NXkwO7GG8cECPX+LNQd1tpmo=;
 b=ARxR4H9sfFo+nvh8rZ3WMz/5vBOcWptYc4QScQ6BwDzQQ9ZqJR17Rkbis3J/NCOw2T3Y+DXYV
 1uradRrW6R5Bl+J4M4CED5l+9lrrUHdMAtWHma7WA0JnTxjPc/6/H28
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065311_460384_C1FFBBA0 
X-CRM114-Status: GOOD (  12.83  )
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

Previously both SID 0 and 1 where associated with the same domain.

When LPAC is not used this is needed so firmware can acces memory when
initializing using the same page table as GFX.

To use LPAC however we need to move SID 1 to a different device.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..f47d1dbd06da 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
-			iommus = <&adreno_smmu 0 0x0>,
-				 <&adreno_smmu 1 0x0>;
+			iommus = <&adreno_smmu 0 0x0>;
 
 			operating-points-v2 = <&gpu_opp_table>;
 
@@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
+			lpac: lpac {
+				compatible = "qcom,lpac";
+
+				iommus = <&adreno_smmu 1 0x0>;
+			};
+
 			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};

-- 
2.56.0


