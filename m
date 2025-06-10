Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA7AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=RpTDuz/r5hier3kTE7/hz4Z4/G
	I0zlpBvM/HzVqiy5DrxiWwqlsMPWHJRbLZXfXjRj8GKaw9cgi9RlCzltHLedgz0C28m6CI5NbiQDw
	EtZXfB9wTrW4N5nDNR48fkamFXp6uosT8w8UAbnv5IWGydfiM6dsfY5kzS2Pq18zYPi4ApEEFiumG
	etifduBIxMOaDYSYTdmTaKlDU12iXWTv8ylyt6TnpkfcBUk6nWKuw0RFxqaJ41dqKohwU857EO2kf
	b4H/mJP3DWzrdHzGGVdqzIoqk6HorJvQ1upv3n9dN0WID/Vok9FeoYnyRy9qNkbOQ0LqczKRSyspV
	UWUspn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3tk-00000007pEn-2dUD;
	Tue, 10 Jun 2025 18:40:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qO-00000007IvZ-02rM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=I4GM/wNtvFHRzzDuqR8osPlaj4
	h2Xp2/0HhwrOg3bHdal1AI92P3gEkM69phAIjS9cZ5fqB4/D8uetbztUnEtcX+vd3eqq7vUO+SZdz
	bg97l5S4L5oxS/UDQh5CfAnmLzxbmFN3N8gUDDgMNCqNpOagWZvidBDbgfxB7FJCJExyJiHp8beMX
	Ri3wNWTb9fY2Pd0H84LFi3OQauuOnL13im7M+QzmknPLw3bqW2XFE1ItMDm+mp7pO3BFX+v0ukUWS
	vr7KIHg3INWnE/2Tj+0HanuxDrbGAi+3jRv3I2x6RVCQ33vVU52d8QthJg4+OvEyqtNujt+4Cux9N
	dc/+Otug==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qM-00000001tlR-0NZ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:24:55 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AF2ajh008882;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=z//Pr8FTUgK5fhQS
	LDClSELw6xrfVI8qqFOjd5vg1DI0uZJ46O+CNCYz3tnpr6kwqJzm0k6FAFIiGOwc
	zBxFkYeku5SvKibqNo+KsTUvNwxun9u57aqxYvxnqQp14qRWBQw/16qrjZtxvbfN
	evlgIOa6602atbj+SgcxV8+zcM5LViVbp23mpAjLmk1KElUyon/HxhBsV/znhXwB
	M8xvc9aQCun1EYBdqOa2QNjMABmmBT61qOA0M0o8fosClZER4nlqYsjhElXPDIOB
	vlePucM04lnuuEhAajr8SVFqUR6RO2wXkkw5B6j/cCfbRaVUR78CNQuE5LRBdQWi
	RMhs5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume5ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6114040053;
	Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA782B79BB8;
	Tue, 10 Jun 2025 17:23:15 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:15 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [RESEND PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing blank lines
Date: Tue, 10 Jun 2025 17:23:09 +0200
Message-ID: <20250610152309.299438-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_162454_267251_3CF1B6BC 
X-CRM114-Status: UNSURE (   8.16  )
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

Separate the properties through a blank line.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 5d17d6487ae9c..961161c2ab62b 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -32,13 +32,16 @@ properties:
 
   '#address-cells':
     const: 1
+
   '#size-cells':
     const: 1
 
   ranges: true
+
   pins-are-numbered:
     $ref: /schemas/types.yaml#/definitions/flag
     deprecated: true
+
   hwlocks: true
 
   interrupts:
@@ -67,22 +70,29 @@ patternProperties:
     additionalProperties: false
     properties:
       gpio-controller: true
+
       '#gpio-cells':
         const: 2
+
       interrupt-controller: true
       '#interrupt-cells':
         const: 2
 
       reg:
         maxItems: 1
+
       clocks:
         maxItems: 1
+
       resets:
         maxItems: 1
+
       gpio-line-names: true
+
       gpio-ranges:
         minItems: 1
         maxItems: 16
+
       ngpios:
         description:
           Number of available gpios in a bank.
@@ -187,18 +197,25 @@ patternProperties:
 
           bias-disable:
             type: boolean
+
           bias-pull-down:
             type: boolean
+
           bias-pull-up:
             type: boolean
+
           drive-push-pull:
             type: boolean
+
           drive-open-drain:
             type: boolean
+
           output-low:
             type: boolean
+
           output-high:
             type: boolean
+
           slew-rate:
             description: |
               0: Low speed
-- 
2.34.1


