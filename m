Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B71C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3d6qXAoH2ydeKOTX+N21t6om6kaUfysJTrx7H/1Esk=; b=DSEShzT0Q8SJEMLXlZxsZWh/na
	CJ8oQOpbf0DCwWxgGz2hTRo7K0WcmucCix1Vc3lwvcohFl4RxZsAs2Vt3SUuh5LFDHDAgulyturJK
	95DYLDG8Oc+lS5hRDgLXN1gB7WvUgXiWwcxOUtvece8OM97mROPtj0Fn6Bpi0/HnEBTJ4HxFGFPlN
	Li832vb76zvmNKcvP2U80pon0Th4mLxrsXh5zsnCu7Pq1Xp9Oa0G/xcW0heN7ZZvb5zZpJ7DBWAkp
	V6e2PUcVq3WDbOnfkDbFe93oN73gOulHqRN19zuOZUKEzy6TYK0W15nwJksyYL2/opHZePqUg7pvo
	TAPkr46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWF1-00000003iqY-0zDP;
	Thu, 27 Aug 2026 09:17:47 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWEw-00000003ipM-1y4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:17:44 +0000
Received: by chaosmail.tech (Postfix) id 0B8ED1CC004;
	Thu, 27 Aug 2026 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787822258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3d6qXAoH2ydeKOTX+N21t6om6kaUfysJTrx7H/1Esk=;
	b=RTM768D65uV9EGE7KIHZHXEhVA8fU4yBLezNY2ButWgK+qMZkKwAETCTj8wIp+DumjX51z
	hgdse1rrUH9++OWsmH35RBcoDRLakI4cGy+3OBM58tHSmY7TV68CK2JKmKAZwesmemOL4k
	06UqESq2A1V6t55Qd1/9nmXJZfUDYfI=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260827-curvy-competent-bee-fcd81d@quoll>
Date: Thu, 27 Aug 2026 11:17:27 +0200
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
Message-Id: <E0136D1E-4CB0-44A8-BB70-D499F113D211@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
 <20260827-curvy-competent-bee-fcd81d@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_021742_977831_0F4C67C5 
X-CRM114-Status: UNSURE (   8.58  )
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

On Aug 27, 2026, at 11:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> On Tue, Aug 18, 2026 at 08:32:40PM +0200, Sasha Finkelstein wrote:
>> 
>> -required:
>> -  - compatible
>> -  - reg
> 
> This stays. Which device does not need reg or compatible? I think none.

I have moved it to the else: section of the if/then below, so it is 
still present


