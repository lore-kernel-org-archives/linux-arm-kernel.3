Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EBCC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Faxl7lmycddH4zNoCSRFZW9JBRSFWM0fBz47WY6ZtBM=; b=yx1TgbXDevXxqp+Pw9HsOzaXaB
	EyQDksCrVq9+swC7r6T8CVPF9TbQLlevbxqstKD28biVPzf7k/ycxvKSsRMXcq7S6wxj7frNBlM9b
	5XJK6VHTZtHJFbtQOpADIs6mIl98jU0PbtEhu2q6qyf4denbQkywjVxm28RzfOr4IgW3ZDRekGB91
	SNPeJtfVl+Hy9jdMOh3oJ6fq164r+DLV0qCW/4q96VMSqhiydOyoJVOfxktdBSnQtfgXu+r6+Y7gv
	DOfhKgAQP7k5WvIxl7m/dhVTr5kOZe5YTEI3K1zPGpVggQqnkLiYFsId4vrIa3QmwE0db4oHhk5KI
	GAtWJK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtJv-00000007fgP-27xn;
	Wed, 02 Jul 2025 08:59:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtHa-00000007fV3-3C1D;
	Wed, 02 Jul 2025 08:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751446652;
	bh=AA9AlIrZgAydaDEjjbmsNIEiAQNjOYkPwuQMM7PW/hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Op8cI2b9O6bAX4reORlcxA7sX3fWm61pByhJs7+IFee02nmz53x0Vk/5v3SQapl2/
	 6lVtnC8O/3lFCmqy2LgNB3ZP6ZpsqnBCBOmPpYmDaC+GwSbTI+bLKYrWIq4oZb9LEu
	 OyJm/uNOsDZDUv6AUwYF139FXcdtIIy3cjz5moAPV8hlwGCGxd25ZdmqznqZvnTE9T
	 6joiDhezFcor9i9fGncK0Cy9NkreimW9JNHkOl5sHB8/UT4J9ij+AHCiT9JdgLR+X5
	 +dxA1Gi9fFQYzcoBsGeq8fuKT2PfxMV4bjRPo9LVr42CotrNDil50f95uTlphhbKYK
	 bOdegJCZ9+OdQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE2B017E059B;
	Wed,  2 Jul 2025 10:57:31 +0200 (CEST)
Message-ID: <53dcc520-fd8a-4c6b-9bc0-cf9daf3e4597@collabora.com>
Date: Wed, 2 Jul 2025 11:57:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: add HDMI audio on ROCK 4D
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-4-0b3c8e8fda9c@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-4-0b3c8e8fda9c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_015734_952240_A22A920C 
X-CRM114-Status: GOOD (  10.32  )
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

On 6/30/25 1:19 PM, Nicolas Frattaroli wrote:
> Much like the Sige5, the ROCK 4D also has an HDMI port, so is capable of
> providing HDMI audio output as well.
> 
> Enable the SoC's hdmi_sound card, and also enable the SoC audio
> controller (sai6) that feeds into it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This worked as expected on my ROCK 4D board after enabling
CONFIG_SND_SOC_ROCKCHIP_SAI, hence

Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


