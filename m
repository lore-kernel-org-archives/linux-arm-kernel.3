Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B03C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXtYPxkN0FShPNZtCQz09+v2tB5oa8aca5wSl7XB7nE=; b=EOeQuP+V7YRMVK4zicRqCMBS4F
	rMpG9a6dzebpu7raw1zCydPlYlLzuP3AE3kQ3cREzUO3wnnzHZ8ymf23OWiLUNGFI9FtN1htYFImw
	ZXr7rxplDMQGa+DcHVaCH2N3RV5/CyaCRFclH87mF2kOawZ67GUt7VEOp5g5adGAs2vSRce76bfdu
	fI5yd+dpDyijO+FUNkFq9qqSAyRAviDgjUVT+D3BoCNow6lc+6I+tjTBeoL9PRcdd80FrY6/i/iSE
	SGAMRfzZhELJULDdNmh/CTmLZOQfQq8iRRRe2VYuICvd1q41yaQvcCmb3MBxiRAftgEz8hTvEqPRO
	Jr+DAgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twrW9-00000004VNe-41j8;
	Mon, 24 Mar 2025 23:47:41 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twrR7-00000004Uuu-1OvD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 23:42:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDF9A102901EC;
	Tue, 25 Mar 2025 00:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742859746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lXtYPxkN0FShPNZtCQz09+v2tB5oa8aca5wSl7XB7nE=;
	b=MKi1+MqQFGvKBQMv6rvYCVscT5Ea/EVGZFWhhy+Cp9DphxbDIhFMtF7OfAAL85Xn6l9Hd5
	dilTPqOCoXPD5niqb4Xj31uho+3FA4d6gjuW/SuuWav4VAKd6q8QamMGkcX3yABgY47zaB
	QDnI1j+Iy2HB4WN9Ke3v1KhvkSLsooFC/7v9YGFkCFjQafKqc7v14bw9oMSudt0+Aru4QB
	A/PmqqM29sMX7HKnjS8SQjWeVprVD7+Plhdt59GKzSBKsYD7CqEfn9ucuqKHJAGTkFuYzs
	9CqjfTrzI3iQz6tlko+FREK/DGAD3QWMTiCk2AyzrUNg3QOiShLw8XAkNwPO6A==
Message-ID: <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
Date: Tue, 25 Mar 2025 00:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250324094333.7afb17a1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_164229_528642_FAAD9442 
X-CRM114-Status: GOOD (  11.95  )
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

On 3/24/25 9:43 AM, Boris Brezillon wrote:

[...]

>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>   
>>   	panthor_devfreq_suspend(ptdev);
>>   
>> +	reset_control_assert(ptdev->resets);
> 
> Hm, that might be the cause of the fast reset issue (which is a fast
> resume more than a fast reset BTW): if you re-assert the reset line on
> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> up in a state where it needs a slow reset (all data sections reset to
> their initial state). Can you try to move the reset_control_[de]assert
> to the unplug/init functions?
Is it correct to assume , that if I remove all reset_control_assert() 
calls (and keep only the _deassert() calls), the slow resume problem 
should go away too ?

