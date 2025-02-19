Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81129C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJAWRiJ/mwO24ULAGvQsu0JbzPibtkKyVGXgvcIBl68=; b=tQqFv90IlUw8qux+AWug6i/XXy
	9OEGFDMFVcs8cpYFo0fuuqLT3kuE/uNHyKnmnhmobOjTCVb/lEFxlz/f1C5AKfreRmG6B3LhUovcY
	2qQDq2uifM9ZU/EY2O7do3wH1cJ046sJkeiZQ8sMoryZTXDRnKMJnp0CtyBGJohSDJ8iQ3QizSr4M
	fLEhIQsvqJnmG0tgPNQ+9cFQCvxfaWte/hYTAmH1CmQ3NZmP/Z1SXgzIx4j+zQ6C8S13ImUtdDZWy
	G00agKoZUM+c2eZXr/cR/SG+2OGyC5imDGGqGihnKgp207VpfMcIpAtq7xVXBqoPgAw+e5oxHt8Lm
	9tr9D6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiQZ-0000000CSiS-2k11;
	Wed, 19 Feb 2025 11:39:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiIU-0000000CPgA-0Tjh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:31:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0E46152B;
	Wed, 19 Feb 2025 03:31:39 -0800 (PST)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BA773F6A8;
	Wed, 19 Feb 2025 03:31:19 -0800 (PST)
Message-ID: <f40a1c37-e088-45fb-9d8f-d04db6f50a79@arm.com>
Date: Wed, 19 Feb 2025 11:30:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: arm: Add Morello fvp compatibility
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
 <20250213180309.485528-3-vincenzo.frascino@arm.com>
 <20250214-utopian-griffin-of-innovation-fabc40@krzk-bin>
 <9570e9bd-0555-4abb-930d-3f393df2b4ca@arm.com>
 <048edaab-253e-4823-9083-0e7fcc339fa5@kernel.org>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <048edaab-253e-4823-9083-0e7fcc339fa5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_033122_201621_D6329C4F 
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



On 19/02/2025 07:13, Krzysztof Kozlowski wrote:
> Don't duplicate, combine pieces which look like enumeration into one
> enum entry.

Is this what you mean exactly?

--->8---

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 40e7910756c8..8de508b977b0 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -118,9 +118,11 @@ description: |+
         items:
           - const: arm,foundation-aarch64
           - const: arm,vexpress
-      - description: Arm Morello System Development Platform
+      - description: Arm Morello System Development/Fixed Virtual Platform
         items:
-          - const: arm,morello-sdp
+          - enum:
+	      - arm,morello-sdp
+	      - arm,morello-fvp
           - const: arm,morello

   arm,vexpress,position:
-- 
2.34.1

--->8---

-- 
Regards,
Vincenzo


