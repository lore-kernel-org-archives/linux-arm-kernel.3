Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39A0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooeVP5dGGOT5mQBBGTeOiF6qxq9Mem1xkxU5dj2s96I=; b=ueAoDgnZViHiBSOtVNtO0ZLNPW
	SSD4P4PFp76MbMCJmwuxBqhNKAzA5S04llYkQY6FnYaFCXxjEhosN/XOtQ54xii9LH/IW3SKZB70W
	uC0OhGO2F/3pQkUgO6AUrF4Yg2gZQNuPl3d0Xaw4QqgS3CfaLgpbXos2NTGRBCwCCenfQl6T2pfHE
	Er8hW6oYOEYWgSEQEL50XjQAt743cTPss0ENmqAxEpeH8a+rKgoakjJ9mrOAB0W53OxkZlNmn45K9
	KIwGxqpv1kFmRnknJEfq1hTRqg5Q6fZ8nLlAmzEFKpSY+xXtbWsOF+1gsqn/iZBm/ORmjrq4Z323P
	XPI/EbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNl8-00000003fMC-1cw6;
	Tue, 04 Mar 2025 08:36:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNiY-00000003f62-0duL;
	Tue, 04 Mar 2025 08:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741077211;
	bh=D//EKwE3vi7nckqhjOFnJzSwtXNgoivMFlQTKbprxrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mptd97tVcVMH7lz6HXvTpKpGWx2ewfwF7dfyrS0ie0PZWEy17pXk+58Hq0tOUHT7q
	 i1semtKIiFJ79X8yRy9uIbg2eYzW93VftX6hhQ1oClURlgK+hquFeaHzQ1JuLufRuv
	 hBPV/rLobz985oewby20c+HWhCNkD7ZtD5+h1UKjt0VHt9bRQ8OSILOZ1QRQzEXwyu
	 GvJlyH6Ypxzj2PT6vLOcTRLMZKjkeBCliWw1ayUHWMpJI+xgVT3dMQ4t4daq0vPQe8
	 bSnl+2PdaA7mgkjz9Jl6164KuY2JJ8VDhVUUxF8xfl14K+O9kfwApIs4cNyizgEtSd
	 m+ELW4hUZAGIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C51417E087E;
	Tue,  4 Mar 2025 09:33:31 +0100 (CET)
Message-ID: <7aa89f17-c2d4-4143-a84d-4e736fdc6c27@collabora.com>
Date: Tue, 4 Mar 2025 09:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: mt6397: drop unused defines
To: alexandre.belloni@bootlin.com, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250303223637.1135362-1-alexandre.belloni@bootlin.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250303223637.1135362-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_003334_345333_6C3AAF95 
X-CRM114-Status: UNSURE (   6.90  )
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

Il 03/03/25 23:36, alexandre.belloni@bootlin.com ha scritto:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> RTC_NUM_YEARS has never been used, the other defines are not used since
> commit 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support
> for start-year")
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



