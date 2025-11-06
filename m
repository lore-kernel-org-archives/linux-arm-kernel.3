Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D84CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55OuAQr6FIZPr3TAwPNOMnE17WSzk2mx5oUi4VbSojU=; b=DivGyqKJP7pJA9Nc7Hi5sRdSI/
	McGQtlMKZ42KQ0VqPELMK571GJ8b8CUjEpktuYP3fugN7M8GAybofBw6eXZa0XpD1yZl0Do1U8JUm
	WYGCb4RDdhxsUoxd7yG9YpvBpDWkMnG1mzgw9kfQsSSm5QdTU5PnBI5V6tf0ij2k3slg+o1j8qSCM
	R4ayfVomBdyyXZm1I3tM2hT9Fk6dz6CyjnJD8MJXi5G9JS7ww1Bts9UN8Xt9PbAqXXV1WVWLNF0Hk
	Mav03hEXP4PYv/AbsEk5TdjbW88+d+1fv0/tVsxhbMdyHB7o79dufOkGyCmyzTFs4nZOba8G52+4T
	qGmylOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvZL-0000000F4yi-0Ti4;
	Thu, 06 Nov 2025 08:42:11 +0000
Received: from uho.ysoft.cz ([81.19.3.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvZI-0000000F4yO-1gVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1762418525;
	bh=55OuAQr6FIZPr3TAwPNOMnE17WSzk2mx5oUi4VbSojU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cWhr1oqhH0GPTEogfnukErJBnrRr5LRJdzBFsZJi6gqihZMJ5G2B0lrSaK90WA//i
	 JiQ9F3ODec8Pdo2t8YzOIEYpAevHj7AmwcU6AIt4EteEm5q3RWiFBMMK9PNWPqSEZO
	 RUpNnbQrQMYRhvhgLwPverOnuoK/dEx9Y8cG31uc=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id EBF96A03F0;
	Thu,  6 Nov 2025 09:42:04 +0100 (CET)
Message-ID: <5379d7f2-24ce-4730-ac39-f2f103403da2@ysoft.com>
Date: Thu, 6 Nov 2025 09:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6dl-yapp4: Model the RGB LED as a single
 multi-led part
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251105152555.1992513-1-michal.vokac@ysoft.com>
 <20251105152555.1992513-2-michal.vokac@ysoft.com>
 <CAOMZO5AKmKWciyF7-f_mVfJWdLB1rjh_Xi=BhkBAcmV=cJ-nyg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <CAOMZO5AKmKWciyF7-f_mVfJWdLB1rjh_Xi=BhkBAcmV=cJ-nyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_004209_408921_897EA706 
X-CRM114-Status: UNSURE (   8.06  )
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

On 11/5/25 16:55, Fabio Estevam wrote:
> On Wed, Nov 5, 2025 at 12:26 PM Michal Vokáč <michal.vokac@ysoft.com> wrote:
>>
>> Describe the RGB LED indicator according to the reality - it is a single
>> part containing all the three R,G and B LEDs in one package.
>> With this description the chan-name property becomes useless, remove it.
>>
>> issue: HWOS-816
> 
> This issue notation appears to be an internal matter. Please remove it.

Ups. I will send v2.
Thank you Fabio.

