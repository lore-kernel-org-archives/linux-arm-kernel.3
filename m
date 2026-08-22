Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399D9C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT4ZfaeeW+xDfLKh1vH6ykikxBYlIkfGuYnlJdpbz6Q=; b=ooGByREtGNRw/nQFsJZ2Lo+szs
	2DZtja1Is5vwdSTbe4S0sahO+K9SlRcSja/ti4QhIijMlfttIy0PI2F0Jfrupcg3yVqo6dEMjSJp3
	3xXCPojIsjkMqv5+sexY7Uz+U+FY0Tn/MW82yqpxUyvJYFuVSjrD7O4UfOk/c2kLe7FEUHKlZxPHB
	6V9ALrvc/SM6mabaSCHNaz8nN7jI6jgmUlOMuSEiYWTMdISq2OerUoA+z1Gg9fSzkCttw18/oMfld
	SvE4EEsypH77M/rS4jMaeAaHDwh52WbrwPE3pCAZF4UNR3By5exBXUPHYRXXwfKn1QeltdzxvW58D
	zcV05FtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgal-0000000EMrJ-3Kb6;
	Sat, 22 Aug 2026 07:56:39 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgaj-0000000EMq5-2MUv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 07:56:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 188A611C824;
	Sat, 22 Aug 2026 09:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385391;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zT4ZfaeeW+xDfLKh1vH6ykikxBYlIkfGuYnlJdpbz6Q=;
	b=A//luhdogAjSYjMVwX87YwUv29JcAAwGxvKY2UWLDydr+E4gK62XFHe4re2rrfIasUebo6
	XQ4R2bHaiDNiS/Pn/2EPtBcWquGqkB7/8LYYtSbWJmWvR5X/boRRTZ/t5QV9kMeKN/jXjC
	cFJ6CLNaS0DVAzaBvyojmqhhYTF27IbsOSe+kBw0FWcmKS5XDKxChXz5cA+ab1dKScaDkL
	tt6QLtLbMjUri8j9w8sLHD8O+bCNIi3svcUPdtMGyZthWTOFHfIeX/jWCgV2hw0Zb9UbNj
	4xSX5q2XqMzu8ecYGPO8BILvWm1qA2Z+BMLg7iNKY9oRZJYHJ3tAp2PaGfUuQQ==
Message-ID: <225f1704-399d-47d0-8bca-73a27a59bbd4@nabladev.com>
Date: Sat, 22 Aug 2026 06:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260819163410.119755-1-marex@nabladev.com>
 <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
Content-Language: en-US
In-Reply-To: <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_005637_756459_B743C4B0 
X-CRM114-Status: UNSURE (   8.87  )
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

On 8/21/26 6:27 PM, Fabrice Gasnier wrote:
> On 8/19/26 18:33, Marek Vasut wrote:
>> Document ST UCPD Type-C block. The UCPD integrates the physical
>> layer of the Power Delivery (PD), with CC signaling method, for
>> operation with Type-C cables. Vbus and Vconn control is performed
>> using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
> 
> Hi Marek, All,
> 
> I've sent a series for the complete case. Please check and review here:
> https://lore.kernel.org/linux-usb/20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com/

What is the difference between this driver and the ^ driver ?

Why is this driver not covering "the complete case" , what is missing 
here and not missing there ?

