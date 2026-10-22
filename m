Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S/FNUnNI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AUSPa3Xr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=; b=S/FNUnNIqrrPSy
	QgriuCt9ws+lyTJeuUfsvYspWauT8Bt7WyzzxS+8XWrk7lAVASOxRQJDG5RMAZv2pkeJAlwvHIZhH
	hiruGyzt40NhM4Zebf4/BZYHW61c7XgkzvUPQyqX54w/2g0AsKhtyIX+nSbTXg8mbyIqqWGJjGLsH
	Ti2+CSSQLUXvgqC3ZnLVipJIFSpFmicy1QOl5gJNMDIjipLwZlM8OtJj/paCqfisj7kF5jxocZIyg
	5WlR7/u4ic62dGCBvfV1gE+h8EUNUsshyIQ738kPoypRUDPB0jtVKJM0obvrIhLHCyUXLJwFJatpZ
	rN/AyU8HynOP5EdWPSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpIv-0000000DrCG-2qDN;
	Thu, 22 Oct 2026 09:41:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpIt-0000000DrBU-2Zm3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:41:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e608cd460eso10041195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662102; x=1793266902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=AUSPa3Xrh9eJILhf+Ar76GyN5lT+OHFIsouxzOlBuNB6/zLqIGcp+Qv9eRsvOQ1DxH
         1YWeqLomJ/DkL0thc0XAwh2CNHVqWGDbcJsElT/tJYTZy/kH1i7zpQ7B661VpLzOhaFL
         zMQv+saX7lbWiH7CuGuMoP+elENY486DOBVhbjelkOd6glCIfRqTeyrJ06aDMnWPoB0C
         m57rasoHk1kvrg3MM+mB9EKe14vUm5PZ1OE/ENRLBZELPvLU2mlZtCBXzoPTbk7dFIiB
         1FxfFNKhYTjfudy0z9qZ7y9HoWxchBusbzvdOrFSmiQo0mkPv59KMhh0IHo5mhbFKcbm
         y/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662102; x=1793266902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=exc9KVh2wF9BKti8Y6wBkyT7rypqNK5M6bC5OHZX60MMuIxfjabmHXlx7+wWXVqRGW
         hQ8E4zz6llxPADB9aXCaoLTnZWoYh+COMPd8aeQUcmdmymGepzeuRKeL2xbnoC/LDgFt
         QOPTmdgHiHVrTMKtgi+RKsGnrxWu9aZ5HrRaF1P24Qul2JEwr0mqR/nJyGxdZMtKPaJU
         mEeEAtViGted+XdXfxVNazdWIYiFDn28Gqtv/pTbabbV0UjDzDv84TNFdNU9s8KkO7OZ
         mVj+iPJbn2pnf3DDXMX7IrfMCh9qzeKiIYxCPLLSoa47uv2laOqLIKDlu58NwU9zirCw
         /sKA==
X-Gm-Message-State: AFq9FYLkS+UsSyIXrhDu6LkBVlJ7q7P5BQjDT3us8cszEF5hieBDygaE
	KIRjYyrCu8l3se3a2DRy4qitT7pxxgsTSAvJKuJOBNmS21l0DQhMwnBNTpw7VQ==
X-Gm-Gg: AYBFou3zUBgXdsdK7AVtrcbIsMpKdilMtRiZpxzm7K3CiA7CJe8AkUOgRNtCLQuJUbs
	6/zINQDRacNwYKQEgv7BqYgHKwnUhsUM4rkOtAqUN68u8SsHmH39XkegIFQvZx1z2B7m4f6HdTZ
	0/okmDCIc8Uyy8M6MlwdbBJgMjC2eT7e+kgllGROryQlpdzh6cEBCUWZFLqM5v7ZJ9cfCeCK2Da
	cUtJUvOq7uwrC1VqorWLIC0tFf+xBeiiKgRtd0QC3IDvLCV2IcJlLf1HBQWIBKA7rIw0433chWc
	NE6xi+6ilUxkVLk3ll9eLf9yEh7cDcbrpSO78hMESnbebua/WQSMKpfE1WQyw5bZ8AePGjmzm6J
	lV75ouV6jA2rfFxGmlPcBf3rz5mrHs7NNEw9NuD07fe4tg3152g84g4BmyhnxCGTga2tM9SAmLw
	D00B2tUj9datOs66plF4MYOx8Ec8Iekh/dAy0LaSuR5ahH8IszYfGlH1aZsgbEpSNzPoVh5tZRu
	qDh24wwk236WvBBx/uxBswNY4tz/NYCCZY7H082BiR/KJZe
X-Received: by 2002:a17:902:da8a:b0:2e9:660b:35a with SMTP id d9443c01a7336-2ea437b199fmr37175735ad.3.1792662102554;
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:10 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_024143_779736_7A20D6D3 
X-CRM114-Status: GOOD (  14.92  )
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

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..2eee38d155 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it for devices that ship with firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.56.0


