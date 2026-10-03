Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE95ACA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 21:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lybFAex9WxGAgZ+zpS5TZW8MDwPCoDmGh2YO/5uBlvI=; b=RCjl3Mxvi3iMi37NmAqgyj6/c3
	9LKermv+HrxB+Ve5me+gm2+OAnkV+BAtomzx22ZZvf8o57bub9BhIFUICkR7c77kZYCwkM/b4uasD
	t83OERV5uBXhp+FdwEDeE6QRvlYoQ5aXR8y4AOIIYcrnNCxcY6GE2PXXT49JvFXeG/wQJvrwtUK53
	/zQ2GKj+eZz6vIVnjlzCs6b2gJjK94Mby60g5KTLUDsR1iXVPyXAomxQe+fmJJbTlOntxneVYaKXb
	8vNZZiWIFFAzHt23Sa70oNhJSFy66QAYSnpeD5MCA1QbNTCVcM1vNG52S67vInWmZDbdnAWJZ/4EL
	hyowZ6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD7Mf-0000000E53O-0M5n;
	Sat, 03 Oct 2026 21:33:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD7MY-0000000E51M-22x3;
	Sat, 03 Oct 2026 21:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791063221;
	bh=kDXqnGMv+3/dGk6DPxEqeXvBQLgvyQU5ZWM8ZzjXf08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OpnIRgT17QQtur0E7ZQ1+4nbWFI2gwCemx/0KapAoxCvcfbqCtyXKndD4Y+fQ/EM4
	 SqhioB0vXIvFRNbrKcA0akg79VEJVi6YYscqU1hSEo3YXe4L/RHhabOeEzRRi7Ln9i
	 SSh1J8rjqKFZf/dDdmtSXDdNjZE/UwDH0smNer4XqntGgxKFm8IE6xzEgk3EeVzHAh
	 yZGuZF7ayBD43yRIH2gtEJc9jjtZ9y16CZZR9A04TYETZJCc90911F5G3rAO3U0DN+
	 Bgfn6E9GoboB1gZGX+Oqt9rLkjryemH9M9FvyJ27hT1DtEIMtNPG7c/uZvjHnqzRMN
	 +cXR9cJyjrgLA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0716617E022A;
	Sat, 03 Oct 2026 23:33:40 +0200 (CEST)
Message-ID: <3c0dc77b-b692-498e-aed6-aa97d827b2f4@collabora.com>
Date: Sun, 4 Oct 2026 00:33:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] phy: hdmi: Add optional FRL TxFFE config options
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
 <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
 <asFoBih6P7Cr6Ute@parshuram>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <asFoBih6P7Cr6Ute@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_143346_685891_ED2AEE7C 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Vinod,

On 10/3/26 11:39 PM, Vinod Koul wrote:
> On 01-09-26, 22:55, Cristian Ciocaltea wrote:
>> During HDMI 2.1 FRL link training, the source and sink can negotiate a
>> Transmitter Feed-Forward Equalization (TxFFE) level to improve the
>> signal quality.  Starting from zero, the source may increment the TxFFE
>> level up to a maximum agreed during the LTS3 stage if the sink keeps
>> reporting FLT failures.  TxFFE adjustment is optional and only attempted
>> when both the source and the connected sink support it.
>>
>> Since the existing HDMI PHY configuration API covers the FRL rate/lane
>> selection only, provide the following fields to the frl sub-struct of
>> phy_configure_opts_hdmi:
>>
>> * ffe_level: the TxFFE level to apply, only meaningful when
>>   set_ffe_level is set.
>>
>> * set_ffe_level: a 1-bit flag that changes the semantics of the
>>   phy_configure() call, i.e. when set, the PHY driver must apply the new
>>   ffe_level and ignore the other frl related fields.
> 
> The ffe_level 0 implies it is disabled, so why should we use a flag for
> this? Rather use if value valid (non zero) logic to apply..?

That's not quite possible because level 0 is valid (and the default) according
to HDMI 2.1 spec. The source is expected to reset TxFFE to default whenever a
new FRL rate is set, hence the API shall be conformant. 

Regards,
Cristian

