Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0202CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 05:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFnDPqUapCpZq44H9P2mGHmeMombMf+LktHqojkMpLA=; b=Fc5qQvoZWs7ZklKtjF/nrJ6W6g
	/gGkdEgavtbb2B4iAPwBFKAilhg1s3GlqvIx4KHUwszYlpfu4XIHbPjUJgU9J0APMx7CQ2iUq0dvD
	vc0L4EsspInk2+jRv7FUL7GB3m+Ufz9ApqQyCgSQYaN1dR/dB55xtQGjFqWQExjLJ463HM/n9+HKg
	neOngEYk+R9SUjy9YuCwj+vg/vkR2jacCbXrLBbk+5th92K3Im7yktp9ow3Jb3A+J9Ylvl45coQYE
	AnNKJMlGQNDLLR7dAq5vLiq+RMkv3Xf+Avn3Oxwe4pJsUdAAg3QvhRt36ZzYDl0Av5XZdBfNBMq3a
	S/tUJ0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfwi-00000004BAj-2BSX;
	Wed, 03 Sep 2025 05:22:12 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utftm-00000004A34-2qNo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 05:19:11 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5835J5dg2693289;
	Wed, 3 Sep 2025 00:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756876745;
	bh=fFnDPqUapCpZq44H9P2mGHmeMombMf+LktHqojkMpLA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nGG27zwBFw4zR3DDV+gRfobREsQuTq4FLtmKTXqoJDfe0a6zkpVrAkMhMAqtXIf/H
	 UTQfsp+F0UF6nZR7Cd1Z6IWuZYbRIOkHd2DY08wObCFFu7JUEzF5TDWTQCme4lSJzR
	 9zRBQXT1rxaCsVj1YqQ3JuyTwFnf9/UZjhstmoaY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5835J5pl2804916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 00:19:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 00:19:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 00:19:04 -0500
Received: from [172.24.231.157] (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5835J0rR748052;
	Wed, 3 Sep 2025 00:19:01 -0500
Message-ID: <068a4bc4-70b4-41a6-b60d-be88d67a0709@ti.com>
Date: Wed, 3 Sep 2025 10:48:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-am62d2-evm: Enable USB support
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
References: <20250823032304.1085775-1-p-bhagat@ti.com>
 <20250823032304.1085775-3-p-bhagat@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <20250823032304.1085775-3-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_221910_809710_82A29806 
X-CRM114-Status: UNSURE (   7.04  )
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



On 23/08/25 08:53, Paresh Bhagat wrote:
> Add pinmux configuration for USB1 interface and enable the node for
> functionality. Also enable data transfer on USB0, on existing power
> delivery configuration.
> 
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---

Reviewed-by: Hrushikesh Salunke <h-salunke@ti.com>


Regards,
Hrushikesh.

