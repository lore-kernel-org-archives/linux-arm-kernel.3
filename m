Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5771C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbN22tyk6cRIX4z1kLmrhR3SyuEx+nhMVUmIuNJ2+xw=; b=nDHr53TCIZq+UF5oDXy3YTOflA
	8yOqd0jBVecICGu8EHGvzj/SwCy9VOHLf7icwNDrz11fxDDlJNqeEUp8+qotA4XHXCxev9jjXuX1n
	4nVpGsrb7e2/Sil7/YcBoDVYXMobZFlveXmheE6wQrCTlFvz1HcmPw6pKAOdCLdlbzwetR4ypbxbZ
	fvrvAUbb+YfFwW9ktvM6pPs6pDIua0txQT0Rdb08nL6DN7TDe4FNjZUWvoc0EB63gbijDDmbKebpZ
	tjr+gGyxeb8gjTaCr4XXRLvs+K/nJ1T8yKOWrltCLTM82JoxiLO1GgRCVpau8nKPPhVa00d/+vYrg
	+Noaffyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yxM-00000005Eg2-3FO5;
	Tue, 22 Sep 2026 11:46:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yxD-00000005EbM-3lYy;
	Tue, 22 Sep 2026 11:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077590;
	bh=9gVIODxYw5hN0j770XoeC/JEiqFERg1vIPBvUxfQU4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WkrWxP5/jTaj4Svij3y9q5znIoayrfXGYGTse7KZQvIGo9RTOiFxiJpbW3rv93Brf
	 RCDHzGOt/ue6AI00eDVGxcPCiwmgZ8zxsEEuIYUWwpDKGEHeHW8xmfd1c+QPnwN+bl
	 fBDJZhg7IIE5RxV06q9WkJHgMdNW35zyEGzS9IALqPvHDZXxHdQye8vAY4tUDD8MHM
	 O97AFjQaRpqUJGK1tpC3AQeHP0lakRVz/2kywSTViiUnLtXrIlN0P5rwDqByIAWXvd
	 WeHmxpZcsqHZ292D9/0iC1om32nSznvCbcEAvOXcdHlgK0Ayw4Co/caF6DWcfNuaAu
	 7r5Sw1CdudTAw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A2FF17E0515;
	Tue, 22 Sep 2026 13:46:29 +0200 (CEST)
Message-ID: <a3775b09-ed6e-4c11-8c05-9c3991b3ca63@collabora.com>
Date: Tue, 22 Sep 2026 13:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: mtu3: add mt6595 support
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044632_088993_A616A99D 
X-CRM114-Status: UNSURE (   6.96  )
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

On 9/22/26 12:36, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
> quirk for single FIFO slot.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

