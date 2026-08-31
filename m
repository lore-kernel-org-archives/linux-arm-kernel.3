Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB138C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chiMGMoTDtadcW5BAFVin4DSW80fvvj3LIzuaS8WzUM=; b=3jaJR5OfiP7cZ/DP9/z4+xZdY8
	V73ehMHECPD2ej/akm/9KvhQB58UBw4iy+Um28CXItWhRFVuzNdK/VGS0qQ7f377Mr8uC9SiX7d7q
	gxt/EIBnM7wN73/9TP/G3J2zina7HTuIe7bj7FvS/7TLP+NtBaz0mVYKAPV9/jITCamHKdga2KzGD
	4sT6N/e8mrpQN9cC7HbumfExiLN0+5PowsXjnE0yGmloP7Bte+wmhx1d/GKnzvZz7Azrw/xd3Ok4h
	JRXZUgMqs4Ypy0RecN+ptSe3OqZQq4JYbaAZQLCNMXkAVMZkyGRWdeeu2NH5dyVwVG6eoPqQno9lC
	anq8ezHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12iT-00000009b0e-13CE;
	Mon, 31 Aug 2026 14:10:29 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12iQ-00000009azh-1GFz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:10:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BA0E11C0AE;
	Mon, 31 Aug 2026 16:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788185413;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=chiMGMoTDtadcW5BAFVin4DSW80fvvj3LIzuaS8WzUM=;
	b=DLXs6x2PgMEz8W1bxUwp+eQG15e0URusVWSSxSPkKI/ppPHEeerTEb/Yc+v8xqyGEmvZw6
	SqSQcZfj5rH2/w7vi3ivQ+VCHKr0ch1PXRzcBb6PqpnqUlW01gR0Mt+PKUSYW6CediCzh5
	F4+bqeGATMwCJLNyZGmydQGyfAL3fI8uL2V7+ym9KIKzldAYjfWa72jcAL2aG93AXZs8Kz
	aMHm3YG3W0ceSKp/UoVWa9HSUH0rerUmpi8NlGr4nM7GEMPSGpn6DswQDJOEcHTcG754cM
	6lo/UfUrcCRm3PmYYjgP3uz032FWLKFuB3CvlRcbVMAbw1WNwPQ8NAqVi0NmPg==
Message-ID: <e90c42ab-010a-4038-8973-1bfcb3948c4d@nabladev.com>
Date: Mon, 31 Aug 2026 15:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: generic-ohci: Document ST
 STM32MP2 SoC compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828155647.353877-1-marex@nabladev.com>
 <20260828155647.353877-2-marex@nabladev.com>
 <20260831-judicious-incredible-aardvark-baa48a@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-judicious-incredible-aardvark-baa48a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_071026_556804_8A54456A 
X-CRM114-Status: UNSURE (   8.35  )
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

On 8/31/26 11:01 AM, Krzysztof Kozlowski wrote:
> On Fri, Aug 28, 2026 at 05:55:45PM +0200, Marek Vasut wrote:
>>     interrupts:
>> @@ -215,6 +220,22 @@ allOf:
>>           clocks:
>>             minItems: 1
>>             maxItems: 3
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-ohci
>> +              - st,stm32mp25-ohci
>> +    then:
>> +      properties:
>> +        clocs:
> 
> typo

Fixed, thanks.

>> +          minItems: 2
>> +          maxItems: 2
> 
> Instead these two list clocks with description
Like this?

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml 
b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 71537d268b075..7a8c3c2318153 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -229,9 +229,10 @@ allOf:
                - st,stm32mp25-ohci
      then:
        properties:
-        clocs:
-          minItems: 2
-          maxItems: 2
+        clocks:
+          items:
+            - description: PHY clock
+            - description: Bus clock

        required:
          - access-controllers

