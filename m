Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7305CC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYkD1BDeagh/tU4CJQnf9fXkpvpMWmQPMRYmn9m9tvY=; b=Y+ufmH0P18Ud/kea/Tet5PrEsN
	TptiQbagOpmgRZFlgX5anhBj4F/wdSrEBULXEf29z7XZOJnFpVw2lBms5DCbdt5jHFZmxeanbpj5i
	osi/HbubvURaZceCY4golf0JxCXV7nZJONBf0GQ/DYdoubj6AFtafAVoMZai8shrQKGxpjmu8L7fa
	ZEkXnR57F9V5NJfBu+0zxnyDLdeewiVeKqjmf+JthWQaxY6QrSOd1qgJycMR1IhCmDjtWYu1g5Bry
	CC3HNUdANNzsCN35It7LgYG8HO3LPGNkNSRbHYEBSeG59dKZJczkFWjATlh9B3yzlJESxwxhMXOea
	hNjMEqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TA1-0000000CxBK-15HZ;
	Tue, 01 Sep 2026 18:24:41 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T9u-0000000CxA6-0YL5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:24:37 +0000
Received: by chaosmail.tech (Postfix) id BA34B1C7E88;
	Tue, 01 Sep 2026 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788287070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYkD1BDeagh/tU4CJQnf9fXkpvpMWmQPMRYmn9m9tvY=;
	b=C47RqzGMBN50QFiqeZghBFTLkfNglzevyGvp/t34nae41elfZ3+0Zyn4D2LV490ecC4wvk
	3FEW5djWGgMi2I3m1/DHHZCvzzJ85AiUeq6lc3q5fRrPggF3dwZ7SymBOkYxUQkkjokhHA
	+vf3qHLjjqkOSPkF7syqqnIwo2uUB3A=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260901-clapped-fled-2ae6126df5cc@spud>
Date: Tue, 1 Sep 2026 20:24:19 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
 <20260901-clapped-fled-2ae6126df5cc@spud>
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_112434_631610_955ADA98 
X-CRM114-Status: UNSURE (   7.60  )
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



> On Sep 1, 2026, at 19:41, Conor Dooley <conor@kernel.org> wrote:
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - apple,t8122-spmi
>> +          - apple,t6030-spmi
>> +          - apple,t6031-spmi
>> +then:
>> +  required:
>> +    - interrupt-controller
>> +    - "#interrupt-cells"
>> +    - interrupts
> 
> else: false?
> Or do the existing devices also support these?

Yes, they do, we are just not planning to use that.


