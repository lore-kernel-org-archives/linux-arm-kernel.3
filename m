Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1202C982D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nh5CA98hU5Kad3EkJ+HsQ6RaKiFClbwyolq9lduE3qw=; b=BPMQPFNzZI7k6COfJYOT1gTgjz
	/OVWsmPJx0MYIM9AQD4eEHBA+KlLdUuiYDt33+Ku39+wlSoG0r1VLRgR9Ir28eI/pQLoYQq2RHmoR
	u6Dzv/3qdeLCacPAezVwsgOS+HR4sLl6yRc3b2JXUpcRvGX7MCC0l/e99GHOGi29qO6DYxR6YdLC6
	UDlc9ffth6kRnc5uN/seymac2TAkTrOxSYXUjCSGMLK7Ot6Vq49TWwZT5156LnOmS33sCMsDPfd3w
	M+0KhGA3EfR7VKahx+YVBzlm8KXoAS1ed/Fzb+KuxROSIgHcK1wE9mWFueSRz7YmnlVk1cVRakJga
	teAy+w0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CMg-0000000BPya-33bJ;
	Thu, 17 Sep 2026 13:41:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CMV-0000000BPw3-1rRw;
	Thu, 17 Sep 2026 13:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652472;
	bh=WXnbHCnUYR5s688B9EDCkVdUk9C84hOPHL2r2I0cRMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kmCkZOj13qxW+S9TnLgN8z4faQzr+EEMKxY3glYI6AvDpyI0Xx2vRPsc8VVbLWAQL
	 9HpIKHi3DmVhIa1qZr7QjHxRY9hQJGI67VyY0p94wAnHdgHCbIsDEDi9DtGF0hM05O
	 R6P3aA9/6reVrlQEQ7g1bFgOFAwmoxEWHm3nydCvAyTr1jy5835DhLBXGN9noH2dKj
	 2o8R6pFOj66jXveiPN41+LlMFeXynIDk6QP9jFGFH4gzpuVKVsXoyl/82C4kUjBjkO
	 IBW/sjuATU2x3yib11NY8XjqTS25lHwlozNtmcM3UgECGFtFjs0Aj5jWxS2ZLsPHdt
	 EzqSTe51B4sXA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90C1C17E01C5;
	Thu, 17 Sep 2026 15:41:11 +0200 (CEST)
Message-ID: <0e161194-aa14-4e63-b7c0-b1cf488203c6@collabora.com>
Date: Thu, 17 Sep 2026 15:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtu3: add mt6595
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
 <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064115_661503_DB7C25D4 
X-CRM114-Status: UNSURE (   5.79  )
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

On 9/17/26 09:32, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


