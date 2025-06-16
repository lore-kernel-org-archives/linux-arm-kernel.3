Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OagoMfnHr9bjR9psIALHO3rss8Lz3ES2XX8Z2M0Bllg=; b=wSVjpz545oktQhx1WxikVxvCi8
	IGZKQ94iNHruS0eFL2IfZrxV3JWrhi9cJh4wbqLrDtqyX9APz33v+2oPoJMQu5AFk1Gf82PiVFuYQ
	i7/IpdbChBS7SoBPVZRO20WAjDPTcdDYwgD8P0SJMA78Ue8DOps9W3QAa66emnZuxvCACWId3juPw
	I5OQ1ijLdoit0J5VCo1loniJIuY5PW82KGrjmAl2DOAdI3lHUtjkVHPCZFOy++mEabft3mKpRv/eW
	zVBsgsdml7fg6IT5eUHMBx8EbMDiVMG0fgEBYcj2oCw9FPWsWfyg7EwvYivtyS8kpkYCGe78O0a6h
	JK8uugWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLu-000000055jg-2W5T;
	Mon, 16 Jun 2025 17:10:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjH-00000004prt-214n
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 15:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OagoMfnHr9bjR9psIALHO3rss8Lz3ES2XX8Z2M0Bllg=; b=jFYjKeXyQGGy/RCUClBEhXixmW
	GQARlOoiJ1OEe2HTYOK+pefkvZnjHaKUQB5ObrnKzoaMuEL4h00kZsfccXoj6sp6o1KAllJtW7p76
	nF70Pa98ymbKdtG5KMyNV6HmUIEeigO1zbN4H1ivTDvTHnC7tZnn1wSx695U583Xdi6JCP/ykwe02
	/KW8c0Zwldhr0P0FOdYpx/Jn76O8D4GDK+3rrtxkTeptsAY+Mi5izh0KOBOcHas0zzlVEeOKv1iuW
	/5Z9pObYALWADyiIXsuPb2Iq9I4EQPD2WPUgOYvOGaaSqEF88cNe+OeY3nla3kl0lmahu5ur6AZCk
	H3Plg/yg==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjE-00000003cat-3Izv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750087561; bh=8492Hh9sftwBn41V1sCx1kh7fJYDsSQj3M1IUOmjNxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZB4DEg1iyhX9hHcPY36NlJhyw7YR8EH+7MAMpzHLuVSr2OfkuimqdG96O2zlGiO1I
	 ddMWdM22PFvOHxF63O9ocYlBpzk8QFX6JC3H1qJbHJa9smFSjJ4gZyATUzoJCqTIrd
	 DmHVO8juXi5FKBQwVrpmmqxOrMbKYP5/wtFa2pwDLA+09AstzWNUrQyN9HvMKeWx0x
	 6MIkNUHjDgQYXGbwm3yNi9nM1HpsjTyHu7jXT011RKaW1kvJmTZEwcyBwvCve/2Rjz
	 9Gdjj2jiIBjC2gqD+iyATnMahCbd+nqvrpFRFgb6CU4/leFEC+BzcQG7ekvry4tt33
	 qFRTTMJQI3l9A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9CDB93C2957;
	Mon, 16 Jun 2025 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750087561; bh=8492Hh9sftwBn41V1sCx1kh7fJYDsSQj3M1IUOmjNxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZB4DEg1iyhX9hHcPY36NlJhyw7YR8EH+7MAMpzHLuVSr2OfkuimqdG96O2zlGiO1I
	 ddMWdM22PFvOHxF63O9ocYlBpzk8QFX6JC3H1qJbHJa9smFSjJ4gZyATUzoJCqTIrd
	 DmHVO8juXi5FKBQwVrpmmqxOrMbKYP5/wtFa2pwDLA+09AstzWNUrQyN9HvMKeWx0x
	 6MIkNUHjDgQYXGbwm3yNi9nM1HpsjTyHu7jXT011RKaW1kvJmTZEwcyBwvCve/2Rjz
	 9Gdjj2jiIBjC2gqD+iyATnMahCbd+nqvrpFRFgb6CU4/leFEC+BzcQG7ekvry4tt33
	 qFRTTMJQI3l9A==
Message-ID: <335bf854-1a73-4370-93f4-77e9fd3febca@mleia.com>
Date: Mon, 16 Jun 2025 18:26:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: Add NULL check in lpc32xx_dmamux_reserve()
Content-Language: ru-RU
To: Charles Han <hanchunchao@inspur.com>, vkoul@kernel.org,
 piotr.wojtaszczyk@timesys.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616104639.1935-1-hanchunchao@inspur.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250616104639.1935-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250616_152601_656558_A4BAA7A1 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_152601_656558_A4BAA7A1 
X-CRM114-Status: UNSURE (   9.01  )
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

Hi Charles,

On 6/16/25 13:46, Charles Han wrote:
> The function of_find_device_by_node() may return NULL if the device
> node cannot be found or if CONFIG_OF is not defined, dereferencing

please see my comments provided for lpc18xx-dmamux.c driver, all of
them are applicable here as well.

There is no problem to be fixed, the change also shall be dropped
in my opinion.

> it without NULL check may lead to NULL dereference.
> Add a check to verify whether the return value is NULL.
> 
> Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

--
Best wishes,
Vladimir

