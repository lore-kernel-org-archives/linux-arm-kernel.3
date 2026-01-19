Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4562CCA6005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgqtOkToglgSyRZPUeRrMsG4ZKccT2bVvpNIRUm3Afw=; b=kvyi/JZR/H5nZF3RXU/Fe9GA8A
	3OIy/ZNgNPPzKGXG3qvhS6NOPmUdFT+QaM98W233VrrNGqKSOu2fD5WvWR/wW+41ccA/Kivnxc/Gz
	5qLC2Xh+W2gSzpTlqWNhbBLlFeYYY0i0CWCSJ6qzI5vM6z3igmcx0ySQaAcHTLgph6/8v91WovtdO
	1uMnfjSnEj+qytUOmzYQifZYDItPEPQ8FbVQHraHjF1YEEnhdp/VzwZGrMJ5gmCltR5jJe9RkZhwu
	ZQ8nhD7Gsl89P2vqiNUk+1WNsys+ZXNPMbOXt9mrESn7C/VAvcIstUNKzpIniovhqV4FzUalexGuW
	mtSc3X6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkqE-00000001ZUh-3mfL;
	Mon, 19 Jan 2026 08:42:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkqC-00000001ZUI-1dyH;
	Mon, 19 Jan 2026 08:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768812143;
	bh=mPX6JoUD2kWnhithrUDeTBPLyzqFJUKWdQH8B2eq938=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Sy4hcfXVy7UPkLEceMqSHCT8dYb/188ZBxySLfn7nfgRLWjtAHCHBdEwhdgGXGSR4
	 Kn+m5je/DMaDal2R1NCkPJdcUfiJJ58acVAZP/f0NibY48X1Uqs41CzKfiqXqGBNXp
	 6y4/xlGirCide43500HZmpVzMJVMBhncRWVDn2RLqvkSWeb5awDN0H4Ej//dIvQzMf
	 TkUM73L85qCtQvRmIvzUkzPZqtufsx/rPfgeu5vvCyE5QhR+XR04gkd6HC6FBaVuY+
	 zGvGXcVM0q9OubkPjrbqb0ma2bP0oZqt1AonUOALg2h2pLQdpV/nBqMeThovDeUELP
	 InwmTpDGNBmPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B65D17E130A;
	Mon, 19 Jan 2026 09:42:23 +0100 (CET)
Message-ID: <366b8358-a89a-4033-9f3b-9542a5de414e@collabora.com>
Date: Mon, 19 Jan 2026 09:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in
 maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_004228_608452_A6FDE349 
X-CRM114-Status: UNSURE (   6.27  )
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

Il 16/01/26 18:29, Krzysztof Kozlowski ha scritto:
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


