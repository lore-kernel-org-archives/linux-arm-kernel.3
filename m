Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DD1CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U1t8yNsMnwDcRwHSJ4AwPrQ1VYreCvHw3ciFOOd158=; b=mYgjXYGuzuW7kmf+c2IeeuYDEc
	HUl9D1hc02GHmKOKamoBrqc+Vkwjtlb+Q+OpU0gLTQsJepc+hCD1q5RGBBM/KWqs2iU9vXF83pjEj
	vhojby9G3ur0a5Oz0ixPw8S7+mMbs91bFjKuF4/lbF+Lt9fQkbzYXNZJpVvtPdylf/J4EVW02DYzb
	ob/NLINN+xB1DGEScSjUEGFfmgP9qUWcxEB1mP8aIs/kF9NrPDuuzTZxCvHo+jeHEuGDjH/A+pHX3
	ik31Wa6ez30c1QGsUnw0cJ3oxvW5u9G+QLemeDTLoZx1FmLFtlApDhZNWYC5JwC6ubDk1/l3gtTtr
	cw2Q3G9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvEI6-0000000B0n3-2FTd;
	Sun, 07 Sep 2025 12:14:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvEFJ-0000000B0Cc-0Nw3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 12:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 414AE601F6;
	Sun,  7 Sep 2025 12:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EC6C4CEF0;
	Sun,  7 Sep 2025 12:11:47 +0000 (UTC)
Message-ID: <27d10a83-903b-4ffc-976b-10973f72a617@kernel.og>
Date: Sun, 7 Sep 2025 07:11:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY
 address
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, dinguyen@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241121071325.2148854-1-iwamatsu@nigauri.org>
 <CABMQnVJVTmnsx3RNYK01ikZ-jnn_y4pbrNAeZaKPzz0N_YFz5g@mail.gmail.com>
 <CABMQnVJsK3wNRQfGjomggKcwL5zaqBchoAKajbVb+ZXmrwn2iQ@mail.gmail.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.og>
In-Reply-To: <CABMQnVJsK3wNRQfGjomggKcwL5zaqBchoAKajbVb+ZXmrwn2iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 9/5/25 10:12, Nobuhiro Iwamatsu wrote:
> ping?
> 
> 2025年1月14日(火) 22:50 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>:
>>
>> Hi Dinh,
>>
>> Could you check and apply this patch?
>>
>> Thanks,
>>    Nobuhiro
>>

Sorry I missed this. I've applied it.

Dinh


