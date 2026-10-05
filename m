Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F246CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULzXOTNGZsl8i2FLpcSokhpQ3RMxibrvq655plx5ZCI=; b=XNjrenwHR6paLhYviqY8oHhp17
	r/22lZ8BFB8swNcOlW5zK4nNd/8PB6SYBp6nAmlNunKvFERr05wHYFr1xQdPXDsTCaFI1xpUc5fLz
	8vPjOFhtwvOHXxydgx1rzysk0qQAMrof9eNyEcRa0g7b5Tqa6FSWK/JkGeEbNxyg+/dGgpj18pyXu
	CEv3qD/l//HfXjK7KGKPUm4SsgClnmFKqLmBpsSmyFrzNM7Gbxg51CT1s9eUGHh7wk/ZmwcSOgFBV
	lkbExDCSi5P4WbheVCaVR6pod4lWsmSDiUCfWULLHfAa16lj5J3VQKellbbqJNimxOVM14lYY7WwM
	PwtJ6m8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlti-0000000Grpm-1sNF;
	Mon, 05 Oct 2026 16:50:42 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDltf-0000000GrpJ-34U8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 16:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791219037; bh=ULzXOTNGZsl8i2FLpcSokhpQ3RMxibrvq655plx5ZCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=x7OBPfO9JJEpW2akVBCoN15RsWSE4268h6ygySivBpFaCP7ky7RQrHnkr5oKvjb+K
	 xGT3H+SnTDtJjDyHEYVRCudnaiikNr05FT3giJI0FXpYNpmw0wzJNhv8HVF4Wo7BEk
	 0IpNQhhlvksHNoOlDneXKXurFk57ADJXs4sPNUME=
Received: from [198.18.0.1] ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id CA2AAA64; Tue, 06 Oct 2026 00:50:34 +0800
X-QQ-mid: xmsmtpt1791219034tau95ipbk
Message-ID: <tencent_914955849500DD870ACC806531A5C590050A@qq.com>
X-QQ-XMAILINFO: NI6TJc3opC6FnwBB3JyN5aL8szNLbrC3r3O/o187PhPGZ8qmUlb1VVzwccvVkm
	 VcfM+uhFE2ChuvowuTHPmpPW591cRGH56ItSZfD8Ce2SHhzlMIzmxHGNasQWsLz/MDVm2lQV8J9a
	 if3wuxWsRpN6JNrKZa9B/ZjgnyypR1fztgT0csOGUfawd4raWhN47ku2XLmJ5HUCr4npaCSCM2XK
	 bjKOQBlLa0Ocd6jY1Kr/06kDKjfetsn7LOBcPB7KkR2izW6WutafF18Bb5o1D3EWlQlAXvlwFyEb
	 pDrC4jjTzJt8ulcEDqejWDs0jTVgDNrQnR71pEk3eSByODbtVWZfdwIqbyN962rjbPqqGSLYn+Lg
	 TpoLSCoyE962STOaos8IYr9/aD/KA0ruwAOsmQ4eQ9pLaYGge4PMrZec+q1vmNB4XU3GsNjIxknY
	 lTEIjZyxxKK8lwHDVDIzvCz40eAnyDoxeJsIAeukxF5tQBzL71NJ6XB42GPin1YXg1jzx21N9z0J
	 wscTlYdqQYgQ0FZh5VRz3rRkBlgKfv6LYxyZH0LVuT/mBxIWGkXxlDFjbjSqFUwxND+/vd0u7A83
	 RiKuhAp6SLiVer6pN6IjuVaUqbq84h5364Rs4AfRNgjgxZd1hEbbIwyndwIYtjOy+ASmrVaDxVAZ
	 QPiL8jj8eY5NOiqMWDqoekul//3TwKRyDY+JptTYL92cT97uOtFS96x1jIPEZLX0wCoiytixr43D
	 dMTAaHfK/JSRHoB9yIfB1n0Y8si/GpedwaBE8ISaU7PdI396J5THMZOaTMJbCtrlus79Az35uiWF
	 U+H2wjJqZMA7dYJ3J83PFMmi/+sTlhPo05Ie7HZukprx6QwiQHqRhEzCZ8hlOztTcXNBzYpCoMpB
	 7DX8R9zW7zj+w9POOxhwn1SAL3SO7LHabWoFLvslQozGgi2mV4UHJrHhR7cEBIkYG6V6SG1LTj6f
	 z1efEBPHmpYykbBm1n+UCfc6f/tE/dGGOQzOk3bY5ukIFRn919eWnkkfnI/FGhQomzv9fBhtTMBa
	 hlpDcVl2xWyO7P1JigwuyYNV4y3u0tAyfTEz2j3AYjnx1AWUB5
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-OQ-MSGID: <aa9d52bb-5501-46dd-b90e-739dbbe53487@qq.com>
Date: Tue, 6 Oct 2026 00:50:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: zynqmp: Add support for EBDEE EdgeBoard FZ3A
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
 <f1e7750f-7057-4430-9783-83dc8a8a2e23@lunn.ch>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <f1e7750f-7057-4430-9783-83dc8a8a2e23@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_095040_112937_2B250991 
X-CRM114-Status: GOOD (  11.87  )
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


On 2026/10/5 05:29, Andrew Lunn wrote:
> On Sun, Oct 04, 2026 at 03:46:22AM +0800, Pufan Jin wrote:
>> The EBDEE EdgeBoard FZ3A is a development board built around the MYIR
>> MYS-CZU3EG SoM, based on the Xilinx Zynq UltraScale+ XCZU3EG.
> What exactly are you describing here. The SoM or the carrier board?
>
> Generally, there is a dtsi for the SoM, and a dts for the carrier
> board which includes the SoM .dtsi file.
>
>        Andrew
Hi Andrew,

Apologies for the confusion in the v1 commit message.

The EdgeBoard FZ3A is actually a monolithic single-board computer
designed and manufactured by ALINX. All components—the Zynq UltraScale+
XCZU3EG SoC, 2GB DDR4, 8GB eMMC, 32MB QSPI NOR flash, KSZ9031 Ethernet
PHY, and all external I/O connectors—are directly soldered onto a single
PCB. There is no separate System-on-Module or board-to-board connector.

The reference to "MYIR MYS-CZU3EG SoM" in my v1 commit message was an
erroneous assumption on my part during initial research.

Because it is a single-board computer, everything belongs in a single
zynqmp-alinx-edgeboard-fz3a.dts without a separate SoM .dtsi. I have
corrected the commit message and cover letter in v2 to describe it
accurately as an integrated SBC.

Best regards,
Pufan Jin


