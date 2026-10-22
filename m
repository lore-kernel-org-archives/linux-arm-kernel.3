Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5517D606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMIJoK/5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B44T1FV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=; b=oMIJoK/59KHgc1
	efphK9y3vUfy9nfJtXse7b6S6oQkK/PSDhjzLfcJm9Yc3vZQs0Oj3I2Q3W3oXtnZ+Rx+07eyRH4j0
	B6gVfS/XX3+OCTZ1tG20eT3KRnHgiqdSEl9+7K0w/1WUTblr1NHT8Rk9S/hGQJNwlBhsjacEvpR6X
	vGDUFtW0MsIwcdMvnRNYJY70gx44LcsfQj9RLGbGyVcJ32tohVO8SpcRcc9lfQL8263LDtZC3K9UQ
	gtgulcigsIIpCyy7M8d4LPcWDWB89UEdJIybU+OhqDDMv20ScgNIH/GN03lUAWJneUDrgOBm7364t
	PN4JmbnNzDfaeYyQyQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpJK-0000000DrMh-0X7q;
	Thu, 22 Oct 2026 09:42:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpJG-0000000DrL9-2JmX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:42:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2db80fcdf8bso10460655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662125; x=1793266925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=B44T1FV+KkrY3wkG6+mhvkgZMJ+YMqx1LMTl8WfY9tRghd61DSIWf6bRdo4JtH7z6n
         kc/Elnjuz0Qb74Y5AdHR+ARhVCZwpriuosVT/7FXmx/GQWlbbzwslx13hX4SpkmqCXqu
         x+CvUSFDibThkHFZx+AWb+yq+uvWNlgwbzF73hYeCr1uhxtscI06on+F8HCPberklioX
         TaFq5m/swE+pnKKODPw4NwRuaZ8iaCMVnT47NFH8AZsqwNLIVzWK0FNzYR/zslcRicjA
         lmB49HRtQUUifzfVFI+nlbaiohoGZXyalnFx+mzGn3MCivEhctMndJB/0SNJyMO4MlmB
         gTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662125; x=1793266925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=1aY8SbjdV7zVkDXusIDZxs15p3g0q6jdw2ujenfqvZm8rNBxKdI586tU9fW3PsHMjh
         Q73Hqq7+NdQ5aU42+sOeBz5PUXBjC+E4KqGcQCv2cy9zzTLuVr2HX1ki58VcSodee1N6
         lSehAyGosC1+oLTGzInai5rJHpmt8sdgnUliUwEtSLRr5SNale7l7X5qm9vqbdpg1hmo
         rANjfgyl6OK/XMuD7kQqKMkEpkVd5BRnt2cXxrdDNymW73LXlbHg6oIGksVMrUuYq1YZ
         mc5qPCVBpb4b6emuHWBSQZFy/B9nI8W5cC22zdEAxjKLlAiB5MOWAF0npNvNvVkGN+K9
         N5wQ==
X-Gm-Message-State: AFq9FYJ9IW4hmkqeqj63KyOEv9Lw0oT86g5bfDqa1NOHa5k5KfuR5yWZ
	ArdDU2xcglGwIMlpeL0LozHnXcD9iccMO98eCIedcDU9ip2N4hkQNpNRND0LCQ==
X-Gm-Gg: AYBFou2e9IuuOv9zDk/0ykAGc9sQO2MQGtW8LjWkkAoRnVh0OxXp5XNhAUeglhA9OVH
	CmF8KHT+9uyWRz/N+4b21LQmhs9TrSMuY7OPe7EOD5HCRmO9IrFDuPy0QSAMSTDKSUqK67PEpk4
	sS0hPNMXNvmU0/BQb6vOwuQR4tihdXmKItxbwNVJN4Xy/c5auHaBYUOzeDn6yIvFl1+MyhhZ6As
	W2HPesUK9+2LXRZD3Vl/gTi2qJzL5VqsgyrSx3t1WSmpP/zpmvPcOhKN9SkuxX1BawOX5GyVbuK
	VNwThylXkR4STZZBfDTH8G/ScvoeNUAk73uhTRQixSVP5f38HYDHys19Yd5fx74v974KTqTDe6C
	UQPO6vNNIS5crdMlc1Uy1/taz//Q7pFTPCD8LVJlHlMHfj7HCnrUvlxfdHph2Vp47mSFcp1oU/0
	HZ90zHqv4sgvDwSH2m948M9+Eg6QlGJVq7Iy5P5kGgX0AhjRPIB0MyorYPrzO5/9c3jGQTSVGmy
	8u28BiYfCsKdaXymT/hJi8Nk7PMivFFtKA8dO3+zU79fYIV
X-Received: by 2002:a17:902:e892:b0:2df:b250:ad9a with SMTP id d9443c01a7336-2ea43cc2bdcmr36258875ad.48.1792662125463;
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:13 +0000
Subject: [PATCH v3 4/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-4-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_024206_607897_46165452 
X-CRM114-Status: GOOD (  13.38  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
probe of psci-cpuidle-domain is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Skip the mode switch on these platforms and continue with the topology
that was already built.

This is expected to be safe since it matches the downstream kernel
behavior, which manages the cluster power level in addition to the CPU
power level, just like Linux does when OSI is supported.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 06f7e7f57c..7730977e6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -182,6 +182,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de4..a66a544f30 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -311,6 +311,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 	};
 
 	rpm: remoteproc {

-- 
2.56.0


