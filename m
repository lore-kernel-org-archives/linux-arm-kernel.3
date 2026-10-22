Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8260A2601
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjx8J0g3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QmjJv84/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZO3QijMDlQGB6qI6turwFa39VuovzlWi+zzZq/Y2Sow=; b=kjx8J0g3OhhfMBPXMBlkNLTnHc
	EGcZxi80dCQDATzyvv8/iKhbb2FFhz4dXn9HG/32PCDbBo45whUmlUsWZT68Akqg4XDSORKjsymKb
	JFU5VX5MOBJuSXFiER5W6zG1Xo7y1jCuek1pZI3N/cZVITahLKgG97om3jfvQo9ca/W43tPGyWaCx
	wWKeopYjdCLfvKMEFVItjp1CWync/grVjum2N2vpGTdNSyw9RUp3zQvLhrwbolDD/M6R5RnqzuUTG
	rvKlc4SOA+EkMcfGU96/cfvALYxxgb132ZV3Jt4SKUH6PRPr8kWw31l38gjLkOsbnFT8d8yo4erdh
	28wPeB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpIp-0000000DrAW-2K4t;
	Thu, 22 Oct 2026 09:41:39 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpIm-0000000DrA0-1AKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:41:37 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d1114320so12456895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662095; x=1793266895; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZO3QijMDlQGB6qI6turwFa39VuovzlWi+zzZq/Y2Sow=;
        b=QmjJv84/d5MXITAChOSJQgoHkfkspgksOyEWmbM7nogLEXosckavJmYkkbIwQgzcuo
         yz2+AntsX5300fst5vjYXhj85qNe0HjdjzO393URxB7iRIN5iVEkBlTnbHcrwlKmwD2w
         ppGLA3XfBVlsiAPq85Vh1PwkPCCS2y3X1RfnBczgwc2b63EaWW47wQBEiPFkVG2/Zcbt
         4qVOxoYoo02NNRwsywKgQ7Ie+2RS0/azvONsjyD3LSR+HSG09oYdTWQz8pkq1YfxkHQ5
         a5SD7/2MigGlpSkOzhiTQlaX+HMquRxhQHHtBuucdJt0xS/CaBtDwqYv0+9V255BB5Za
         aE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662095; x=1793266895;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZO3QijMDlQGB6qI6turwFa39VuovzlWi+zzZq/Y2Sow=;
        b=A6tMTEvF6v1Zs/quaMkhF8VqILNkN/Ruj5igNDGjPzfKOpTUhbWG7Qmr3GGlRnzYac
         C/4MsEeqzLs7Qi5b9dDe6Fx2rtvhdVdWB82sKtWrlLDaydeno5Yf2ZNIKLyv5O3YMy96
         pW2Xw1p3fiH11u0CzRVE9Uf9szgSkn20cvucxtIcsq5vc+Amq4yJgWXKvPifYXYSvt/g
         O+A1fMECzmDvSmCpH8TE3RQhlH5F+un0A6sreFON8GGXIwlv+USxiS0uDaxgPafyLINS
         5CtAwIng69jXA5DXsrg/Cu82akDGjus4O/G4GGyunT/G97xJaP4l+nIRvPRQ/BLVSHi4
         80Ag==
X-Gm-Message-State: AFq9FYKqcYD7khsdAhxRuI37ZFk+Za9bj8pnRL56z8oC+AmduzJlVQQV
	gpDxsUdeIVH6aLpxG7e1ZL+u8TCqrNlxN6CndYX09KtOwxJ0WE+6RIvtxK5RZQ==
X-Gm-Gg: AYBFou2gGJWPsTxpQxHk23koPqeL3wb5HTJRVnNkIs42j6t3S8DvLPowVD2ldcCl3/p
	1fdAlyALGau7qB+cZWkYdIHmf3zux9wZMyPlgkCZ3yKJIrRhtqToI2wdjsfMOGvN6hIrYWaU446
	by2Y1hbwkHr0kWWw3Ld6l1SgWeOK0BZxumXIcoj1qufqMo61B5z7e/OZ8lEBglkfwJEUC0Rw0Pj
	15E/lH0Oh+R/Adr6Ac9MP3MGT23EHTl1sIZZwTVu1H/P4r3+SOpoqPf15GV6V0QAkPbkqPJhW8D
	t9n45yKIdT37fImeGaIO/Jz3qYANHr+ZKmKQ3PK1Y9UhP7qfQ9ezsFJU6Uk36HEv9OumZmll/vP
	dlLMej3DYonWTWfWPs8+cQvELGO3Rg3D9wLCkAsruF/gj7I1sHSoTWeIFV2Rb34QFoLlqV3wfOu
	/Yhc587aEhgw/va8we0b8zZ9T3KJ0fZvYvvdA1fWhgsulIo0XrrK3LxahBvcSctdQFivneM6dsU
	uoOsFXIi9IgIHXvi1NW0vlc1VU6AbKADCb35kJKbjH0hZWEHg==
X-Received: by 2002:a17:902:ce10:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2ea43fbc008mr40821225ad.48.1792662094813;
        Thu, 22 Oct 2026 02:41:34 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:34 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v3 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Thu, 22 Oct 2026 09:41:09 +0000
Message-Id: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4V0bU0fUsCV/2FclHaAMfJIi42G8
 O+2GCPLOznnzEI8OARPztlCHAT0OA5xyENGTKeHFijauIlgQnHGJZ28Qdrgi5ZaGGaVUKrRJOK
 Tg3jeUtfbd/tnfQczJz8RHfp5dO/tV+CJ+2WLfzZwyqgFq0EUcNKSX9pe4+Noxp6kbBB7sdyJI
 ooyb1Re5xXUld6L67p+ADr8iXrrAAAA
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
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
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_024136_334767_E88A96EC 
X-CRM114-Status: GOOD (  14.65  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSCI on Qualcomm MSM8917 and MSM8937 advertises support for OS-initiated
mode through PSCI_FEATURES, but rejects every PSCI_SET_SUSPEND_MODE call
with NOT_SUPPORTED. The cpuidle-psci-domain driver treats this as a
fatal error, so probe fails and the CPU PM domain topology is never
registered:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

This series adds a "skip-suspend-mode-switch" property to the PSCI node.
When present, cpuidle-psci-domain does not call psci_set_osi_mode() and
continues with the topology it has already built.

Skipping the switch is expected to be safe on these platforms since it
matches the behavior of the downstream kernel, which manages the
cluster power level in addition to the CPU power level, just as Linux
does when OSI is supported.

Additionally, it also adds the property to the PSCI node for both
platforms. For MSM8917, additional change is added to fix the system
being unresponsive at idle.

---
Changes in v3:
- Swap ordering (patch #3 <-> patch #4)
- Link to v2: https://patch.msgid.link/20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com

Changes in v2:
- Small phrase change in the property description
- Added property check in psci_1_0_init()
- Link to v1: https://patch.msgid.link/20261017-psci-fix-v1-0-dedae27e4a31@gmail.com

---
Alejandro Tafalla (2):
      dt-bindings: arm: psci: Add skip-suspend-mode-switch property
      cpuidle: psci: Allow skipping the suspend mode switch

Reza Kurniawan (2):
      arm64: dts: qcom: msm8917: Use a shallower cluster state to fix unresponsive idle
      arm64: dts: qcom: Skip suspend mode switch on MSM8917 and MSM8937

 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8917.dtsi           |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8937.dtsi           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c           | 16 ++++++++++------
 drivers/firmware/psci/psci.c                    |  6 ++++--
 5 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>


